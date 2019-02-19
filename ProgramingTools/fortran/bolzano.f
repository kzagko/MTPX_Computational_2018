      program test2

      real*8 a,b,m,e,p,eps,fa,fb,fm,yy
      integer i

         a = 0.d0	! to arxiko diasthma elegxou
         b = 3.14159d0 	 	

         p = 3.14159d0/3.d0	! oi times twn sta8erwn sthn F(x)
         e = 0.6d0

         eps = 1.d-15	! h akribeia pou 8elw..

         i=1	! metrhths (poses epanalhseis 8a kanei...)

         fa = a-e*dsin(a)-p	!arxikes times F(a) kai F(b)
         fb = b-e*dsin(b)-p

         if (fa*fb.gt.0.d0) then	!elegxos Bolzano
            write(*,*) 'Den yparxei riza'
            goto 11	! spaw to programma --> TELOS
         endif

 22         m = (a+b)/2.d0	! ypologizw to meso tou diasthmatos
            fm = m-e*dsin(m)-p	! kai thn timh ths F(x) ekei...

            if (dabs(fm).gt.eps) then   ! mhpws epesa panw sth riza ???
				       ! an oxi -->
               yy = fm*fa	! elegxos Bolzano
				! kai prosdiorismos tou katallhlou diasthmatos
                if (yy.lt.0.d0) then
                   b = m
                   fb = fm
                else
                   a = m
                   fa = fm
                endif

                i = i+1		! ekana mia akomh epanalhpsh
                goto 22		! kai 3ana apo thn arxh...

            else		! an eixa ontws pesei sth riza...

               write(*,*) 'Epanalhpsh No=',i
               write(*,*) 'H riza einai rho =',m*180.d0/3.14159d0,
     &      ' me timh fm=',fm 
	       goto 11		! grafw ta apotelesmata kai TELOS

            endif
 
 11   continue	!TELOS

      end


