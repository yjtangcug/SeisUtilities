
Subroutine read_par(fn,lenstring) BIND(c,name='read_par')
	use, intrinsic :: ISO_C_binding
	implicit none
	type(c_ptr),value :: fn
	integer(c_int),value :: lenstring
	character(kind=c_char) ,pointer :: pfn(:)
	character(len=256, kind=c_char) :: fname
! 	local var
	integer :: nx,nz
	real 	:: sx,sz

	call c_f_pointer(fn,pfn,[lenstring+1])
	pfn(lenstring+1)=''
	print *, 'cstring is ',pfn(1:lenstring+1),' cstring length is',lenstring

	call strarr2str(pfn,lenstring,fname,256)
	print *, 'fname is', trim(fname)

	open(99,file=fname,status='old')
	read(99,*) nx,nz
	print * , 'nx=',nx,'nz=',nz
	read(99,*) sx,sz
	print * , 'sx=',sx,'sz=',sz
	close(99)
End Subroutine

Subroutine strarr2str(pfn,lenstring,fname,lens)
	use, intrinsic :: ISO_C_binding
	implicit none
	character(kind=c_char) :: pfn(lenstring)
	integer :: lenstring,lens
	character(len=lens) :: fname

	integer :: is
	character(c_char) :: s
	do is=1,lenstring
		s=pfn(is)
		print *,'s=',s
		if (is==1) then
			fname=s
		else
			fname=trim(fname)//s
		end if

	end do
End Subroutine



