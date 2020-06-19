Caml1999N026����   5         	3book/duniverse/async_unix.v0.13.0/src/scheduler.mli����  E�  �  '�  $O�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
   Dispatches and monitors Async processes.

    The threading model is as follows.  Only one thread runs Async code at a time.  This
    is enforced by a single lock in Async's scheduler data structure.  There are any
    number of threads running code without holding the lock that get data from the outside
    world and want to affect the Async world.  They do this by calling
    [Thread_safe.run_in_async*], which acquires the lock, does a computation (e.g., fills
    an ivar), and then runs a "cycle" of Async computations. @��	3book/duniverse/async_unix.v0.13.0/src/scheduler.mliA@@�H�@@@@��A@@�H�@@���@@ ���@@ �A��
A@@�H�@������$Core��J�J#@@��J�J#@@��J�J#@������&Import��$K$*�%K$0@@��'K$$�(K$0@@��*K$$�+K$0@���A�    �!t��4M27�5M28@@@@A������-Raw_scheduler!t��?M2;�@M2J@@��BM2;�CM2J@@@���(deriving��IM2N�JM2V@��������'sexp_of��UM2W�VM2^@��XM2W�YM2^@@@@��[M2W�\M2^@@��^M2K�_M2_@@��aM22�bM2_@@��dM22�eM2_@�����������-ocaml.warning��sM22�tM2_@�������#-32@��~M22�M2_@@@@���M22��M2_@@���M22��M2_@���M22��M2_@���Р)sexp_of_t���M27��M28@��@����f���M27��M28@@���M27��M28@@@������1Ppx_sexp_conv_lib$Sexp!t���M27��M28@@���M27��M28@@@���M27��M28@@@@@���M22��M2_@���M22��M2_@@���M22��M2_@@���M22��M2_@���)ocaml.doc���M22��M2_@�������'@inline@���M22��M2_@@@@���M22��M2_@@���M22��M2_@@���M22��M2_@����������������6Async_kernel_scheduler���P���P�@���P���P�@@���P���P�@@���P���P�@@���Oax��Q��@@���Oai��Q��@@���Oaa��Q��@@���Oaa��Q��@���Р!t��U/3�U/4@��@����$unit��U/7�U/;@@��U/7�U/;@@@����!t��U/?�U/@@@��U/?� U/@@@@��"U/7�#U/@@@@@���)ocaml.doc��@@ ��@@ �A�������	� [t ()] returns the Async scheduler.  If the scheduler hasn't been created yet, this
    will create it and acquire the Async lock. @��4S���5T�.@@@@��7S���8T�.@@��%@@ ��&@@ �A@��=U//�>U/@@��@U//�AU/@@�����T��3@@ ��4@@ �A�������+ Accessors @��SWBB�TWBR@@@@��VWBB�WWBR@@��D@@ ��E@@ �A��\WBB�]WBR@���Р8max_num_open_file_descrs��eYTX�fYTp@��@����$unit��oYTs�pYTw@@��rYTs�sYTw@@@����#int��zYT{�{YT~@@��}YT{�~YT~@@@���YTs��YT~@@@@@���YTT��YT~@���YTT��YT~@���Р/max_num_threads���Z���Z�@��@����$unit���Z���Z�@@���Z���Z�@@@����#int���Z���Z�@@���Z���Z�@@@���Z���Z�@@@@@���Z��Z�@���Z��Z�@���Р"go���h����h��@���3raise_unhandled_exn����$bool���h���h�@@���h���h�@@�������@@ ���@@ �A�������4 default is [false] @���h���h�0@@@@���h���h�0@@���@@ ���@@ �A@��@����$unit���h�4��h�8@@���h�4��h�8@@@����-never_returns���h�<��h�I@@���h�<��h�I@@@���h�4��h�I@@@���h����h�I@@@@���۰��@@ ���@@ �A�������
  L [go ?raise_unhandled_exn ()] passes control to Async, at which point Async starts
    running handlers, one by one without interruption, until there are no more handlers to
    run.  When Async is out of handlers, it blocks until the outside world schedules more
    of them.  Because of this, Async programs do not exit until [shutdown] is called.

    [go ()] calls [handle_signal Sys.sigpipe], which causes the SIGPIPE signal to be
    ignored.  Low-level syscalls (e.g., write) still raise EPIPE.

    If any Async job raises an unhandled exception that is not handled by any monitor,
    Async execution ceases.  Then, by default, Async pretty prints the exception, and
    exits with status 1.  If you don't want this, pass [~raise_unhandled_exn:true], which
    will cause the unhandled exception to be raised to the caller of [go ()]. @��\���g��@@@@��\���g��@@���@@ �� @@ �A@��h���h�I@��h���h�I@���Р'go_main��#ny}�$ny�@���3raise_unhandled_exn����$bool��/o���0o��@@��2o���3o��@@�����#@@ ��$@@ �A�������4 default is [false] @��Co���Do��@@@@��Fo���Go��@@��4@@ ��5@@ �A@���2file_descr_watcher������&Config2File_descr_watcher!t��Yp���Zp��@@��\p���]p��@@���:��M@@ ��N@@ �A�������5 default is [Config] @��mp���np�	@@@@��pp���qp�	@@��^@@ ��_@@ �A@���8max_num_open_file_descrs����#int��q		-��q		0@@���q		-��q		0@@���`��s@@ ��t@@ �A�������5 default is [Config] @���q		1��q		K@@@@���q		1��q		K@@���@@ ���@@ �A@���/max_num_threads����#int���r	L	b��r	L	e@@���r	L	b��r	L	e@@�������@@ ���@@ �A�������5 default is [Config] @���r	L	f��r	L	�@@@@���r	L	f��r	L	�@@���@@ ���@@ �A@���$main��@����$unit���s	�	���s	�	�@@���s	�	���s	�	�@@@����$unit���s	�	���s	�	�@@���s	�	���s	�	�@@@���s	�	���s	�	�@@@��@����$unit���t	�	���t	�	�@@���t	�	���t	�	�@@@����-never_returns���u	�	���u	�	�@@���u	�	���u	�	�@@@���t	�	���u	�	�@@@���s	�	���u	�	�@@@���r	L	Q� u	�	�@@@��q		�u	�	�@@@��p���u	�	�@@@��o���	u	�	�@@@@������@@ ���@@ �A�������
  ( [go_main] is like [go], except that you supply a [main] function that will be run to
    initialize the Async computation, and that [go_main] will fail if any Async has been
    used prior to [go_main] being called.  Moreover it allows you to configure more static
    options of the scheduler. @��jKK�mXx@@@@��jKK�mXx@@��
@@ ��@@ �A@��"nyy�#u	�	�@��%nyy�&u	�	�@���Р7report_long_cycle_times��.z
�
��/z
�
�@���&cutoff������$Time$Span!t��>z
�
��?z
�
�@@��Az
�
��Bz
�
�@@@��@����$unit��Kz
�
��Lz
�
�@@��Nz
�
��Oz
�
�@@@����$unit��Vz
�
��Wz
�
�@@��Yz
�
��Zz
�
�@@@��\z
�
��]z
�
�@@@��_z
�
��`z
�
�@@@@���=��P@@ ��Q@@ �A�������	� [report_long_cycle_times ?cutoff ()] sets up something that will print a warning to
    stderr whenever there is an Async cycle that is too long, as specified by [cutoff],
    whose default is 1s. @��pw	�	��qy
h
�@@@@��sw	�	��ty
h
�@@��a@@ ��b@@ �A@��yz
�
��zz
�
�@��|z
�
��}z
�
�@���Р*is_running���}��}@��@����$unit���}��}#@@���}��}#@@@����$bool���}'��}+@@���}'��}+@@@���}��}+@@@@���~���@@ ���@@ �A�������	A [is_running ()] returns true if the scheduler has been started. @���|
�
���|
�@@@@���|
�
���|
�@@���@@ ���@@ �A@���}��}+@���}��}+@���Р;set_max_inter_cycle_timeout��� A���� A��@��@������$Time$Span!t��� A���� A��@@��� A���� A��@@@����$unit��� A���� A��@@��� A���� A��@@@��� A���� A��@@@@���ð��@@ ���@@ �A�������	� [set_max_inter_cycle_timeout span] sets the maximum amount of time the scheduler will
    remain blocked (on epoll or select) between cycles. @���--�� @��@@@@���--�� @��@@���@@ ���@@ �A@��� A���  A��@�� A��� A��@���Р4set_check_invariants�� F��� F��@��@����$bool�� F��� F��@@�� F��� F��@@@����$unit��  F���! F��@@��# F���$ F��@@@��& F���' F��@@@@�����@@ ��@@ �A�������	� [set_check_invariants do_check] sets whether Async should check invariants of its
    internal data structures.  [set_check_invariants true] can substantially slow down
    your program. @��7 C���8 E��@@@@��: C���; E��@@��(@@ ��)@@ �A@��@ F���A F��@��C F���D F��@���Р	%set_detect_invalid_access_from_thread��L L���M L�@��@����$bool��V L��W L�#@@��Y L��Z L�#@@@����$unit��a L�'�b L�+@@��d L�'�e L�+@@@��g L��h L�+@@@@���E��X@@ ��Y@@ �A�������
  	 [set_detect_invalid_access_from_thread do_check] sets whether Async routines should
    check if they are being accessed from some thread other than the thread currently
    holding the Async lock, which is not allowed and can lead to very confusing
    behavior. @��x H���y K��@@@@��{ H���| K��@@��i@@ ��j@@ �A@��� L���� L�+@��� L���� L�+@���A�    �&folder��� N-5�� N-;@����!b��� N-2�� N-4@@@B@@��Р&folder��� N-@�� N-F@@����!a��� N-J�� N-K@@��@��!b��� N-M�� N-O@@@��@����!t��� N-S�� N-T@@��� N-S�� N-T@@@��@�����%Field!t��� N-`�� N-g@�����!t��� N-Y�� N-Z@@��� N-Y�� N-Z@@@���!a��� N-\�� N-^@@@@��� N-X�� N-g@@@��!b��� N-k�� N-m@@@��� N-X�� N-m@@@��� N-S�� N-m@@@��� N-M�� N-m@@@��� N-I�� N-m@@@��� N-@�� N-m@@@A@@��� N--�� N-o@@��� N--�� N-o@���Р+fold_fields�� T��� T��@���$init��!b�� T��� T��@@@��@����&folder�� T��� T��@���!b�� T��� T��@@@@�� T���  T��@@@��!b��% T���& T��@@@��( T���) T��@@@��+ T���, T��@@@@���	��@@ ��@@ �A�������
   [fold_fields ~init folder] folds [folder] over each field in the scheduler.  The
    fields themselves are not exposed -- [folder] must be a polymorphic function that
    can work on any field.  So, it's only useful for generic operations, e.g., getting
    the size of each field. @��< Pqq�= Ss�@@@@��? Pqq�@ Ss�@@��-@@ ��.@@ �A@��E T���F T��@��H T���I T��@���Р6is_ready_to_initialize��Q V���R V��@��@����$unit��[ V���\ V��@@��^ V���_ V��@@@����$bool��f V���g V��@@��i V���j V��@@@��l V���m V��@@@@@��o V���p V��@��r V���s V��@���Р7reset_in_forked_process��{ ]{�| ]{�@��@����$unit��� ]{��� ]{�@@��� ]{��� ]{�@@@����$unit��� ]{��� ]{�@@��� ]{��� ]{�@@@��� ]{��� ]{�@@@@���t���@@ ���@@ �A�������
  � If a process that has already created, but not started, the Async scheduler would like
    to fork, and would like the child to have a clean Async, i.e., not inherit any of the
    Async work that was done in the parent, it can call [reset_in_forked_process] at the
    start of execution in the child process.  After that, the child can do Async stuff and
    then start the Async scheduler. @��� X���� \Tz@@@@��� X���� \Tz@@���@@ ���@@ �A@��� ]{{�� ]{�@��� ]{{�� ]{�@���Р3make_async_unusable��� c���� c�	@��@����$unit��� c��� c�@@��� c��� c�@@@����$unit��� c��� c�@@��� c��� c�@@@��� c��� c�@@@@�������@@ ���@@ �A�������
  E [make_async_unusable ()] makes subsequent attempts to use the Async scheduler raise.
    One use case for [make_async_unusable] is if you fork from a process already running
    the Async scheduler, and want to run non-Async OCaml code in the child process, with
    the guarantee that the child process does not use Async. @��� _���� b��@@@@��� _���� b��@@���@@ ���@@ �A@��� c���� c�@��� c���� c�@���Р/add_busy_poller��� w���� w��@��@��@����$unit��	 x���
 x��@@�� x��� x��@@@������0Continue_polling�� x��� x��@A@�� x��� x��@@����,Stop_polling��! x���" x��@@���!a��( x���) x��@@@@��+ x���, x��@@@@@��. x���/ x��@@@��1 x���2 x��@@@�����(Deferred!t��; y���< y��@���!a��B y���C y��@@@@��E y���F y��@@@��H x���I y��@@@@���&��9@@ ��:@@ �A�������
  c Async supports "busy polling", which runs a thread that busy loops running
    user-supplied polling functions.  The busy-loop thread is distinct from Async's
    scheduler thread.

    Busy polling is useful for a situation like a shared-memory ringbuffer being used for
    IPC.  One can poll the ringbuffer with a busy poller, and then when data is detected,
    fill some ivar that causes Async code to handle the data.

    [add_busy_poller poll] adds [poll] to the busy loop.  [poll] will be called
    continuously, once per iteration of the busy loop, until it returns [`Stop_polling a]
    at which point the result of [add_busy_poller] will become determined.  [poll] will
    hold the Async lock while running, so it is fine to do ordinary Async operations,
    e.g., fill an ivar.  The busy loop will run an ordinary Async cycle if any of the
    pollers add jobs.

    [poll] will run in the monitor in effect when [add_busy_poller] was called; exceptions
    raised by [poll] will be sent asynchronously to that monitor.  If [poll] raises, it
    will still be run on subsequent iterations of the busy loop. @��Y e�Z v?�@@@@��\ e�] v?�@@��J@@ ��K@@ �A���*deprecated��f z���g z��@�������	+[since 2018-11] use [set_on_start_of_cycle]@��q z���r z� @@@@��t z���u z� @@��w z���x z�!@@��z w���{ z�!@��} w���~ z�!@���Р8handle_thread_pool_stuck��� �]a�� �]y@��@���)stuck_for������'Time_ns$Span!t��� �]��� �]�@@��� �]��� �]�@@@����$unit��� �]��� �]�@@��� �]��� �]�@@@��� �]}�� �]�@@@����$unit��� �]��� �]�@@��� �]��� �]�@@@��� �]|�� �]�@@@@�������@@ ���@@ �A�������
  4 [handle_thread_pool_stuck f] causes [f] to run whenever Async detects its thread pool
    is stuck (i.e., hasn't completed a job for over a second and has work waiting to
    start).  Async checks every second.  By default, if the thread pool has been stuck for
    less than 60s, Async will [eprintf] a message.  If more than 60s, Async will send an
    exception to the main monitor, which will abort the program unless there is a custom
    handler for the main monitor.

    Calling [handle_thread_pool_stuck] replaces whatever behavior was previously there. @��� |##�� �\@@@@��� |##�� �\@@���@@ ���@@ �A@��� �]]�� �]�@��� �]]�� �]�@���Р	 default_handle_thread_pool_stuck��� ����� ���@��@�����+Thread_pool!t��� ����� ���@@��� ����� ���@@@���)stuck_for������'Time_ns$Span!t��� ����� ���@@��� ����  ���@@@����$unit�� ���� �� @@��
 ���� �� @@@�� ���� �� @@@�� ���� �� @@@@@�� ���� �� @�� ���� �� @���Р9time_spent_waiting_for_io�� ����  ���@��@����$unit��) ����* ���@@��, ����- ���@@@������'Time_ns$Span!t��8 ����9 ���@@��; ����< ���@@@��> ����? ���@@@@�����/@@ ��0@@ �A�������	� [time_spent_waiting_for_io ()] returns the amount of time that the Async scheduler has
    spent in calls to [epoll_wait] (or [select]) since the start of the program. @��O ��P �]�@@@@��R ��S �]�@@��@@@ ��A@@ �A@��X ����Y ���@��[ ����\ ���@���Р;set_min_inter_cycle_timeout��d �rv�e �r�@��@������'Time_ns$Span!t��r �r��s �r�@@��u �r��v �r�@@@����$unit��} �r��~ �r�@@��� �r��� �r�@@@��� �r��� �r�@@@@���a��t@@ ��u@@ �A�������
  � [set_min_inter_cycle_timeout] sets the minimum timeout that the scheduler will pass to
    the OS when it checks for I/O between cycles.  The minimum is zero by default.
    Setting it to a nonzero value is used to increase thread fairness between the
    scheduler and other threads.  A plausible setting is 10us.  This can also be set via
    the [ASYNC_CONFIG] environment variable. @��� ����� �Bq@@@@��� ����� �Bq@@���@@ ���@@ �A@��� �rr�� �r�@��� �rr�� �r�@@