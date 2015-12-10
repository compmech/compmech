r"""
================================================
CLPT (:mod:`compmech.stiffpanelbay2d.clpt`)
================================================

.. currentmodule:: compmech.stiffpanelbay2d.clpt

Contains all the methods and functions to calculate the stiffness matrices,
aerodynamic matrix, mass matrix, the displacement strain and the stress fields
for all models using the CLPT kinematic assumption.

"""
modules = [
          'clpt_commons_bardell',
          'clpt_donnell_bardell_linear',
          ]

for module in modules:
    try:
        exec('from . import {0}'.format(module))
    except:
        print('WARNING - module {0} could not be imported!'.format(module))
        exec('{0} = None'.format(module))
