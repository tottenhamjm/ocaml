Caml1999N026����   C         
	Abook/duniverse/async_unix.v0.13.0/thread_pool/src/thread_pool.mli����  Z�  Z  4  /Р����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  
4 A thread pool is a set of OCaml threads used to do work, where each piece of work is
    simply a thunk.  One creates a thread pool, and then uses [add_work] to submit work to
    it.  Work is done first-come-first-served by available threads in the pool.  Any of
    the available threads in the pool could be used to do work submitted to the pool
    (except helper threads, see below).

    A thread pool starts with no threads.  As work is added, the thread pool creates new
    threads to do the work, up to the maximum number of allowed threads,
    [max_num_threads], supplied to [create].  Thread-pool threads never die.  They just
    get created up until [max_num_threads] is reached and then live forever, doing work.
    Each thread in the pool is in a loop, waiting for a piece of work, running the thunk,
    and then repeating.  It may be that all the threads in the pool are not doing
    anything, but in this case, the threads still exist, and are simply blocked waiting
    for work.

    Sometimes one wants work to run in a dedicated thread, e.g. some C libraries require
    this.  To do this, use [Helper_thread], see below.

    All of the functions exposed by this module are thread safe; they synchronize using a
    mutex on the thread pool.

    One must not call thread-pool functions from a GC finalizer, since a finalizer could
    run within a thread running a thread-pool function, which already holds the lock, and
    would therefore deadlock or error when attempting to re-acquire it.  This is
    accomplished elsewhere by using Async finalizers, which are run from ordinary Async
    jobs, and thus do not hold the thread-pool lock.

    One can control the priority and affinity of threads in the pool (priority in the
    sense of [Linux_ext.setpriority]).
    Work added to the pool can optionally be given a priority, and the
    pool will set the priority of the thread that runs it for the duration of the work.
    Helper threads can also be given a priority, which will be used for
    all work run by the helper thread, unless the work has an overriding priority.
    The thread pool has a "default" priority that will be used for all work
    and helper threads that have no specified priority.
    The default priority is the priority in effect when [create] is called.

    Affinity, on the other hand, can only be specified when you create a pool.
    The default affinity is the affinity in effect when a new thread happens to be created
    (e.g. when you call [add_work]).

    Behavior is unspecified if work calls [setpriority] or [setaffinity] directly. @��	Abook/duniverse/async_unix.v0.13.0/thread_pool/src/thread_pool.mliA@@�j	�
9@@@@��A@@�j	�
9@@���@@ ���@@ �A��
A@@�j	�
9@������$Core��l
;
A�l
;
E@@��l
;
;�l
;
E@@��l
;
;�l
;
E@������&Import��$m
F
L�%m
F
R@@��'m
F
F�(m
F
R@@��*m
F
F�+m
F
R@�����,Cpu_affinity��3n
S
Z�4n
S
f@����8Thread_pool_cpu_affinity��;n
S
i�<n
S
�@��>n
S
i�?n
S
�@@@��An
S
S�Bn
S
�@��Dn
S
S�En
S
�@�����(Priority��Mo
�
��No
�
�@���������)Linux_ext(Priority��[o
�
��\o
�
�@��^o
�
��_o
�
�@@��ao
�
��bo
�
�@@����!t��io
�
��jo
�
�@    ���no
�
��oo
�
�@@@@A�������)Linux_ext(Priority!t��{o
�
��|o
�
�@@��~o
�
��o
�
�@@@@���o
�
���o
�
�@@���o
�
���o
�
�@@@���o
�
���o
�
�@���o
�
���o
�
�@���A�    �!t���q
�
���q
�
�@@@@A@���(deriving���q
�
���q
�
�@��������'sexp_of���q
�
���q
�
�@���q
�
���q
�
�@@@@���q
�
���q
�
�@@���q
�
���q
�
�@@���q
�
���q
�
�@@���q
�
���q
�
�@�����������-ocaml.warning���q
�
���q
�
�@�������#-32@���q
�
���q
�
�@@@@���q
�
���q
�
�@@���q
�
���q
�
�@���q
�
���q
�
�@���Р)sexp_of_t���q
�
���q
�
�@��@����X���q
�
���q
�
�@@���q
�
���q
�
�@@@������1Ppx_sexp_conv_lib$Sexp!t���q
�
���q
�
�@@���q
�
���q
�
�@@@�� q
�
��q
�
�@@@@@��q
�
��q
�
�@��q
�
��q
�
�@@��	q
�
��
q
�
�@@��q
�
��q
�
�@���)ocaml.doc��q
�
��q
�
�@�������'@inline@��q
�
��q
�
�@@@@��!q
�
��"q
�
�@@��$q
�
��%q
�
�@@��'q
�
��(q
�
�@�����������)Invariant!S��7s
�
��8s
�
@��:s
�
��;s
�
@@����!t��Bs
��Cs
�@    ���Gs
��Hs
�@@@@A�����!t��Ps
��Qs
�@@��Ss
��Ts
�@@@@��Vs
��Ws
�@@��Ys
�
��Zs
�@@��\s
�
��]s
�@@��_s
�
��`s
�@���Р&create��h}���i}��@���,cpu_affinity�����,Cpu_affinity!t��v~���w~��@@��y~���z~��@@���)ocaml.doc��k@@ ��l@@ �A�������6 default is [Inherit] @���~����~��@@@@���~����~��@@��|@@ ��}@@ �A@���/max_num_threads����#int���������@@���������@@@��@����$unit��� @���� @��@@��� @���� @��@@@�����(Or_error!t��� A��� A�@�����!t��� A���� A� @@��� A���� A� @@@@��� A���� A�@@@��� @���� A�@@@������� A�@@@���~���� A�@@@@���V���@@ ���@@ �A�������
  k [create ?cpuset ~max_num_threads] returns a new thread pool.  It is an
    error if [max_num_threads < 1].

    If [cpuset] is specified, then every thread will be affinitized to those
    CPU cores upon creation.

    If [cpuset] is not specified, then every thread will inherit the
    affinitization of the thread (typically the main thread) that created it. @���u��|=�@@@@���u��|=�@@���@@ ���@@ �A@���}���� A�@���}���� A�@���Р,cpu_affinity��� E���� E��@��@����!t��� E���  E��@@�� E��� E��@@@�����,Cpu_affinity!t�� E��� E��@@�� E��� E��@@@�� E��� E��@@@@������@@ ��@@ �A�������	� [cpu_affinity t] returns the CPU affinity that [t] was created with.  All
    threads created by [t] will be created with this affinity. @��# C�$ D[�@@@@��& C�' D[�@@��@@ ��@@ �A@��, E���- E��@��/ E���0 E��@���Р-finished_with��8 K���9 K�@��@����!t��B K�	�C K�
@@��E K�	�F K�
@@@����$unit��M K��N K�@@��P K��Q K�@@@��S K�	�T K�@@@@���ڰ�D@@ ��E@@ �A�������
  * [finished_with t] makes it an error to subsequently call [add_work* t] or
    [create_helper_thread t].  And, once all current work in [t] is finished, destroys all
    the threads in [t].  It is OK to call [finished_with] multiple times on the same [t];
    subsequent calls will have no effect. @��d G���e J��@@@@��g G���h J��@@��U@@ ��V@@ �A@��m K���n K�@��p K���q K�@���Р4block_until_finished��y O���z O��@��@����!t��� O���� O��@@��� O���� O��@@@����$unit��� O���� O��@@��� O���� O��@@@��� O���� O��@@@@������@@ ���@@ �A�������	� [block_until_finished t] blocks the current thread until thread pool [t] has finished.
    One must previously have called [finished_with] to cause [t] to start finishing. @��� M�� No�@@@@��� M�� No�@@���@@ ���@@ �A@��� O���� O��@��� O���� O��@���Р/max_num_threads��� SQU�� SQd@��@����!t��� SQg�� SQh@@��� SQg�� SQh@@@����#int��� SQl�� SQo@@��� SQl�� SQo@@@��� SQg�� SQo@@@@���\���@@ ���@@ �A�������	^ [max_num_threads t] returns the maximum number of threads that [t] is allowed to
    create. @��� Q���� RBP@@@@��� Q���� RBP@@���@@ ���@@ �A@��� SQQ�� SQo@��� SQQ�� SQo@���Р+num_threads��� V���� V��@��@����!t�� V��� V��@@�� V���	 V��@@@����#int�� V��� V��@@�� V��� V��@@@�� V��� V��@@@@������@@ ��@@ �A�������	N [num_threads t] returns the number of threads that the pool [t] has created. @��' Uqq�( Uq�@@@@��* Uqq�+ Uq�@@��@@ ��@@ �A@��0 V���1 V��@��3 V���4 V��@���Р/unfinished_work��< ZUY�= ZUh@��@����!t��F ZUk�G ZUl@@��I ZUk�J ZUl@@@����#int��Q ZUp�R ZUs@@��T ZUp�U ZUs@@@��W ZUk�X ZUs@@@@���ް�H@@ ��I@@ �A�������	n [unfinished_work t] returns the number of jobs that have been submitted to [t]
    but haven't yet finished. @��h X���i Y4T@@@@��k X���l Y4T@@��Y@@ ��Z@@ �A@��q ZUU�r ZUs@��t ZUU�u ZUs@���Р0default_priority��} ^�~ ^"@��@����!t��� ^%�� ^&@@��� ^%�� ^&@@@�����(Priority!t��� ^*�� ^4@@��� ^*�� ^4@@@��� ^%�� ^4@@@@���!���@@ ���@@ �A�������	� [default_priority t] returns the priority that will be used for work performed by
    [t], unless that work is added with an overriding priority. @��� \uu�� ]�@@@@��� \uu�� ]�@@���@@ ���@@ �A@��� ^�� ^4@��� ^�� ^4@���Р(add_work��� i���� i��@���(priority�����(Priority!t��� j���� j��@@��� j���� j��@@���X���@@ ���@@ �A�������	! default is [default_priority t] @��� j���� j�@@@@��� j���� j�@@���@@ ���@@ �A@���$name����&string��� k�� k@@��� k�� k@@���~���@@ ���@@ �A�������	# default is ["thread-pool thread"] @�� k �	 kH@@@@�� k � kH@@���@@ ���@@ �A@��@����!t�� lIN� lIO@@�� lIN� lIO@@@��@��@����$unit��' mPV�( mPZ@@��* mPV�+ mPZ@@@����$unit��2 mP^�3 mPb@@��5 mP^�6 mPb@@@��8 mPV�9 mPb@@@�����(Or_error!t��B ndn�C ndx@�����$unit��K ndi�L ndm@@��N ndi�O ndm@@@@��Q ndi�R ndx@@@��T mPU�U ndx@@@��W lIN�X ndx@@@��Z k�[ ndx@@@��] j���^ ndx@@@@�����N@@ ��O@@ �A�������
  � [add_work ?priority ?name t f] enqueues [f] to be done by some thread in the pool.

    Exceptions raised by [f] are silently ignored.

    While the work is run, the name of the thread running the work will be set (via
    [Linux_ext.pr_set_name]) to [name] and the priority of the thread will be set
    to [priority].

    It is an error to call [add_work t] after [finished_with t]. @��n `66�o h|�@@@@��q `66�r h|�@@��_@@ ��`@@ �A@��w i���x ndx@��z i���{ ndx@���Р2num_work_completed��� pz~�� pz�@��@����!t��� pz��� pz�@@��� pz��� pz�@@@����#int��� pz��� pz�@@��� pz��� pz�@@@��� pz��� pz�@@@@@��� pzz�� pz�@��� pzz�� pz�@���Р2has_unstarted_work��� t�� t/@��@����!t��� t2�� t3@@��� t2�� t3@@@����$bool��� t7�� t;@@��� t7�� t;@@@��� t2�� t;@@@@���O���@@ ���@@ �A�������	v [has_unstarted_work t] returns [true] if [t] has work that it hasn't been assigned
    to start running in a thread. @��� r���� s�@@@@��� r���� s�@@���@@ ���@@ �A@��� t�� t;@��� t�� t;@�����-Helper_thread��� zW^�� zWk@�����A�    �!t��� {ry�� {rz@@@@A@���(deriving�� {r~� {r�@��������'sexp_of�� {r�� {r�@�� {r�� {r�@@@@�� {r�� {r�@@�� {r{� {r�@@�� {rt� {r�@@�� {rt� {r�@�����������f��* {rt�+ {r�@�������e@��4 {rt�5 {r�@@@@��7 {rt�8 {r�@@��: {rt�; {r�@��= {rt�> {r�@���Р)sexp_of_t��F {ry�G {rz@��@����V��O {ry�P {rz@@��R {ry�S {rz@@@������dcb��[ {ry�\ {rz@@��^ {ry�_ {rz@@@��a {ry�b {rz@@@@@��d {rt�e {r�@��g {rt�h {r�@@��j {rt�k {r�@@��m {rt�n {r�@���a��s {rt�t {r�@�������`@��} {rt�~ {r�@@@@��� {rt�� {r�@@��� {rt�� {r�@@��� {rt�� {r�@���Р,default_name��� !'�� !3@��@����!t��� !6�� !7@@��� !6�� !7@@@����&string��� !;�� !A@@��� !;�� !A@@@��� !6�� !A@@@@���1���@@ ���@@ �A�������	� [default_name t] returns the name that will be used for work performed by [t],
      unless that work is added with an overriding name @��� }���� ~� @@@@��� }���� ~� @@���@@ ���@@ �A@��� !#�� !A@��� !#�� !A@���Р0default_priority��� ����� ���@��@����!t��� ����� ���@@��� ����� ���@@@�����(Priority!t��� ����� ��@@��� ����� ��@@@��� ����� ��@@@@���t���@@ ���@@ �A�������	� [default_priority t] returns the priority that will be used for work performed by
      [t], unless that work is added with an overriding priority. @��� �CE�� ���@@@@�� �CE� ���@@���@@ ���@@ �A@�� ���� ��@��
 ���� ��@@�� zWn� �	@@�������@@ ���@@ �A�������
   A helper thread is a thread with its own dedicated work queue.  Work added for the
    helper thread is guaranteed to be run by that thread.  The helper thread only runs
    work explicitly supplied to it.  Helper threads count towards a thread pool's
    [max_num_threads]. @�� v==� y=V@@@@��! v==�" y=V@@��@@ ��@@ �A@��' zWW�( �	@��* zWW�+ �	@���Р4create_helper_thread��3 ����4 ���@���(priority�����(Priority!t��A ����B ���@@��D ����E ���@@���˰�5@@ ��6@@ �A�������	! default is [default_priority t] @��U �� �V ��&@@@@��X �� �Y ��&@@��F@@ ��G@@ �A@���$name����&string��g �'2�h �'8@@��j �'2�k �'8@@�����[@@ ��\@@ �A�������> default is ["helper thread"] @��{ �'9�| �'\@@@@��~ �'9� �'\@@��l@@ ��m@@ �A@��@����!t��� �]b�� �]c@@��� �]b�� �]c@@@�����(Or_error!t��� �dy�� �d�@������-Helper_thread!t��� �di�� �dx@@��� �di�� �dx@@@@��� �di�� �d�@@@��� �]b�� �d�@@@��� �',�� �d�@@@��� ����� �d�@@@@���9���@@ ���@@ �A�������
  � [create_helper_thread ?priority ?name t] takes an available thread from the thread
    pool and makes it a helper thread, raising if no threads are available or if
    [finished_with t] was previously called.  The new helper thread runs work with [name]
    and [priority], except for work that is added with an overriding priority or name.
    The thread remains a helper thread until [finished_with_helper_thread] is called, if
    ever. @��� ��� ���@@@@��� ��� ���@@���@@ ���@@ �A@��� ����� �d�@��� ����� �d�@���Р4become_helper_thread��� ����� ���@���(priority�����(Priority!t��� �� �� ��
@@��� �� �� ��
@@���p���@@ ���@@ �A�������	! default is [default_priority t] @��� ���� ��1@@@@��� ���� ��1@@���@@ ���@@ �A@���$name����&string�� �2=� �2C@@�� �2=� �2C@@������ @@ ��@@ �A�������> default is ["helper thread"] @��  �2D�! �2g@@@@��# �2D�$ �2g@@��@@ ��@@ �A@��@����!t��0 �hm�1 �hn@@��3 �hm�4 �hn@@@�����(Or_error!t��= �o��> �o�@������-Helper_thread!t��H �ot�I �o�@@��K �ot�L �o�@@@@��N �ot�O �o�@@@��Q �hm�R �o�@@@��T �27�U �o�@@@��W ����X �o�@@@@���ް�H@@ ��I@@ �A�������
  M [become_helper_thread ?priority ?name t] should be run from within work supplied to
    [add_work].  When [become_helper_thread] runs, it transitions the current thread into
    a helper thread.

    Other than that, [become_helper_thread] is like [create_helper_thread], except it
    cannot fail because no threads are available. @��h ����i ���@@@@��k ����l ���@@��Y@@ ��Z@@ �A@��q ����r �o�@��t ����u �o�@���Р:add_work_for_helper_thread��} �+/�~ �+I@���(priority�����(Priority!t��� �JY�� �Jc@@��� �JY�� �Jc@@�����@@ ���@@ �A�������	; default is [Helper_thread.default_priority helper_thread] @��� �Jd�� �J�@@@@��� �Jd�� �J�@@���@@ ���@@ �A@���$name����&string��� ����� ���@@��� ����� ���@@���;���@@ ���@@ �A�������	/ default is [Helper_thread.name helper_thread] @��� ����� ���@@@@��� ����� ���@@���@@ ���@@ �A@��@����!t��� ����� ���@@��� ����� ���@@@��@�����-Helper_thread!t��� ����� ��@@��� ����� ��@@@��@��@����$unit��� ��� �@@��� ��� �@@@����$unit��� ��� �@@�� �� �@@@�� �� �@@@�����(Or_error!t�� �&� �0@�����$unit�� �!� �%@@�� �!� �%@@@@�� �!� �0@@@��  ��! �0@@@��# ����$ �0@@@��& ����' �0@@@��) ����* �0@@@��, �JO�- �0@@@@������	@@ ��	@@ �A�������
  � [add_work_for_helper_thread ?priority ?name t helper_thread f] enqueues [f] on
    [helper_thread]'s work queue.

    Exceptions raised by [f] are silently ignored.

    It is an error to call [add_work_for_helper_thread t] after
    [finished_with_helper_thread t].

    When the helper thread runs [f], it will be at the helper thread's name and priority,
    unless overriden by [name] or [priority]. @��= ����> ��*@@@@��@ ����A ��*@@��	.@@ ��	/@@ �A@��F �++�G �0@��I �++�J �0@���Р;finished_with_helper_thread��R �!
!�S �!
!)@��@����!t��\ �!
!,�] �!
!-@@��_ �!
!,�` �!
!-@@@��@�����-Helper_thread!t��k �!
!1�l �!
!@@@��n �!
!1�o �!
!@@@@����$unit��v �!
!D�w �!
!H@@��y �!
!D�z �!
!H@@@��| �!
!1�} �!
!H@@@�� �!
!,�� �!
!H@@@@�����	p@@ ��	q@@ �A�������
  � [finished_with_helper_thread t helper_thread] informs thread pool [t] that no future
    work will be added for [helper_thread], and makes it an error to in the future add
    work for [helper_thread].  Furthermore, once [helper_thread] finishes with its last
    piece of work, it will revert to a general thread-pool thread.  It is OK to call
    [finished_with_helper_thread] multiple times on the same [helper_thread]; subsequent
    calls will have no effect. @��� �22�� � �!	@@@@��� �22�� � �!	@@��	�@@ ��	�@@ �A@��� �!
!
�� �!
!H@��� �!
!
�� �!
!H@���Р<last_thread_creation_failure��� �!J!N�� �!J!j@��@����!t��� �!J!m�� �!J!n@@��� �!J!m�� �!J!n@@@����&option��� �!J!y�� �!J!@������$Sexp!t��� �!J!r�� �!J!x@@��� �!J!r�� �!J!x@@@@��� �!J!r�� �!J!@@@��� �!J!m�� �!J!@@@@@��� �!J!J�� �!J!@��� �!J!J�� �!J!@���Р?thread_creation_failure_lockout��� �!�!��� �!�!�@��@����!t��� �!�!��� �!�!�@@��� �!�!��� �!�!�@@@������'Time_ns$Span!t��� �!�!��� �!�!�@@��� �!�!��� �!�!�@@@��� �!�!��� �!�!�@@@@@��� �!�!��	  �!�!�@��	 �!�!��	 �!�!�@���Р%debug��	 �!�!��	 �!�!�@����#ref��	 �!�!��	 �!�!�@�����$bool��	 �!�!��	 �!�!�@@��	 �!�!��	  �!�!�@@@@��	" �!�!��	# �!�!�@@@@@��	% �!�!��	& �!�!�@��	( �!�!��	) �!�!�@�����	<��
@@ ��
@@ �A�������"/*@��	; �!�!��	< �!�!�@@@@��	> �!�!��	? �!�!�@@��
,@@ ��
-@@ �A��	D �!�!��	E �!�!�@�����'Private��	M �!�!��	N �!�!�@�����Р/check_invariant��	X �!�!��	Y �!�"@����#ref��	` �!�"�	a �!�"@�����$bool��	i �!�"�	j �!�"
@@��	l �!�"�	m �!�"
@@@@��	o �!�"�	p �!�"@@@@@��	r �!�!��	s �!�"@��	u �!�!��	v �!�"@���Р3default_thread_name��	~ �""�	 �""(@����&string��	� �""+�	� �""1@@��	� �""+�	� �""1@@@@@��	� �""�	� �""1@��	� �""�	� �""1@���Р+is_finished��	� �"2"8�	� �"2"C@��@����!t��	� �"2"F�	� �"2"G@@��	� �"2"F�	� �"2"G@@@����$bool��	� �"2"K�	� �"2"O@@��	� �"2"K�	� �"2"O@@@��	� �"2"F�	� �"2"O@@@@@��	� �"2"4�	� �"2"O@��	� �"2"4�	� �"2"O@���Р)is_in_use��	� �"P"V�	� �"P"_@��@����!t��	� �"P"b�	� �"P"c@@��	� �"P"b�	� �"P"c@@@����$bool��	� �"P"g�	� �"P"k@@��	� �"P"g�	� �"P"k@@@��	� �"P"b�	� �"P"k@@@@@��	� �"P"R�	� �"P"k@��	� �"P"R�	� �"P"k@���Р	 set_last_thread_creation_failure��	� �"l"r�	� �"l"�@��@����!t��	� �"l"��	� �"l"�@@��	� �"l"��	� �"l"�@@@��@�����'Time_ns!t��
 �"l"��
 �"l"�@@��
 �"l"��
	 �"l"�@@@����$unit��
 �"l"��
 �"l"�@@��
 �"l"��
 �"l"�@@@��
 �"l"��
 �"l"�@@@��
 �"l"��
 �"l"�@@@@@��
 �"l"n�
 �"l"�@��
 �"l"n�
  �"l"�@���Р	#set_thread_creation_failure_lockout��
( �"�"��
) �"�"�@��@����!t��
2 �"�"��
3 �"�"�@@��
5 �"�"��
6 �"�"�@@@��@������'Time_ns$Span!t��
C �"�"��
D �"�"�@@��
F �"�"��
G �"�"�@@@����$unit��
N �"�"��
O �"�"�@@��
Q �"�"��
R �"�"�@@@��
T �"�"��
U �"�"�@@@��
W �"�"��
X �"�"�@@@@@��
Z �"�"��
[ �"�"�@��
] �"�"��
^ �"�"�@@��
` �!�!��
a �"�"�@@@��
c �!�!��
d �"�"�@��
f �!�!��
g �"�"�@@