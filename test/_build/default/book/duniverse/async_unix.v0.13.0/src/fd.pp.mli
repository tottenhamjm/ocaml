Caml1999N026����   .         	,book/duniverse/async_unix.v0.13.0/src/fd.mli����  ��  �  W4  Qm�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � An [Fd.t] is a wrapper around a Unix file descriptor, with additional information
    about the kind of file descriptor and logic to ensure that we don't use a file
    descriptor that has been closed, or close a file descriptor that is in use.

    Since Async uses multiple threads to make read/write and other system calls on file
    descriptors, and Unix reuses descriptors after they are closed, Async has to be very
    careful that the file descriptor passed to a system call is referring to the file it
    intends, and not some other completely unrelated file that Unix has decided to assign
    to the same descriptor.

    Provided that one only accesses a file descriptor within the context of the functions
    below, [Fd] guarantees that the file descriptor will not have been closed/reused and
    will correspond to the same file that it did when the [Fd.t] was created:

    {v
      with_file_descr
      with_file_descr_deferred
      syscall
      syscall_exn
      syscall_result_exn
      syscall_in_thread
      syscall_in_thread_exn
    v}

    The [Fd] module keeps track of which of these functions are currently accessing the
    file descriptor, and ensures that any close happens after they complete.  Also, once
    close has been called, it refuses to provide further access to the file descriptor,
    either by returning a variant [`Already_closed] or by raising an exception.

    Some of the above functions take an optional [?nonblocking:bool] argument.  The
    default is [false], but if it is set to [true], then before supplying the underlying
    [file_descr], the [Fd] module will first call [Unix.set_nonblock file_descr], if it
    hasn't previously done so on that file descriptor.  This is intended to support making
    nonblocking system calls (e.g., connect, read, write) directly within Async, without
    releasing the OCaml lock or the Async lock, and without using another thread. @��	,book/duniverse/async_unix.v0.13.0/src/fd.mliA@@�cA�@@@@��A@@�cA�@@���@@ ���@@ �A��
A@@�cA�@������$Core��e���e��@@��e���e��@@��e���e��@������&Import��$f���%f��@@��'f���(f��@@��*f���+f��@�����$Kind��3h���4h��@�����A�    �!t��?i���@i��@@@��Р$Char��Gj���Hj��@�@@��Kj���Lj��@���)ocaml.doc��=@@ ��>@@ �A�������, a terminal @��]j���^j��@@@@��`j���aj��@@��N@@ ��O@@ �A@�Р$Fifo��jk���kk��@�@@��nk���ok��@���#��_@@ ��`@@ �A�������( a pipe @��k����k�@@@@���k����k�@@��p@@ ��q@@ �A@�Р$File���l	��l@�@@���l��l@���E���@@ ���@@ �A�������0 a regular file @���l��l#@@@@���l��l#@@���@@ ���@@ �A@�Р&Socket���m$*��m$0@��������+Unconnected���n4>��n4J@A@���n4>��n4J@���r���@@ ���@@ �A�������: the result of [socket()] @���n4K��n4j@@@@���n4K��n4j@@���@@ ���@@ �A@����%Bound���oku��ok{@A@���oku��ok{@�������@@ ���@@ �A�������8 the result of [bind()] @���ok|��ok�@@@@���ok|��ok�@@���@@ ���@@ �A@����'Passive���p����p��@A@��p���p��@�������@@ ���@@ �A�������: the result of [listen()] @��p���p��@@@@��p���p��@@��@@ ��@@ �A@����&Active�� q���!q��@A@��#q���$q��@���ذ�@@ ��@@ �A�������	) the result of [connect()] or [accept()] @��4q���5q�	@@@@��7q���8q�	@@��%@@ ��&@@ �A@@@@��=n4<�>r		@@@@@��@m$(�Ar		@@@A@@��Ci���Dr		@@��Fi���Gr		@���Р0infer_using_stat��Ot		�Pt		/@��@������$Unix*File_descr!t��]t		2�^t		C@@��`t		2�at		C@@@�����(Deferred!t��jt		I�kt		S@�����!t��st		G�tt		H@@��vt		G�wt		H@@@@��yt		G�zt		S@@@��|t		2�}t		S@@@@@��t		��t		S@���t		��t		S@@���h����u	T	W@@@���h����u	T	W@���h����u	T	W@���A�    �!t���w	Y	^��w	Y	_@@@@A@���(deriving���w	Y	c��w	Y	k@��������'sexp_of���w	Y	l��w	Y	s@���w	Y	l��w	Y	s@@@@���w	Y	l��w	Y	s@@���w	Y	`��w	Y	t@@���w	Y	Y��w	Y	t@@���w	Y	Y��w	Y	t@�����������-ocaml.warning���w	Y	Y��w	Y	t@�������#-32@���w	Y	Y��w	Y	t@@@@���w	Y	Y��w	Y	t@@���w	Y	Y��w	Y	t@���w	Y	Y��w	Y	t@���Р)sexp_of_t���w	Y	^��w	Y	_@��@����X���w	Y	^��w	Y	_@@���w	Y	^��w	Y	_@@@������1Ppx_sexp_conv_lib$Sexp!t���w	Y	^��w	Y	_@@���w	Y	^��w	Y	_@@@��w	Y	^�w	Y	_@@@@@��w	Y	Y�w	Y	t@��w	Y	Y�w	Y	t@@��
w	Y	Y�w	Y	t@@��w	Y	Y�w	Y	t@���)ocaml.doc��w	Y	Y�w	Y	t@�������'@inline@��w	Y	Y� w	Y	t@@@@��"w	Y	Y�#w	Y	t@@��%w	Y	Y�&w	Y	t@@��(w	Y	Y�)w	Y	t@���A�    �%t_hum��2x	u	z�3x	u	@@@@A�����!t��;x	u	��<x	u	�@@��>x	u	��?x	u	�@@@���(deriving��Ex	u	��Fx	u	�@��������'sexp_of��Qx	u	��Rx	u	�@��Tx	u	��Ux	u	�@@@@��Wx	u	��Xx	u	�@@��Zx	u	��[x	u	�@@��]x	u	u�^x	u	�@@��`x	u	u�ax	u	�@��������������nx	u	u�ox	u	�@��������@��xx	u	u�yx	u	�@@@@��{x	u	u�|x	u	�@@��~x	u	u�x	u	�@���x	u	u��x	u	�@���Р-sexp_of_t_hum���x	u	z��x	u	@��@����b���x	u	z��x	u	@@���x	u	z��x	u	@@@������������x	u	z��x	u	@@���x	u	z��x	u	@@@���x	u	z��x	u	@@@@@���x	u	u��x	u	�@���x	u	u��x	u	�@@���x	u	u��x	u	�@@���x	u	u��x	u	�@�������x	u	u��x	u	�@��������@���x	u	u��x	u	�@@@@���x	u	u��x	u	�@@���x	u	u��x	u	�@@���x	u	u��x	u	�@���Р$info���z	�	���z	�	�@��@����!t���z	�	���z	�	�@@���z	�	���z	�	�@@@�����$Info!t���z	�	���z	�	�@@���z	�	���z	�	�@@@���z	�	���z	�	�@@@@@���z	�	���z	�	�@���z	�	���z	�	�@���Р)to_string���}	�	�� }	�
@��@����!t��	}	�
�
}	�
@@��}	�
�}	�
@@@����&string��}	�
�}	�
@@��}	�
�}	�
@@@��}	�
�}	�
@@@@���ϰ�@@ ��@@ �A�������	C [to_string t] returns a pretty sexp of the representation of [t]. @��+|	�	��,|	�	�@@@@��.|	�	��/|	�	�@@��@@ ��@@ �A@��4}	�	��5}	�
@��7}	�	��8}	�
@���Р&create��@ J���A J��@���:avoid_nonblock_if_possible����$bool��L K���M K��@@��O K���P K��@@�����@@@ ��A@@ �A�������4 default is [false] @��` K���a K��@@@@��c K���d K��@@��Q@@ ��R@@ �A@��@�����$Kind!t��r L���s L� @@��u L���v L� @@@��@������$Unix*File_descr!t��� M�� M@@��� M�� M@@@��@�����$Info!t��� N�� N#@@��� N�� N#@@@����!t��� O$)�� O$*@@��� O$)�� O$*@@@��� N�� O$*@@@��� M�� O$*@@@��� L���� O$*@@@��� K���� O$*@@@@���a���@@ ���@@ �A�������
  � [create ?support_nonblock kind file_descr] creates a new [t] of the underlying kind
    and file descriptor.

    We thought about using [fstat()] rather than requiring the user to supply the kind.
    But [fstat] can block, which would require putting this in a thread, which has some
    consequences, and it isn't clear that it gets us that much.  Also, [create] is mostly
    used within the Async implementation -- clients shouldn't need it unless they are
    mixing Async and non-Async code.

    If [avoid_nonblock_if_possible], then Async will treat the file descriptor as blocking
    if it can (more precisely, if it's not a bound socket). @���

�� Ik�@@@@���

�� Ik�@@���@@ ���@@ �A@��� J���� O$*@��� J���� O$*@���Р$kind��� Rmq�� Rmu@��@����!t��� Rmx�� Rmy@@��� Rmx�� Rmy@@@�����$Kind!t��� Rm}�� Rm�@@��� Rm}�� Rm�@@@��� Rmx�� Rm�@@@@�������@@ ���@@ �A�������	; [kind t] returns the kind of file descriptor that [t] is. @��  Q,,� Q,l@@@@�� Q,,� Q,l@@���@@ ���@@ �A@��	 Rmm�
 Rm�@�� Rmm� Rm�@���Р1supports_nonblock�� U��� U��@��@����!t�� U���  U��@@��" U���# U��@@@����$bool��* U���+ U��@@��- U���. U��@@@��0 U���1 U��@@@@�����!@@ ��"@@ �A�������	N [supports_nonblock t] returns true if [t] supports nonblocking system calls. @��A T���B T��@@@@��D T���E T��@@��2@@ ��3@@ �A@��J U���K U��@��M U���N U��@���Р.clear_nonblock��V ^���W ^��@��@����!t��` ^���a ^��@@��c ^���d ^��@@@����$unit��k ^���l ^��@@��n ^���o ^��@@@��q ^���r ^��@@@@���&��b@@ ��c@@ �A�������
  � [clear_nonblock t] clears the [nonblocking] flag on [t] and causes Async to treat the
    fd as though it doesn't support nonblocking I/O.  This is useful for applications that
    want to share a file descriptor between Async and non-Async code and want to avoid
    [EWOULDBLOCK] or [EAGAIN] being seen by the non-Async code, which would then cause a
    [Sys_blocked_io] exception.

    [clear_nonblock t] has no effect if [not (supports_nonblock t)]. @��� W���� ]��@@@@��� W���� ]��@@��s@@ ��t@@ �A@��� ^���� ^��@��� ^���� ^��@�����%Close��� b{��� b{�@�����A�    �/socket_handling��� c���� c��@@@��Р/Shutdown_socket��� d���� d��@�@@��� d���� d��@@�Р6Do_not_shutdown_socket��� e���� e��@�@@��� e���� e��@@@A@@��� c���� e��@@��� c���� e��@���A�    �8file_descriptor_handling��� g���� g��@@@��Р5Close_file_descriptor��� h��� h�@������/socket_handling��� h��� h�+@@��� h��� h�+@@@@@��� h��� h�+@@�Р<Do_not_close_file_descriptor��� i,2�� i,N@�@@��� i,0�� i,N@@@A@@��� g���� i,N@@��� g���� i,N@���Р%close��� {�� {@���8file_descriptor_handling����8file_descriptor_handling�� |:�	 |R@@�� |:� |R@@�������@@ ���@@ �A�������	4 default is [Close_file_descriptor Shutdown_socket] @�� }SW� }S�@@@@�� }SW�  }S�@@��@@ ��@@ �A@��@����!t��, ~���- ~��@@��/ ~���0 ~��@@@�����(Deferred!t��9 ���: ��@�����$unit��B ���C ��@@��E ���F ��@@@@��H ���I ��@@@��K ~���L ��@@@��N | �O ��@@@@�����?@@ ��@@@ �A�������
  � [close t] prevents further use of [t], and makes [shutdown()] and [close()] system
      calls on [t]'s underlying file descriptor according to the
      [file_descriptor_handling] argument and whether or not [t] is a socket, i.e., [kind
      t = Socket `Active]:

      {v
        | file_descriptor_handling                     | shutdown() | close() |
        |----------------------------------------------+------------+---------|
        | Do_not_close_file_descriptor                 | no         | no      |
        | Close_file_descriptor Shutdown_socket        | if socket  | yes     |
        | Close_file_descriptor Do_not_shutdown_socket | no         | yes     |
      v}

      The result of [close] becomes determined once the system calls complete.  It is OK
      to call [close] multiple times on the same [t]; calls subsequent to the initial call
      will have no effect, but will return the same deferred as the original call. @��_ kPR�` z�@@@@��b kPR�c z�@@��P@@ ��Q@@ �A@��h {�i ��@��k {�l ��@@��n b{��o ���@@���#��_@@ ��`@@ �A�������	� The [Close] module exists to collect [close] and its associated types, so they
    can be easily reused elsewhere, e.g., [Unix_syscalls]. @�� `���� a=z@@@@��� `���� a=z@@��p@@ ��q@@ �A@��� b{{�� ���@��� b{{�� ���@����������%Close��� ����� ���@��� ����� ���@@��� ����� ���@@��� ����� ���@@��� ����� ���@���Р-close_started��� ��� �+@��@����!t��� �.�� �/@@��� �.�� �/@@@�����(Deferred!t��� �8�� �B@�����$unit��� �3�� �7@@��� �3�� �7@@@@��� �3�� �B@@@��� �.�� �B@@@@�������@@ ���@@ �A�������	@ [close_started t] becomes determined when [close t] is called. @��� ����� ��@@@@��� ����� ��@@���@@ ���@@ �A@��� ��� �B@��� ��� �B@���Р.close_finished��� ����� ���@��@����!t�� ���� ���@@��
 ���� ���@@@�����(Deferred!t�� ���� ���@�����$unit�� ���� ���@@��  ����! ���@@@@��# ����$ ���@@@��& ����' ���@@@@���۰�@@ ��@@ �A�������	� [close_finished] returns the same result as [close], but differs in that it does not
    have the side effect of initiating a close. @��7 �DD�8 ���@@@@��: �DD�; ���@@��(@@ ��)@@ �A@��@ ����A ���@��C ����D ���@���Р)is_closed��L �>B�M �>K@��@����!t��V �>N�W �>O@@��Y �>N�Z �>O@@@����$bool��a �>S�b �>W@@��d �>S�e �>W@@@��g �>N�h �>W@@@@�����X@@ ��Y@@ �A�������	= [is_closed t] returns [true] iff [close t] has been called. @��x ����y ��=@@@@��{ ����| ��=@@��i@@ ��j@@ �A@��� �>>�� �>W@��� �>>�� �>W@���Р*with_close��� ����� ���@��@����!t��� ����� ���@@��� ����� ���@@@���!f��@����!t��� ����� ���@@��� ����� ���@@@�����(Deferred!t��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@@�����(Deferred!t��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@@�������@@ ���@@ �A�������	Q [with_close t f] applies [f] to [t], returns the result of [f], and closes [t]. @��� �YY�� �Y�@@@@��� �YY�� �Y�@@���@@ ���@@ �A@��� ����� ���@��� ����� ���@���Р'is_open�� �� �$@��@����!t�� �'� �(@@�� �'� �(@@@����$bool�� �,� �0@@�� �,� �0@@@�� �'� �0@@@@���Ұ�@@ ��@@ �A�������	$ [is_open t] is [not (is_closed t]) @��. ����/ ��@@@@��1 ����2 ��@@��@@ �� @@ �A@��7 ��8 �0@��: ��; �0@���Р%stdin��C ����D ���@��@����$unit��M ����N ���@@��P ����Q ���@@@����!t��X ����Y ���@@��[ ����\ ���@@@��^ ����_ ���@@@@�����O@@ ��P@@ �A�������	] [stdin], [stdout], and [stderr] are wrappers around the standard Unix file
    descriptors. @��o �22�p ���@@@@��r �22�s ���@@��`@@ ��a@@ �A@��x ����y ���@��{ ����| ���@���Р&stdout��� ����� ���@��@����$unit��� ����� ���@@��� ����� ���@@@����!t��� ����� ���@@��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��� ����� ���@���Р&stderr��� ����� ���@��@����$unit��� ����� ���@@��� ����� ���@@@����!t��� ����� ���@@��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��� ����� ���@���Р/with_file_descr��� ����� ���@���+nonblocking����$bool��� ����� ���@@��� ����� ���@@�������@@ ���@@ �A�������4 default is [false] @��� ����� �� @@@@��� ����� �� @@���@@ ���@@ �A@��@����!t�� ��	 �@@�� �� �@@@��@��@������$Unix*File_descr!t�� �� �@@�� �� �@@@��!a��$ �#�% �%@@@��' ��( �%@@@������"Ok��1 �'.�2 �'1@@���!a��8 �'5�9 �'7@@@@��; �'.�< �'7@@����.Already_closed��C �':�D �'I@A@��F �':�G �'I@@����%Error��N �'L�O �'R@@�����#exn��W �'V�X �'Y@@��Z �'V�[ �'Y@@@@��] �'L�^ �'Y@@@@@��` �',�a �'[@@@��c ��d �'[@@@��f ��g �'[@@@��i ����j �'[@@@@�����	Z@@ ��	[@@ �A�������	� [with_file_descr t f] runs [f] on the file descriptor underlying [t], if [is_open t],
    and returns [`Ok] or [`Error] according to [f].  If [is_closed t], then it does not
    call [f] and returns [`Already_closed]. @��z ����{ ���@@@@��} ����~ ���@@��	k@@ ��	l@@ �A@��� ����� �'[@��� ����� �'[@���Р3with_file_descr_exn��� ����� ���@���+nonblocking����$bool��� ��
�� ��@@��� ��
�� ��@@���S��	�@@ ��	�@@ �A�������4 default is [false] @��� ���� ��(@@@@��� ���� ��(@@��	�@@ ��	�@@ �A@��@����!t��� �).�� �)/@@��� �).�� �)/@@@��@��@������$Unix*File_descr!t��� �06�� �0G@@��� �06�� �0G@@@��!a��� �0K�� �0M@@@��� �06�� �0M@@@��!a��� �OT�� �OV@@@��� �05�� �OV@@@��� �).�� �OV@@@��� ����� �OV@@@@������	�@@ ��	�@@ �A�������	} [with_file_descr_exn] is like [with_file_descr] except that it raises rather than
    return [`Already_closed] or [`Error]. @��� �]]�� ���@@@@��	 �]]�	 ���@@��	�@@ ��	�@@ �A@��	 ����	 �OV@��	
 ����	 �OV@���Р8with_file_descr_deferred��	 ����	 ���@��@����!t��	 ����	 ���@@��	  ����	! ���@@@��@��@������$Unix*File_descr!t��	0 ����	1 ��@@��	3 ����	4 ��@@@�����(Deferred!t��	= ��
�	> ��@���!a��	D ���	E ��	@@@@��	G ���	H ��@@@��	J ����	K ��@@@�����(Deferred!t��	T �K�	U �U@�������"Ok��	_ ��	` � @@���!a��	f �$�	g �&@@@@��	i ��	j �&@@����.Already_closed��	q �)�	r �8@A@��	t �)�	u �8@@����%Error��	| �;�	} �A@@�����#exn��	� �E�	� �H@@��	� �E�	� �H@@@@��	� �;�	� �H@@@@@��	� ��	� �J@@@@��	� ��	� �U@@@��	� ����	� �U@@@��	� ����	� �U@@@@���	L��
�@@ ��
�@@ �A�������
  j [with_file_descr_deferred t f] runs [f] on the file descriptor underlying [t], if
    [is_open t], and returns [`Ok] or [`Error] according to [f].  If [is_closed t], then
    it does not call [f] and returns [`Already_closed].  It ensures that the file
    descriptor underlying [t] is not closed until the result of [f] becomes determined (or
    [f] raises). @��	� �XX�	� ���@@@@��	� �XX�	� ���@@��
�@@ ��
�@@ �A@��	� ����	� �U@��	� ����	� �U@���Р<with_file_descr_deferred_exn��	� ����	� ��@��@����!t��	� ��	� �@@��	� ��	� �@@@��@��@������$Unix*File_descr!t��	� ��	� �,@@��	� ��	� �,@@@�����(Deferred!t��	� �3�	� �=@���!a��	� �0�	� �2@@@@��	� �0�	� �=@@@��	� ��	� �=@@@�����(Deferred!t��	� �?G�	� �?Q@���!a��
 �?D�
 �?F@@@@��
 �?D�
	 �?Q@@@��
 ��
 �?Q@@@��
 ��
 �?Q@@@@���	ð�
�@@ �� @@ �A�������	� [with_file_descr_deferred_exn] is like [with_file_descr_deferred], except that it
    raises rather than return [`Already_closed] or [`Error]. @��
 �WW�
  ���@@@@��
" �WW�
# ���@@��@@ ��@@ �A@��
( ����
) �?Q@��
+ ����
, �?Q@���Р6interruptible_ready_to��
4 �CG�
5 �C]@��@����!t��
> �^c�
? �^d@@��
A �^c�
B �^d@@@��@������$Read��
M �el�
N �eq@A@��
P �el�
Q �eq@@����%Write��
X �et�
Y �ez@A@��
[ �et�
\ �ez@@@@@��
^ �ej�
_ �e|@@@���)interrupt�����(Deferred!t��
l �}��
m �}�@�����$unit��
u �}��
v �}�@@��
x �}��
y �}�@@@@��
{ �}��
| �}�@@@�����(Deferred!t��
� ����
� ���@�������&Bad_fd��
� ����
� ���@A@��
� ����
� ���@@����&Closed��
� ����
� ���@A@��
� ����
� ���@@����+Interrupted��
� ����
� ���@A@��
� ����
� ���@@����%Ready��
� ����
� ���@A@��
� ����
� ���@@@@@��
� ����
� ���@@@@��
� ����
� ���@@@��
� �}��
� ���@@@��
� �ej�
� ���@@@��
� �^c�
� ���@@@@���
x���@@ ���@@ �A�������	� [interruptible_ready_to t read_write ~interrupt] returns a deferred that will become
    determined when the file descriptor underlying [t] can be read from or written to
    without blocking, or when [interrupt] becomes determined. @��
� �SS�
� �B@@@@��
� �SS�
� �B@@���@@ ���@@ �A@��
� �CC�
� ���@��
� �CC�
� ���@���Р(ready_to��
� � M Q�
� � M Y@��@����!t��
� � M \�
� � M ]@@��
� � M \�
� � M ]@@@��@������$Read�� � M c� � M h@A@�� � M c� � M h@@����%Write�� � M k� � M q@A@�� � M k� � M q@@@@@�� � M a� � M s@@@�����(Deferred!t�� � M �� � M �@�������&Bad_fd��( � M y�) � M �@A@��+ � M y�, � M �@@����&Closed��3 � M ��4 � M �@A@��6 � M ��7 � M �@@����%Ready��> � M ��? � M �@A@��A � M ��B � M �@@@@@��D � M w�E � M �@@@@��G � M w�H � M �@@@��J � M a�K � M �@@@��M � M \�N � M �@@@@�����>@@ ��?@@ �A�������	l [ready_to t read_write] is like [interruptible_ready_to], but without the possibility
    of interruption. @��^ ����_ � 5 L@@@@��a ����b � 5 L@@��O@@ ��P@@ �A@��g � M M�h � M �@��j � M M�k � M �@���Р<interruptible_every_ready_to��s �"�"��t �"�#@��@����!t��} �##�~ �##@@��� �##�� �##@@@��@������$Read��� �# #'�� �# #,@A@��� �# #'�� �# #,@@����%Write��� �# #/�� �# #5@A@��� �# #/�� �# #5@@@@@��� �# #%�� �# #7@@@���)interrupt�����(Deferred!t��� �#8#L�� �#8#V@�����$unit��� �#8#G�� �#8#K@@��� �#8#G�� �#8#K@@@@��� �#8#G�� �#8#V@@@��@��@��!a��� �#W#]�� �#W#_@@@����$unit��� �#W#c�� �#W#g@@��� �#W#c�� �#W#g@@@��� �#W#]�� �#W#g@@@��@��!a��� �#i#n�� �#i#p@@@�����(Deferred!t��� �#q#��� �#q#�@�������&Bad_fd��� �#q#x�� �#q#@A@��� �#q#x�� �#q#@@����&Closed��� �#q#��� �#q#�@A@��� �#q#��� �#q#�@@����+Unsupported�� �#q#�� �#q#�@A@�� �#q#��	 �#q#�@@����+Interrupted�� �#q#�� �#q#�@A@�� �#q#�� �#q#�@@@@@�� �#q#v� �#q#�@@@@�� �#q#v� �#q#�@@@�� �#i#n� �#q#�@@@�� �#W#\�  �#q#�@@@��" �#8#=�# �#q#�@@@��% �# #%�& �#q#�@@@��( �##�) �#q#�@@@@���ݰ�@@ ��@@ �A�������
  O [interruptible_every_ready_to t read_write ~interrupt f a] checks every Async cycle
    whether the file descriptor underlying [t] can be read from or written to without
    blocking, and if so, enqueues a job to run [f a].  [interruptible_every_ready_to] is
    level triggered -- it will enqueue a job every cycle if I/O is available, even if the
    prior job hasn't run yet, or the job ran but did not consume the available data.
    [interruptible_every_ready_to] returns a deferred that will become determined when
    [interrupt] becomes determined or the file descriptor is closed. @��9 � � ��: �"�"�@@@@��< � � ��= �"�"�@@��*@@ ��+@@ �A@��B �"�"��C �#q#�@��E �"�"��F �#q#�@���Р.every_ready_to��N �$8$<�O �$8$J@��@����!t��X �$K$P�Y �$K$Q@@��[ �$K$P�\ �$K$Q@@@��@������$Read��g �$R$Y�h �$R$^@A@��j �$R$Y�k �$R$^@@����%Write��r �$R$a�s �$R$g@A@��u �$R$a�v �$R$g@@@@@��x �$R$W�y �$R$i@@@��@��@��!a��� �$j$p�� �$j$r@@@����$unit��� �$j$v�� �$j$z@@��� �$j$v�� �$j$z@@@��� �$j$p�� �$j$z@@@��@��!a��� �$|$��� �$|$�@@@�����(Deferred!t��� �$�$��� �$�$�@�������&Bad_fd��� �$�$��� �$�$�@A@��� �$�$��� �$�$�@@����&Closed��� �$�$��� �$�$�@A@��� �$�$��� �$�$�@@����+Unsupported��� �$�$��� �$�$�@A@��� �$�$��� �$�$�@@@@@��� �$�$��� �$�$�@@@@��� �$�$��� �$�$�@@@��� �$|$��� �$�$�@@@��� �$j$o�� �$�$�@@@��� �$R$W�� �$�$�@@@��� �$K$P�� �$�$�@@@@�������@@ ���@@ �A�������	| [every_ready_to t read_write f x] is like [interruptible_every_ready_to], but without
    the possibility of interruption. @��� �#�#��� �$$7@@@@��� �#�#��� �$$7@@���@@ ���@@ �A@��� �$8$8�� �$�$�@��� �$8$8�� �$�$�@���Р'syscall��� �%�%��� �%�%�@���+nonblocking����$bool��
 �%�%�� �%�%�@@�� �%�%�� �%�%�@@���°��@@ ���@@ �A�������4 default is [false] @�� �%�%�� �%�%�@@@@��! �%�%��" �%�%�@@��@@ ��@@ �A@��@����!t��. �%�%��/ �%�%�@@��1 �%�%��2 �%�%�@@@��@��@������$Unix*File_descr!t��A �%�%��B �%�&@@��D �%�%��E �%�&@@@��!a��J �%�&�K �%�&	@@@��M �%�%��N �%�&	@@@������.Already_closed��W �&&�X �&&!@A@��Z �&&�[ �&&!@@����"Ok��b �&&$�c �&&'@@���!a��i �&&+�j �&&-@@@@��l �&&$�m �&&-@@����%Error��t �&&0�u �&&6@@�����#exn��} �&&:�~ �&&=@@��� �&&:�� �&&=@@@@��� �&&0�� �&&=@@@@@��� �&&�� �&&?@@@��� �%�%��� �&&?@@@��� �%�%��� �&&?@@@��� �%�%��� �&&?@@@@���D���@@ ���@@ �A�������	� [syscall t f] runs [Async_unix.syscall] with [f] on the file descriptor underlying
    [t], if [is_open t], and returns [`Ok] or [`Error] according to [f].  If
    [is_closed t], it does not call [f] and returns [`Already_closed]. @��� �$�$��� �%^%�@@@@��� �$�$��� �%^%�@@���@@ ���@@ �A@��� �%�%��� �&&?@��� �%�%��� �&&?@���Р+syscall_exn��� �&�&��� �&�&�@���+nonblocking����$bool��� �&�&��� �&�&�@@��� �&�&��� �&�&�@@���y���@@ ���@@ �A�������4 default is [false] @��� �&�&��� �&�&�@@@@��� �&�&��� �&�&�@@���@@ ���@@ �A@��@����!t��� �&�&��� �&�&�@@��� �&�&��� �&�&�@@@��@��@������$Unix*File_descr!t��� �&�'�� �&�'@@��� �&�'�� �&�'@@@��!a�� �&�'� �&�'@@@�� �&�'� �&�'@@@��!a��
 �'' � �''"@@@�� �&�'� �''"@@@�� �&�&�� �''"@@@�� �&�&�� �''"@@@@���Ȱ�@@ ��@@ �A�������	m [syscall_exn t f] is like [syscall], except it raises rather than return
    [`Already_closed] or [`Error]. @��$ �&A&A�% �&�&�@@@@��' �&A&A�( �&�&�@@��@@ ��@@ �A@��- �&�&��. �''"@��0 �&�&��1 �''"@���Р2syscall_result_exn��9 �((�: �((@���+nonblocking����$bool��E �((,�F �((0@@��H �((,�I �((0@@������9@@ ��:@@ �A�������4 default is [false] @��Y �((1�Z �((J@@@@��\ �((1�] �((J@@��J@@ ��K@@ �A@��@����!t��i �(K(P�j �(K(Q@@��l �(K(P�m �(K(Q@@@��@��!a��t �(R(W�u �(R(Y@@@��@��@������$Unix*File_descr!t��� �(Z(`�� �(Z(q@@��� �(Z(`�� �(Z(q@@@��@��!a��� �(Z(u�� �(Z(w@@@������$Unix.Syscall_result!t��� �(Z(~�� �(Z(�@���!b��� �(Z({�� �(Z(}@@@@��� �(Z({�� �(Z(�@@@��� �(Z(u�� �(Z(�@@@��� �(Z(`�� �(Z(�@@@������$Unix.Syscall_result!t��� �(�(��� �(�(�@���!b��� �(�(��� �(�(�@@@@��� �(�(��� �(�(�@@@��� �(Z(_�� �(�(�@@@��� �(R(W�� �(�(�@@@��� �(K(P�� �(�(�@@@��� �((�� �(�(�@@@@�������@@ ���@@ �A�������	� [syscall_result_exn t f a] is like [syscall_exn], except it does not allocate except
    in exceptional cases.  [a] is passed unchanged to [f], and should be used to eliminate
    allocations due to closure capture. @��� �'$'$�� �'�(@@@@��� �'$'$�� �'�(@@���@@ ���@@ �A@��� �((�� �(�(�@��� �((�� �(�(�@���Р1syscall_in_thread���)�)���)�)�@��@����!t���)�* ��)�*@@�� )�* �)�*@@@���$name����&string��**�**@@��**�**@@@��@��@������$Unix*File_descr!t��**� ***@@��"**�#***@@@��!a��(**.�)**0@@@��+**�,**0@@@�����(Deferred!t��5*2*g�6*2*q@�������.Already_closed��@*2*9�A*2*H@A@��C*2*9�D*2*H@@����"Ok��K*2*K�L*2*N@@���!a��R*2*R�S*2*T@@@@��U*2*K�V*2*T@@����%Error��]*2*W�^*2*]@@�����#exn��f*2*a�g*2*d@@��i*2*a�j*2*d@@@@��l*2*W�m*2*d@@@@@��o*2*7�p*2*f@@@@��r*2*7�s*2*q@@@��u**�v*2*q@@@��x**�y*2*q@@@��{)�* �|*2*q@@@@���0��l@@ ��m@@ �A�������
  + [syscall_in_thread t f] runs [In_thread.syscall] with [f] on the file descriptor
    underlying [t], if [is_open t], and returns a deferred that becomes determined with
    [`Ok] or [`Error] when the system call completes.  If [is_closed t], it does not call
    [f] and returns [`Already_closed]. @��� �(�(���)�)�@@@@��� �(�(���)�)�@@��}@@ ��~@@ �A@���)�)���*2*q@���)�)���*2*q@���Р5syscall_in_thread_exn���
*�*���
*�+@��@����!t���++��++@@���++��++@@@���$name����&string���++!��++'@@���++!��++'@@@��@��@������$Unix*File_descr!t���+(+.��+(+?@@���+(+.��+(+?@@@��!a���+(+C��+(+E@@@���+(+.��+(+E@@@�����(Deferred!t���+G+O��+G+Y@���!a���+G+L��+G+N@@@@���+G+L��+G+Y@@@���+(+-��+G+Y@@@���++��+G+Y@@@���++��+G+Y@@@@�������@@ ���@@ �A�������	} [syscall_in_thread_exn] is like [syscall_in_thread], except it raises rather than
    return [`Already_closed] or [`Error]. @��*s*s�	*�*�@@@@��
*s*s�	*�*�@@���@@ ���@@ �A@��
*�*��+G+Y@��
*�*��+G+Y@���Р-of_in_channel��+�+��+�+�@��@�����*In_channel!t��(+�+��)+�+�@@��++�+��,+�+�@@@��@�����$Kind!t��7+�+��8+�+�@@��:+�+��;+�+�@@@����!t��B+�+��C+�+�@@��E+�+��F+�+�@@@��H+�+��I+�+�@@@��K+�+��L+�+�@@@@��� ��<@@ ��=@@ �A�������	^ [of_in_channel] and [of_out_channel] create an fd from their underlying file
    descriptor. @��\+[+[�]+�+�@@@@��_+[+[�`+�+�@@��M@@ ��N@@ �A@��e+�+��f+�+�@��h+�+��i+�+�@���Р.of_out_channel��q+�+��r+�,@��@�����+Out_channel!t��}+�,�~+�,@@���+�,��+�,@@@��@�����$Kind!t���+�,��+�,@@���+�,��+�,@@@����!t���+�, ��+�,!@@���+�, ��+�,!@@@���+�,��+�,!@@@���+�,��+�,!@@@@@���+�+���+�,!@���+�+���+�,!@���Р2of_in_channel_auto���-�-���-�-�@��@�����*In_channel!t���-�-���-�-�@@���-�-���-�-�@@@�����(Deferred!t���-�-���-�-�@�����!t���-�-���-�-�@@���-�-���-�-�@@@@���-�-���-�-�@@@���-�-���-�-�@@@@�������@@ ���@@ �A�������
  g [of_in_channel_auto ic] is just like [of_in_channel], but uses [fstat] to determine
    the kind.  It makes some assumptions about sockets, specifically it assumes that a
    socket is either listening or connected to something (and it uses [getsockopt] to find
    out which).  Don't pass an [in_channel] containing an unconnected non-listening
    socket. @���,#,#��-�-�@@@@���,#,#��-�-�@@���@@ ���@@ �A@���-�-���-�-�@���-�-���-�-�@���Р3of_out_channel_auto�� "/6/:�"/6/M@��@�����+Out_channel!t��"/6/P�"/6/]@@��"/6/P�"/6/]@@@�����(Deferred!t��"/6/c�"/6/m@�����!t��""/6/a�#"/6/b@@��%"/6/a�&"/6/b@@@@��("/6/a�)"/6/m@@@��+"/6/P�,"/6/m@@@@�����@@ ��@@ �A�������
  i [of_out_channel_auto ic] is just like [of_out_channel], but uses [fstat] to determine
    the kind.  It makes some assumptions about sockets, specifically it assumes that a
    socket is either listening or connected to something (and it uses [getsockopt] to find
    out which).  Don't pass an [in_channel] containing an unconnected non listening
    socket. @��<-�-��=!/'/5@@@@��?-�-��@!/'/5@@��-@@ ��.@@ �A@��E"/6/6�F"/6/m@��H"/6/6�I"/6/m@���Р.file_descr_exn��Q(0�0��R(0�0�@��@����!t��[(0�0��\(0�0�@@��^(0�0��_(0�0�@@@������$Unix*File_descr!t��j(0�0��k(0�0�@@��m(0�0��n(0�0�@@@��p(0�0��q(0�0�@@@@���%��a@@ ��b@@ �A�������
  S [file_descr_exn t] returns the file descriptor underlying [t], unless [is_closed t],
    in which case it raises.  One must be very careful when using this function, and
    should try not to, since any uses of the resulting file descriptor are unknown to
    the [Fd] module, and hence can violate the guarantee it is trying to enforce. @���$/o/o��'0s0�@@@@���$/o/o��'0s0�@@��r@@ ��s@@ �A@���(0�0���(0�0�@���(0�0���(0�0�@���Р*to_int_exn���,1s1w��,1s1�@��@����!t���,1s1���,1s1�@@���,1s1���,1s1�@@@����#int���,1s1���,1s1�@@���,1s1���,1s1�@@@���,1s1���,1s1�@@@@���f���@@ ���@@ �A�������	x [to_int_exn t] returns the the underlying file descriptor as an int.  It has the same
    caveats as [file_descr_exn]. @���*0�0���+1O1r@@@@���*0�0���+1O1r@@���@@ ���@@ �A@���,1s1s��,1s1�@���,1s1s��,1s1�@��������@@ ���@@ �A�������"/*@���.1�1���.1�1�@@@@���.1�1���.1�1�@@���@@ ���@@ �A���.1�1���.1�1�@�����'Private���01�1���01�1�@�����Р'replace���32J2P��32J2W@��@����!t��32J2Z�	32J2[@@��32J2Z�32J2[@@@��@�����$Kind!t��32J2_�32J2e@@��32J2_�32J2e@@@��@������#Set��&32J2k�'32J2o@@������$Info!t��132J2s�232J2y@@��432J2s�532J2y@@@@��732J2k�832J2y@@����&Extend��?32J2|�@32J2�@@������$Info!t��J32J2��K32J2�@@��M32J2��N32J2�@@@@��P32J2|�Q32J2�@@@@@��S32J2i�T32J2�@@@����$unit��[32J2��\32J2�@@��^32J2��_32J2�@@@��a32J2i�b32J2�@@@��d32J2_�e32J2�@@@��g32J2Z�h32J2�@@@@�����X@@ ��Y@@ �A�������	� [replace t kind] is for internal use only, by [Unix_syscalls].  It is used when one
      wants to reuse a file descriptor in an fd with a new kind. @��x11�1��y222I@@@@��{11�1��|222I@@��i@@ ��j@@ �A@���32J2L��32J2�@���32J2L��32J2�@@���01�1���42�2�@@@���01�1���42�2�@���01�1���42�2�@@