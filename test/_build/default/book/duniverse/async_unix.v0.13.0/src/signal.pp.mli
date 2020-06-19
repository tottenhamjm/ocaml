Caml1999N026����   2         	0book/duniverse/async_unix.v0.13.0/src/signal.mli����  �  �  �  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������2 Signal handling. @��	0book/duniverse/async_unix.v0.13.0/src/signal.mliA@@�A@W@@@@��A@@�A@W@@���@@ ���@@ �A��
A@@�A@W@������&Import��CY_�CYe@@��CYY�CYe@@��CYY�CYe@���������������$Core&Signal��.H � ��/H � �@��1H � ��2H � �@@��4H � ��5H � �@@����!t��<I � ��=I � �@    ���AI � ��BI � �@@@@A�������$Core&Signal!t��NI � ��OI � �@@��QI � ��RI � �@@@@��TI � ��UI � �@@��WH � ��XI � �@@����&Expert��_J � ��`J � �@����$Core&Signal&Expert��iJ ��jJ �@@��lH � ��mJ �@@��oG � ��pJ �@���)ocaml.doc��a@@ ��b@@ �A�������	z To discourage use of the [Signal.Expert] module, we hide it here.  People can use
    [Core.Signal.Expert] if they need. @���Egg��F } �@@@@���Egg��F } �@@��r@@ ��s@@ �A@���G � ���J �@���Р.handle_default���Ntx��Nt�@��@������5Do_not_use_with_async���Nt���Nt�@A@���Nt���Nt�@@@@@���Nt���Nt�@@@�@���Nt���Nt�@@@���Nt���Nt�@@@@���=���@@ ���@@ �A�������	X We override values from [Core.Signal] that we don't want people to use with
    Async. @���L��Mfs@@@@���L��Mfs@@���@@ ���@@ �A@���Ntt��Nt�@���Ntt��Nt�@���Р&ignore���P����P��@��@������5Do_not_use_with_async���P����P��@A@���P����P��@@@@@���P����P��@@@�@���P����P��@@@���P����P��@@@@@���P����P��@���P����P��@���Р&handle���\��\!@���$stop�����(Deferred!t��\/�	\9@�����$unit��\*�\.@@��\*�\.@@@@��\*�\9@@@��@����$list��!\?�"\C@�����!t��*\=�+\>@@��-\=�.\>@@@@��0\=�1\C@@@���!f��@����!t��>\J�?\K@@��A\J�B\K@@@����$unit��I\O�J\S@@��L\O�M\S@@@��O\J�P\S@@@����$unit��W\X�X\\@@��Z\X�[\\@@@��]\G�^\\@@@��`\=�a\\@@@��c\$�d\\@@@@������T@@ ��U@@ �A�������
  9 [handle ?stop signals ~f] arranges so that whenever a signal in [signals] is
    delivered, [f] is called on that signal.  If [f] raises, then an exception will be
    raised to the monitor in effect when [handle] was called.

    Multiple calls to [handle] with the same signal will cause all the handlers to run
    when that signal is delivered, not just the last handler from the last call to
    [handle].

    The first time [handle] is called for a signal, it will install a C signal handler for
    it, replacing the existing C signal handler for that signal. @��tR���u[�@@@@��wR���x[�@@��e@@ ��f@@ �A@��}\�~\\@���\��\\@���Р+terminating���h����h��@����$list���h����h��@�����!t���h����h��@@���h����h��@@@@���h����h��@@@@���1���@@ ���@@ �A�������
  7 [terminating] is a list of signals that can be supplied to [handle] and whose default
    behavior is to terminate the program: [alrm hup int term usr1 usr2].

    Various signals whose [default_sys_behavior] is [`Terminate] are not included:

    {v
       | kill   | it's not allowed to be handled                            |
       | pipe   | Async already ignores this signal, since it handles EPIPE |
       | prof   | so that we can profile things with -p                     |
       | vtalrm | it already has a handler                                  | v} @���^^^��gG�@@@@���^^^��gG�@@���@@ ���@@ �A@���h����h��@���h����h��@���Р3is_managed_by_async���lIM��lI`@��@����!t���lIc��lId@@���lIc��lId@@@����$bool���lIh��lIl@@���lIh��lIl@@@���lIc��lIl@@@@���r���@@ ���@@ �A�������	� [is_managed_by_async signal] returns true iff [signal] is being managed by Async, and
    hence its default behavior is no longer in effect. @���j����kH@@@@���j����kH@@���@@ ���@@ �A@���lII��lIl@���lII��lIl@@