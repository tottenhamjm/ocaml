Caml1999N026����   B         
	@book/duniverse/async.v0.13.0/async_command/src/async_command.mli����  �  �  �  y�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������	U [Async.Command] is {{!Core.Command}[Core.Command]} with additional Async functions. @��	@book/duniverse/async.v0.13.0/async_command/src/async_command.mliA@@�A@ Z@@@@��A@@�A@ Z@@���@@ ���@@ �A��
A@@�A@ Z@������$Core��C \ b�C \ f@@��C \ \�C \ f@@��C \ \�C \ f@������&Import��$D g m�%D g s@@��'D g g�(D g s@@��*D g g�+D g s@�����������������$Core'Command��@H � ��AH � �@��CH � ��DH � �@@��FH � ��GH � �@@��IH � ��JH � �@@��LG � ��MI � �@@��OG � ��PI � �@@��RG � ��SI � �@���)ocaml.doc��D@@ ��E@@ �A�������' @open @��dF u u�eF u �@@@@��gF u u�hF u �@@��U@@ ��V@@ �A@��mG � ��nI � �@���A�    �,with_options��wK � ��xK � �@����!a��K � ���K � �@@@B@@@A����+extract_exn����$bool���K � ���K � �@@���K � ���K � �@@@��!a���K � ���K � �@@@���K � ���K � �@@@@���K � ���K � �@@���K � ���K � �@���Р%async���U��U@����,with_options���U6��UB@�����-basic_command���U(��U5@������(Deferred!t���U��U'@�����$unit���U��U@@���U��U@@@@���U��U'@@@@���U��U5@@@@���U��UB@@@@�������@@ ���@@ �A�������
   [async] is like [Core.Command.basic], except that the main function it expects returns
    [unit Deferred.t], instead of [unit].  [async] will also start the Async scheduler
    before main is run, and will stop the scheduler when main returns.

    [async] also handles top-level exceptions by wrapping the user-supplied function in a
    [Monitor.try_with]. If an exception is raised, it will print it to stderr and call
    [shutdown 1]. The [extract_exn] argument is passed along to [Monitor.try_with]; by
    default it is [false]. @���M � ���T�@@@@���M � ���T�@@���@@ ���@@ �A@���U��UB@���U��UB@���Р*async_spec���WDH��WDR@����,with_options��WD~�WD�@�����2basic_spec_command��WDk�WD}@���!a��WDV�WDX@@@������(Deferred!t��!WD_�"WDi@�����$unit��*WDZ�+WD^@@��-WDZ�.WD^@@@@��0WDZ�1WDi@@@@��3WDU�4WD}@@@@��6WDU�7WD�@@@@@��9WDD�:WD�@��<WDD�=WD�@���Р.async_or_error��E\JN�F\J\@����,with_options��M\J��N\J�@�����-basic_command��V\Jx�W\J�@�������(Deferred(Or_error!t��c\Jd�d\Jw@�����$unit��l\J_�m\Jc@@��o\J_�p\Jc@@@@��r\J_�s\Jw@@@@��u\J_�v\J�@@@@��x\J_�y\J�@@@@���&��i@@ ��j@@ �A�������	� [async_or_error] is like [async], except that the main function it expects may
    return an error, in which case it prints out the error message and shuts down with
    exit code 1. @���Y����[6I@@@@���Y����[6I@@��z@@ ��{@@ �A@���\JJ��\J�@���\JJ��\J�@���Р3async_spec_or_error���^����^��@����,with_options���^����^��@�����2basic_spec_command���^����^��@���!a���^����^��@@@�������(Deferred(Or_error!t���^����^��@�����$unit���^����^��@@���^����^��@@@@���^����^��@@@@���^����^��@@@@���^����^��@@@@@���^����^��@���^����^��@��������@@ ���@@ �A�������
  K Staged functions allow the main function to be separated into two stages.  The first
    part is guaranteed to run before the Async scheduler is started, and the second part
    will run after the scheduler is started.  This is useful if the main function runs
    code that relies on the fact that threads have not been created yet
    (e.g., [Daemon.daemonize]).

    As an example:
    {[
      let main () =
        assert (not (Scheduler.is_running ()));
        stage (fun `Scheduler_started ->
          assert (Scheduler.is_running ());
          Deferred.unit
        )
    ]}
@���`����o<>@@@@���`����o<>@@���@@ ���@@ �A���`����o<>@���A�    �&staged��q@H�q@N@����!r��q@E�q@G@@@B@@@A������&Staged!t��q@p�q@x@���@������1Scheduler_started��$q@T�%q@f@A@��'q@T�(q@f@@@@@��*q@R�+q@h@@@��!r��0q@l�1q@n@@@��3q@R�4q@n@@@@��6q@Q�7q@x@@@@��9q@@�:q@x@@��<q@@�=q@x@�����&Staged��Esz��Fsz�@�����Р%async��Pt���Qt��@����,with_options��Xt���Yt��@�����-basic_command��at���bt��@�����&staged��jt���kt��@������(Deferred!t��ut���vt��@�����$unit��~t���t��@@���t����t��@@@@���t����t��@@@@���t����t��@@@@���t����t��@@@@���t����t��@@@@@���t����t��@���t����t��@���Р*async_spec���u����u��@����,with_options���u���u�@�����2basic_spec_command���u����u�@���!a���u����u��@@@�����&staged���u����u��@������(Deferred!t���u����u��@�����$unit���u����u��@@���u����u��@@@@���u����u��@@@@���u����u��@@@@���u����u�@@@@���u����u�@@@@@���u����u�@���u����u�@���Р.async_or_error���v$��v2@����,with_options���vc��vo@�����-basic_command�� vU�vb@�����&staged��	vN�
vT@�������(Deferred(Or_error!t��v:�vM@�����$unit��v5� v9@@��"v5�#v9@@@@��%v5�&vM@@@@��(v5�)vT@@@@��+v5�,vb@@@@��.v5�/vo@@@@@��1v �2vo@��4v �5vo@���Р3async_spec_or_error��=xqw�>xq�@����,with_options��Ey���Fy��@�����2basic_spec_command��Ny���Oy��@���!a��Uy���Vy��@@@�����&staged��^y���_y��@�������(Deferred(Or_error!t��ky���ly��@�����$unit��ty���uy��@@��wy���xy��@@@@��zy���{y��@@@@��}y���~y��@@@@���y����y��@@@@���y����y��@@@@@���xqs��y��@���xqs��y��@@���sz���z��@@@���szz��z��@���szz��z��@���������@@ ���@@ �A�������
  u To create an [Arg_type.t] that uses auto-completion and uses Async to compute the
    possible completions, one should use

    {[
      Arg_type.create ~complete of_string
    ]}

    where [complete] wraps its Async operations in [Thread_safe.block_on_async].  With
    this, the [complete] function is only called when the executable is auto-completing,
    not for ordinary execution.  This improves performance, and also means that the Async
    scheduler isn't started for ordinary execution of the command, which makes it possible
    for the command to daemonize (which requires the scheduler to not have been started).
@���|���� HTV@@@@���|���� HTV@@���@@ ���@@ �A���|���� HTV@@