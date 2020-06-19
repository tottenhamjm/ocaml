Caml1999N026����   =         		;book/duniverse/async_kernel.v0.13.0/src/deferred_result.mli����    �  �  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ�����+Core_kernel��	;book/duniverse/async_kernel.v0.13.0/src/deferred_result.mliA@F�A@Q@@��A@@�A@Q@@��A@@�A@Q@�����������%Monad"S2��CS[�CSc@��CS[�CSc@@����!t��"CSw�#CSx@    ���'CSw�(CSx@����!a��/CSo�0CSq@@@B����!b��7CSs�8CSu@@@B@@@A������)Deferred1!t��BCS M�CCS X@������&Result!t��MCS D�NCS L@���!a��TCS|�UCS~@@@���!b��[CS @�\CS B@@@@��^CS{�_CS L@@@@��aCS{�bCS X@@@@��dCSi�eCS X@@��gCS[�hCS X@@��jCSS�kCS X@���)ocaml.doc��R@@ ��S@@ �A�������' @open @��|CS Y�}CS e@@@@��CS Y��CS e@@��c@@ ��d@@ �A@���CSS��CS X@���Р&ignore���E g k��E g q@��@����!t���E g ~��E g @��@���E g u��E g v@@@���#err���E g x��E g |@@@@���E g t��E g @@@����!t���E g ���E g �@�����$unit���E g ���E g �@@���E g ���E g �@@@���#err���E g ���E g �@@@@���E g ���E g �@@@���E g t��E g �@@@@���*deprecated���F � ���F � �@�������	&[since 2019-06] Use [ignore_m] instead@���F � ���F � �@@@@���F � ���F � �@@���F � ���F � �@@���E g g��F � �@���E g g��F � �@���Р$fail���H � ���H � �@��@��#err���H � ���H � �@@@����!t���H � �� H � �@��@��H � ��H � �@@@���#err��H � ��H � �@@@@��H � ��H � �@@@��H � ��H � �@@@@@��H � ��H � �@��H � ��H � �@���Р%failf�� K26�!K2;@��@����'format4��*K2`�+K2g@���!a��1K2?�2K2A@@@�����$unit��:K2C�;K2G@@��=K2C�>K2G@@@�����&string��FK2I�GK2O@@��IK2I�JK2O@@@�����!t��RK2]�SK2^@��@��WK2R�XK2S@@@�����&string��`K2U�aK2[@@��cK2U�dK2[@@@@��fK2Q�gK2^@@@@��iK2>�jK2g@@@��!a��oK2k�pK2m@@@��rK2>�sK2m@@@@�����Y@@ ��Z@@ �A�������	A e.g., [failf "Couldn't find bloogle %s" (Bloogle.to_string b)]. @���J � ���J �1@@@@���J � ���J �1@@��j@@ ��k@@ �A@���K22��K2m@���K22��K2m@���Р)map_error���Mos��Mo|@��@����!t���Mo���Mo�@���"ok���Mo���Mo�@@@���&error1���Mo���Mo�@@@@���Mo��Mo�@@@���!f��@��&error1���Mo���Mo�@@@��&error2���Mo���Mo�@@@���Mo���Mo�@@@����!t���Mo���Mo�@���"ok���Mo���Mo�@@@���&error2���Mo���Mo�@@@@���Mo���Mo�@@@���Mo���Mo�@@@���Mo��Mo�@@@@@���Moo��Mo�@���Moo��Mo�@���Р'combine���P��P#@��@����!t�� Q$6�Q$7@���#ok1��Q$*�Q$.@@@���#err��Q$0�Q$4@@@@��Q$)�Q$7@@@��@����!t��R8J�R8K@���#ok2��"R8>�#R8B@@@���#err��)R8D�*R8H@@@@��,R8=�-R8K@@@���"ok��@��#ok1��8SLU�9SLY@@@��@��#ok2��@SL]�ASLa@@@��#ok3��FSLe�GSLi@@@��ISL]�JSLi@@@��LSLU�MSLi@@@���#err��@��#err��XTku�YTky@@@��@��#err��`Tk}�aTk�@@@��#err��fTk��gTk�@@@��iTk}�jTk�@@@��lTku�mTk�@@@����!t��tU���uU��@���#ok3��{U���|U��@@@���#err���U����U��@@@@���U����U��@@@���Tkp��U��@@@���SLQ��U��@@@���R8=��U��@@@���Q$)��U��@@@@���'��x@@ ��y@@ �A�������	S [combine] waits on both inputs and combines their results using [Result.combine]. @���O����O�@@@@���O����O�@@���@@ ���@@ �A@���P��U��@���P��U��@@