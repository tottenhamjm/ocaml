Caml1999N026����   9         	7book/duniverse/core_kernel.v0.13.0/src/only_in_test.mli����  �  �  �  1�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � This module can be used to safely expose functions and values in signatures
    that should only be used in unit tests.

    Under the hood, ['a t = 'a Lazy.t] and the only thing that ever forces them
    is the [force] function below which should only be called in unit tests.

    For example, suppose in some module, [type t] is actually an [int].  You
    want to keep the type definition opaque, but use the underlying
    representation in unit tests.  You could write in the ml:

    {[
      let test_to_int t = Only_in_test.return t
      let test_of_int n = Only_in_test.return n]}

    You would then expose in the mli:

    {[
      type t
      val test_to_int : t -> int Only_in_test.t
      val test_of_int : int -> t Only_in_test.t]}

    Finally, if you have specific values that you might want to use in unit
    tests, but that have top-level side-effects or take too long to compute, you
    can delay the side-effects or computation until the unit tests are run by
    writing, e.g.:

    [let (test_special_value : t Only_in_test.t) =
    Only_in_test.of_thunk (fun () ->  factorial 100)]

    instead of

    [let (test_special_value : t Only_in_test.t) =
    Only_in_test.return (factorial 100)]
@��	7book/duniverse/core_kernel.v0.13.0/src/only_in_test.mliA@@�b��@@@@��A@@�b��@@���@@ ���@@ �A��
A@@�b��@������&Import��d���d��@@��d���d��@@��d���d��@���A�    �!t��$f���%f��@����!a��,f���-f��@@@B@@@A@@��/f���0f��@@��2f���3f��@�����������%Monad!S��Bh���Ch��@��Eh���Fh��@@����!t��Mh��Nh�@    ���Rh��Sh�@����!a��Zh���[h�@@@B@@@A�����!t��ch�
�dh�@���!a��jh��kh�	@@@@��mh��nh�@@@@��ph���qh�@@��sh���th�@@��vh���wh�@@��yh���zh�@���Р(of_thunk���j��j@��@��@����$unit���j��j!@@���j��j!@@@��!a���j%��j'@@@���j��j'@@@����!t���j/��j0@���!a���j,��j.@@@@���j,��j0@@@���j��j0@@@@@���j��j0@���j��j0@���Р%force���k15��k1:@��@����!t���k1@��k1A@���!a���k1=��k1?@@@@���k1=��k1A@@@��!a���k1E��k1G@@@���k1=��k1G@@@@@���k11��k1G@���k11��k1G@@