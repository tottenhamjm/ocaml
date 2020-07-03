Caml1999N026����   2         	0book/duniverse/core_kernel.v0.13.0/src/error.mli����  p  �  �   �����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������	G This module extends {{!module:Base.Error}[Base.Error]} with [bin_io]. @��	0book/duniverse/core_kernel.v0.13.0/src/error.mliA@@�A@ L@@@@��A@@�A@ L@@���@@ ���@@ �A��
A@@�A@ L@������&Import��C N T�C N Z@@��C N N�C N Z@@��C N N�C N Z@�����������������$Base%Error��0G � ��1G � �@��3G � ��4G � �@@��6G � ��7G � �@@��9G � ��:G � �@@��<F k ��=H � �@@��?F k s�@H � �@@��BF k k�CH � �@���)ocaml.doc��4@@ ��5@@ �A�������) @inline @��TE \ \�UE \ j@@@@��WE \ \�XE \ j@@��E@@ ��F@@ �A@��]F k k�^H � �@�����������)Info_intf)Extension��mL � ��nL � �@��pL � ��qL � �@@����!t��xL ��yL �@    ���}L ��~L �@@@@A�����!t���L ���L �@@���L ���L �@@@@���L ���L �@@���L � ���L �@@���K � ���L �@���P���@@ ���@@ �A�������	5 This include is the source of the bin_io functions. @���J � ���J � �@@@@���J � ���J � �@@���@@ ���@@ �A���g���@@ ���@@ �A�������' @open @���M��M@@@@���M��M@@���@@ ���@@ �A@���K � ���L �@�����װ��@@ ���@@ �A�������	_ [Error.t] is {e not} wire-compatible with [Error.Stable.V1.t].  See info.mli for
    details. @���O��Pp@@@@���O��Pp@@���@@ ���@@ �A���O��Pp@���Р)failwiths���e@D��e@M@���&strict����$unit���fN[��fN_@@���fN[��fN_@@@���$here�����&Lexing(position��g`k�g`z@@��g`k�	g`z@@@��@����&string��h{��h{�@@��h{��h{�@@@��@��!a��i���i��@@@��@��@��!a��'j���(j��@@@������$Base$Sexp!t��3j���4j��@@��6j���7j��@@@��9j���:j��@@@�@��=k���>k��@@@��@j���Ak��@@@��Ci���Dk��@@@��Fh{��Gk��@@@��Ig`e�Jk��@@@��LfNS�Mk��@@@@���
��=@@ ��>@@ �A�������
  � {[
     failwiths ?strict ?here message a sexp_of_a
     = Error.raise (Error.create ?strict ?here s a sexp_of_a)
   ]}

   As with [Error.create], [sexp_of_a a] is lazily computed when the error is converted
   to a sexp. So if [a] is mutated in the time between the call to [failwiths] and the
   sexp conversion, those mutations will be reflected in the error message. Use
   [~strict:()] to force [sexp_of_a a] to be computed immediately.

   The [pa_fail] preprocessor replaces [failwiths] with [failwiths ?here:[%here]] so that
   one does not need to (and cannot) supply [[%here]]. [pa_fail] does not add
   [?here:[%here]] to [Error.failwiths].

   In this signature we write [?here:Lexing.position] rather than
   [?here:Source_code_position.t] to avoid a circular dependency.

   [failwithp here] is like [failwiths ~here], except that you can provide a source
   position yourself (which is only interesting if you don't provide [[%here]]). @��]R���^d�?@@@@��`R���ad�?@@��N@@ ��O@@ �A@��fe@@�gk��@��ie@@�jk��@���Р)failwithp��rm���sm��@���&strict����$unit��~n���n��@@���n����n��@@@��@�����&Lexing(position���o����o��@@���o����o��@@@��@����&string���p����p��@@���p����p��@@@��@��!a���q����q��@@@��@��@��!a���r����r�@@@������$Base$Sexp!t���r���r�@@���r���r�@@@���r����r�@@@�@���s��s@@@���r����s@@@���q����s@@@���p����s@@@���o����s@@@���n����s@@@@@���m����s@���m����s@@