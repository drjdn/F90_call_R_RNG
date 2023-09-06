Calling R's RNG's from Fortran
==============================

This repository contains an example of how to call
[R](https://www.r-project.org/)'s random number generation from `Fortran 90` or
above.  If you maintain a package on
[CRAN](https://cran.r-project.org/mirrors.html) that calls Fortran code this
might be of interest to you.  `R` doesn't allow you to call the built in random
number generators that are part of the `Fortran` standard (true of `C` or any other
language as it can cause issues).  This is explained in the [Writing R
Extensions](https://cran.r-project.org/doc/manuals/R-exts.html) document.

Requirements
------------

The code requires gcc, gfortran, make and pkg-config.  These should be readily
available on any POSIX system.  You can switch the `C` and `Fortran` compilers by
editing the `Makefile`.

Building
--------

Build by changing into the repo directory and running make:

```bash
$ cd F90_call_R_RNG
$ make
```
and to run the simple example:

```bash
$ ./run -q
```
The only files that are of interest to package maintainers are `wrap.c` which
wraps `R`'s basic RNG code and `rrandom.f90` that has an interface to call `R`'s
RNG via a subroutine called `r_random_number`.  There is a `Fortran` interface that
makes this operate like `Fortran`'s built in `random_number` subroutine for
convenience.  The rest just builds the code an runs the example.

License
-------

[MIT](https://github.com/drjdn/F90_call_R_RNG/blob/master/LICENSE.md)
