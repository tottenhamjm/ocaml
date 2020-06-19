Caml1999N026����   4         	2book/duniverse/async_unix.v0.13.0/src/shutdown.mli����  !�    t  `�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������	% For shutting down an Async program. @��	2book/duniverse/async_unix.v0.13.0/src/shutdown.mliA@@�A@j@@@@��A@@�A@j@@���@@ ���@@ �A��
A@@�A@j@������$Core��Clr�Clv@@��Cll�Clv@@��Cll�Clv@������&Import��$Dw}�%Dw C@@��'Dww�(Dw C@@��*Dww�+Dw C@���Р(shutdown��3Q���4Q��@���%force�����(Deferred!t��AQ���BQ�@�����$unit��JQ���KQ��@@��MQ���NQ��@@@@��PQ���QQ�@@@��@����#int��ZQ�	�[Q�@@��]Q�	�^Q�@@@����$unit��eQ��fQ�@@��hQ��iQ�@@@��kQ�	�lQ�@@@��nQ���oQ�@@@@���)ocaml.doc��`@@ ��a@@ �A�������
  � [shutdown ?force status] initiates shutdown, which runs all the [at_shutdown]
    functions, waits for them to finish, and then exits with the supplied status.  The
    [at_shutdown] functions can block -- one can use [~force] to forcibly exit (with
    status 1) if the [at_shutdown] functions do not finish in a reasonable amount of time.

    By default, [force] is [after (sec 10.)].

    Repeated calls to [shutdown] with the same status will have no effect.  Any call to
    [shutdown] with nonzero status will cause that to be the status that is exited with.
    A call to [shutdown] with different nonzero status from the original call will
    raise. @���F E E��P��@@@@���F E E��P��@@��q@@ ��r@@ �A@���Q����Q�@���Q����Q�@���Р9shutdown_on_unhandled_exn���Y
��Y
'@��@����$unit���Y
*��Y
.@@���Y
*��Y
.@@@����$unit���Y
2��Y
6@@���Y
2��Y
6@@@���Y
*��Y
6@@@@���B���@@ ���@@ �A�������
  � [shutdown_on_unhandled_exn ()] arranges things so that whenever there is an
    asynchronous unhandled exception, an error message is printed to stderr and [shutdown
    1] is called.  This is useful when one wants to ensure that [at_shutdown] handlers run
    when there is an unhandled exception.  Calling [shutdown_on_unhandled_exn] ensures
    that [Scheduler.go] will not raise due to an unhandled exception, and instead that the
    program will exit once [at_shutdown] handlers finish. @���S��X�	@@@@���S��X�	@@���@@ ���@@ �A@���Y

��Y
6@���Y

��Y
6@���Р$exit���k����k��@���%force�����(Deferred!t���k����k��@�����$unit���k����k��@@���k����k��@@@@���k����k��@@@��@����#int���k����k��@@�� k���k��@@@�����(Deferred!t��
k��k�@��@��k� �k�@@@@��k� �k�@@@��k���k�@@@��k���k�@@@@������	@@ ��
@@ �A�������
  � [exit ?force status] is [shutdown ?force status; Deferred.never ()].

    We do not have an exit function that returns a non-deferred:

    {[
      val exit : ?force:unit Deferred.t -> int -> _ ]}

    Such a function should not exist, for the same reason that we do not have:

    {[
      val block : 'a Deferred.t -> 'a ]}

    The semantics of such an exit function would allow one to block a running Async job,
    and to switch to another one (to run the [at_shutdown] handlers), without expressing
    that switch in the type system via a [Deferred.t].  That would eliminate all the nice
    reasoning guarantees that Async gives about concurrent jobs. @��)[88�*j��@@@@��,[88�-j��@@��@@ ��@@ �A@��2k���3k�@��5k���6k�@���Р-default_force��>nfj�?nfw@��@����$unit��Hnfz�Inf~@@��Knfz�Lnf~@@@��@����$unit��Unf��Vnf�@@��Xnf��Ynf�@@@�����(Deferred!t��bnf��cnf�@�����$unit��knf��lnf�@@��nnf��onf�@@@@��qnf��rnf�@@@��tnf��unf�@@@��wnfz�xnf�@@@@���	��h@@ ��i@@ �A�������	R [default_force] returns the default [force] value used by [shutdown] and [exit]. @���m��me@@@@���m��me@@��y@@ ��z@@ �A@���nff��nf�@���nff��nf�@���Р1set_default_force���z
�
���z
�@��@��@����$unit���z
���z
�@@���z
���z
�@@@�����(Deferred!t���z
�!��z
�+@�����$unit���z
���z
� @@���z
���z
� @@@@���z
���z
�+@@@���z
���z
�+@@@����$unit���z
�0��z
�4@@���z
�0��z
�4@@@���z
���z
�4@@@@���h���@@ ���@@ �A�������
  Z [set_default_force f] sets the default [force] value used by [shutdown] and [exit] to
    [f]. Initially, the default value is [fun () -> after (sec 10.)]. A subsequent call to
    [shutdown] or [exit] that doesn't supply [~force] will call [f] and will force
    shutdown when its result becomes determined.

    [set_default_force] has no effect if [shutdown] or [exit] has already been called, or
    if the next call to [shutdown] or [exit] supplies [~force].

    [set_default_force] is useful for applications that call [shutdown] indirectly via
    a library, yet want to modify its behavior.  @���p����y
�
�@@@@���p����y
�
�@@���@@ ���@@ �A@���z
�
���z
�4@���z
�
���z
�4@���Р-shutting_down���~����~��@��@����$unit��~���~��@@��	~���
~��@@@������"No��~���~��@A@��~���~��@@����#Yes��~���~��@@�����#int��'~���(~��@@��*~���+~��@@@@��-~���.~��@@@@@��0~���1~��@@@��3~���4~��@@@@���Ű�$@@ ��%@@ �A�������	e [shutting_down ()] reports whether we are currently shutting down, and if so, with
    what status. @��D|66�E}��@@@@��G|66�H}��@@��5@@ ��6@@ �A@��M~���N~��@��P~���Q~��@���Р0is_shutting_down��Y @���Z @��@��@����$unit��c @���d @��@@��f @���g @��@@@����$bool��n @���o @��@@��q @���r @��@@@��t @���u @��@@@@@��w @���x @��@��z @���{ @��@���Р+at_shutdown��� L���� L��@��@��@����$unit��� L���� L��@@��� L���� L��@@@�����(Deferred!t��� L��� L�@�����$unit��� L��� L�@@��� L��� L�@@@@��� L��� L�@@@��� L���� L�@@@����$unit��� L��� L�@@��� L��� L�@@@��� L���� L�@@@@���N���@@ ���@@ �A�������
  � [at_shutdown f] causes [f ()] to be run when [shutdown] is called, and for [shutdown]
    to wait until the returned deferred finishes.  If [f] raises (synchronously or
    asynchronously), then the exception is printed to stderr and the program exits
    nonzero, irrespective of the status supplied to [shutdown].

    If [shutdown] has already been called, then calling [at_shutdown f] does nothing.

    The functions supplied to [at_shutdown] are run in parallel on shutdown.

    @��� B���� K��@@@@��� B���� K��@@���@@ ���@@ �A@��� L���� L�@��� L���� L�@���Р3don't_finish_before��� S���� S��@��@�����(Deferred!t��� S���� S��@�����$unit��� S���� S��@@��� S���� S��@@@@��� S���� S��@@@����$unit�� S��� S��@@�� S���	 S��@@@�� S��� S��@@@@�������@@ ���@@ �A�������
  � [don't_finish_before d] causes [shutdown] to wait until [d] becomes determined before
    finishing.  It is like [at_shutdown (fun _ -> d)], except it is more efficient, and
    will not take any space once [d] is determined.  There is a single [at_shutdown]
    shared among all deferreds supplied to [don't_finish_before].  [don't_finish_before]
    does not override the [force] argument passed to shutdown. @�� N� R{�@@@@�� N�  R{�@@��@@ ��@@ �A@��% S���& S��@��( S���) S��@@