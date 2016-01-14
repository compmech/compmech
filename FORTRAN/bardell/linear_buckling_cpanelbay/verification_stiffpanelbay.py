from compmech.stiffpanelbay import StiffPanelBay

spb = StiffPanelBay()
spb.a = 2.
spb.b = 1.
spb.r = 10.
spb.stack = [0, 90, 90, 0, -45, +45]
spb.plyt = 1e-3*0.125
spb.laminaprop = (142.5e9, 8.7e9, 0.28, 5.1e9, 5.1e9, 5.1e9)
spb.model = 'cpanel_clt_donnell_bardell'
spb.mu = 1.3e3
spb.m = 11
spb.n = 12

spb.add_panel(y1=0, y2=spb.b/2., plyt=spb.plyt, Nxx=-100.)
spb.add_panel(y1=spb.b/2., y2=spb.b, plyt=spb.plyt, Nxx=-100.)

#spb.add_bladestiff1d(ys=spb.b/2., Fx=-10., bf=0.05, fstack=[0, 90, 90, 0],
        #fplyt=spb.plyt, flaminaprop=spb.laminaprop)

spb.lb(silent=False)

print spb.panels[0].lam.A
print spb.panels[0].lam.B
print spb.panels[0].lam.D

print spb.k0.sum()
print spb.kG0.sum()

