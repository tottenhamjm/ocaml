Caml1999M026����   V         	Tbook/duniverse/core_kernel.v0.13.0/base_for_tests/src/test_binary_searchable_intf.ml����  !�  0  �  �����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@�����@������"()��	Tbook/duniverse/core_kernel.v0.13.0/base_for_tests/src/test_binary_searchable_intf.mlA@@�A@@@@��A@@�A@@@@@��������3Ppx_inline_test_lib'Runtime5set_lib_and_partition��A@@�A@@@��A@@�A@@@@@��@���.base_for_tests@��A@@�A@@@@@��@��� @��'A@@�(A@@@@@@��*A@@�+A@@@@@@��-A@@�.A@@@@��0A@@�1A@@@�����*ocaml.text���@@ ���@@ �A�������	5 Produce unit tests for binary searchable containers @��DA@@�EA@z@@@@��GA@@�HA@z@@���@@ ���@@ �A��MA@@�NA@z@��������$Base��YC| B�ZC| F@��\C| B�]C| F@@@��_C||�`C| F@@��bC||�cC| F@��������1Binary_searchable��nD G M�oD G ^@��qD G M�rD G ^@@@��tD G G�uD G ^@@��wD G G�xD G ^@�����(For_test���F ` l��F ` t@��������S��@@ �� @@ �A�������	� To implement the tests, we need two different [elt] values [small < big], to be able
      to compare those values, and to be able to construct a [t] containing those
      values. @���G { }��I(8@@@@���G { }��I(8@@��0@@ ��1@@ �A���G { }��I(8@���A�    �!t���K:A��K:B@@@@A@@���K:<��K:B@@���K:<��K:B@���A�    �#elt���LCJ��LCM@@@@A@@���LCE��LCM@@���LCE��LCM@���Р'compare���MNT��MN[@��@����#elt���MN_��MNb@@���MN_��MNb@@@��@����#elt���MNf��MNi@@���MNf��MNi@@@����#int���MNm��MNp@@���MNm��MNp@@@���MNf��MNp@@@���MN_��MNp@@@@@���MNP��MNp@���MNP��MNp@���Р%small��Nqw�Nq|@����#elt��
Nq��Nq�@@��Nq��Nq�@@@@@��Nqs�Nq�@��Nqs�Nq�@���Р#big��O���O��@����#elt��$O���%O��@@��'O���(O��@@@@@��*O���+O��@��-O���.O��@���Р(of_array��6P���7P��@��@����%array��@P���AP��@�����#elt��IP���JP��@@��LP���MP��@@@@��OP���PP��@@@����!t��WP���XP��@@��ZP���[P��@@@��]P���^P��@@@@@��`P���aP��@��cP���dP��@@��fF ` w�gQ��@@@��iF ` `�jQ��@��lF ` `�mQ��@�����)For_test1��uS���vS��@������A�    �!t���T����T��@����!a���T����T��@@@B@@@A@@���T����T��@@���T����T��@���Р(of_array���U����U��@��@����%array���U����U�@�����$bool���U����U��@@���U����U��@@@@���U����U�@@@����!t���U���U�@�����$bool���U���U�@@���U���U�@@@@���U���U�@@@���U����U�@@@@@���U����U�@���U����U�@@���S����V@@@���S����V@���S����V@�����6Indexable_and_for_test���X��X5@�����������)Indexable���Y<F��Y<O@���Y<F��Y<O@@���Y<>��Y<O@@���Y<>��Y<O@�����(For_test��ZPY�ZPa@��������(For_test��ZPd�ZPl@��ZPd�ZPl@@����#elt��ZPw�ZPz@    ���!ZPw�"ZPz@@@@A�����#elt��*ZP~�+ZP�@@��-ZP~�.ZP�@@@@��0ZPr�1ZP�@@��3ZPd�4ZP�@@����!t��;ZP��<ZP�@    ���@ZP��AZP�@@@@A�����!t��IZP��JZP�@@��LZP��MZP�@@@@��OZP��PZP�@@��RZPd�SZP�@@@��UZPR�VZP�@��XZPR�YZP�@@��[X8�\[��@@@��^X�_[��@��aX�b[��@�����7Indexable1_and_for_test��j]���k]��@�����������*Indexable1��y^���z^��@��|^���}^��@@��^����^��@@���^����^��@�����(For_test���_����_��@������)For_test1���_����_��@���_����_��@@����!t���_���_�@    ����_���_�@����!a���_����_�@@@B@@@A�����!t���_�
��_�@���!a���_���_�	@@@@���_���_�@@@@���_����_�@@���_����_�@@@���_����_�@���_����_�@@���]����`@@@���]����`@���]����`@�����>Binary_searchable_and_for_test���b��b;@������������1Binary_searchable!S���cBL��cB_@���cBL��cB_@@���cBD��cB_@@���cBD��cB_@�����(For_test��d`i�d`q@��������(For_test��d`t�d`|@��d`t�d`|@@����#elt��d`��d`�@    ���d`��d`�@@@@A�����#elt��&d`��'d`�@@��)d`��*d`�@@@@��,d`��-d`�@@��/d`t�0d`�@@����!t��7d`��8d`�@    ���<d`��=d`�@@@@A�����!t��Ed`��Fd`�@@��Hd`��Id`�@@@@��Kd`��Ld`�@@��Nd`t�Od`�@@@��Qd`b�Rd`�@��Td`b�Ud`�@@��Wb>�Xe��@@@��Zb�[e��@��]b�^e��@�����?Binary_searchable1_and_for_test��fg���gg��@������������1Binary_searchable"S1��wh���xh��@��zh���{h��@@��}h���~h��@@���h����h��@�����(For_test���i���i�
@������)For_test1���i���i�@���i���i�@@����!t���i�$��i�%@    ����i�$��i�%@����!a���i�!��i�#@@@B@@@A�����!t���i�,��i�-@���!a���i�)��i�+@@@@���i�)��i�-@@@@���i���i�-@@���i���i�-@@@���i����i�-@���i����i�-@@���g����j.1@@@���g����j.1@���g����j.1@�����6Test_binary_searchable���l3?��l3U@��������(For_test���m\j��m\r@�����(For_test���m\v��m\~@���m\v��m\~@@@���m\^��m\~@���m\^��m\~@�����)For_test1��n��n�@�����)For_test1��n��n�@��n��n�@@@��n��n�@��n��n�@�����$Test��p���p��@���!M��%p���&p��@�����>Binary_searchable_and_for_test��.p���/p��@��1p���2p��@@��@��6p���7p��@@��9p���:p��@@@��<p���=p��@��?p���@p��@�����%Test1��Hq���Iq��@���!M��Oq���Pq��@�����?Binary_searchable1_and_for_test��Xq���Yq�@��[q���\q�@@��@��`q��aq�!@@��cq���dq�!@@@��fq���gq�!@��iq���jq�!@�����-Make_and_test��rtfo�stf|@���!T��ytf�ztf�@�����6Indexable_and_for_test���tf���tf�@���tf���tf�@@��������!S���u����u��@���u����u��@@����!t���u����u��@    ����u����u��@@@@A������!T!t���u����u��@@���u����u��@@@@���u����u��@@���u����u��@@����#elt���u����u��@    ����u����u��@@@@A������!T#elt���u����u��@@���u����u��@@@@���u����u��@@���u����u��@@���tf~��u��@@���)ocaml.doc��t@@ ��u@@ �A�������	; [Make_and_test] does [Binary_searchable.Make] and [Test]. @���s#%��s#e@@@@���s#%��s#e@@���@@ ���@@ �A@���tfh��u��@���tfh��u��@�����.Make1_and_test�� v���v��@���!T��v���v��@�����7Indexable1_and_for_test��v���v�@��v���v�@@������"S1��w	�w@�� w	�!w@@����!t��(w�)w@    ���-w�.w@����!a��5w�6w@@@B@@@A������!T!t��@w!�Aw$@���!a��Gw�Hw @@@@��Jw�Kw$@@@@��Mw�Nw$@@��Pw	�Qw$@@��Sv���Tw$@@@��Vv���Ww$@��Yv���Zw$@@��\l3X�]x%(@@@��_l33�`x%(@��bl33�cx%(@���@������o��nx%(�ox%(@@��qx%(�rx%(@@@��������3Ppx_inline_test_lib'Runtime)unset_lib��x%(��x%(@���x%(��x%(@@@��@���m@���x%(��x%(@@@@���x%(��x%(@@@@���x%(��x%(@@���x%(��x%(@@