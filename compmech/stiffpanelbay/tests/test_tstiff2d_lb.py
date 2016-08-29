import numpy as np

from compmech.stiffpanelbay import StiffPanelBay
from compmech.analysis import lb


def test_tstiff2d_lb():
    #NOTE reference values taken from
    # compmech.panel.assembly.tstiff2d_1stiff_compression
    a_b_list = [2, 0.5, 2., 10.]
    ref_values = [-416.041614194, -406.176400334, -441.008172729]
    for a_b, ref_value in zip(a_b_list, ref_values):
        print('Testing linear buckling')
        spb = StiffPanelBay()
        spb.b = 1.
        spb.a = spb.b * a_b
        spb.stack = [0, +45, -45, 90, -45, +45]
        spb.plyt = 1e-3*0.125
        spb.laminaprop = (142.5e9, 8.7e9, 0.28, 5.1e9, 5.1e9, 5.1e9)
        spb.model = 'plate_clt_donnell_bardell'
        spb.m = 17
        spb.n = 16

        Nxx = -50.
        spb.add_panel(y1=0, y2=spb.b/2., plyt=spb.plyt, Nxx=Nxx)
        spb.add_panel(y1=spb.b/2., y2=spb.b, plyt=spb.plyt, Nxx=Nxx)

        bb = spb.b/5.
        stiff = spb.add_tstiff2d(ys=spb.b/2., bf=bb/2, bb=bb,
                         fstack=[0, 90, 90, 0]*8,
                         fplyt=spb.plyt*1., flaminaprop=spb.laminaprop,
                         bstack=[0, 90, 90, 0]*4,
                         bplyt=spb.plyt*1., blaminaprop=spb.laminaprop,
                         mb=17, nb=16, mf=17, nf=16, Nxxf=Nxx)

        spb.calc_k0()
        spb.calc_kG0()
        eigvals, eigvecs = lb(spb.k0, spb.kG0, silent=True)

        spb.plot_skin(eigvecs[:, 0], filename='tmp_test_tstiff2d_lb_skin.png',
                colorbar=True)
        spb.plot_stiffener(eigvecs[:, 0], si=0, region='base',
                filename='tmp_test_tstiff2d_lb_stiff_base.png', colorbar=True)
        spb.plot_stiffener(eigvecs[:, 0], si=0, region='flange',
                filename='tmp_test_tstiff2d_lb_stiff_flange.png', colorbar=True)

        calc = eigvals[0]*Nxx

        assert np.isclose(calc, ref_value, rtol=0.05) # allowing up to 5% error

