Caml1999N026����   7         	5book/duniverse/async_unix.v0.13.0/src/thread_safe.mli����  $�  �  >  f�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � The [Thread_safe] module has functions that are safe to call from threads outside
    Async, such as the ones spawned by [In_thread.run].

    This is in contrast with the rest of [Async] library which is generally not
    thread-safe.

    All the [Thread_safe.block*] and [Thread_safe.run*] functions wake up the Async
    scheduler to ensure that it continues in a timely manner with whatever jobs got
    started.  Some functions take an optional [?wakeup_scheduler:bool] argument, which
    defaults to [true].  One can cause the scheduler to not be woken up by supplying
    [~wakeup_scheduler:false], which can reduce CPU use, but increase latency, because the
    scheduler may not wake up for a while to process jobs. @��	5book/duniverse/async_unix.v0.13.0/src/thread_safe.mliA@@�L��@@@@��A@@�L��@@���@@ ���@@ �A��
A@@�L��@������$Core��N���N��@@��N���N��@@��N���N��@������,Async_kernel��$O���%O��@A��'O���(O��@@��*O���+O��@���Р5am_holding_async_lock��3Sko�4Sk�@��@����$unit��=Sk��>Sk�@@��@Sk��ASk�@@@����$bool��HSk��ISk�@@��KSk��LSk�@@@��NSk��OSk�@@@@���)ocaml.doc��@@@ ��A@@ �A�������	h [am_holding_async_lock ()] returns true if the currently running thread is holding the
    Async lock. @��`Q���aRXj@@@@��cQ���dRXj@@��Q@@ ��R@@ �A@��iSkk�jSk�@��lSkk�mSk�@���Р(deferred��u[���v[��@��@����$unit��[����[��@@���[����[��@@@��������(Deferred!t���[����[��@���!a���[����[��@@@@���[����[��@@@���@��!a���[����[��@@@����$unit���[����[��@@���[����[��@@@���[����[��@@@@���[����[��@@@���[����[��@@@@���h���@@ ���@@ �A�������	� [deferred ()] returns [(d, fill)] where [d] is a deferred that will become determined
    with value [v] once [fill v] is called.

    It is ok to call [deferred] from inside or outside Async.  [fill] must be called from
    outside Async.
@���U����Z��@@@@���U����Z��@@���@@ ���@@ �A@���[����[��@���[����[��@���Р	 run_in_async_with_optional_cycle���`ko��`k�@���0wakeup_scheduler����$bool���a����a��@@���a����a��@@�������@@ ���@@ �A�������3 default is [true] @���a����a��@@@@���a��� a��@@���@@ ���@@ �A@��@��@����$unit��b���b��@@��b���b��@@@���������+Run_a_cycle��b���b��@A@��!b���"b��@@����2Do_not_run_a_cycle��)b���*b��@A@��,b���-b��@@@@@��/b���0b��@@@���!a��6b���7b��@@@@��9b���:b��@@@��<b���=b��@@@�����&Result!t��Fc �Gc @���!a��Mc �Nc @@@�����#exn��Vc 
�Wc @@��Yc 
�Zc @@@@��\c �]c @@@��_b���`c @@@��ba���cc @@@@�����S@@ ��T@@ �A�������	� [run_in_async_with_optional_cycle f] acquires the Async lock and runs [f ()] while
    holding the lock.  Depending on the result of [f], it may also run a cycle.
@��s]���t_hj@@@@��v]���w_hj@@��d@@ ��e@@ �A@��|`kk�}c @��`kk��c @���Р,run_in_async���n����n��@���0wakeup_scheduler����$bool���o����o��@@���o����o��@@���I���@@ ���@@ �A�������3 default is [true] @���o����o�@@@@���o����o�@@���@@ ���@@ �A@��@��@����$unit���p	��p@@���p	��p@@@��!a���p��p@@@���p	��p@@@�����&Result!t���q$��q,@���!a���q��q@@@�����#exn���q��q"@@���q��q"@@@@���q��q,@@@���p��q,@@@���o����q,@@@@�������@@ ���@@ �A�������
  � [run_in_async f] acquires the Async lock and runs [f ()] while holding the lock. It
    returns the result of [f ()] to the outside world.  The scheduler is woken up to
    ensure the code that depends on [f ()] is run soon enough.

    [run_in_async] doesn't run a cycle.

    [run_in_async] does not automatically start the Async scheduler.  You still need to
    call [Scheduler.go] elsewhere in your program.
@���e��m��@@@@�� e�m��@@���@@ ���@@ �A@��n���q,@��	n���
q,@���Р0run_in_async_exn��s.2�s.B@���0wakeup_scheduler����$bool��tCZ�tC^@@��!tCZ�"tC^@@���Ӱ�@@ ��@@ �A�������3 default is [true] @��2tC_�3tCw@@@@��5tC_�6tCw@@��#@@ ��$@@ �A@��@��@����$unit��Dux~�Eux�@@��Gux~�Hux�@@@��!a��Mux��Nux�@@@��Pux~�Qux�@@@��!a��Vv���Wv��@@@��Yux}�Zv��@@@��\tCH�]v��@@@@@��_s..�`v��@��bs..�cv��@���Р.block_on_async��k B
l
p�l B
l
~@��@��@����$unit��w B
l
��x B
l
�@@��z B
l
��{ B
l
�@@@�����(Deferred!t��� B
l
��� B
l
�@���!a��� B
l
��� B
l
�@@@@��� B
l
��� B
l
�@@@��� B
l
��� B
l
�@@@�����&Result!t��� B
l
��� B
l
�@���!a��� B
l
��� B
l
�@@@�����#exn��� B
l
��� B
l
�@@��� B
l
��� B
l
�@@@@��� B
l
��� B
l
�@@@��� B
l
��� B
l
�@@@@���f���@@ ���@@ �A�������
  � [block_on_async f] runs [f ()] in the Async world and blocks until the result becomes
    determined.  This function can be called from the main thread (before Async is
    started) or from a thread outside Async.

    [block_on_async] will run a cycle if the deferred isn't determined, in the hope that
    running the cycle will cause the deferred to become determined.

    [block_on_async] will automatically start the scheduler if it isn't already
    running.
@���x���� A
i
k@@@@���x���� A
i
k@@���@@ ���@@ �A@��� B
l
l�� B
l
�@��� B
l
l�� B
l
�@���Р2block_on_async_exn��� D
�
��� D
�
�@��@��@����$unit��� D
�
��� D
�
�@@��� D
�
��� D
�
�@@@�����(Deferred!t��� D
�
��� D
�
�@���!a��� D
�
��� D
�
�@@@@��� D
�
��� D
�
�@@@��  D
�
�� D
�
�@@@��!a�� D
�
�� D
�
�@@@��	 D
�
��
 D
�
�@@@@@�� D
�
�� D
�
�@�� D
�
�� D
�
�@���Р1run_in_async_wait�� J��� J��@��@��@����$unit��$ J���% J��@@��' J���( J��@@@�����(Deferred!t��1 J���2 J��@���!a��8 J���9 J��@@@@��; J���< J��@@@��> J���? J��@@@�����&Result!t��H J�
�I J�@���!a��O J��P J�@@@�����#exn��X J��Y J�@@��[ J��\ J�@@@@��^ J� �_ J�@@@��a J���b J�@@@@�����R@@ ��S@@ �A�������	� [run_in_async_wait f] is like [block_on_async f], except that it must be called from a
    thread outside Async.  Upon returning from [run_in_async_wait], it is guaranteed that
    the caller does not have the Async lock.
@��r F
�
��s I��@@@@��u F
�
��v I��@@��c@@ ��d@@ �A@��{ J���| J�@��~ J��� J�@���Р5run_in_async_wait_exn��� L�� L-@��@��@����$unit��� L1�� L5@@��� L1�� L5@@@�����(Deferred!t��� L<�� LF@���!a��� L9�� L;@@@@��� L9�� LF@@@��� L1�� LF@@@��!a��� LK�� LM@@@��� L0�� LM@@@@@��� L�� LM@��� L�� LM@���Р/reset_scheduler��� V���� V��@��@����$unit��� V���� V��@@��� V���� V��@@@����$unit��� V���� V��@@��� V���� V��@@@��� V���� V��@@@@�������@@ ���@@ �A�������
  2 [reset_scheduler] stops the scheduler thread and any associated threads, and resets
    Async's global state to its initial state.  This is useful if you need to first use
    Async to compute a value and then to daemonize (in which case you should [daemonize]
    with [~allow_threads_to_have_been_created:true]).

    [reset_scheduler] can be called from the main thread (before Async is started) or from
    a thread outside Async.  [reset_scheduler] is known to be imperfect, and to have races
    in which there are still threads running after it returns. @��� NOO�� UE�@@@@��� NOO�� UE�@@���@@ ���@@ �A@��� V���� V��@��� V���� V��@@