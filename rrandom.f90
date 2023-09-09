!The MIT License
!
!Copyright (c) 2023 Jason D. Nielsen <drjdnielsen@gmail.com>

module dtype
  implicit none
  integer, parameter:: dp=kind(1.0D0)  
end module dtype

module rrand
  use dtype
  implicit none

  private:: ranu_s, ranu_v, ranu_m
  
  interface r_random_number
     module procedure ranu_s, ranu_v, ranu_m
  end interface r_random_number

contains

  subroutine r_set_random
    implicit none
    call sRNG()
  end subroutine r_set_random

  subroutine r_close_random
    implicit none
    call eRNG()
  end subroutine r_close_random
  
  subroutine ranu_s(rv)
    implicit none
    real(dp), intent(inout):: rv
    real(dp):: runi
    rv = runi()
  end subroutine ranu_s

  subroutine ranu_v(rv)
    implicit none
    real(dp), dimension(:), intent(inout):: rv
    real(dp):: runi
    integer:: i
    do i=1,size(rv)
       rv(i) = runi()
    end do
  end subroutine ranu_v

  subroutine ranu_m(rv)
    implicit none
    real(dp), dimension(:,:), intent(inout):: rv
    real(dp):: runi
    integer:: i, j
    do j=1,size(rv,2)
       do i=1,size(rv,1)
          rv(i,j) = runi()
       end do
    end do
  end subroutine ranu_m
  
end module rrand
