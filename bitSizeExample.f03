      program bitSizeExample
!
!     This program demonstrates the use of the Fortran intrinsic function
!     Bit_Size.
!
!
!     Hrant P. Hratchian, 2021.
!
!
      use ISO_FORTRAN_ENV
      implicit none
      integer(kind=int32)::testInt32
      integer(kind=int64)::testInt64
!
 1000 format(1x,'Bit_Size(',A,') = ',I4)
!
!     This program demonstrates the use of the intrinsic Bit_Size function.
!
!
      write(*,1000) 'int32',Bit_Size(testInt32)
      write(*,1000) 'int64',Bit_Size(testInt64)
!
      end program bitSizeExample
