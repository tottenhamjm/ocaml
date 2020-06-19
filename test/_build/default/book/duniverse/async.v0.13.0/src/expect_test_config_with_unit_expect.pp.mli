Caml1999N026����   J         	Hbook/duniverse/async.v0.13.0/src/expect_test_config_with_unit_expect.mli����  �    �  g�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  n An alternative to [Async.Expect_test_config] in which [%expect] has type [unit] rather
    than [unit Deferred.t].  This lets one write:

    {[
      [%expect {| |};
    ]}

    rather than:

    {[
      let%bind () = [%expect {| |}] in
    ]}

    It also means that [let%expect] cannot terminate with [%expect], and must instead
    terminate with [return ()]. @��	Hbook/duniverse/async.v0.13.0/src/expect_test_config_with_unit_expect.mliA@@�OQs@@@@��A@@�OQs@@���@@ ���@@ �A��
A@@�OQs@������,Async_kernel��Qu{�Qu�@@��Quu�Qu�@@��Quu�Qu�@�������������2Expect_test_config!S��,T���-T��@��/T���0T��@@�����(IO_flush!t��9T���:T��@    ���>T���?T��@����!a��FT���GT��@@@B@@@A���!a��MT���NT��@@@@��PT���QT��@@��ST���TT��@@�����&IO_run!t��]T���^T��@    ���bT���cT��@����!a��jT���kT��@@@B@@@A������(Deferred!t��uT���vT��@���!a��|T���}T��@@@@��T����T��@@@@���T����T��@@���T����T��@@���S����T��@@���S����T��@@