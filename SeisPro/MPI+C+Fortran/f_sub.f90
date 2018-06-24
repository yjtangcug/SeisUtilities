


Subroutine f_sub(fstr,lens) BIND(c,name='f_sub')
use, intrinsic :: iso_c_binding
use mpi
implicit none
type(c_ptr),value :: fstr
integer(c_int),value :: lens



! fortran mpi code block


End Subroutine
