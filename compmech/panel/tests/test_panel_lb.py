import numpy as np

from compmech.panel import Panel


def test_panel_lb():
    for model in ['plate_clt_donnell_bardell',
                  'plate_clt_donnell_bardell_w',
                  'cpanel_clt_donnell_bardell',
                  'kpanel_clt_donnell_bardell']:
        print('Linear buckling for model {0}'.format(model))
        # ssss
        p = Panel()
        p.bc_ssss()
        p.m = 12
        p.n = 13
        p.stack = [0, 90, -45, +45]
        p.plyt = 0.125e-3
        p.laminaprop = (142.5e9, 8.7e9, 0.28, 5.1e9, 5.1e9, 5.1e9)
        p.model = model
        p.a = 1.
        p.b = 0.5
        p.r = 1.e8
        p.alphadeg = 0.
        p.Nxx = -1
        p.lb(silent=True)
        if '_w' in model:
            assert np.isclose(p.eigvals[0], 88.47696, atol=0.1, rtol=0)
        else:
            assert np.isclose(p.eigvals[0], 85.2912, atol=0.1, rtol=0)

        p.Nxx = 0
        p.Nyy = -1
        p.lb(silent=True)
        if '_w' in model:
            assert np.isclose(p.eigvals[0], 26.45882, atol=0.1, rtol=0)
        else:
            assert np.isclose(p.eigvals[0], 25.17562, atol=0.1, rtol=0)

        # ssfs
        p = Panel()
        p.bc_ssfs()
        p.m = 12
        p.n = 13
        p.stack = [0, 90, -45, +45]
        p.plyt = 0.125e-3
        p.laminaprop = (142.5e9, 8.7e9, 0.28, 5.1e9, 5.1e9, 5.1e9)
        p.model = model
        p.a = 1.
        p.b = 0.5
        p.r = 1.e8
        p.alphadeg = 0.
        p.Nxx = -1
        p.lb(silent=True)
        if '_w' in model:
            assert np.isclose(p.eigvals[0], 17.14427, atol=0.1, rtol=0)
        else:
            assert np.isclose(p.eigvals[0], 15.842356, atol=0.1, rtol=0)

        p.bc_sfss()
        p.Nxx = 0
        p.Nyy = -1
        p.lb(silent=True)
        if '_w' in model:
            assert np.isclose(p.eigvals[0], 15.809986, atol=0.1, rtol=0)
        else:
            assert np.isclose(p.eigvals[0], 13.9421988, atol=0.1, rtol=0)


if __name__ == '__main__':
    test_panel_lb()
