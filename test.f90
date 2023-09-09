subroutine testit()
  use rrand
  implicit none
  real(dp):: x
  real(dp), dimension(4):: vx
  real(dp), dimension(2,2):: mx
  call r_set_random()
  call r_random_number(x)
  write(*,'(F6.4)') x
  call r_random_number(vx)
  write(*,*)  
  write(*,'(F6.4)') vx
  call r_random_number(mx)
  write(*,*)  
  write(*,'(F6.4)') mx  
  call r_close_random()
end subroutine testit
