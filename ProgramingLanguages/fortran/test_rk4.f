      PROGRAM SOLUTION_DEDP
      IMPLICIT REAL*8 (A-H,O-Z)

      PARAMETER (NEQN=4)
c----------------------------------------------------------------
c THIS IS THE NUMBER OF EQUATIONS WE SOLVE - i.e. the size of 
c the Y and dY/dX arrays
c----------------------------------------------------------------

      REAL*8 Y(NEQN),YY(NEQN),DYDX(NEQN)
      EXTERNAL DERIVS
      COMMON /pars/ c,cf1,cf2,cf3,cf4,bfr
c----------------------------------------------------------------
c   DERIVS = the subrutine where the r.h.s. of the equations
c   (i.e. the 1st-order derivatives) are computed
c   Y(n)    = the vector of dependent variables 
c   YY(n)   = the same as Y(n), but it will be used to pu tin 
c             the *final* values of each step 
c   DYDX(n) = the vector of derivatives of Y(n) 
c----------------------------------------------------------------

      PI = dacos(-1.d0)
      twopi = 2.d0*PI
      
      T     = 0.d0
      STEP  = 0.001d0
      NPER  = 1800
c----------------------------------------------------------------
c   T = independent variable (initial value)
c   STEP = integration step in T (e.g. time-step)
c   NPER = number of steps to carry out until T_final
c---------------------------------------------------------------- 

c----------------------------------------------------------------
c   open a file to write the data in
c----------------------------------------------------------------
      OPEN(11,FILE='output.dat',STATUS='UNKNOWN')
      
c----------------------------------------------------------------
c   give INITIAL values to the variables AND their derivatives
c----------------------------------------------------------------
      Y(1) = 0.4*PI
      Y(2) = Y(1)+1.d-3
      Y(3) = 0.d0
      Y(4) = 0.d0
      
	  AL1 = 2.5   ! length 1
      AL2 = 0.5   ! length 2
      GG  = 9.81  ! gravity
      C = 0.1     ! moment of inertia of the box w.r.t axis from joint
                  ! scaled by mass and length 1 = I_2 / M * AL1 
      bfr = 0.1   ! friction coefficient
      
      cf1 = AL2/AL1
      cf2 = GG/AL1
      cf3 = GG/(AL2+C)
      cf4 = AL1/(AL2+C)
      
	  CALL DERIVS(T,Y,DYDX)
      y(1)=dmod(y(1),twopi)
      y(2)=dmod(y(2),twopi)
      if (y(1).lt.0.d0) y(1)=y(1)+twopi
      if (y(2).lt.0.d0) y(2)=y(2)+twopi
        
      write(*,*) t
      write(*,*) y(1),y(2),y(3),y(4)
      write(*,*) dydx(1),dydx(2),dydx(3),dydx(4)

      WRITE(*,*) 'Initial Data'
      DO I=1,NEQN
         WRITE(*,*) 'Y(',I,') = ',Y(I),'   dY/dX(',I,') = ',DYDX(I)
      ENDDO  


c===============================================================
c     Now STARTS the basic loop of NPER STEPs in T !!!
c===============================================================

      DO I=1,NPER     
         T = (I-1)*STEP                          ! increment T
         CALL RK4(Y,DYDX,NEQN,T,STEP,YY,DERIVS)  ! take one STEP forward
         DO J=1,NEQN
            Y(J) = YY(J)                         ! re-increment the variables 
         ENDDO                                   !          for the next step          
         WRITE(11,*) T+STEP,(Y(k),k=1,NEQN)      ! write the output
         WRITE(*,*) T+STEP,(Y(k),k=1,NEQN)       ! also on the screen
      ENDDO
      
c
c...
c

      CLOSE(11)
      PAUSE
      END 

C===================================================================
C===================================================================
      SUBROUTINE DERIVS(X,Y,DYDX)
c
c... NOTE! --> WE NEED TO SPECIFY HERE THE NUMBER OF EQUATIONS AGAIN!!!
c
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (NEQN=4)
      REAL*8 Y(NEQN),DYDX(NEQN)
      COMMON /pars/ c,cf1,cf2,cf3,cf4,bfr

c
c...  Here write your equations in solved form, i.e. dy_i/dx = f(x,yi,...yn)
c

      DYDX(1) = Y(3)
      DYDX(2) = Y(4)
      DYDX(3) = (cf1*cf3*dsin(Y(2))*dcos(Y(2)-Y(1))
     $	 -cf2*dsin(Y(1)))/((1.d0-cf1*cf4)
     $ 	*dcos(Y(2)-Y(1))**2)      
      DYDX(4) = -cf4*DYDX(3)*dcos(Y(2)-Y(1))
     $	   -cf3*dsin(Y(2))+bfr*DYDX(2)
      
      END SUBROUTINE

C===================================================================

      SUBROUTINE rk4(y,dydx,n,x,h,yout,derivs)

c
c...  THIS IS THE 4th-ORDER RUNGE-KUTTA INTEGRATOR
c...
c...  NO NEED TO CHANGE ANYTHING, EVER !!!
c
      INTEGER n,NMAX
      REAL*8 h,x,dydx(n),y(n),yout(n)
      EXTERNAL derivs
      PARAMETER (NMAX=50)
      INTEGER i
      REAL*8 h6,hh,xh,dym(NMAX),dyt(NMAX),yt(NMAX)

c     Given values for the variables y(1:n) and their derivatives 
c     dydx(1:n) known at x, use the fourth-order Runge-Kutta method 
c     to advance the solution over an interval h and return
c     the incremented variables as yout(1:n). 

      hh=h*0.5d0
      h6=h/6.d0
      xh=x+hh

      do i=1,n	!First step.
         yt(i)=y(i)+hh*dydx(i)
      enddo 
      call derivs(xh,yt,dyt)	!Second step.
      do i=1,n
         yt(i)=y(i)+hh*dyt(i)
      enddo 
      call derivs(xh,yt,dym)	!Third step.
      do i=1,n
         yt(i)=y(i)+h*dym(i)
         dym(i)=dyt(i)+dym(i)
      enddo 
      call derivs(x+h,yt,dyt)	!Fourth step.
      
c     Accumulate increments with proper weights.
      do i=1,n
         yout(i)=y(i)+h6*(dydx(i)+dyt(i)+2.d0*dym(i))
      enddo 

      return
      END



