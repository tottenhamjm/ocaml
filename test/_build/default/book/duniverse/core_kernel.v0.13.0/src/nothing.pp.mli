Caml1999N026����   4         	2book/duniverse/core_kernel.v0.13.0/src/nothing.mli����   2  �  A  Ҡ����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  I An uninhabited type. This is useful when interfaces require that a type be specified,
    but the implementer knows this type will not be used in their implementation of the
    interface.

    For instance, [Async.Rpc.Pipe_rpc.t] is parameterized by an error type, but a user
    may want to define a Pipe RPC that can't fail. @��	2book/duniverse/core_kernel.v0.13.0/src/nothing.mliA@@�FN@@@@��A@@�FN@@���@@ ���@@ �A��
A@@�FN@������&Import��HPV�HP\@@��HPP�HP\@@��HPP�HP\@���A�    �!t��$Y+0�%Y+1@@@�@A@���)ocaml.doc��@@ ��@@ �A�������
  � Having [[@@deriving enumerate]] may seem strange due to the fact that generated
    [val all : t list] is the empty list, so it seems like it could be of no use.

    This may be true if you always expect your type to be [Nothing.t], but [[@@deriving
    enumerate]] can be useful if you have a type which you expect to change over time.
    For example, you may have a program which has to interact with multiple servers which
    are possibly at different versions.  It may be useful in this program to have a
    variant type which enumerates the ways in which the servers may differ.  When all the
    servers are at the same version, you can change this type to [Nothing.t] and code
    which uses an enumeration of the type will continue to work correctly.

    This is a similar issue to the identifiability of [Nothing.t].  As discussed below,
    another case where [[@deriving enumerate]] could be useful is when this type is part
    of some larger type.
@��7J^^�8X(*@@@@��:J^^�;X(*@@��(@@ ��)@@ �A���(deriving��DY+9�EY+A@�����������$hash��SY+B�TY+F@��VY+B�WY+F@@@�����)enumerate��_Y+H�`Y+Q@��bY+H�cY+Q@@@@��eY+B�fY+Q@@@@��hY+B�iY+Q@@��kY+6�lY+R@@��nY++�oY+R@@��qY++�rY+R@�����������-ocaml.warning���Y++��Y+R@�������#-32@���Y++��Y+R@@@@���Y++��Y+R@@���Y++��Y+R@���Y++��Y+R@���Р+hash_fold_t���Y+0��Y+1@��@�������,Ppx_hash_lib#Std$Hash%state���Y+0��Y+1@@���Y+0��Y+1@@@��@��������Y+0��Y+1@@���Y+0��Y+1@@@����������Y+0��Y+1@@���Y+0��Y+1@@@���Y+0��Y+1@@@���Y+0��Y+1@@@@@���Y++��Y+R@���Y++��Y+R@���Р$hash���Y+0��Y+1@��@����İ��Y+0��Y+1@@���Y+0��Y+1@@@�������,Ppx_hash_lib#Std$Hash*hash_value���Y+0��Y+1@@���Y+0��Y+1@@@���Y+0��Y+1@@@@@��Y++�Y+R@��Y++�Y+R@���Р#all��Y++�Y+R@����$list��Y+0�Y+1@��������Y+0�Y+1@@�� Y+0�!Y+1@@@@��#Y+0�$Y+1@@@@@��&Y++�'Y+R@��)Y++�*Y+R@@��,Y++�-Y+R@@��/Y++�0Y+R@���)ocaml.doc��6Y++�7Y+R@�������'@inline@��AY++�BY+R@@@@��DY++�EY+R@@��GY++�HY+R@@��JY++�KY+R@���Р0unreachable_code��Sn���Tn��@��@����!t��]n���^n��@@��`n���an��@@@�@��dn���en��@@@��gn���hn��@@@@���B��X@@ ��Y@@ �A�������
  t Because there are no values of type [Nothing.t], a piece of code that has a value of
      type [Nothing.t] must be unreachable.  In such an unreachable piece of code, one can
      use [unreachable_code] to give the code whatever type one needs.  For example:

      {[
        let f (r : (int, Nothing.t) Result.t) : int =
          match r with
          | Ok i -> i
          | Error n -> Nothing.unreachable_code n
        ;;
      ]}

      Note that the compiler knows that [Nothing.t] is uninhabited, hence this will type
      without warning:

      {[
        let f (Ok i : (int, Nothing.t) Result.t) = i
      ]}
  @��x[TV�ym��@@@@��{[TV�|m��@@��i@@ ��j@@ �A@���n����n��@���n����n��@�����������,Identifiable!S���w	z	|��w	z	�@���w	z	|��w	z	�@@����!t���w	z	���w	z	�@    ����w	z	���w	z	�@@@@A�����!t���w	z	���w	z	�@@���w	z	���w	z	�@@@@���w	z	���w	z	�@@���w	z	|��w	z	�@@���v	r	r��w	z	�@�������@@ ���@@ �A�������
  } It may seem weird that this is identifiable, but we're just trying to anticipate all
    the contexts in which people may need this. It would be a crying shame if you had some
    variant type involving [Nothing.t] that you wished to make identifiable, but were
    prevented for lack of [Identifiable.S] here.

    Obviously, [of_string] and [t_of_sexp] will raise an exception. @���p����u	+	q@@@@���p����u	+	q@@���@@ ���@@ �A@���v	r	r��w	z	�@�����&Stable���y	�	���y	�	�@�������"V1���z	�	���z	�	�@�����@�    �!t���{	�	���{	�	�@@@@A�����!t���{	�	���{	�	�@@���{	�	�� {	�	�@@@���(deriving��{	�	��{	�	�@�����������$sexp��{	�	��{	�	�@��{	�	��{	�	�@@@�����&bin_io��!{	�	��"{	�	�@��${	�	��%{	�	�@@@�����'compare��-{	�	��.{	�	�@��0{	�	��1{	�	�@@@�����$hash��9{	�	��:{	�
 @��<{	�	��={	�
 @@@@��?{	�	��@{	�
 @@@@��B{	�	��C{	�
 @@��E{	�	��F{	�
@@��H{	�	��I{	�
@@��K{	�	��L{	�
@�����������ڰ�Y{	�	��Z{	�
@��������@��c{	�	��d{	�
@@@@��f{	�	��g{	�
@@��i{	�	��j{	�
@��l{	�	��m{	�
@������������1Ppx_sexp_conv_lib(Sexpable!S��~{	�	��{	�
@���{	�	���{	�
@@����!t���{	�	���{	�
@    �����{	�	���{	�	�@@@@A���������{	�	���{	�	�@@���{	�	���{	�
@@@@���{	�	���{	�
@@���{	�	���{	�
@@���{	�	���{	�
@@���{	�	���{	�
@������������(Bin_prot'Binable!S���{	�	���{	�
@���{	�	���{	�
@@����9���{	�	���{	�
@    �԰��{	�	���{	�	�@@@@A�����ܰ��{	�	���{	�	�@@���{	�	���{	�
@@@@���{	�	���{	�
@@���{	�	���{	�
@@���{	�	���{	�
@@���{	�	���{	�
@���Р'compare���{	�	���{	�	�@��@��������{	�	���{	�	�@@���{	�	���{	�	�@@@��@����	���{	�	���{	�	�@@���{	�	���{	�	�@@@����#int��{	�	��{	�	�@@��	{	�	��
{	�	�@@@��{	�	��{	�	�@@@��{	�	��{	�	�@@@@@��{	�	��{	�
@��{	�	��{	�
@���Р+hash_fold_t��{	�	��{	�	�@��@���������~��*{	�	��+{	�	�@@��-{	�	��.{	�	�@@@��@����D��6{	�	��7{	�	�@@��9{	�	��:{	�	�@@@�������������C{	�	��D{	�	�@@��F{	�	��G{	�	�@@@��I{	�	��J{	�	�@@@��L{	�	��M{	�	�@@@@@��O{	�	��P{	�
@��R{	�	��S{	�
@���Р}��Z{	�	��[{	�	�@��@����q��c{	�	��d{	�	�@@��f{	�	��g{	�	�@@@�������|{zy��p{	�	��q{	�	�@@��s{	�	��t{	�	�@@@��v{	�	��w{	�	�@@@@@��y{	�	��z{	�
@��|{	�	��}{	�
@@��{	�	���{	�
@@���{	�	���{	�
@���S���{	�	���{	�
@�������R@���{	�	���{	�
@@@@���{	�	���{	�
@@���{	�	���{	�
@@���{	�	���{	�
@@���z	�	���|

@@@���z	�	���|

@���z	�	���|

@@���y	�	���}

@@@���y	�	���}

@���y	�	���}

@@