      program Gauss

      parameter (nline=3)
      implicit real*8 (a-h,o-z)

      real*8 a(nline,nline)
      real*8 x(nline)
      real*8 b(nline)

c      real*8 c(nline,nline)
      write(*,*) 'This is the first array'
      open(1,file="initial.dat",status='old')
       do i=1,nline
        read(1,1000) (a(i,j), j=1,nline),b(i)
 1000 format(4(1x,f5.1))
        write(*,1000) (a(i,j), j=1,nline),b(i)
       enddo
      close(1)
      pause

c begin Gauss method

      do ii=1,nline-1  !a

       do jj=ii+1,nline  !b
          c=(a(jj,ii)/a(ii,ii))
          b(jj)= -c*b(ii) + b(jj)
          do kk=1,nline  !c
             a(jj,kk)= -(c*a(ii,kk)) + a(jj,kk)
c             write(*,*) jj,kk
c             write(*,*) a(jj,kk)
c             pause
          enddo          !c
       enddo           !b
      enddo            !a

      write(*,*) 'This is the final array'
      do l=1,nline
      write(*,1000) (a(l,m),m=1,nline),b(l)
      enddo
      pause
 
      x(nline)=b(nline)/a(nline,nline)
      do m=nline-1,1,-1  ! antistrofi metrisi
         sum=b(m)
         do n=m+1,nline
            sum=sum-x(n)*a(m,n)
         enddo
         x(m)=sum/a(m,m)
      enddo

      write(*,*) 'The solution of the system is '
      do mm=1,nline
       write(*,*) x(mm)
      enddo
      write(*,*) a(1,1)*x(1)+a(1,2)*x(2)+a(1,3)*x(3) - b(1)
      stop
      end
