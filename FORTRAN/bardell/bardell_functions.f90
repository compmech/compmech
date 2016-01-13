! Bardell's hierarchical functions

! Number of terms: 30

SUBROUTINE calc_vec_f(f, xi, xi1t, xi1r, xi2t, xi2r)
    REAL*8, INTENT(IN) :: xi, xi1t, xi1r, xi2t, xi2r
    REAL*8, INTENT(OUT) :: f(30)
    f(1) = xi1t*(0.25*xi**3 - 0.75*xi + 0.5)
    f(2) = xi1r*(0.125*xi**3 - 0.125*xi**2 - 0.125*xi + 0.125)
    f(3) = xi2t*(-0.25*xi**3 + 0.75*xi + 0.5)
    f(4) = xi2r*(0.125*xi**3 + 0.125*xi**2 - 0.125*xi - 0.125)
    f(5) = 0.125*xi**4 - 0.25*xi**2 + 0.125
    f(6) = 0.125*xi**5 - 0.25*xi**3 + 0.125*xi
    f(7) = 0.145833333333333*xi**6 - 0.3125*xi**4 + 0.1875*xi**2 - 0.0208333333333333
    f(8) = 0.1875*xi**7 - 0.4375*xi**5 + 0.3125*xi**3 - 0.0625*xi
    f(9) = 0.2578125*xi**8 - 0.65625*xi**6 + 0.546875*xi**4 - 0.15625*xi**2 + 0.0078125
    f(10) = 0.372395833333333*xi**9 - 1.03125*xi**7 + 0.984375*xi**5 - 0.364583333333333*xi**3 + 0.0390625*xi
    f(11) = 0.55859375*xi**10 - 1.67578125*xi**8 + 1.8046875*xi**6 - 0.8203125*xi**4 + 0.13671875*xi**2 - 0.00390625
    f(12) = 0.86328125*xi**11 - 2.79296875*xi**9 + 3.3515625*xi**7 - 1.8046875*xi**5 + 0.41015625*xi**3 - 0.02734375*xi
    f(13) = 1.36686197916667*xi**12 - 4.748046875*xi**10 + 6.2841796875*xi**8 - 3.91015625*xi**6 + 1.1279296875*xi**4 - 0.123046875*xi**2 + 0.00227864583333333
    f(14) = 2.2080078125*xi**13 - 8.201171875*xi**11 + 11.8701171875*xi**9 - 8.37890625*xi**7 + 2.9326171875*xi**5 - 0.451171875*xi**3 + 0.0205078125*xi
    f(15) = 3.62744140625*xi**14 - 14.35205078125*xi**12 + 22.55322265625*xi**10 - 17.80517578125*xi**8 + 7.33154296875*xi**6 - 1.46630859375*xi**4 + 0.11279296875*xi**2 - 0.00146484375
    f(16) = 6.04573567708333*xi**15 - 25.39208984375*xi**13 + 43.05615234375*xi**11 - 37.5887044270833*xi**9 + 17.80517578125*xi**7 - 4.39892578125*xi**5 + 0.48876953125*xi**3 - 0.01611328125*xi
    f(17) = 10.2021789550781*xi**16 - 45.343017578125*xi**14 + 82.5242919921875*xi**12 - 78.936279296875*xi**10 + 42.2872924804688*xi**8 - 12.463623046875*xi**6 + 1.8328857421875*xi**4 - 0.104736328125*xi**2 + 0.001007080078125
    f(18) = 17.4037170410156*xi**17 - 81.617431640625*xi**15 + 158.700561523438*xi**13 - 165.048583984375*xi**11 + 98.6703491210938*xi**9 - 33.829833984375*xi**7 + 6.2318115234375*xi**5 - 0.523681640625*xi**3 + 0.013092041015625*xi
    f(19) = 29.9730682373047*xi**18 - 147.931594848633*xi**16 + 306.065368652344*xi**14 - 343.851216634115*xi**12 + 226.941802978516*xi**10 - 88.8033142089844*xi**8 + 19.7340698242188*xi**6 - 2.22564697265625*xi**4 + 0.0981903076171875*xi**2 - 0.000727335611979167
    f(20) = 52.0584869384766*xi**19 - 269.757614135742*xi**17 + 591.726379394531*xi**15 - 714.152526855469*xi**13 + 515.776824951172*xi**11 - 226.941802978516*xi**9 + 59.2022094726563*xi**7 - 8.45745849609375*xi**5 + 0.556411743164063*xi**3 - 0.0109100341796875*xi
    f(21) = 91.102352142334*xi**20 - 494.555625915527*xi**18 + 1146.4698600769*xi**16 - 1479.31594848633*xi**14 + 1160.49785614014*xi**12 - 567.354507446289*xi**10 + 170.206352233887*xi**8 - 29.6011047363281*xi**6 + 2.6429557800293*xi**4 - 0.0927352905273438*xi**2 + 0.000545501708984375
    f(22) = 160.513668060303*xi**21 - 911.02352142334*xi**19 + 2225.50031661987*xi**17 - 3057.25296020508*xi**15 + 2588.80290985107*xi**13 - 1392.59742736816*xi**11 + 472.795422871908*xi**9 - 97.2607727050781*xi**7 + 11.100414276123*xi**5 - 0.587323506673177*xi**3 + 0.00927352905273438*xi
    f(23) = 284.546957015991*xi**22 - 1685.39351463318*xi**20 + 4327.36172676086*xi**18 - 6305.58423042297*xi**16 + 5732.34930038452*xi**14 - 3365.4437828064*xi**12 + 1276.54764175415*xi**10 - 303.939914703369*xi**8 + 42.5515880584717*xi**6 - 3.08344841003418*xi**4 + 0.0880985260009766*xi**2 - 0.000421524047851563
    f(24) = 507.235879898071*xi**23 - 3130.0165271759*xi**21 + 8426.96757316589*xi**19 - 12982.0851802826*xi**17 + 12611.1684608459*xi**15 - 8025.28902053833*xi**13 + 3365.4437828064*xi**11 - 911.819744110107*xi**9 + 151.969957351685*xi**7 - 14.1838626861572*xi**5 + 0.616689682006836*xi**3 - 0.00800895690917969*xi
    f(25) = 908.797618150711*xi**24 - 5833.21261882782*xi**22 + 16432.5867676735*xi**20 - 26685.3973150253*xi**18 + 27586.9310081005*xi**16 - 18916.7526912689*xi**14 + 8694.06310558319*xi**12 - 2644.27725791931*xi**10 + 512.898606061935*xi**8 - 59.0994278589884*xi**6 + 3.54596567153931*xi**4 - 0.0840940475463867*xi**2 + 0.000333706537882487
    f(26) = 1635.83571267128*xi**25 - 10905.5714178085*xi**23 + 32082.669403553*xi**21 - 54775.2892255783*xi**19 + 60042.143958807*xi**17 - 44139.0896129608*xi**15 + 22069.5448064804*xi**13 - 7452.05409049988*xi**11 + 1652.67328619957*xi**9 - 227.954936027527*xi**7 + 17.7298283576965*xi**5 - 0.644721031188965*xi**3 + 0.00700783729553223*xi
    f(27) = 2957.08763444424*xi**26 - 20447.946408391*xi**24 + 62707.0356523991*xi**22 - 112289.342912436*xi**20 + 130091.311910748*xi**18 - 102071.644729972*xi**16 + 55173.862016201*xi**14 - 20493.1487488747*xi**12 + 5123.28718721867*xi**10 - 826.336643099785*xi**8 + 79.7842276096344*xi**6 - 4.02950644493103*xi**4 + 0.0805901288986206*xi**2 - 0.000269532203674316
    f(28) = 5366.5664476951*xi**27 - 38442.1392477751*xi**25 + 122687.678450346*xi**23 - 229925.79739213*xi**21 + 280723.357281089*xi**19 - 234164.361439347*xi**17 + 136095.526306629*xi**15 - 55173.862016201*xi**13 + 15369.861561656*xi**11 - 2846.27065956593*xi**9 + 330.534657239914*xi**7 - 21.7593348026276*xi**5 + 0.671584407488505*xi**3 - 0.00619924068450928*xi
    f(29) = 9774.81745830178*xi**28 - 72448.6470438838*xi**26 + 240263.370298594*xi**24 - 470302.767392993*xi**22 + 603555.218154341*xi**20 - 533374.378834069*xi**18 + 331732.845372409*xi**16 - 145816.635328531*xi**14 + 44828.7628881633*xi**12 - 9392.69317656755*xi**10 + 1280.82179680467*xi**8 - 105.1701182127*xi**6 + 4.53319475054741*xi**4 - 0.077490508556366*xi**2 + 0.000221401453018188
    f(30) = 17864.3215617239*xi**29 - 136847.444416225*xi**27 + 470916.205785245*xi**25 - 961053.481194377*xi**23 + 1293332.61033073*xi**21 - 1207110.43630868*xi**19 + 800061.568251103*xi**17 - 379123.251854181*xi**15 + 127589.555912465*xi**13 - 29885.8419254422*xi**11 + 4696.34658828378*xi**9 - 465.753380656242*xi**7 + 26.292529553175*xi**5 - 0.697414577007294*xi**3 + 0.00553503632545471*xi
END SUBROUTINE


SUBROUTINE calc_vec_fxi(fxi, xi, xi1t, xi1r, xi2t, xi2r)
    REAL*8, INTENT(IN) :: xi, xi1t, xi1r, xi2t, xi2r
    REAL*8, INTENT(OUT) :: fxi(30)
    fxi(1) = xi1t*(0.75*xi**2 - 0.75)
    fxi(2) = xi1r*(0.375*xi**2 - 0.25*xi - 0.125)
    fxi(3) = xi2t*(-0.75*xi**2 + 0.75)
    fxi(4) = xi2r*(0.375*xi**2 + 0.25*xi - 0.125)
    fxi(5) = 0.5*xi**3 - 0.5*xi
    fxi(6) = 0.625*xi**4 - 0.75*xi**2 + 0.125
    fxi(7) = 0.875*xi**5 - 1.25*xi**3 + 0.375*xi
    fxi(8) = 1.3125*xi**6 - 2.1875*xi**4 + 0.9375*xi**2 - 0.0625
    fxi(9) = 2.0625*xi**7 - 3.9375*xi**5 + 2.1875*xi**3 - 0.3125*xi
    fxi(10) = 3.3515625*xi**8 - 7.21875*xi**6 + 4.921875*xi**4 - 1.09375*xi**2 + 0.0390625
    fxi(11) = 5.5859375*xi**9 - 13.40625*xi**7 + 10.828125*xi**5 - 3.28125*xi**3 + 0.2734375*xi
    fxi(12) = 9.49609375*xi**10 - 25.13671875*xi**8 + 23.4609375*xi**6 - 9.0234375*xi**4 + 1.23046875*xi**2 - 0.02734375
    fxi(13) = 16.40234375*xi**11 - 47.48046875*xi**9 + 50.2734375*xi**7 - 23.4609375*xi**5 + 4.51171875*xi**3 - 0.24609375*xi
    fxi(14) = 28.7041015625*xi**12 - 90.212890625*xi**10 + 106.8310546875*xi**8 - 58.65234375*xi**6 + 14.6630859375*xi**4 - 1.353515625*xi**2 + 0.0205078125
    fxi(15) = 50.7841796875*xi**13 - 172.224609375*xi**11 + 225.5322265625*xi**9 - 142.44140625*xi**7 + 43.9892578125*xi**5 - 5.865234375*xi**3 + 0.2255859375*xi
    fxi(16) = 90.68603515625*xi**14 - 330.09716796875*xi**12 + 473.61767578125*xi**10 - 338.29833984375*xi**8 + 124.63623046875*xi**6 - 21.99462890625*xi**4 + 1.46630859375*xi**2 - 0.01611328125
    fxi(17) = 163.23486328125*xi**15 - 634.80224609375*xi**13 + 990.29150390625*xi**11 - 789.36279296875*xi**9 + 338.29833984375*xi**7 - 74.78173828125*xi**5 + 7.33154296875*xi**3 - 0.20947265625*xi
    fxi(18) = 295.863189697266*xi**16 - 1224.26147460938*xi**14 + 2063.10729980469*xi**12 - 1815.53442382813*xi**10 + 888.033142089844*xi**8 - 236.808837890625*xi**6 + 31.1590576171875*xi**4 - 1.571044921875*xi**2 + 0.013092041015625
    fxi(19) = 539.515228271484*xi**17 - 2366.90551757813*xi**15 + 4284.91516113281*xi**13 - 4126.21459960938*xi**11 + 2269.41802978516*xi**9 - 710.426513671875*xi**7 + 118.404418945313*xi**5 - 8.902587890625*xi**3 + 0.196380615234375*xi
    fxi(20) = 989.111251831055*xi**18 - 4585.87944030762*xi**16 + 8875.89569091797*xi**14 - 9283.98284912109*xi**12 + 5673.54507446289*xi**10 - 2042.47622680664*xi**8 + 414.415466308594*xi**6 - 42.2872924804688*xi**4 + 1.66923522949219*xi**2 - 0.0109100341796875
    fxi(21) = 1822.04704284668*xi**19 - 8902.00126647949*xi**17 + 18343.5177612305*xi**15 - 20710.4232788086*xi**13 + 13925.9742736816*xi**11 - 5673.54507446289*xi**9 + 1361.65081787109*xi**7 - 177.606628417969*xi**5 + 10.5718231201172*xi**3 - 0.185470581054688*xi
    fxi(22) = 3370.78702926636*xi**20 - 17309.4469070435*xi**18 + 37833.5053825378*xi**16 - 45858.7944030762*xi**14 + 33654.437828064*xi**12 - 15318.5717010498*xi**10 + 4255.15880584717*xi**8 - 680.825408935547*xi**6 + 55.5020713806152*xi**4 - 1.76197052001953*xi**2 + 0.00927352905273438
    fxi(23) = 6260.03305435181*xi**21 - 33707.8702926636*xi**19 + 77892.5110816956*xi**17 - 100889.347686768*xi**15 + 80252.8902053833*xi**13 - 40385.3253936768*xi**11 + 12765.4764175415*xi**9 - 2431.51931762695*xi**7 + 255.30952835083*xi**5 - 12.3337936401367*xi**3 + 0.176197052001953*xi
    fxi(24) = 11666.4252376556*xi**22 - 65730.347070694*xi**20 + 160112.383890152*xi**18 - 220695.448064804*xi**16 + 189167.526912689*xi**14 - 104328.757266998*xi**12 + 37019.8816108704*xi**10 - 8206.37769699097*xi**8 + 1063.78970146179*xi**6 - 70.9193134307861*xi**4 + 1.85006904602051*xi**2 - 0.00800895690917969
    fxi(25) = 21811.1428356171*xi**23 - 128330.677614212*xi**21 + 328651.73535347*xi**19 - 480337.151670456*xi**17 + 441390.896129608*xi**15 - 264834.537677765*xi**13 + 104328.757266998*xi**11 - 26442.7725791931*xi**9 + 4103.18884849548*xi**7 - 354.596567153931*xi**5 + 14.1838626861572*xi**3 - 0.168188095092773*xi
    fxi(26) = 40895.892816782*xi**24 - 250828.142609596*xi**22 + 673736.057474613*xi**20 - 1040730.49528599*xi**18 + 1020716.44729972*xi**16 - 662086.344194412*xi**14 + 286904.082484245*xi**12 - 81972.5949954987*xi**10 + 14874.0595757961*xi**8 - 1595.68455219269*xi**6 + 88.6491417884827*xi**4 - 1.93416309356689*xi**2 + 0.00700783729553223
    fxi(27) = 76884.2784955502*xi**25 - 490750.713801384*xi**23 + 1379554.78435278*xi**21 - 2245786.85824871*xi**19 + 2341643.61439347*xi**17 - 1633146.31567955*xi**15 + 772434.068226814*xi**13 - 245917.784986496*xi**11 + 51232.8718721867*xi**9 - 6610.69314479828*xi**7 + 478.705365657806*xi**5 - 16.1180257797241*xi**3 + 0.161180257797241*xi
    fxi(28) = 144897.294087768*xi**26 - 961053.481194377*xi**24 + 2821816.60435796*xi**22 - 4828441.74523473*xi**20 + 5333743.78834069*xi**18 - 3980794.1444689*xi**16 + 2041432.89459944*xi**14 - 717260.206210613*xi**12 + 169068.477178216*xi**10 - 25616.4359360933*xi**8 + 2313.7426006794*xi**6 - 108.796674013138*xi**4 + 2.01475322246552*xi**2 - 0.00619924068450928
    fxi(29) = 273694.88883245*xi**27 - 1883664.82314098*xi**25 + 5766320.88716626*xi**23 - 10346660.8826458*xi**21 + 12071104.3630868*xi**19 - 9600738.81901324*xi**17 + 5307725.52595854*xi**15 - 2041432.89459944*xi**13 + 537945.15465796*xi**11 - 93926.9317656755*xi**9 + 10246.5743744373*xi**7 - 631.020709276199*xi**5 + 18.1327790021896*xi**3 - 0.154981017112732*xi
    fxi(30) = 518065.325289994*xi**28 - 3694880.99923807*xi**26 + 11772905.1446311*xi**24 - 22104230.0674707*xi**22 + 27159984.8169453*xi**20 - 22935098.289865*xi**18 + 13601046.6602688*xi**16 - 5686848.77781272*xi**14 + 1658664.22686204*xi**12 - 328744.261179864*xi**10 + 42267.119294554*xi**8 - 3260.2736645937*xi**6 + 131.462647765875*xi**4 - 2.09224373102188*xi**2 + 0.00553503632545471
END SUBROUTINE


SUBROUTINE calc_f(i, xi, xi1t, xi1r, xi2t, xi2r, out)
    INTEGER, INTENT(IN) :: i
    REAL*8, INTENT(IN) :: xi, xi1t, xi1r, xi2t, xi2r
    REAL*8, INTENT(OUT) :: out
    out = 0.
    SELECT CASE (i)
    CASE (1)
        out = xi1t*(0.25*xi**3 - 0.75*xi + 0.5)
    CASE (2)
        out = xi1r*(0.125*xi**3 - 0.125*xi**2 - 0.125*xi + 0.125)
    CASE (3)
        out = xi2t*(-0.25*xi**3 + 0.75*xi + 0.5)
    CASE (4)
        out = xi2r*(0.125*xi**3 + 0.125*xi**2 - 0.125*xi - 0.125)
    CASE (5)
        out = 0.125*xi**4 - 0.25*xi**2 + 0.125
    CASE (6)
        out = 0.125*xi**5 - 0.25*xi**3 + 0.125*xi
    CASE (7)
        out = 0.145833333333333*xi**6 - 0.3125*xi**4 + 0.1875*xi**2 - 0.0208333333333333
    CASE (8)
        out = 0.1875*xi**7 - 0.4375*xi**5 + 0.3125*xi**3 - 0.0625*xi
    CASE (9)
        out = 0.2578125*xi**8 - 0.65625*xi**6 + 0.546875*xi**4 - 0.15625*xi**2 + 0.0078125
    CASE (10)
        out = 0.372395833333333*xi**9 - 1.03125*xi**7 + 0.984375*xi**5 - 0.364583333333333*xi**3 + 0.0390625*xi
    CASE (11)
        out = 0.55859375*xi**10 - 1.67578125*xi**8 + 1.8046875*xi**6 - 0.8203125*xi**4 + 0.13671875*xi**2 - 0.00390625
    CASE (12)
        out = 0.86328125*xi**11 - 2.79296875*xi**9 + 3.3515625*xi**7 - 1.8046875*xi**5 + 0.41015625*xi**3 - 0.02734375*xi
    CASE (13)
        out = 1.36686197916667*xi**12 - 4.748046875*xi**10 + 6.2841796875*xi**8 - 3.91015625*xi**6 + 1.1279296875*xi**4 - 0.123046875*xi**2 + 0.00227864583333333
    CASE (14)
        out = 2.2080078125*xi**13 - 8.201171875*xi**11 + 11.8701171875*xi**9 - 8.37890625*xi**7 + 2.9326171875*xi**5 - 0.451171875*xi**3 + 0.0205078125*xi
    CASE (15)
        out = 3.62744140625*xi**14 - 14.35205078125*xi**12 + 22.55322265625*xi**10 - 17.80517578125*xi**8 + 7.33154296875*xi**6 - 1.46630859375*xi**4 + 0.11279296875*xi**2 - 0.00146484375
    CASE (16)
        out = 6.04573567708333*xi**15 - 25.39208984375*xi**13 + 43.05615234375*xi**11 - 37.5887044270833*xi**9 + 17.80517578125*xi**7 - 4.39892578125*xi**5 + 0.48876953125*xi**3 - 0.01611328125*xi
    CASE (17)
        out = 10.2021789550781*xi**16 - 45.343017578125*xi**14 + 82.5242919921875*xi**12 - 78.936279296875*xi**10 + 42.2872924804688*xi**8 - 12.463623046875*xi**6 + 1.8328857421875*xi**4 - 0.104736328125*xi**2 + 0.001007080078125
    CASE (18)
        out = 17.4037170410156*xi**17 - 81.617431640625*xi**15 + 158.700561523438*xi**13 - 165.048583984375*xi**11 + 98.6703491210938*xi**9 - 33.829833984375*xi**7 + 6.2318115234375*xi**5 - 0.523681640625*xi**3 + 0.013092041015625*xi
    CASE (19)
        out = 29.9730682373047*xi**18 - 147.931594848633*xi**16 + 306.065368652344*xi**14 - 343.851216634115*xi**12 + 226.941802978516*xi**10 - 88.8033142089844*xi**8 + 19.7340698242188*xi**6 - 2.22564697265625*xi**4 + 0.0981903076171875*xi**2 - 0.000727335611979167
    CASE (20)
        out = 52.0584869384766*xi**19 - 269.757614135742*xi**17 + 591.726379394531*xi**15 - 714.152526855469*xi**13 + 515.776824951172*xi**11 - 226.941802978516*xi**9 + 59.2022094726563*xi**7 - 8.45745849609375*xi**5 + 0.556411743164063*xi**3 - 0.0109100341796875*xi
    CASE (21)
        out = 91.102352142334*xi**20 - 494.555625915527*xi**18 + 1146.4698600769*xi**16 - 1479.31594848633*xi**14 + 1160.49785614014*xi**12 - 567.354507446289*xi**10 + 170.206352233887*xi**8 - 29.6011047363281*xi**6 + 2.6429557800293*xi**4 - 0.0927352905273438*xi**2 + 0.000545501708984375
    CASE (22)
        out = 160.513668060303*xi**21 - 911.02352142334*xi**19 + 2225.50031661987*xi**17 - 3057.25296020508*xi**15 + 2588.80290985107*xi**13 - 1392.59742736816*xi**11 + 472.795422871908*xi**9 - 97.2607727050781*xi**7 + 11.100414276123*xi**5 - 0.587323506673177*xi**3 + 0.00927352905273438*xi
    CASE (23)
        out = 284.546957015991*xi**22 - 1685.39351463318*xi**20 + 4327.36172676086*xi**18 - 6305.58423042297*xi**16 + 5732.34930038452*xi**14 - 3365.4437828064*xi**12 + 1276.54764175415*xi**10 - 303.939914703369*xi**8 + 42.5515880584717*xi**6 - 3.08344841003418*xi**4 + 0.0880985260009766*xi**2 - 0.000421524047851563
    CASE (24)
        out = 507.235879898071*xi**23 - 3130.0165271759*xi**21 + 8426.96757316589*xi**19 - 12982.0851802826*xi**17 + 12611.1684608459*xi**15 - 8025.28902053833*xi**13 + 3365.4437828064*xi**11 - 911.819744110107*xi**9 + 151.969957351685*xi**7 - 14.1838626861572*xi**5 + 0.616689682006836*xi**3 - 0.00800895690917969*xi
    CASE (25)
        out = 908.797618150711*xi**24 - 5833.21261882782*xi**22 + 16432.5867676735*xi**20 - 26685.3973150253*xi**18 + 27586.9310081005*xi**16 - 18916.7526912689*xi**14 + 8694.06310558319*xi**12 - 2644.27725791931*xi**10 + 512.898606061935*xi**8 - 59.0994278589884*xi**6 + 3.54596567153931*xi**4 - 0.0840940475463867*xi**2 + 0.000333706537882487
    CASE (26)
        out = 1635.83571267128*xi**25 - 10905.5714178085*xi**23 + 32082.669403553*xi**21 - 54775.2892255783*xi**19 + 60042.143958807*xi**17 - 44139.0896129608*xi**15 + 22069.5448064804*xi**13 - 7452.05409049988*xi**11 + 1652.67328619957*xi**9 - 227.954936027527*xi**7 + 17.7298283576965*xi**5 - 0.644721031188965*xi**3 + 0.00700783729553223*xi
    CASE (27)
        out = 2957.08763444424*xi**26 - 20447.946408391*xi**24 + 62707.0356523991*xi**22 - 112289.342912436*xi**20 + 130091.311910748*xi**18 - 102071.644729972*xi**16 + 55173.862016201*xi**14 - 20493.1487488747*xi**12 + 5123.28718721867*xi**10 - 826.336643099785*xi**8 + 79.7842276096344*xi**6 - 4.02950644493103*xi**4 + 0.0805901288986206*xi**2 - 0.000269532203674316
    CASE (28)
        out = 5366.5664476951*xi**27 - 38442.1392477751*xi**25 + 122687.678450346*xi**23 - 229925.79739213*xi**21 + 280723.357281089*xi**19 - 234164.361439347*xi**17 + 136095.526306629*xi**15 - 55173.862016201*xi**13 + 15369.861561656*xi**11 - 2846.27065956593*xi**9 + 330.534657239914*xi**7 - 21.7593348026276*xi**5 + 0.671584407488505*xi**3 - 0.00619924068450928*xi
    CASE (29)
        out = 9774.81745830178*xi**28 - 72448.6470438838*xi**26 + 240263.370298594*xi**24 - 470302.767392993*xi**22 + 603555.218154341*xi**20 - 533374.378834069*xi**18 + 331732.845372409*xi**16 - 145816.635328531*xi**14 + 44828.7628881633*xi**12 - 9392.69317656755*xi**10 + 1280.82179680467*xi**8 - 105.1701182127*xi**6 + 4.53319475054741*xi**4 - 0.077490508556366*xi**2 + 0.000221401453018188
    CASE (30)
        out = 17864.3215617239*xi**29 - 136847.444416225*xi**27 + 470916.205785245*xi**25 - 961053.481194377*xi**23 + 1293332.61033073*xi**21 - 1207110.43630868*xi**19 + 800061.568251103*xi**17 - 379123.251854181*xi**15 + 127589.555912465*xi**13 - 29885.8419254422*xi**11 + 4696.34658828378*xi**9 - 465.753380656242*xi**7 + 26.292529553175*xi**5 - 0.697414577007294*xi**3 + 0.00553503632545471*xi
    END SELECT
END SUBROUTINE


SUBROUTINE calc_fxi(i, xi, xi1t, xi1r, xi2t, xi2r, out)
    INTEGER, INTENT(IN) :: i
    REAL*8, INTENT(IN) :: xi, xi1t, xi1r, xi2t, xi2r
    REAL*8, INTENT(OUT) :: out
    out = 0.
    SELECT CASE (i)
    CASE (1)
        out = xi1t*(0.75*xi**2 - 0.75)
    CASE (2)
        out = xi1r*(0.375*xi**2 - 0.25*xi - 0.125)
    CASE (3)
        out = xi2t*(-0.75*xi**2 + 0.75)
    CASE (4)
        out = xi2r*(0.375*xi**2 + 0.25*xi - 0.125)
    CASE (5)
        out = 0.5*xi**3 - 0.5*xi
    CASE (6)
        out = 0.625*xi**4 - 0.75*xi**2 + 0.125
    CASE (7)
        out = 0.875*xi**5 - 1.25*xi**3 + 0.375*xi
    CASE (8)
        out = 1.3125*xi**6 - 2.1875*xi**4 + 0.9375*xi**2 - 0.0625
    CASE (9)
        out = 2.0625*xi**7 - 3.9375*xi**5 + 2.1875*xi**3 - 0.3125*xi
    CASE (10)
        out = 3.3515625*xi**8 - 7.21875*xi**6 + 4.921875*xi**4 - 1.09375*xi**2 + 0.0390625
    CASE (11)
        out = 5.5859375*xi**9 - 13.40625*xi**7 + 10.828125*xi**5 - 3.28125*xi**3 + 0.2734375*xi
    CASE (12)
        out = 9.49609375*xi**10 - 25.13671875*xi**8 + 23.4609375*xi**6 - 9.0234375*xi**4 + 1.23046875*xi**2 - 0.02734375
    CASE (13)
        out = 16.40234375*xi**11 - 47.48046875*xi**9 + 50.2734375*xi**7 - 23.4609375*xi**5 + 4.51171875*xi**3 - 0.24609375*xi
    CASE (14)
        out = 28.7041015625*xi**12 - 90.212890625*xi**10 + 106.8310546875*xi**8 - 58.65234375*xi**6 + 14.6630859375*xi**4 - 1.353515625*xi**2 + 0.0205078125
    CASE (15)
        out = 50.7841796875*xi**13 - 172.224609375*xi**11 + 225.5322265625*xi**9 - 142.44140625*xi**7 + 43.9892578125*xi**5 - 5.865234375*xi**3 + 0.2255859375*xi
    CASE (16)
        out = 90.68603515625*xi**14 - 330.09716796875*xi**12 + 473.61767578125*xi**10 - 338.29833984375*xi**8 + 124.63623046875*xi**6 - 21.99462890625*xi**4 + 1.46630859375*xi**2 - 0.01611328125
    CASE (17)
        out = 163.23486328125*xi**15 - 634.80224609375*xi**13 + 990.29150390625*xi**11 - 789.36279296875*xi**9 + 338.29833984375*xi**7 - 74.78173828125*xi**5 + 7.33154296875*xi**3 - 0.20947265625*xi
    CASE (18)
        out = 295.863189697266*xi**16 - 1224.26147460938*xi**14 + 2063.10729980469*xi**12 - 1815.53442382813*xi**10 + 888.033142089844*xi**8 - 236.808837890625*xi**6 + 31.1590576171875*xi**4 - 1.571044921875*xi**2 + 0.013092041015625
    CASE (19)
        out = 539.515228271484*xi**17 - 2366.90551757813*xi**15 + 4284.91516113281*xi**13 - 4126.21459960938*xi**11 + 2269.41802978516*xi**9 - 710.426513671875*xi**7 + 118.404418945313*xi**5 - 8.902587890625*xi**3 + 0.196380615234375*xi
    CASE (20)
        out = 989.111251831055*xi**18 - 4585.87944030762*xi**16 + 8875.89569091797*xi**14 - 9283.98284912109*xi**12 + 5673.54507446289*xi**10 - 2042.47622680664*xi**8 + 414.415466308594*xi**6 - 42.2872924804688*xi**4 + 1.66923522949219*xi**2 - 0.0109100341796875
    CASE (21)
        out = 1822.04704284668*xi**19 - 8902.00126647949*xi**17 + 18343.5177612305*xi**15 - 20710.4232788086*xi**13 + 13925.9742736816*xi**11 - 5673.54507446289*xi**9 + 1361.65081787109*xi**7 - 177.606628417969*xi**5 + 10.5718231201172*xi**3 - 0.185470581054688*xi
    CASE (22)
        out = 3370.78702926636*xi**20 - 17309.4469070435*xi**18 + 37833.5053825378*xi**16 - 45858.7944030762*xi**14 + 33654.437828064*xi**12 - 15318.5717010498*xi**10 + 4255.15880584717*xi**8 - 680.825408935547*xi**6 + 55.5020713806152*xi**4 - 1.76197052001953*xi**2 + 0.00927352905273438
    CASE (23)
        out = 6260.03305435181*xi**21 - 33707.8702926636*xi**19 + 77892.5110816956*xi**17 - 100889.347686768*xi**15 + 80252.8902053833*xi**13 - 40385.3253936768*xi**11 + 12765.4764175415*xi**9 - 2431.51931762695*xi**7 + 255.30952835083*xi**5 - 12.3337936401367*xi**3 + 0.176197052001953*xi
    CASE (24)
        out = 11666.4252376556*xi**22 - 65730.347070694*xi**20 + 160112.383890152*xi**18 - 220695.448064804*xi**16 + 189167.526912689*xi**14 - 104328.757266998*xi**12 + 37019.8816108704*xi**10 - 8206.37769699097*xi**8 + 1063.78970146179*xi**6 - 70.9193134307861*xi**4 + 1.85006904602051*xi**2 - 0.00800895690917969
    CASE (25)
        out = 21811.1428356171*xi**23 - 128330.677614212*xi**21 + 328651.73535347*xi**19 - 480337.151670456*xi**17 + 441390.896129608*xi**15 - 264834.537677765*xi**13 + 104328.757266998*xi**11 - 26442.7725791931*xi**9 + 4103.18884849548*xi**7 - 354.596567153931*xi**5 + 14.1838626861572*xi**3 - 0.168188095092773*xi
    CASE (26)
        out = 40895.892816782*xi**24 - 250828.142609596*xi**22 + 673736.057474613*xi**20 - 1040730.49528599*xi**18 + 1020716.44729972*xi**16 - 662086.344194412*xi**14 + 286904.082484245*xi**12 - 81972.5949954987*xi**10 + 14874.0595757961*xi**8 - 1595.68455219269*xi**6 + 88.6491417884827*xi**4 - 1.93416309356689*xi**2 + 0.00700783729553223
    CASE (27)
        out = 76884.2784955502*xi**25 - 490750.713801384*xi**23 + 1379554.78435278*xi**21 - 2245786.85824871*xi**19 + 2341643.61439347*xi**17 - 1633146.31567955*xi**15 + 772434.068226814*xi**13 - 245917.784986496*xi**11 + 51232.8718721867*xi**9 - 6610.69314479828*xi**7 + 478.705365657806*xi**5 - 16.1180257797241*xi**3 + 0.161180257797241*xi
    CASE (28)
        out = 144897.294087768*xi**26 - 961053.481194377*xi**24 + 2821816.60435796*xi**22 - 4828441.74523473*xi**20 + 5333743.78834069*xi**18 - 3980794.1444689*xi**16 + 2041432.89459944*xi**14 - 717260.206210613*xi**12 + 169068.477178216*xi**10 - 25616.4359360933*xi**8 + 2313.7426006794*xi**6 - 108.796674013138*xi**4 + 2.01475322246552*xi**2 - 0.00619924068450928
    CASE (29)
        out = 273694.88883245*xi**27 - 1883664.82314098*xi**25 + 5766320.88716626*xi**23 - 10346660.8826458*xi**21 + 12071104.3630868*xi**19 - 9600738.81901324*xi**17 + 5307725.52595854*xi**15 - 2041432.89459944*xi**13 + 537945.15465796*xi**11 - 93926.9317656755*xi**9 + 10246.5743744373*xi**7 - 631.020709276199*xi**5 + 18.1327790021896*xi**3 - 0.154981017112732*xi
    CASE (30)
        out = 518065.325289994*xi**28 - 3694880.99923807*xi**26 + 11772905.1446311*xi**24 - 22104230.0674707*xi**22 + 27159984.8169453*xi**20 - 22935098.289865*xi**18 + 13601046.6602688*xi**16 - 5686848.77781272*xi**14 + 1658664.22686204*xi**12 - 328744.261179864*xi**10 + 42267.119294554*xi**8 - 3260.2736645937*xi**6 + 131.462647765875*xi**4 - 2.09224373102188*xi**2 + 0.00553503632545471
    END SELECT
END SUBROUTINE