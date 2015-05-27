from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
args_linear = ['/openmp', '/O2', '/favor:INTEL64']
args_nonlinear = ['/openmp', '/O2', '/favor:INTEL64', '/fp:fast']
ext_modules = [
    Extension('clpt_commons_free', ['clpt_commons_free.pyx'],
              extra_compile_args=args_linear),
    Extension('clpt_donnell_free_linear', ['clpt_donnell_free_linear.pyx'],
              extra_compile_args=args_linear),
    #Extension('clpt_donnell_free_nonlinear', ['clpt_donnell_free_nonlinear.pyx'],
              #extra_compile_args=args_nonlinear),
    ]
setup(
name = 'plates_clpt',
cmdclass = {'build_ext': build_ext},
ext_modules = ext_modules
)