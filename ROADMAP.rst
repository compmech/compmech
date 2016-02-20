Version 0.5.5
-------------
- numerical integration for kG0 of panels, possibility to include non-uniform
  stress states and pretty much any load then (this will pave the way for
  geometrically non-linear analyses)
- tests for integrate module
- T, Z and I 2D stiffeners

Version 0.5.6
-------------
- using the Bardell's strategy, move many code from Mathematica to SymPy
- check why plate lb with reduced_dof=True is not the same as plate_w
- reconsider reading bardell_12 from the C code and reuse in FORTRAN


Version 0.7.0
-------------
- implement CI compilation and test for FORTRANs
- improve the numerical stability of FORTRAN's eigensolver (cpanelbay)
- skew panel with formulation for stringers not aligned with the panel
  longitudinal direction
- put matrices for cones and cylinders in the new format and unify their
  calculation as we did for compmech.panel
- robustness of sparse-solver for the panel module, it is really a pain to use
  the dense solver because of the relative slowness...
- tune eigenvalue solver for freq in compmech.panel, similarly to what has
  been done for linear buckling analysis....
- add Third-Order Shear Deformation Theory to deal with many papers using
  shear correction factors
- finish implementing compmech.plate for Monteiro

Version 1.0.0 (long term)
--------------------------
- finite element solver
