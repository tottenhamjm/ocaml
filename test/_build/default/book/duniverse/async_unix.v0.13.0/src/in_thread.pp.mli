Caml1999N026����   5         	3book/duniverse/async_unix.v0.13.0/src/in_thread.mli����  0Z  �  �  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
   The [In_thread] module has functions for interaction between the Async world and other
    (kernel) threads.  The name is to remind us to think about threads and race
    conditions.

    All threads come from the one thread pool used for all Async-managed threads. @��	3book/duniverse/async_unix.v0.13.0/src/in_thread.mliA@@�E �@@@@��A@@�E �@@���@@ ���@@ �A��
A@@�E �@������$Core��G�G@@��G�G@@��G�G@������,Async_kernel��$H"�%H.@A��'H�(H.@@��*H�+H.@�����(Priority��3I/6�4I/>@���������)Linux_ext(Priority��AI/P�BI/b@��DI/P�EI/b@@��GI/A�HI/b@@����!t��OI/m�PI/n@    ���TI/m�UI/n@@@@A�������)Linux_ext(Priority!t��aI/q�bI/�@@��dI/q�eI/�@@@@��gI/h�hI/�@@��jI/A�kI/�@@@��mI//�nI/�@��pI//�qI/�@�����-Helper_thread��yK���zK��@�����A�    �!t���O����O��@@@@A@���)ocaml.doc��w@@ ��x@@ �A�������	� A Helper_thread is a thread that is dedicated to handling computations external to
      Async.  We need them because some libraries (e.g. Sqlite3) require that certain
      collections of computations run in the same thread. @���L����NQ�@@@@���L����NQ�@@���@@ ���@@ �A@���O����O��@@���O����O��@���Р&create���]qw��]q}@���(priority�����(Priority!t���]q���]q�@@���]q���]q�@@@���$name����&string���]q���]q�@@���]q���]q�@@@��@����$unit���]q���]q�@@���]q���]q�@@@�����(Deferred!t���]q���]q�@�����!t���]q���]q�@@���]q���]q�@@@@���]q���]q�@@@���]q���]q�@@@���]q���]q�@@@���]q���]q�@@@@���v���@@ ���@@ �A�������
  � [create ?name ()] creates a new helper thread.  The [name] will be used as the
      thread name for any work that that is done by the thread that doesn't get its own
      name.

      [create] uses a thread from Async's thread pool, reserving that thread for exclusive
      use by the helper thread until the helper thread is no longer used (specifically,
      finalized and is finished with all its work), at which point the thread is made
      available for general use by the pool.

      [create] returns a deferred that becomes determined when a helper thread is
      available.  On the other hand, [create_now] checks if a helper thread is available
      now, and if so returns it, or else returns [Error]. @��Q���\4p@@@@��Q���\4p@@���@@ ���@@ �A@��]qs�]q�@��]qs�]q�@���Р*create_now��!_���"_��@���(priority�����(Priority!t��/_���0_��@@��2_���3_��@@@���$name����&string��>_���?_��@@��A_���B_��@@@��@����$unit��K_���L_��@@��N_���O_��@@@�����(Or_error!t��X_��Y_�@�����!t��a_��b_�@@��d_��e_�@@@@��g_��h_�@@@��j_���k_�@@@��m_���n_�@@@��p_���q_�@@@@@��s_���t_�@��v_���w_�@@��yK���z`@@@��|K���}`@��K����`@���Р.pipe_of_squeue���e����e��@��@�����&Squeue!t���e���e�@���!a���e� ��e�@@@@���e� ��e�@@@������$Pipe&Reader!t���e���e�@���!a���e���e�@@@@���e���e�@@@���e� ��e�@@@@���2���@@ ���@@ �A�������	� [pipe_of_squeue squeue] returns a pipe [p] and consumes the contents [squeue], placing
    them in [p].  It repeatedly grabs everything from [squeue], places it in [p], and
    then waits for pushback on [p]. @���b��d��@@@@���b��d��@@���@@ ���@@ �A@���e����e�@���e����e�@�����-When_finished���i����i��@�����A�    �!t���j����j��@@@��Р4Notify_the_scheduler���k����k��@�@@���k����k��@���p���@@ ���@@ �A�������	� The helper thread notifies the Async scheduler that the result is ready, so that
        the scheduler will wake up in a timely manner and run a cycle. @��l���m&o@@@@��	l���
m&o@@���@@ ���@@ �A@�Р3Take_the_async_lock��npv�np�@�@@��npt�np�@������@@ ��	@@ �A�������	g The helper thread blocks until it can acquire the Async lock, at which point it
        runs a cycle. @��(o���)p��@@@@��+o���,p��@@��@@ ��@@ �A@�Р:Try_to_take_the_async_lock��5q�	�6q�	@�@@��9q���:q�	@������*@@ ��+@@ �A�������
  $ If the [thread_pool_cpu_affinity] is [Inherit], then the helper hread tries to
        take the Async lock and run a cycle.  If the [thread_pool_cpu_affinity] is
        [Cpuset] or the helper thread is unable to acquire the Async lock, then it
        behaves as in [Notify_the_scheduler]. @��Jr		 �Ku

I@@@@��Mr		 �Nu

I@@��;@@ ��<@@ �A@@A@���(deriving��Wv
J
O�Xv
J
W@�����������)enumerate��fv
J
X�gv
J
a@��iv
J
X�jv
J
a@@@�����'sexp_of��rv
J
c�sv
J
j@��uv
J
c�vv
J
j@@@@��xv
J
X�yv
J
j@@@@��{v
J
X�|v
J
j@@��~v
J
L�v
J
k@@���j����v
J
k@@���j����v
J
k@�����������-ocaml.warning���j����v
J
k@�������#-32@���j����v
J
k@@@@���j����v
J
k@@���j����v
J
k@���j����v
J
k@���Р#all���j����v
J
k@����$list���j����j��@�����ذ��j����j��@@���j����j��@@@@���j����j��@@@@@���j����v
J
k@���j����v
J
k@���Р)sexp_of_t���j����j��@��@��������j����j��@@���j����j��@@@������1Ppx_sexp_conv_lib$Sexp!t���j����j��@@���j����j��@@@���j����j��@@@@@���j����v
J
k@���j����v
J
k@@���j����v
J
k@@���j��� v
J
k@���)ocaml.doc��j���v
J
k@�������'@inline@��j���v
J
k@@@@��j���v
J
k@@��j���v
J
k@@��j���v
J
k@���Р'default��#���$��@����#ref��+���,��@�����!t��4���5��@@��7���8��@@@@��:���;��@@@@������+@@ ��,@@ �A�������
   [default] defines the default value used for [In_thread.run]'s [?when_finished]
      argument.  Changes to [default] affect subsequent calls to [In_thread.run].
      Initially, [default = Try_to_take_the_async_lock], which typically leads to better
      latency by avoiding an extra context switch to pass the result to the Async
      scheduler thread.  However, there are applications (e.g. jenga) where
      [Notify_the_scheduler] leads to significantly higher throughput by greatly
      decreasing the total number of Async cycles. @��Kx
m
o�L~]�@@@@��Nx
m
o�O~]�@@��<@@ ��=@@ �A@��T���U��@��W���X��@@��Zi���[ @��@@���հ�K@@ ��L@@ �A�������	e [When_finished] describes how [In_thread.run f] behaves when the helper thread
    finishes [f ()]. @��kg!!�lht�@@@@��ng!!�oht�@@��\@@ ��]@@ �A@��ti���u @��@��wi���x @��@���Р#run��� h���� h��@���(priority�����(Priority!t��� i���� i��@@��� i���� i��@@@���&thread�����-Helper_thread!t��� j��� j�@@��� j��� j�@@@���-when_finished�����-When_finished!t��� k*�� k9@@��� k*�� k9@@@���$name����&string��� l:E�� l:K@@��� l:E�� l:K@@@��@��@����$unit��� mLR�� mLV@@��� mLR�� mLV@@@��!a��� mLZ�� mL\@@@��� mLR�� mL\@@@�����(Deferred!t��� n^f�� n^p@���!a��� n^c�� n^e@@@@��� n^c�� n^p@@@��� mLQ�� n^p@@@��� l:?�� n^p@@@��� k�� n^p@@@��� j���� n^p@@@��� i���� n^p@@@@���x���@@ ���@@ �A�������
  # [run ?priority ?thread ?name f] runs [f ()] in a separate thread outside Async and
    returns the result as a Deferred in the Async world.  If [f ()] raises an exception
    (asynchronously, since it is another thread) then that exception will be raised to the
    monitor that called [run].

    WARNING: Async code MUST NOT be used from within [f].  By Async code we mean
    pretty-much all functions of libraries making use of Async.  Only a few functions of
    the Async library can be called inside [In_thread.run].  These are explicitly marked
    as such, using the phrase "thread-safe".

    If [thread] is not supplied, then any thread from the thread pool could be used.  If
    you need to run routines in a specific thread (as is required by some libraries like
    Sqlite), you should create a helper thread and supply it to [run].

    If [priority] is supplied, the priority of the thread in the linux scheduler will be
    set to [priority] for the duration of [f ()], provided the thread is allowed to do so
    (see [man setpriority]).

    If you call [run] several times with the same helper thread, the [f ()] calls will run
    in sequence, in the order in which they are supplied to [run].  Each [f ()] will
    complete (return or raise) before another [f ()] starts.

    For example, if you do:

    {[
      let () =
        run ~thread f1;
        run ~thread f2;
        run ~thread f3; ]}

    Then the thread will run [f1 ()] to completion, then [f2 ()] to completion, then
    [f3 ()] to completion.

    If [name] is supplied, the name of the thread will be set to it for the duration of
    the execution of [f ()].

    [when_finished] describes how the helper thread behaves once [f ()] has completed.
    Its default value is the value of {!When_finished.default} when [run] is called. @�� B��� g�@@@@�� B��� g�@@���@@ �� @@ �A@�� h��� n^p@�� h��� n^p@���Р'syscall��# t���$ t��@���$name����&string��/ t���0 t��@@��2 t���3 t��@@@��@��@����$unit��> t���? t��@@��A t���B t��@@@��!a��G t���H t��@@@��J t���K t��@@@�����(Deferred!t��T t���U t��@������&Result!t��_ t���` t��@���!a��f t���g t��@@@�����#exn��o t���p t��@@��r t���s t��@@@@��u t���v t��@@@@��x t���y t��@@@��{ t���| t��@@@��~ t��� t��@@@@������o@@ ��p@@ �A�������
  ( [syscall f] runs f, which should be a single system call, and returns the result,
    handling the restarting of interrupted system calls.  To avoid race conditions, the
    [f] supplied to [syscall] should just make a system call.  That way, everything else
    is done holding the Async lock. @��� prr�� sy�@@@@��� prr�� sy�@@���@@ ���@@ �A@��� t���� t��@��� t���� t��@���Р+syscall_exn��� v���� v��@���$name����&string��� v��� v�	@@��� v��� v�	@@@��@��@����$unit��� v��� v�@@��� v��� v�@@@��!a��� v��� v�@@@��� v��� v�@@@�����(Deferred!t��� v� �� v�*@���!a��� v��� v�@@@@��� v��� v�*@@@��� v��� v�*@@@��� v���� v�*@@@@@��� v���� v�*@��� v���� v�*@@