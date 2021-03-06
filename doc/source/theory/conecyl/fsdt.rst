.. _theory-conecyl-fsdt:

===========================================
FSDT - First-order Shear Deformation Theory
===========================================

Description
===========

For the FSDT the displacement field components are:

.. math::
    u, v, w, \phi_x, \phi_t

The displacement field is approximated similarly to the
:ref:`CLPT <theory-conecyl-clpt>`, but here `\phi_x` and `\phi_\theta`
are independent variables, relaxing the approximation.

For the ``ConeCyl`` implementations, the approximation functions are
separated into three components:

.. math::
    u = u_0 + u_1 + u_2\\

    \vdots

    {{\phi}_\theta} = {{\phi}_\theta}_0 + {{\phi}_\theta}_1 
                      + {{\phi}_\theta}_2

where `u_0` contains the approximation functions corresponding to the
prescribed degrees of freedom, `u_1` contains the functions independent
of `\theta` and `u_2` the functions that depend on both `x`
and `\theta`.

The aim is to have a model capable to simulate non-rigid supports, and where
the displacement components `u, \phi_x` can habe a non-costant value
along the edges.

It is of special importance to allow `\phi_x` to be between zero
(clamped) and another value (up to simply supported),
by using elastic stiffnesses for the corresponding degrees of freedom. The 
elastic stiffnesses are implemented for the FSDT in the same manner described
for the :ref:`CLPT <elastic_constraints>`.

Models
======

The **recommended models**, according to the
:ref:`desired boundary condition <boundary_conditions>` , are:

- SS1- or CC1-type: fsdt_donnell_bc1_

- SS2- or CC2-type: fsdt_donnell_bc2_

- SS3- or CC3-type: fsdt_donnell_bc3_

- SS4- or CC4-type: fsdt_donnell_bc4_

Note that the fsdt_donnell_bc4_ model can be used to simulate all the other
types of boundary condition, which is allowed by the use of :ref:`elastic
constraints <elastic_constraints>`.

A more general model, the fsdt_donnell_bcn_ (or the counterpart
fsdt_sanders_bcn_) has been proposed and despite it has the largest 
simulation capabilities, it can be unstable for high stiffeness applied
to the elastic constraints. Moreover, this model cannot simulate the linear
buckling analysis of the `4^{th}` type of boundary conditions.

The models below were kept for future reference only and have
been used in comparative studies:

- fsdt_geier1997_bc2_
- fsdt_shadmehri2012_bc2_
- fsdt_shadmehri2012_bc3_

.. _fsdt_donnell_bc1:

fsdt_donnell_bc1
----------------

SS1- and CC1-types of boundary conditions.

.. math::
    u = u_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{u} \sin{{b_x}_1}
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{u} \sin{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{u} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\    
    v = v_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{v} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{v} \sin{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{v} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    w = w_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{w} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{w} \sin{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{w} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    \phi_x = {\phi_x}_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{\phi_x} \cos{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                 {c_{i_2 j_2}}_a^{\phi_x} \cos{{b_x}_2} \sin{j_2 \theta}
                +{c_{i_2 j_2}}_b^{\phi_x} \cos{{b_x}_2} \cos{j_2 \theta}
              \right)
    \\
    {\phi}_\theta = {\phi_x}_0 + \sum_{i_1=0}^{m_1}
                                 {c_{i_1}}^{{\phi}_\theta} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
         {c_{i_2 j_2}}_a^{{\phi}_\theta} \sin{{b_x}_2} \sin{j_2 \theta}
        +{c_{i_2 j_2}}_b^{{\phi}_\theta} \sin{{b_x}_2} \cos{j_2 \theta}
              \right)

Observations:

    `\checkmark` linear static implemented

    `\checkmark` linear buckling implemented

    `\checkmark` non-linear analysis implemented

      
.. _fsdt_donnell_bc2:

fsdt_donnell_bc2
----------------

SS2- and CC2-types of boundary conditions.

.. math::
    u = u_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{u} \sin{{b_x}_1}
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{u} \cos{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{u} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\    
    v = v_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{v} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{v} \sin{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{v} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    w = w_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{w} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{w} \sin{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{w} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    \phi_x = {\phi_x}_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{\phi_x} \cos{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                 {c_{i_2 j_2}}_a^{\phi_x} \cos{{b_x}_2} \sin{j_2 \theta}
                +{c_{i_2 j_2}}_b^{\phi_x} \cos{{b_x}_2} \cos{j_2 \theta}
              \right)
    \\
    {\phi}_\theta = {\phi_x}_0 + \sum_{i_1=0}^{m_1}
                                 {c_{i_1}}^{{\phi}_\theta} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
         {c_{i_2 j_2}}_a^{{\phi}_\theta} \sin{{b_x}_2} \sin{j_2 \theta}
        +{c_{i_2 j_2}}_b^{{\phi}_\theta} \sin{{b_x}_2} \cos{j_2 \theta}
              \right)

Observations:

    `\checkmark` linear static implemented

    `\checkmark` linear buckling implemented

    `\checkmark` non-linear analysis implemented


.. _fsdt_donnell_bc3:

fsdt_donnell_bc3
----------------

SS3- and CC3-types of boundary conditions.

.. math::
    u = u_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{u} \sin{{b_x}_1}
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{u} \sin{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{u} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\    
    v = v_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{v} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{v} \cos{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{v} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    w = w_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{w} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{w} \sin{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{w} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    \phi_x = {\phi_x}_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{\phi_x} \cos{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                 {c_{i_2 j_2}}_a^{\phi_x} \cos{{b_x}_2} \sin{j_2 \theta}
                +{c_{i_2 j_2}}_b^{\phi_x} \cos{{b_x}_2} \cos{j_2 \theta}
              \right)
    \\
    {\phi}_\theta = {\phi_x}_0 + \sum_{i_1=0}^{m_1}
                                 {c_{i_1}}^{{\phi}_\theta} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
         {c_{i_2 j_2}}_a^{{\phi}_\theta} \sin{{b_x}_2} \sin{j_2 \theta}
        +{c_{i_2 j_2}}_b^{{\phi}_\theta} \sin{{b_x}_2} \cos{j_2 \theta}
              \right)

Observations:

    `\checkmark` linear static implemented

    `\checkmark` linear buckling implemented

    `\checkmark` non-linear analysis implemented


.. _fsdt_donnell_bc4:

fsdt_donnell_bc4
----------------

SS4- and CC4-types of boundary conditions.

.. math::
    u = u_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{u} \sin{{b_x}_1}
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{u} \cos{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{u} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\    
    v = v_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{v} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{v} \cos{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{v} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    w = w_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{w} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{w} \sin{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{w} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    \phi_x = {\phi_x}_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{\phi_x} \cos{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                 {c_{i_2 j_2}}_a^{\phi_x} \cos{{b_x}_2} \sin{j_2 \theta}
                +{c_{i_2 j_2}}_b^{\phi_x} \cos{{b_x}_2} \cos{j_2 \theta}
              \right)
    \\
    {\phi}_\theta = {\phi_x}_0 + \sum_{i_1=0}^{m_1}
                                 {c_{i_1}}^{{\phi}_\theta} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
         {c_{i_2 j_2}}_a^{{\phi}_\theta} \sin{{b_x}_2} \sin{j_2 \theta}
        +{c_{i_2 j_2}}_b^{{\phi}_\theta} \sin{{b_x}_2} \cos{j_2 \theta}
              \right)

Observations:

    `\checkmark` linear static implemented

    `\checkmark` linear buckling implemented

    `\checkmark` non-linear analysis implemented


.. _fsdt_donnell_bcn:

fsdt_donnell_bcn
----------------

The current attempt adds more flexibility in `v,w,\phi_\theta`.
The resulting approximation functions are:

.. math::
    u = u_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{u} \sin{{b_x}_1}
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{u} \cos{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{u} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\    
    v = v_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{v} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{v} \cos{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{v} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    w = w_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{w} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                     {c_{i_2 j_2}}_a^{w} \cos{{b_x}_2} \sin{j_2 \theta}
                    +{c_{i_2 j_2}}_b^{w} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    \phi_x = {\phi_x}_0 + \sum_{i_1=0}^{m_1} {c_{i_1}}^{\phi_x} \cos{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
                 {c_{i_2 j_2}}_a^{\phi_x} \cos{{b_x}_2} \sin{j_2 \theta}
                +{c_{i_2 j_2}}_b^{\phi_x} \cos{{b_x}_2} \cos{j_2 \theta}
              \right)
    \\
    {\phi}_\theta = {\phi_x}_0 + \sum_{i_1=0}^{m_1}
                                 {c_{i_1}}^{{\phi}_\theta} \sin{{b_x}_1} 
            + \sum_{i_2=0}^{m_2} \sum_{j_2=1}^{n_2} \left(
         {c_{i_2 j_2}}_a^{{\phi}_\theta} \cos{{b_x}_2} \sin{j_2 \theta}
        +{c_{i_2 j_2}}_b^{{\phi}_\theta} \cos{{b_x}_2} \cos{j_2 \theta}
              \right)


Observations:

    `\checkmark` linear static implemented

    `\times` linear buckling not working

    `\checkmark` non-linear analysis implemented


.. _fsdt_sanders_bcn:

fsdt_sanders_bcn
----------------

Counterpart of :ref:`fsdt_donnell_bcn` using the Sanders non-linear equations.

Observations:

    `\checkmark` linear static implemented

    `\times` linear buckling not working

    `\rightarrow` non-linear analysis not implemented

.. _fsdt_shadmehri2012_bc2:

fsdt_shadmehri2012_bc2
----------------------

.. note:: NOT RECOMMENDED, implemented for comparative purposes only.

Adapted from the model published by Shadmehri (2012) 
([shadmehri2012]_, [shadmehri2012thesis]_) for the SS2- and CC2-types
of boundary conditions. Uses the Donnell's equations and 
the approximation functions are:

.. math::
    u = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{u} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\    
    v = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{v} \sin{{b_x}_2} \sin{j_2 \theta}
                  \right)
    \\
    w = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{w} \sin{{b_x}_2} \sin{j_2 \theta}
                  \right)
    \\
    \phi_x = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                 {c_{i_2 j_2}}^{\phi_x} \cos{{b_x}_2} \sin{j_2 \theta}
              \right)
    \\
    {\phi}_\theta =  \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
         {c_{i_2 j_2}}^{{\phi}_\theta} \sin{{b_x}_2} \cos{j_2 \theta}
              \right)

Observations:

    `\checkmark` linear buckling implemented

    `\rightarrow` linear static not implemented

    `\rightarrow` non-linear analysis not implemented


.. _fsdt_shadmehri2012_bc3:

fsdt_shadmehri2012_bc3
----------------------

.. note:: NOT RECOMMENDED, implemented for comparative purposes only.

Published by Shadmehri (2012) (see [shadmehri2012]_ or [shadmehri2012thesis]_
for more details). This model was developed to simulate the SS3- and 
CC3-types of boundary condition. Uses the Donnell's 
equations and the approximation functions are:

.. math::
    u = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{u} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\    
    v = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{v} \cos{{b_x}_2} \sin{j_2 \theta}
                  \right)
    \\
    w = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{w} \sin{{b_x}_2} \sin{j_2 \theta}
                  \right)
    \\
    \phi_x = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                 {c_{i_2 j_2}}^{\phi_x} \cos{{b_x}_2} \sin{j_2 \theta}
              \right)
    \\
    {\phi}_\theta =  \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
         {c_{i_2 j_2}}^{{\phi}_\theta} \sin{{b_x}_2} \cos{j_2 \theta}
              \right)

Observations:

    `\checkmark` linear buckling implemented

    `\rightarrow` linear static not implemented

    `\rightarrow` non-linear analysis not implemented


.. _fsdt_geier1997_bc2:

fsdt_geier1997_bc2
----------------------

.. note:: NOT RECOMMENDED, implemented for comparative purposes only.

Published by Geier and Singh (1997) (see [geier1997]_ 
for more details). This model was developed to simulate the SS2- and 
CC2-types of boundary condition. Such models seem to be originally
proposed by Khdeir et al. (1989) (see [khdeir1989]_).  
Uses the Donnell's equations and the approximation functions are:

.. math::
    u = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{u} \cos{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\    
    v = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{v} \sin{{b_x}_2} \sin{j_2 \theta}
                  \right)
    \\
    w = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                     {c_{i_2 j_2}}^{w} \sin{{b_x}_2} \cos{j_2 \theta}
                  \right)
    \\
    \phi_x = \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
                 {c_{i_2 j_2}}^{\phi_x} \cos{{b_x}_2} \cos{j_2 \theta}
              \right)
    \\
    {\phi}_\theta =  \sum_{i_2=0}^{m_2} \sum_{j_2=0}^{n_2} \left(
         {c_{i_2 j_2}}^{{\phi}_\theta} \sin{{b_x}_2} \sin{j_2 \theta}
              \right)

Observations:

    `\checkmark` linear buckling implemented

    `\rightarrow` linear static not implemented

    `\rightarrow` non-linear analysis not implemented
