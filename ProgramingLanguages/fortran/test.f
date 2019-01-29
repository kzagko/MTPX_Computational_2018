      program test
      integer x,z,f
      x=4
      write(*,*) "x=",x
      z=f(x)
      write(*,*) "x=",x," z=",z
      pause
	  end
!-----------------------------------       
      function f(x)
      integer x
      integer f
      x=2
      f=3*x
      return
      end
