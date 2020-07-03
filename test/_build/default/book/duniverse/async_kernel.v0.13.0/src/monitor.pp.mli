Caml1999N026����   5         	3book/duniverse/async_kernel.v0.13.0/src/monitor.mli����  q�    CS  >ʠ����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � The part of the {{!Async_kernel.Execution_context}[Execution_context]} that determines
    what to do when there is an unhandled exception.

    Every Async computation runs within the context of some monitor, which, when the
    computation is running, is referred to as the "current" monitor.  Monitors are
    arranged in a tree -- when a new monitor is created, it is a child of the current
    monitor.

    If a computation raises an unhandled exception, the behavior depends on whether the
    current monitor is "detached" or "attached".  If the monitor has been "detached", via
    one of the [detach*] functions, then whoever detached it is responsible for dealing
    with the exception.  If the monitor is still attached, then the exception bubbles to
    monitor's parent.  If an exception bubbles to the initial monitor, i.e., the root of
    the monitor tree, that prints an unhandled-exception message and calls exit 1.

    {2 Note about the toplevel monitor}

    It is important to note that in the toplevel monitor, exceptions will only be caught
    in the Async part of a computation.  For example, in:

    {[
      upon (f ()) g ]}

    if [f] raises, the exception will not go to a monitor; it will go to the next caml
    exception handler on the stack.  Any exceptions raised by [g] will be caught by the
    scheduler and propagated to the toplevel monitor.  Because of this it is advised to
    always use [Scheduler.schedule] or [Scheduler.within].  For example:

    {[
      Scheduler.within (fun () -> upon (f ()) g) ]}

    This code will catch an exception in either [f] or [g], and propagate it to the
    monitor.

    This is only relevant to the toplevel monitor because if you create another monitor
    and you wish to run code within it you have no choice but to use [Scheduler.within].
    [try_with] creates its own monitor and uses [Scheduler.within], so it does not have
    this problem. @��	3book/duniverse/async_kernel.v0.13.0/src/monitor.mliA@@�f��@@@@��A@@�f��@@���@@ ���@@ �A��
A@@�f��@������+Core_kernel��h���h��@@��h���h��@@��h���h��@�����(Deferred��#i���$i��@����)Deferred1��+i���,i��@��.i���/i��@@@��1i���2i��@��4i���5i��@���A�    �!t��>k���?k��@@@@A������(Monitor0!t��Ik���Jk��@@��Lk���Mk��@@@���(deriving��Sk���Tk��@��������'sexp_of��_k���`k��@��bk���ck��@@@@��ek���fk��@@��hk���ik��@@��kk���lk��@@��nk���ok��@�����������-ocaml.warning��}k���~k��@�������#-32@���k����k��@@@@���k����k��@@���k����k��@���k����k��@���Р)sexp_of_t���k����k��@��@����f���k����k��@@���k����k��@@@������1Ppx_sexp_conv_lib$Sexp!t���k����k��@@���k����k��@@@���k����k��@@@@@���k����k��@���k����k��@@���k����k��@@���k����k��@���)ocaml.doc���k����k��@�������'@inline@���k����k��@@@@���k����k��@@���k����k��@@���k����k��@�����������)Invariant!S���m����m�@���m����m�@@����!t���m���m�@    ����m�� m�@@@@A�����!t��m��	m�@@��m��m�@@@@��m�	�m�@@��m���m�@@��m���m�@@��m���m�@���A�    �:with_optional_monitor_name��!o�"o8@����!a��)o�*o@@@B@@@A����$here�����4Source_code_position!t��8p;C�9p;Y@@��;p;C�<p;Y@@@���$info�����$Info!t��Ip;c�Jp;i@@��Lp;c�Mp;i@@@���$name����&string��Xp;s�Yp;y@@��[p;s�\p;y@@@��!a��ap;}�bp;@@@��dp;m�ep;@@@��gp;]�hp;@@@��jp;=�kp;@@@@��mo�np;@@��po�qp;@���Р&create��ys���zs��@����:with_optional_monitor_name���s����s�	@���@����$unit���s����s��@@���s����s��@@@����!t���s����s��@@���s����s��@@@���s����s��@@@@���s����s�	@@@@���)ocaml.doc���@@ ���@@ �A�������	H [create ()] returns a new monitor whose parent is the current monitor. @���r����r��@@@@���r����r��@@���@@ ���@@ �A@���s����s�	@���s����s�	@���Р$name���w	m	q��w	m	u@��@����!t���w	m	x��w	m	y@@���w	m	x��w	m	y@@@�����$Info!t���w	m	}��w	m	�@@���w	m	}��w	m	�@@@���w	m	x��w	m	�@@@@���D���@@ ���@@ �A�������	c [name t] returns the name of the monitor, or a unique id if no name was supplied to
    [create]. @���u		��v	\	l@@@@���u		��v	\	l@@���@@ ���@@ �A@���w	m	m��w	m	�@��w	m	m�w	m	�@���Р&parent��
y	�	��y	�	�@��@����!t��y	�	��y	�	�@@��y	�	��y	�	�@@@����&option��y	�	�� y	�	�@�����!t��(y	�	��)y	�	�@@��+y	�	��,y	�	�@@@@��.y	�	��/y	�	�@@@��1y	�	��2y	�	�@@@@@��4y	�	��5y	�	�@��7y	�	��8y	�	�@���Р%depth��@z	�	��Az	�	�@��@����!t��Jz	�	��Kz	�	�@@��Mz	�	��Nz	�	�@@@����#int��Uz	�	��Vz	�	�@@��Xz	�	��Yz	�	�@@@��[z	�	��\z	�	�@@@@@��^z	�	��_z	�	�@��az	�	��bz	�	�@���Р'current��j}	�	��k}	�	�@��@����$unit��t}	�	��u}	�	�@@��w}	�	��x}	�	�@@@����!t��}	�	���}	�	�@@���}	�	���}	�	�@@@���}	�	���}	�	�@@@@�����v@@ ��w@@ �A�������	+ [current ()] returns the current monitor. @���|	�	���|	�	�@@@@���|	�	���|	�	�@@���@@ ���@@ �A@���}	�	���}	�	�@���}	�	���}	�	�@���Р&detach��� D �� D&@��@����!t��� D)�� D*@@��� D)�� D*@@@����$unit��� D.�� D2@@��� D.�� D2@@@��� D)�� D2@@@@���&���@@ ���@@ �A�������
   [detach t] detaches [t] so that errors raised to [t] are not passed to [t]'s parent
    monitor.  If those errors aren't handled in some other way, then they will effectively
    be ignored.  One should usually use [detach_and_iter_errors] so that errors are not
    ignored. @��� @

�� C@@@@��� @

�� C@@���@@ ���@@ �A@��� D�� D2@��� D�� D2@���Р6detach_and_iter_errors��� J=A�� J=W@��@����!t��� J=Z�� J=[@@��� J=Z�� J=[@@@���!f��@����#exn�� J=b� J=e@@��
 J=b� J=e@@@����$unit�� J=i� J=m@@�� J=i� J=m@@@�� J=b� J=m@@@����$unit��  J=r�! J=v@@��# J=r�$ J=v@@@��& J=_�' J=v@@@��) J=Z�* J=v@@@@������@@ ��@@ �A�������
   [detach_and_iter_errors t ~f] detaches [t] and passes to [f] all subsequent errors
    that reach [t], stopping iteration if [f] raises an exception.  An exception raised by
    [f] is sent to the monitor in effect when [detach_and_iter_errors] was called. @��: G55�; I�<@@@@��= G55�> I�<@@��+@@ ��,@@ �A@��C J==�D J=v@��F J==�G J=v@���Р9detach_and_get_next_error��O N�P N1@��@����!t��Y N4�Z N5@@��\ N4�] N5@@@�����(Deferred!t��f N=�g NG@�����#exn��o N9�p N<@@��r N9�s N<@@@@��u N9�v NG@@@��x N4�y NG@@@@���ذ�i@@ ��j@@ �A�������	� [detach_and_get_next_error t] detaches [t] and returns a deferred that becomes
    determined with the next error that reaches [t] (possibly never). @��� Lxx�� M�@@@@��� Lxx�� M�@@��z@@ ��{@@ �A@��� N�� NG@��� N�� NG@���Р;detach_and_get_error_stream��� U)-�� U)H@��@����!t��� U)K�� U)L@@��� U)K�� U)L@@@������$Tail&Stream!t��� U)T�� U)a@�����#exn��� U)P�� U)S@@��� U)P�� U)S@@@@��� U)P�� U)a@@@��� U)K�� U)a@@@@���)���@@ ���@@ �A�������	� [detach_and_get_error_stream t] detaches [t] and returns a stream of all subsequent
    errors that reach [t].

    [Stream.iter (detach_and_get_error_stream t) ~f] is equivalent to
    [detach_and_iter_errors t ~f]. @��� PII�� T(@@@@��� PII�� T(@@���@@ ���@@ �A@��� U))�� U)a@��� U))�� U)a@���Р.get_next_error��� Zei�� Zew@��@����!t��� Zez�� Ze{@@��� Zez�� Ze{@@@�����(Deferred!t�� Ze�� Ze�@�����#exn�� Ze� Ze�@@�� Ze� Ze�@@@@�� Ze� Ze�@@@�� Zez� Ze�@@@@���x��	@@ ��
@@ �A�������	� [get_next_error t] returns a deferred that becomes determined the next time [t] gets
    an error, if ever.  Calling [get_next_error t] does not detach [t], and if no other
    call has detached [t], then errors will still bubble up the monitor tree. @��) Wcc�* Yd@@@@��, Wcc�- Yd@@��@@ ��@@ �A@��2 Zee�3 Ze�@��5 Zee�6 Ze�@���Р+extract_exn��> _{�? _{�@��@����#exn��H _{��I _{�@@��K _{��L _{�@@@����#exn��S _{��T _{�@@��V _{��W _{�@@@��Y _{��Z _{�@@@@������J@@ ��K@@ �A�������	� [extract_exn exn] extracts the exn from an error exn that comes from a monitor. If it
    is not supplied such an error exn, it returns the exn itself.  It removes the
    backtrace from the error (see discussion in [try_with]). @��j \���k ^;z@@@@��m \���n ^;z@@��[@@ ��\@@ �A@��s _{{�t _{�@��v _{{�w _{�@���Р.has_seen_error�� b���� b��@��@����!t��� b���� b��@@��� b���� b��@@@����$bool��� b��� b�@@��� b��� b�@@@��� b���� b�@@@@�������@@ ���@@ �A�������	I [has_seen_error t] returns true iff the monitor has ever seen an error. @��� a���� a��@@@@��� a���� a��@@���@@ ���@@ �A@��� b���� b�@��� b���� b�@���Р(send_exn��� h=A�� h=I@��@����!t��� h=L�� h=M@@��� h=L�� h=M@@@���)backtrace������#Get��� h=^�� h=b@A@��� h=^�� h=b@@����$This��� h=e�� h=j@@������)Backtrace!t��� h=n�� h=y@@��� h=n�� h=y@@@@��� h=e�� h=y@@@@@��� h=\�� h={@@@��@����#exn�� h=� h=�@@�� h=� h=�@@@����$unit�� h=�� h=�@@�� h=�� h=�@@@�� h=� h=�@@@�� h=Q� h=�@@@�� h=L� h=�@@@@���{��@@ ��@@ �A�������
  / [send_exn t exn ?backtrace] sends the exception [exn] as an error to be handled by
    monitor [t].  By default, the error will not contain a backtrace.  However, the caller
    can supply one using [`This], or use [`Get] to request that [send_exn] obtain one
    using [Backtrace.Exn.most_recent ()]. @��, d�- g<@@@@��/ d�0 g<@@��@@ ��@@ �A@��5 h==�6 h=�@��8 h==�9 h=�@���Р(try_with��A ~���B ~��@����:with_optional_monitor_name��I ����J ���@����+extract_exn����$bool��V ���W ��@@��Y ���Z ��@@������J@@ ��K@@ �A�������4 default is [false] @��j ���k ��@@@@��m ���n ��@@��[@@ ��\@@ �A@���#run������#Now��~ ���� ���@A@��� ����� ���@@����(Schedule��� ����� ��@A@��� ����� ��@@@@@��� ����� ��
@@������@@ ���@@ �A�������8 default is [`Schedule] @��� ���� ��(@@@@��� ���� ��(@@���@@ ���@@ �A@���$rest������#Log��� �)9�� �)=@A@��� �)9�� �)=@@����%Raise��� �)@�� �)F@A@��� �)@�� �)F@@����$Call��� �)I�� �)N@@���@����#exn��� �)R�� �)U@@��� �)R�� �)U@@@����$unit��� �)Y�� �)]@@��� �)Y�� �)]@@@��� �)R�� �)]@@@@��� �)I�� �)]@@@@@��� �)7�� �)_@@���L���@@ ���@@ �A�������3 default is [`Log] @��� �)`�� �)x@@@@��  �)`� �)x@@���@@ ���@@ �A@��@��@����$unit�� �y�� �y�@@�� �y�� �y�@@@�����(Deferred!t�� �y�� �y�@���!a��# �y��$ �y�@@@@��& �y��' �y�@@@��) �y��* �y�@@@�����(Deferred!t��3 ����4 ���@������&Result!t��> ����? ���@���!a��E ����F ���@@@�����#exn��N ����O ���@@��Q ����R ���@@@@��T ����U ���@@@@��W ����X ���@@@��Z �y��[ ���@@@��] �)1�^ ���@@@��` ����a ���@@@��c ���d ���@@@@��f ���g ���@@@@���ư�W@@ ��X@@ �A�������
   [try_with f] runs [f ()] in a monitor and returns the result as [Ok x] if [f] finishes
    normally, or returns [Error e] if there is an exception.  It either runs [f] now, if
    [run = `Now], or schedules a job to run [f], if [run = `Schedule].  Once a result is
    returned, subsequent exceptions raised to the monitor are handled according to [rest]:

    - [`Log]: Logged to a global error log (cannot raise).
    - [`Raise]: Reraised to the monitor of [try_with]'s caller.
    - [`Call f]: Passed to [f] within the context of the caller of [try_with]'s monitor.

    The [name] argument is used to give a name to the monitor the computation will be
    running in.  This name will appear when printing errors.

    [try_with] runs [f ()] in a new monitor [t] that has no parent.  This works because
    [try_with] calls [detach_and_get_error_stream t] and explicitly handles all errors
    sent to [t].  No errors would ever implicitly propagate to [t]'s parent, although
    [try_with] will explicitly send them to [t]'s parent with [rest = `Raise].

    If [extract_exn = true], then in an [Error exn] result, the [exn] will be the actual
    exception raised by the computation.  If [extract_exn = false], then the [exn] will
    include additional information, like the monitor and backtrace. @��w j���x }d�@@@@��z j���{ }d�@@��h@@ ��i@@ �A@��� ~���� ���@��� ~���� ���@���Р1try_with_or_error��� ����� ���@����:with_optional_monitor_name��� ��� �3@����+extract_exn����$bool��� ����� ���@@��� ����� ���@@������@@ ���@@ �A�������4 default is [false] @��� ����� ���@@@@��� ����� ���@@���@@ ���@@ �A@��@��@����$unit��� ����� ���@@��� ����� ���@@@�����(Deferred!t��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@@�����(Deferred!t��� ���� ��@������(Or_error!t��� ����� ��@���!a��� ����� ���@@@@��  ���� ��@@@@�� ���� ��@@@�� ���� ��@@@��	 ����
 ��@@@@�� ���� �3@@@@���l���@@ ���@@ �A�������
  � [try_with_or_error] is like [try_with] but returns ['a Or_error.t Deferred.t]
    instead of [('a,exn) Result.t Deferred.t].  More precisely:

    {[
      try_with_or_error f ?extract_exn
      = try_with f ?extract_exn ~run:`Now ~rest:`Log >>| Or_error.of_exn_result ]}

    [~run:`Now] is different from [try_with]'s default, [~run:`Schedule].  Based on
    experience, we think [~run:`Now] is a better behavior. @�� ���� �L�@@@@��  ����! �L�@@��@@ ��@@ �A@��& ����' �3@��) ����* �3@���Р6try_with_join_or_error��2 ����3 ���@����:with_optional_monitor_name��: ��; �9@����+extract_exn����$bool��G ����H ���@@��J ����K ���@@������;@@ ��<@@ �A�������4 default is [false] @��[ ����\ ���@@@@��^ ����_ ���@@��L@@ ��M@@ �A@��@��@����$unit��m ����n ���@@��p ����q ���@@@�����(Deferred!t��z ����{ ���@������(Or_error!t��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@@�����(Deferred!t��� ���� ��@������(Or_error!t��� ���� ��@���!a��� ����� ��@@@@��� ����� ��@@@@��� ����� ��@@@��� ����� ��@@@��� ����� ��@@@@��� ����� �9@@@@��� ���@@ ���@@ �A�������	E [try_with_join_or_error f = try_with_or_error f >>| Or_error.join]. @��� �55�� �5@@@@��� �55�� �5@@���@@ ���@@ �A@��� ����� �9@��� ����� �9@���Р-handle_errors��� ����� ��@����:with_optional_monitor_name��� �EK�� �Ee@���@��@����$unit��� ��� �@@��� ��� �@@@�����(Deferred!t�� ��	 � @���!a�� �� �@@@@�� �� � @@@�� �� � @@@��@��@����#exn��! �&�" �)@@��$ �&�% �)@@@����$unit��, �-�- �1@@��/ �-�0 �1@@@��2 �&�3 �1@@@�����(Deferred!t��< �9�= �C@���!a��C �6�D �8@@@@��F �6�G �C@@@��I �%�J �C@@@��L �
�M �C@@@@��O �	�P �Ee@@@@������	@@@ ��	A@@ �A�������
  � [handle_errors ?name f handler] runs [f ()] inside a new monitor with the optionally
    supplied name, and calls [handler error] on every error raised to that monitor.  Any
    error raised by [handler] goes to the monitor in effect when [handle_errors] was
    called.

    Errors that are raised after [f ()] becomes determined will still be sent to
    [handler], i.e., the new monitor lives as long as jobs created by [f] live. @��` �;;�a ���@@@@��c �;;�d ���@@��	Q@@ ��	R@@ �A@��i ����j �Ee@��l ����m �Ee@���Р,catch_stream��u ����v ���@����:with_optional_monitor_name��} ���~ ��1@���@��@����$unit��� ����� ���@@��� ����� ���@@@����$unit��� ����� ���@@��� ����� ���@@@��� ����� ���@@@������$Tail&Stream!t��� ���� ��@�����#exn��� ���� ��@@��� ���� ��@@@@��� ���� ��@@@��� ����� ��@@@@��� ����� ��1@@@@�����	�@@ ��	�@@ �A�������	q [catch_stream ?name f] runs [f ()] inside a new monitor [m] and returns the stream of
    errors raised to [m]. @��� �gg�� ���@@@@��� �gg�� ���@@��	�@@ ��	�@@ �A@��� ����� ��1@��� ����� ��1@���Р%catch��� ����� ���@����:with_optional_monitor_name��� ����� ���@���@��@����$unit��� ����� ���@@��� ����� ���@@@����$unit��	 ����	 ���@@��	 ����	 ���@@@��	 ����		 ���@@@�����(Deferred!t��	 ����	 ���@�����#exn��	 ����	 ���@@��	 ����	 ���@@@@��	! ����	" ���@@@��	$ ����	% ���@@@@��	' ����	( ���@@@@������
@@ ��
@@ �A�������	e [catch ?name f] runs [f ()] inside a new monitor [m] and returns the first error
    raised to [m]. @��	8 �33�	9 ���@@@@��	; �33�	< ���@@��
)@@ ��
*@@ �A@��	A ����	B ���@��	D ����	E ���@���Р+catch_error��	M � ] a�	N � ] l@����:with_optional_monitor_name��	U � ] ��	V � ] �@���@��@����$unit��	b � ] q�	c � ] u@@��	e � ] q�	f � ] u@@@����$unit��	m � ] y�	n � ] }@@��	p � ] y�	q � ] }@@@��	s � ] q�	t � ] }@@@�����(Deferred!t��	} � ] ��	~ � ] �@������%Error!t��	� � ] ��	� � ] �@@��	� � ] ��	� � ] �@@@@��	� � ] ��	� � ] �@@@��	� � ] p�	� � ] �@@@@��	� � ] o�	� � ] �@@@@������
�@@ ��
�@@ �A�������	n [catch_error ?name f] runs [f ()] inside of a new monitor [m] and returns the first
    error raised to [m]. @��	� ����	� � A \@@@@��	� ����	� � A \@@��
�@@ ��
�@@ �A@��	� � ] ]�	� � ] �@��	� � ] ]�	� � ] �@���Р'protect��	� �""
�	� �""@����:with_optional_monitor_name��	� �"�"��	� �"�#@����+extract_exn����$bool��	� �""$�	� �""(@@��	� �""$�	� �""(@@���2��
�@@ ��
�@@ �A�������4 default is [false] @��	� �"")�	� �""B@@@@��	� �"")�	� �""B@@��
�@@ ��
�@@ �A@���#run������#Now��	� �"C"R�	� �"C"V@A@��	� �"C"R�	� �"C"V@@����(Schedule��
 �"C"Y�
 �"C"b@A@��
 �"C"Y�
 �"C"b@@@@@��
 �"C"P�
	 �"C"d@@���h��
�@@ ��
�@@ �A�������8 default is [`Schedule] @��
 �"C"e�
 �"C"�@@@@��
 �"C"e�
 �"C"�@@��
@@ ��@@ �A@��@��@����$unit��
+ �"�"��
, �"�"�@@��
. �"�"��
/ �"�"�@@@�����(Deferred!t��
8 �"�"��
9 �"�"�@���!a��
? �"�"��
@ �"�"�@@@@��
B �"�"��
C �"�"�@@@��
E �"�"��
F �"�"�@@@���'finally��@����$unit��
S �"�"��
T �"�"�@@��
V �"�"��
W �"�"�@@@�����(Deferred!t��
` �"�"��
a �"�"�@�����$unit��
i �"�"��
j �"�"�@@��
l �"�"��
m �"�"�@@@@��
o �"�"��
p �"�"�@@@��
r �"�"��
s �"�"�@@@�����(Deferred!t��
| �"�"��
} �"�"�@���!a��
� �"�"��
� �"�"�@@@@��
� �"�"��
� �"�"�@@@��
� �"�"��
� �"�"�@@@��
� �"�"��
� �"�"�@@@��
� �"C"K�
� �"�"�@@@��
� �""�
� �"�"�@@@@��
� �""�
� �"�#@@@@�������@@ ���@@ �A�������
  N [protect f ~finally] runs [f ()] and then [finally] regardless of the success or
    failure of [f].  It re-raises any exception thrown by [f] or returns whatever [f]
    returned.

    The [name] argument is used to give a name to the monitor the computation will be
    running in.  This name will appear when printing the errors. @��
� � � ��
� �!�"@@@@��
� � � ��
� �!�"@@���@@ ���@@ �A@��
� �""�
� �"�#@��
� �""�
� �"�#@���Р$main��
� �#�#��
� �#�#�@����!t��
� �#�#��
� �#�#�@@��
� �#�#��
� �#�#�@@@@���	&���@@ ���@@ �A�������	x This is the initial monitor and is the root of the monitor tree.  Unhandled exceptions
    are raised to this monitor. @��
� �##�
� �#a#�@@@@��
� �##�
� �#a#�@@���@@ ���@@ �A@��
� �#�#��
� �#�#�@��
� �#�#��
� �#�#�@�����&Expert��
� �#�#��
� �#�#�@�����Р0try_with_log_exn��
� �$R$X�
� �$R$h@����#ref��
� �$R$y�  �$R$|@���@����#exn��
 �$R$l� �$R$o@@�� �$R$l� �$R$o@@@����$unit�� �$R$s� �$R$w@@�� �$R$s� �$R$w@@@�� �$R$l� �$R$w@@@@�� �$R$k� �$R$|@@@@���	~��@@ ��@@ �A�������	� [try_with_log_exn] is called by [try_with] when an exception is raised to a
      [try_with] that already returned.  [Async_unix] sets it to a function that logs. @��/ �#�#��0 �#�$Q@@@@��2 �#�#��3 �#�$Q@@�� @@ ��!@@ �A@��8 �$R$T�9 �$R$|@��; �$R$T�< �$R$|@@��> �#�#��? �$}$�@@@��A �#�#��B �$}$�@��D �#�#��E �$}$�@�����6Exported_for_scheduler��M �$�$��N �$�$�@�����A�    �,with_options��Y �$�$��Z �$�$�@����!a��a �$�$��b �$�$�@@@B@@@A����'monitor����!t��n �$�$��o �$�$�@@��q �$�$��r �$�$�@@@���(priority�����(Priority!t�� �$�$��� �$�$�@@��� �$�$��� �$�$�@@@��!a��� �$�$��� �$�$�@@@��� �$�$��� �$�$�@@@��� �$�$��� �$�$�@@@@��� �$�$��� �$�$�@@��� �$�$��� �$�$�@���Р'within'��� �$�$��� �$�$�@����,with_options��� �$�%$�� �$�%0@���@��@����$unit��� �$�$��� �$�$�@@��� �$�$��� �$�$�@@@�����(Deferred!t��� �$�%�� �$�%@���!a��� �$�%�� �$�%@@@@��� �$�%�� �$�%@@@��� �$�$��� �$�%@@@�����(Deferred!t��� �$�%�� �$�%"@���!a��� �$�%�� �$�%@@@@��� �$�%�� �$�%"@@@��� �$�$��� �$�%"@@@@��� �$�$��� �$�%0@@@@@��� �$�$��� �$�%0@��� �$�$��� �$�%0@���Р&within��� �%1%7�� �%1%=@����,with_options��� �%1%Y�� �%1%e@���@��@����$unit��
 �%1%B� �%1%F@@�� �%1%B� �%1%F@@@����$unit�� �%1%J� �%1%N@@�� �%1%J� �%1%N@@@�� �%1%B� �%1%N@@@����$unit��# �%1%S�$ �%1%W@@��& �%1%S�' �%1%W@@@��) �%1%A�* �%1%W@@@@��, �%1%@�- �%1%e@@@@@��/ �%1%3�0 �%1%e@��2 �%1%3�3 �%1%e@���Р(within_v��; �%f%l�< �%f%t@����,with_options��C �%f%��D �%f%�@���@��@����$unit��P �%f%y�Q �%f%}@@��S �%f%y�T �%f%}@@@��!a��Y �%f%��Z �%f%�@@@��\ �%f%y�] �%f%�@@@����&option��d �%f%��e �%f%�@���!a��k �%f%��l �%f%�@@@@��n �%f%��o �%f%�@@@��q �%f%x�r �%f%�@@@@��t �%f%w�u �%f%�@@@@@��w �%f%h�x �%f%�@��z �%f%h�{ �%f%�@���Р)schedule'��� �%�%��� �%�%�@����,with_options��� �%�%��� �%�%�@���@��@����$unit��� �%�%��� �%�%�@@��� �%�%��� �%�%�@@@�����(Deferred!t��� �%�%��� �%�%�@���!a��� �%�%��� �%�%�@@@@��� �%�%��� �%�%�@@@��� �%�%��� �%�%�@@@�����(Deferred!t��� �%�%��� �%�%�@���!a��� �%�%��� �%�%�@@@@��� �%�%��� �%�%�@@@��� �%�%��� �%�%�@@@@��� �%�%��� �%�%�@@@@@��� �%�%��� �%�%�@��� �%�%��� �%�%�@���Р(schedule��� �%�%��� �%�%�@����,with_options��� �%�&�� �%�& @���@��@����$unit��� �%�%��� �%�&@@��� �%�%��� �%�&@@@����$unit��� �%�&�� �%�&	@@��� �%�&�� �%�&	@@@�� �%�%�� �%�&	@@@����$unit��	 �%�&�
 �%�&@@�� �%�&� �%�&@@@�� �%�%�� �%�&@@@@�� �%�%�� �%�& @@@@@�� �%�%�� �%�& @�� �%�%�� �%�& @���Р.within_context��! �&!&'�" �&!&5@��@�����1Execution_context!t��- �&!&8�. �&!&K@@��0 �&!&8�1 �&!&K@@@��@��@����$unit��< �&!&P�= �&!&T@@��? �&!&P�@ �&!&T@@@��!a��E �&!&X�F �&!&Z@@@��H �&!&P�I �&!&Z@@@�����&Result!t��R �&!&j�S �&!&r@���!a��Y �&!&`�Z �&!&b@@@�����$unit��b �&!&d�c �&!&h@@��e �&!&d�f �&!&h@@@@��h �&!&_�i �&!&r@@@��k �&!&O�l �&!&r@@@��n �&!&8�o �&!&r@@@@@��q �&!&#�r �&!&r@��t �&!&#�u �&!&r@���Р:preserve_execution_context��} �&s&y�~ �&s&�@��@��@��!a��� �&s&��� �&s&�@@@����$unit��� �&s&��� �&s&�@@��� �&s&��� �&s&�@@@��� �&s&��� �&s&�@@@�����&Staged!t��� �&s&��� �&s&�@���@��!a��� �&s&��� �&s&�@@@����$unit��� �&s&��� �&s&�@@��� �&s&��� �&s&�@@@��� �&s&��� �&s&�@@@@��� �&s&��� �&s&�@@@��� �&s&��� �&s&�@@@@@��� �&s&u�� �&s&�@��� �&s&u�� �&s&�@���Р;preserve_execution_context'��� �&�&��� �&�&�@��@��@��!a��� �&�&��� �&�&�@@@�����(Deferred!t��� �&�&��� �&�&�@���!b��� �&�&��� �&�&�@@@@��� �&�&��� �&�&�@@@��� �&�&��� �&�&�@@@�����&Staged!t��� �&�'�� �&�'!@���@��!a��� �&�'�  �&�'@@@�����(Deferred!t��	 �&�'�
 �&�'@���!b�� �&�'
� �&�'@@@@�� �&�'
� �&�'@@@�� �&�'� �&�'@@@@�� �&�'� �&�'!@@@�� �&�&�� �&�'!@@@@@�� �&�&��  �&�'!@��" �&�&��# �&�'!@@��% �$�$��& �'"'%@@@��( �$�$��) �'"'%@��+ �$�$��, �'"'%@@