      program integrate_Simpson
      implicit real*8 (a-h,o-z)
      character ii
                  
	  pi=dacos(-1.d0)
      ean = 0.5d0*pi-1.d0
      
      a=0.d0
      b=pi/2.d0

20    write(*,*) ' '
	  write(*,*) 'Diale3e me8odo:'
      write(*,*) '[1]=Simpson + Romberg '
      write(*,*) '[2]=Simpson 3/8ths'
      write(*,*) ' '
10	  read(*,*) imd

1000  format (a23,f20.18,a3,f20.18,a3)
      
      if (imd.eq.1) then
      	 write(*,*) 'Dwse ton ari8mo twn diamerisewn (artios>=4)'
         read(*,*) N
         call simpson(a,b,N,s1,s2)
         err1 = dabs((s1-ean)/ean)*100.d0
         err2 = dabs((s2-ean)/ean)*100.d0
         write(*,1000) 'Simpson:           I = ',
     &    s1,'  (',err1,' %)'
         write(*,1000) 'Simpson + Romberg: I = ',
     &    s2,'  (',err2,' %)'
      else if (imd.eq.2) then
         write(*,*) 'Dwse ton ari8mo twn diamerisewn (pollapl. 3)'
         read(*,*) N
         call simp38(a,b,N,s3)           
         err3 = dabs((s3-ean)/ean)*100.d0
         write(*,1000) 'Simpson 3/8ths   : I = ',
     &    s3,'  (',err3,' %)'
      else 
         write(*,*) 'FAIL! - Give [1] or [2]: '
         goto 10
      endif   

      write(*,*) 'Neos ypologismos = [0]     Telos =/= 0'
      read(*,*) ii
      if (ii.eq.'0') goto 20
        
      end

c----------------------------
      real*8 function f(x)
      real*8 x

      f = x*dcos(x)

      return
      end
  
c---------------------------------------
      subroutine simpson(a,b,N,s1,s2)
      real*8 a,b,h1,h2,s1,s2,fa,fb,sum,x,f  
      integer N,N1,N2,i

      N1 = N
      N2 = 2*N
      
      h1=(b-a)/dfloat(N1)     
      h2=0.5d0*h1     
          
      fa=f(a)
      fb=f(b)

c...  1st step - Simpson with N
      sum=h1*(fa+fb)
      x=a
      do i=1,N1-1
         x = x + h1
         if (mod(i,2).eq.1) then
            r=4.d0
         else
            r=2.d0
         endif
         sum = sum + r*f(x)*h1
      enddo
      s1=sum/3.d0

c...  2nd step - Simpson with 2*N
      sum=h2*(fa+fb)
      x=a      
      do i=1,N2-1
         x = x + h2
         if (mod(i,2).eq.1) then
            r=4.d0
         else
            r=2.d0
         endif
         sum = sum + r*f(x)*h2
      enddo
      sum=sum/3.d0

      s2 = sum+(sum-s1)/(2.d0**5-1.d0)
      
      return
      end
c---------------------------------------

      subroutine simp38(a,b,N,s)
      real*8 a,b,h,s,fa,fb,sum,x,f  
      integer N,i

      h = (b-a)/dfloat(N)     
      
      fa=f(a)
      fb=f(b)

      sum=h*(fa+fb)
      x=a
      do i=1,N-1
         x = x + h
         if (mod(i,3).eq.0) then
            r=2.d0
         else
            r=3.d0
         endif
         sum = sum + r*f(x)*h
      enddo
      s=3.d0*sum/8.d0

      return
      end
      
