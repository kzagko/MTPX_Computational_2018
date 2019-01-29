      PROGRAM SOLUTION_DEDP

      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (NEQN=2)
      REAL*8 Y(NEQN)
      EXTERNAL DERIVS

      TIME   = 0.d0
      TSTEP  = 0.01d0
      NPER   = 10

      RELERR = 1.d-13
      ABSERR = 1.d-13
      IFLAG  = 1

      OPEN(11,FILE='output.dat',STATUS='UNKNOWN')

      Y(1) = 1.
      Y(2) = 1.

C===============================================================
c     Basic Time Loop !!!
C===============================================================

      DO I=1,NPER     
         
         TOUT = I*TSTEP
         CALL DEDP(DERIVS,NEQN,Y,TIME,TOUT,RELERR
     $        ,ABSERR,IFLAG)
         WRITE(11,*) TIME,Y(1),Y(2)
         
      ENDDO
      
      CLOSE(11)

      END 

C===================================================================
C===================================================================

      SUBROUTINE DERIVS(T,Y,DYDT)

      IMPLICIT REAL*8 (A-H,O-Z)
      REAL*8 Y(2),DYDT(2)

      DYDT(1) = Y(2)
      DYDT(2) = -Y(1)

      END SUBROUTINE

C===================================================================

      INCLUDE 'dedp.f'

