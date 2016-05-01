#cython: boundscheck=False
#cython: wraparound=False
#cython: cdivision=True
#cython: nonecheck=False
#cython: profile=False
#cython: infer_types=False
from __future__ import division

from scipy.sparse import coo_matrix
import numpy as np
cimport numpy as np


cdef extern from 'bardell.h':
    double integral_ff(int i, int j,
            double x1t, double x1r, double x2t, double x2r,
            double y1t, double y1r, double y2t, double y2r) nogil
    double integral_ffxi(int i, int j,
            double x1t, double x1r, double x2t, double x2r,
            double y1t, double y1r, double y2t, double y2r) nogil
    double integral_fxifxi(int i, int j,
            double x1t, double x1r, double x2t, double x2r,
            double y1t, double y1r, double y2t, double y2r) nogil

cdef extern from 'bardell_functions.h':
    double calc_f(int i, double xi, double xi1t, double xi1r,
                  double xi2t, double xi2r) nogil
    double calc_fxi(int i, double xi, double xi1t, double xi1r,
                    double xi2t, double xi2r) nogil

ctypedef np.double_t cDOUBLE
DOUBLE = np.float64
ctypedef np.int64_t cINT
INT = np.int64

cdef int num = 3


def fkCSB11(double kt, double a1, double b1, double dsb,
        int m1, int n1,
        double u1tx1, double u1rx1, double u2tx1, double u2rx1,
        double v1tx1, double v1rx1, double v2tx1, double v2rx1,
        double w1tx1, double w1rx1, double w2tx1, double w2rx1,
        double u1ty1, double u1ry1, double u2ty1, double u2ry1,
        double v1ty1, double v1ry1, double v2ty1, double v2ry1,
        double w1ty1, double w1ry1, double w2ty1, double w2ry1,
        int size, int row0, int col0):
    cdef int i1, k1, j1, l1, c, row, col

    cdef np.ndarray[cINT, ndim=1] kCSB11r, kCSB11c
    cdef np.ndarray[cDOUBLE, ndim=1] kCSB11v

    cdef double f1Auf1Bu, f1Auf1Bwxi, f1Avf1Bv, f1Avf1Bw, f1Awf1Bv, f1Awf1Bw, f1Awxif1Bu, f1Awxif1Bwxi
    cdef double g1Aug1Bu, g1Aug1Bw, g1Avg1Bv, g1Avg1Bweta, g1Awg1Bu, g1Awg1Bw, g1Awetag1Bv, g1Awetag1Bweta

    fdim = 7*m1*n1*m1*n1

    kCSB11r = np.zeros((fdim,), dtype=INT)
    kCSB11c = np.zeros((fdim,), dtype=INT)
    kCSB11v = np.zeros((fdim,), dtype=DOUBLE)

    with nogil:
        # kCSB11
        c = -1
        for i1 in range(m1):
            for k1 in range(m1):
                f1Auf1Bu = integral_ff(i1, k1, u1tx1, u1rx1, u2tx1, u2rx1, u1tx1, u1rx1, u2tx1, u2rx1)
                f1Auf1Bwxi = integral_ffxi(i1, k1, u1tx1, u1rx1, u2tx1, u2rx1, w1tx1, w1rx1, w2tx1, w2rx1)
                f1Avf1Bv = integral_ff(i1, k1, v1tx1, v1rx1, v2tx1, v2rx1, v1tx1, v1rx1, v2tx1, v2rx1)
                f1Avf1Bw = integral_ff(i1, k1, v1tx1, v1rx1, v2tx1, v2rx1, w1tx1, w1rx1, w2tx1, w2rx1)
                f1Awf1Bv = integral_ff(i1, k1, w1tx1, w1rx1, w2tx1, w2rx1, v1tx1, v1rx1, v2tx1, v2rx1)
                f1Awf1Bw = integral_ff(i1, k1, w1tx1, w1rx1, w2tx1, w2rx1, w1tx1, w1rx1, w2tx1, w2rx1)
                f1Awxif1Bu = integral_ffxi(k1, i1, u1tx1, u1rx1, u2tx1, u2rx1, w1tx1, w1rx1, w2tx1, w2rx1)
                f1Awxif1Bwxi = integral_fxifxi(i1, k1, w1tx1, w1rx1, w2tx1, w2rx1, w1tx1, w1rx1, w2tx1, w2rx1)

                for j1 in range(n1):
                    for l1 in range(n1):
                        row = row0 + num*(j1*m1 + i1)
                        col = col0 + num*(l1*m1 + k1)

                        #NOTE symmetry
                        if row > col:
                            continue

                        g1Aug1Bu = integral_ff(j1, l1, u1ty1, u1ry1, u2ty1, u2ry1, u1ty1, u1ry1, u2ty1, u2ry1)
                        g1Aug1Bw = integral_ff(j1, l1, u1ty1, u1ry1, u2ty1, u2ry1, w1ty1, w1ry1, w2ty1, w2ry1)
                        g1Avg1Bv = integral_ff(j1, l1, v1ty1, v1ry1, v2ty1, v2ry1, v1ty1, v1ry1, v2ty1, v2ry1)
                        g1Avg1Bweta = integral_ffxi(j1, l1, v1ty1, v1ry1, v2ty1, v2ry1, w1ty1, w1ry1, w2ty1, w2ry1)
                        g1Awg1Bu = integral_ff(j1, l1, w1ty1, w1ry1, w2ty1, w2ry1, u1ty1, u1ry1, u2ty1, u2ry1)
                        g1Awg1Bw = integral_ff(j1, l1, w1ty1, w1ry1, w2ty1, w2ry1, w1ty1, w1ry1, w2ty1, w2ry1)
                        g1Awetag1Bv = integral_ffxi(l1, j1, v1ty1, v1ry1, v2ty1, v2ry1, w1ty1, w1ry1, w2ty1, w2ry1)
                        g1Awetag1Bweta = integral_fxifxi(j1, l1, w1ty1, w1ry1, w2ty1, w2ry1, w1ty1, w1ry1, w2ty1, w2ry1)

                        c += 1
                        kCSB11r[c] = row+0
                        kCSB11c[c] = col+0
                        kCSB11v[c] += 0.25*a1*b1*f1Auf1Bu*g1Aug1Bu*kt
                        c += 1
                        kCSB11r[c] = row+0
                        kCSB11c[c] = col+2
                        kCSB11v[c] += 0.5*b1*dsb*f1Auf1Bwxi*g1Aug1Bw*kt
                        c += 1
                        kCSB11r[c] = row+1
                        kCSB11c[c] = col+1
                        kCSB11v[c] += 0.25*a1*b1*f1Avf1Bv*g1Avg1Bv*kt
                        c += 1
                        kCSB11r[c] = row+1
                        kCSB11c[c] = col+2
                        kCSB11v[c] += 0.5*a1*dsb*f1Avf1Bw*g1Avg1Bweta*kt
                        c += 1
                        kCSB11r[c] = row+2
                        kCSB11c[c] = col+0
                        kCSB11v[c] += 0.5*b1*dsb*f1Awxif1Bu*g1Awg1Bu*kt
                        c += 1
                        kCSB11r[c] = row+2
                        kCSB11c[c] = col+1
                        kCSB11v[c] += 0.5*a1*dsb*f1Awf1Bv*g1Awetag1Bv*kt
                        c += 1
                        kCSB11r[c] = row+2
                        kCSB11c[c] = col+2
                        kCSB11v[c] += 0.25*a1*b1*kt*(f1Awf1Bw*g1Awg1Bw + 4*(dsb*dsb)*f1Awf1Bw*g1Awetag1Bweta/(b1*b1) + 4*(dsb*dsb)*f1Awxif1Bwxi*g1Awg1Bw/(a1*a1))

    kCSB11 = coo_matrix((kCSB11v, (kCSB11r, kCSB11c)), shape=(size, size))

    return kCSB11


def fkCSB12(double kt, double a1, double b1, double dsb,
          int m1, int n1, int m2, int n2,
          double u1tx1, double u1rx1, double u2tx1, double u2rx1,
          double v1tx1, double v1rx1, double v2tx1, double v2rx1,
          double w1tx1, double w1rx1, double w2tx1, double w2rx1,
          double u1ty1, double u1ry1, double u2ty1, double u2ry1,
          double v1ty1, double v1ry1, double v2ty1, double v2ry1,
          double w1ty1, double w1ry1, double w2ty1, double w2ry1,
          double u1tx2, double u1rx2, double u2tx2, double u2rx2,
          double v1tx2, double v1rx2, double v2tx2, double v2rx2,
          double w1tx2, double w1rx2, double w2tx2, double w2rx2,
          double u1ty2, double u1ry2, double u2ty2, double u2ry2,
          double v1ty2, double v1ry2, double v2ty2, double v2ry2,
          double w1ty2, double w1ry2, double w2ty2, double w2ry2,
          int size, int row0, int col0):
    cdef int i1, j1, k2, l2, c, row, col

    cdef np.ndarray[cINT, ndim=1] kCSB12r, kCSB12c
    cdef np.ndarray[cDOUBLE, ndim=1] kCSB12v

    cdef double f1Auf2Bu, f1Avf2Bv, f1Awf2Bw, f1Awxif2Bu, f1Awf2Bv
    cdef double g1Aug2Bu, g1Avg2Bv, g1Awg2Bw, g1Awetag2Bv, g1Awg2Bu

    fdim = 5*m1*n1*m2*n2

    kCSB12r = np.zeros((fdim,), dtype=INT)
    kCSB12c = np.zeros((fdim,), dtype=INT)
    kCSB12v = np.zeros((fdim,), dtype=DOUBLE)

    with nogil:
        # kCSB12
        c = -1
        for i1 in range(m1):
            for k2 in range(m2):
                f1Auf2Bu = integral_ff(i1, k2, u1tx1, u1rx1, u2tx1, u2rx1, u1tx2, u1rx2, u2tx2, u2rx2)
                f1Avf2Bv = integral_ff(i1, k2, v1tx1, v1rx1, v2tx1, v2rx1, v1tx2, v1rx2, v2tx2, v2rx2)
                f1Awf2Bw = integral_ff(i1, k2, w1tx1, w1rx1, w2tx1, w2rx1, w1tx2, w1rx2, w2tx2, w2rx2)
                f1Awxif2Bu = integral_ffxi(k2, i1, u1tx2, u1rx2, u2tx2, u2rx2, w1tx1, w1rx1, w2tx1, w2rx1)
                f1Awf2Bv = integral_ff(i1, k2, w1tx1, w1rx1, w2tx1, w2rx1, v1tx2, v1rx2, v2tx2, v2rx2)

                for j1 in range(n1):
                    for l2 in range(n2):
                        row = row0 + num*(j1*m1 + i1)
                        col = col0 + num*(l2*m2 + k2)

                        #NOTE symmetry not applicable here
                        #if row > col:
                            #continue

                        g1Aug2Bu = integral_ff(j1, l2, u1ty1, u1ry1, u2ty1, u2ry1, u1ty2, u1ry2, u2ty2, u2ry2)
                        g1Avg2Bv = integral_ff(j1, l2, v1ty1, v1ry1, v2ty1, v2ry1, v1ty2, v1ry2, v2ty2, v2ry2)
                        g1Awg2Bw = integral_ff(j1, l2, w1ty1, w1ry1, w2ty1, w2ry1, w1ty2, w1ry2, w2ty2, w2ry2)
                        g1Awetag2Bv = integral_ffxi(l2, j1, v1ty2, v1ry2, v2ty2, v2ry2, w1ty1, w1ry1, w2ty1, w2ry1)
                        g1Awg2Bu = integral_ff(j1, l2, w1ty1, w1ry1, w2ty1, w2ry1, u1ty2, u1ry2, u2ty2, u2ry2)

                        c += 1
                        kCSB12r[c] = row+0
                        kCSB12c[c] = col+0
                        kCSB12v[c] += -0.25*a1*b1*f1Auf2Bu*g1Aug2Bu*kt
                        c += 1
                        kCSB12r[c] = row+1
                        kCSB12c[c] = col+1
                        kCSB12v[c] += -0.25*a1*b1*f1Avf2Bv*g1Avg2Bv*kt
                        c += 1
                        kCSB12r[c] = row+2
                        kCSB12c[c] = col+0
                        kCSB12v[c] += -0.5*b1*dsb*f1Awxif2Bu*g1Awg2Bu*kt
                        c += 1
                        kCSB12r[c] = row+2
                        kCSB12c[c] = col+1
                        kCSB12v[c] += -0.5*a1*dsb*f1Awf2Bv*g1Awetag2Bv*kt
                        c += 1
                        kCSB12r[c] = row+2
                        kCSB12c[c] = col+2
                        kCSB12v[c] += -0.25*a1*b1*f1Awf2Bw*g1Awg2Bw*kt

    kCSB12 = coo_matrix((kCSB12v, (kCSB12r, kCSB12c)), shape=(size, size))

    return kCSB12


def fkCSB22(double kt, double a1, double b1, int m2, int n2,
        double u1tx2, double u1rx2, double u2tx2, double u2rx2,
        double v1tx2, double v1rx2, double v2tx2, double v2rx2,
        double w1tx2, double w1rx2, double w2tx2, double w2rx2,
        double u1ty2, double u1ry2, double u2ty2, double u2ry2,
        double v1ty2, double v1ry2, double v2ty2, double v2ry2,
        double w1ty2, double w1ry2, double w2ty2, double w2ry2,
        int size, int row0, int col0):
    cdef int i2, k2, j2, l2, c, row, col

    cdef np.ndarray[cINT, ndim=1] kCSB22r, kCSB22c
    cdef np.ndarray[cDOUBLE, ndim=1] kCSB22v

    cdef double f2Auf2Bu, f2Avf2Bv, f2Awf2Bw
    cdef double g2Aug2Bu, g2Avg2Bv, g2Awg2Bw

    fdim = 3*m2*n2*m2*n2

    kCSB22r = np.zeros((fdim,), dtype=INT)
    kCSB22c = np.zeros((fdim,), dtype=INT)
    kCSB22v = np.zeros((fdim,), dtype=DOUBLE)

    with nogil:
        c = -1
        for i2 in range(m2):
            for k2 in range(m2):
                f2Auf2Bu = integral_ff(i2, k2, u1tx2, u1rx2, u2tx2, u2rx2, u1tx2, u1rx2, u2tx2, u2rx2)
                f2Avf2Bv = integral_ff(i2, k2, v1tx2, v1rx2, v2tx2, v2rx2, v1tx2, v1rx2, v2tx2, v2rx2)
                f2Awf2Bw = integral_ff(i2, k2, w1tx2, w1rx2, w2tx2, w2rx2, w1tx2, w1rx2, w2tx2, w2rx2)

                for j2 in range(n2):
                    for l2 in range(n2):
                        row = row0 + num*(j2*m2 + i2)
                        col = col0 + num*(l2*m2 + k2)

                        #NOTE symmetry
                        if row > col:
                            continue

                        g2Aug2Bu = integral_ff(j2, l2, u1ty2, u1ry2, u2ty2, u2ry2, u1ty2, u1ry2, u2ty2, u2ry2)
                        g2Avg2Bv = integral_ff(j2, l2, v1ty2, v1ry2, v2ty2, v2ry2, v1ty2, v1ry2, v2ty2, v2ry2)
                        g2Awg2Bw = integral_ff(j2, l2, w1ty2, w1ry2, w2ty2, w2ry2, w1ty2, w1ry2, w2ty2, w2ry2)

                        c += 1
                        kCSB22r[c] = row+0
                        kCSB22c[c] = col+0
                        kCSB22v[c] += 0.25*a1*b1*f2Auf2Bu*g2Aug2Bu*kt
                        c += 1
                        kCSB22r[c] = row+1
                        kCSB22c[c] = col+1
                        kCSB22v[c] += 0.25*a1*b1*f2Avf2Bv*g2Avg2Bv*kt
                        c += 1
                        kCSB22r[c] = row+2
                        kCSB22c[c] = col+2
                        kCSB22v[c] += 0.25*a1*b1*f2Awf2Bw*g2Awg2Bw*kt

    kCSB22 = coo_matrix((kCSB22v, (kCSB22r, kCSB22c)), shape=(size, size))

    return kCSB22
