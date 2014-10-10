import numpy as np

from compmech.logger import msg, warn
from compmech.sparse import solve

def _solver_NR(a):
    """Newton-Raphson solver

    """
    msg('Initialization...', level=1)

    line_search = a.line_search
    compute_every_n = a.compute_every_n
    modified_NR = a.modified_NR
    inc = a.initialInc
    total = inc
    once_at_total = False
    max_total = 0.

    fext = a.calc_fext(inc=inc)
    k0 = a.calc_k0()
    c = solve(k0, fext)

    if modified_NR:
        if a.kT_initial_state:
            msg('Initial update of kT ...', level=1)
            kT_last = a.calc_kT(c*0)
            msg('kT updated!', level=1)
        else:
            kT_last = k0
        compute_NL_matrices = False
    else:
        compute_NL_matrices = True
        kT_last = k0

    step_num = 1
    while True:
        msg('Started Load Step {} - '.format(step_num)
            + 'Attempting time = {0}'.format(total), level=1)

        # TODO maybe for pdC=True, pdT the fext must be calculated with
        # the last kT available...

        absERR = 1.e6
        relERR = 1.e6
        min_Rmax = 1.e6
        prev_Rmax = 1.e6
        last_min_Rmax = 1.e6
        iteration = 0
        converged = False

        kT = kT_last

        fext = a.calc_fext(inc=total)

        iter_NR = 0
        while True:
            iteration += 1
            msg('Iteration: {}'.format(iteration), level=2)
            if iteration > a.maxNumIter:
                warn('Maximum number of iterations achieved!', level=2)
                break

            if compute_NL_matrices or (a.kT_initial_state and step_num==1 and
                    iteration==1) or iter_NR==(compute_every_n-1):
                iter_NR = 0
                kT = a.calc_kT(c)
            else:
                iter_NR += 1
                if not modified_NR:
                    compute_NL_matrices = True

            fint = a.calc_fint(c)

            R = fext - fint

            # convergence criteria:
            # - maximum residual force Rmax
            Rmax = np.abs(R).max()
            msg('Rmax = {0}'.format(Rmax), level=3)

            if iteration >= 2 and Rmax < a.absTOL:
                converged = True
                break
            if (Rmax > prev_Rmax and Rmax > min_Rmax and iteration > 2):
                warn('Diverged!', level=2)
                break
            else:
                min_Rmax = min(min_Rmax, Rmax)
            change_rate_Rmax = abs(prev_Rmax-Rmax)/abs(prev_Rmax)
            if (iteration > 2 and change_rate_Rmax < a.too_slow_TOL):
                warn('Diverged! (convergence too slow)', level=2)
                break
            prev_Rmax = Rmax

            msg('Solving... ', level=2)
            delta_c = solve(kT, R)
            msg('finished!', level=2)

            eta1 = 0.
            eta2 = 1.
            if line_search:
                while True:
                    c1 = c + eta1*delta_c
                    c2 = c + eta2*delta_c
                    fint1 = a.calc_fint(c1)
                    fint2 = a.calc_fint(c2)
                    R1 = fext - fint1
                    R2 = fext - fint2
                    s1 = delta_c.dot(R1)
                    s2 = delta_c.dot(R2)
                    eta_new = (eta2-eta1)*(-s1/(s2-s1)) + eta1
                    eta1 = eta2
                    eta2 = eta_new
                    eta2 = min(max(eta2, 0.2), 10.)
                    if abs(eta2-eta1) < 0.01:
                        break
            c = c + eta2*delta_c

        if converged:
            msg('Finished Load Step {} at'.format(step_num)
                + ' time = {0}'.format(total), level=1)
            a.increments.append(total)
            a.cs.append(c.copy()) #NOTE copy required
            finished = False
            if abs(total - 1) < 1e-3:
                finished = True
            else:
                factor = 1.1
                if once_at_total:
                    inc_new = min(factor*inc, a.maxInc, (1.-total)/2)
                else:
                    inc_new = min(factor*inc, a.maxInc, 1.-total)
                msg('Changing time increment from {0} to {1}'.format(
                    inc, inc_new), level=1)
                inc = inc_new
                total += inc
                total = min(1, total)
                step_num += 1
            if finished:
                break
            if modified_NR:
                msg('Updating kT...', level=1)
                kT = a.calc_kT(c)
                msg('kT updated!', level=1)
            compute_NL_matrices = False
            kT_last = kT
        else:
            max_total = max(max_total, total)
            while True:
                factor = 0.3
                msg('Bisecting time increment from {0} to {1}'.format(
                    inc, inc*factor), level=1)
                if abs(total -1) < 1e-3:
                    once_at_total = True
                total -= inc
                inc *= factor
                if inc < a.minInc:
                    msg('Minimum step size achieved!', level=1)
                    break
                total += inc
                if total >= max_total:
                    continue
                else:
                    break
            if inc < a.minInc:
                msg('Stopping solver: minimum step size achieved!',
                        level=1)
                break

        if len(a.cs)>0:
            c = a.cs[-1].copy() #NOTE copy required
        else:
            # means that a bisection must be done in initialInc
            fext = a.calc_fext(inc=inc)
            c = solve(k0, fext)

    msg('Finished Non-Linear Static Analysis')
    msg('at time {0}'.format(total), level=1)

