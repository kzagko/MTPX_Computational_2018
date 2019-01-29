      program integrate_Newton_Cotes
      implicit real*8 (a-h,o-z)
	  real*8 h(3),s(3),err(3),ar(3),br(3)
      
	  pi=dacos(-1.d0)
      ean = 0.5d0*pi-1.d0
      
      a=0.d0
      b=pi/2.d0
 
      ar(1) = 0.5d0
      ar(2) = 1.d0/3.d0
      ar(3) = 3.d0/8.d0

      br(1) = 1.d0
      br(2) = 4.d0
      br(3) = 3.d0
      
      do i=1,3
         h(i) = (b-a)/dfloat(i)
         s(i) = 0.d0
	  enddo        
      
c...  Check this out!
      do i=1,3
        sum=f(a)+f(b)
        x=a
        do j=2,i
           x = x+h(i)
           sum = sum + br(i)*f(x) 
        enddo
        s(i) = sum*h(i)*ar(i)
        if (s(i).lt.1.d-14) s(i)=0.d0
      enddo
c...

      write(*,'(a29,f8.6)') 'H analytikh timh einai: I0 = ',ean
      write(*,*) ' '
      
      do i=1,3
         err(i)= dabs((s(i)-ean)/ean)*100.d0
         write(*,'(a10,i1,a7,f8.6)') 'N-C order ',i,' : I = ',s(i)
         write(*,'(a18,f7.3,a1)')'Sxetiko sfalma  = ',err(i),'%'
         write(*,*) ' '
      enddo
      
      end

c----------------------------
      real*8 function f(x)
      real*8 x,f

      f = x*dcos(x)

      return
      end
      