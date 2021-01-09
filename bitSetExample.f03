      program bitSetExample
!
!     This program is used to demonstrate setting, reading, and working with
!     bits in integer variables.
!
!
!     Hrant P. Hratchian, 2021.
!
      use ISO_FORTRAN_ENV
      implicit none
      integer(kind=int64)::i,int1,int2,int3
      logical::bitOn
!
 1000 format(1x,A,' = ',I10)
 1100 format(1x,A,'  OR ',A,' = ',I10)
 1200 format(1x,A,' XOR ',A,' = ',I10)
 1300 format(1x,A,' AND ',A,' = ',I10)
!
!     We will begin by setting bits 1 and 5 in int1. We also set bits 1, 3, and
!     6 in int2. So, in binary form,
!           int1 =  100010
!           int2 = 1001010
!
!     Note that we have ensured that int1 has 64 bits. We consider use of only
!     bits 0 -> 62 in case the 64th bit is a sign bit.
!
      int1 = 2**1 + 2**5
      int2 = 2**1 + 2**3 + 2**6
!
!     Check each bit of int1 and report to the screen whether each bit is on (1)
!     or off (0).
!
      write(*,1000) TRIM('int1'),int1
      call checkBits(int1)
      write(*,1000) TRIM('int2'),int2
      call checkBits(int2)
!
!     Let int3 be given by the OR or int1 and int2. Then report the bits turned
!     on in int3.
!
      int3 = int1.or.int2
      write(*,1100) 'int1','int2',int3
      call checkBits(int3)
!
!     Let int3 be given by the XOR or int1 and int2. Then report the bits turned
!     on in int3.
!
      int3 = int1.xor.int2
      write(*,1200) 'int1','int2',int3
      call checkBits(int3)
!
!     Let int3 be given by the AND or int1 and int2. Then report the bits turned
!     on in int3.
!
      int3 = int1.and.int2
      write(*,1300) 'int1','int2',int3
      call checkBits(int3)
!     
      end program bitSetExample


      subroutine checkBits(inputInt)
!
!     This subroutine goes through the bits of the input argument inputInt and
!     reports which are on (set to 1).
!
!
!     Hrant P. Hratchian, 2021.
!
      use ISO_FORTRAN_ENV
      implicit none
      integer(kind=int64),intent(in)::inputInt
      integer(kind=int64)::i
      logical::bitOn
!
 1000 format(1x,'  Bit ',I2,' is ON.')
!
!     Check each bit of int1 and report to the screen whether each bit is on (1)
!     or off (0).
!
      do i = 0,62
        bitOn = Mod(inputInt,2*2**i).ge.2**i
        if(bitOn) write(*,1000) i
      endDo
!
      end subroutine checkBits
