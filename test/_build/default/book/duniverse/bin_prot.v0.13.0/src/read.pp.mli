Caml1999N026����   .         	,book/duniverse/bin_prot.v0.13.0/src/read.mli����  1d  �  #�  "������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@�������*ocaml.text���@@ ���@@ �A�������	? Reading values from the binary protocol using (mostly) OCaml. @��	,book/duniverse/bin_prot.v0.13.0/src/read.mliA@@�A@ D@@@@��A@@�A@ D@@���@@ ���@@ �A��
A@@�A@ D@������&Common��C F K�C F Q@A��C F F�C F Q@@��C F F�C F Q@���A�    �&reader��$IRZ�%IR`@����!a��,IRW�-IRY@@@B@@@A���@����#buf��7IRc�8IRf@@��:IRc�;IRf@@@���'pos_ref����'pos_ref��FIRr�GIRy@@��IIRr�JIRy@@@��!a��OIR}�PIR@@@��RIRj�SIR@@@��UIRc�VIR@@@���)ocaml.doc���@@ ���@@ �A�������	� Type of reader functions for the binary protocol.  They take a
    buffer and a reference to a read position, and return the unmarshalled
    value.  The next buffer position after reading in the value will be
    stored in the position reference. @��gE S S�hH)Q@@@@��jE S S�kH)Q@@��@@ ��	@@ �A@��pIRR�qIR@@��sIRR�tIR@���A�    �'reader1��}K���~K��@����!a���K����K��@@@B����!b���K����K��@@@B@@@A���@����&reader���K����K��@���!a���K����K��@@@@���K����K��@@@����&reader���K����K��@���!b���K����K��@@@@���K����K��@@@���K����K��@@@@���K����K��@@���K����K��@���A�    �'reader2���L����L��@����!a���L����L��@@@B����!b���L����L��@@@B����!c���L����L��@@@B@@@A���@����&reader���L����L��@���!a���L����L��@@@@���L����L��@@@����'reader1���L����L��@���!b��L���L��@@@���!c��
L���L��@@@@��L���L��@@@��L���L��@@@@��L���L��@@��L���L��@���A�    �'reader3�� M� �!M�@����!a��(M���)M��@@@B����!b��0M���1M��@@@B����!c��8M���9M��@@@B����!d��@M���AM��@@@B@@@A���@����&reader��KM��LM�@���!a��RM�
�SM�@@@@��UM�
�VM�@@@����'reader2��]M�$�^M�+@���!b��dM��eM�@@@���!c��kM��lM�@@@���!d��rM� �sM�"@@@@��uM��vM�+@@@��xM�
�yM�+@@@@��{M���|M�+@@��~M���M�+@���Р-bin_read_unit���O-1��O->@����&reader���O-F��O-L@�����$unit���O-A��O-E@@���O-A��O-E@@@@���O-A��O-L@@@@@���O--��O-L@���O--��O-L@���Р-bin_read_bool���PMQ��PM^@����&reader���PMf��PMl@�����$bool���PMa��PMe@@���PMa��PMe@@@@���PMa��PMl@@@@@���PMM��PMl@���PMM��PMl@���Р/bin_read_string���Qmq��Qm�@����&reader���Qm���Qm�@�����&string���Qm���Qm�@@���Qm���Qm�@@@@���Qm���Qm�@@@@@���Qmm��Qm�@���Qmm��Qm�@���Р.bin_read_bytes���R����R��@����&reader��R���R��@�����%bytes��
R���R��@@��R���R��@@@@��R���R��@@@@@��R���R��@��R���R��@���Р-bin_read_char��S��� S��@����&reader��'S���(S��@�����$char��0S���1S��@@��3S���4S��@@@@��6S���7S��@@@@@��9S���:S��@��<S���=S��@���Р,bin_read_int��ET���FT��@����&reader��MT���NT��@�����#int��VT���WT��@@��YT���ZT��@@@@��\T���]T��@@@@@��_T���`T��@��bT���cT��@���Р-bin_read_nat0��kU���lU�@����&reader��sU��tU�@������$Nat0!t��~U��U�@@���U���U�@@@@���U���U�@@@@@���U����U�@���U����U�@���Р.bin_read_float���V��V%@����&reader���V.��V4@�����%float���V(��V-@@���V(��V-@@@@���V(��V4@@@@@���V��V4@���V��V4@���Р.bin_read_int32���W59��W5G@����&reader���W5P��W5V@�����%int32���W5J��W5O@@���W5J��W5O@@@@���W5J��W5V@@@@@���W55��W5V@���W55��W5V@���Р.bin_read_int64���XW[��XWi@����&reader���XWr��XWx@�����%int64���XWl��XWq@@���XWl��XWq@@@@���XWl��XWx@@@@@���XWW��XWx@���XWW��XWx@���Р2bin_read_nativeint��Yy}�Yy�@����&reader��Yy��Yy�@�����)nativeint��Yy��Yy�@@��Yy��Yy�@@@@��Yy��Yy�@@@@@��Yyy� Yy�@��"Yyy�#Yy�@���Р,bin_read_ref��+Z���,Z��@����'reader1��3Z���4Z��@���!a��:Z���;Z��@@@�����#ref��CZ���DZ��@���!a��JZ���KZ��@@@@��MZ���NZ��@@@@��PZ���QZ��@@@@@��SZ���TZ��@��VZ���WZ��@���Р-bin_read_lazy��_[���`[��@����'reader1��g[���h[��@���!a��n[���o[��@@@�����&lazy_t��w[���x[��@���!a��~[���[��@@@@���[����[��@@@@���[����[��@@@@@���[����[��@���[����[��@���Р/bin_read_option���\����\�
@����'reader1���\���\�$@���!a���\���\�@@@�����&option���\���\�@���!a���\���\�@@@@���\���\�@@@@���\���\�$@@@@@���\����\�$@���\����\�$@���Р-bin_read_pair���]%)��]%6@����'reader2���]%K��]%R@���!a���]%:��]%<@@@���!b���]%>��]%@@@@������!a���]%B��]%D@@@���!b���]%G��]%I@@@@���]%B��]%I@@@@���]%9��]%R@@@@@���]%%��]%R@���]%%��]%R@���Р/bin_read_triple��^SW�^Sf@����'reader3��^S��^S�@���!a��^Sj�^Sl@@@���!b��^Sn�^Sp@@@���!c�� ^Sr�!^St@@@������!a��*^Sv�+^Sx@@@���!b��1^S{�2^S}@@@���!c��8^S��9^S�@@@@��;^Sv�<^S�@@@@��>^Si�?^S�@@@@@��A^SS�B^S�@��D^SS�E^S�@���Р-bin_read_list��M_���N_��@����'reader1��U_���V_��@���!a��\_���]_��@@@�����$list��e_���f_��@���!a��l_���m_��@@@@��o_���p_��@@@@��r_���s_��@@@@@��u_���v_��@��x_���y_��@���Р.bin_read_array���`����`��@����'reader1���`����`��@���!a���`����`��@@@�����%array���`����`��@���!a���`����`��@@@@���`����`��@@@@���`����`��@@@@@���`����`��@���`����`��@���Р0bin_read_hashtbl���a����a��@����'reader2���a���a�@���!a���a����a��@@@���!b���a����a� @@@������'Hashtbl!t���a���a�@���!a���a���a�@@@���!b���a���a�	@@@@���a���a�@@@@���a����a�@@@@@���a����a�@���a����a�@���Р4bin_read_float32_vec���b"��b6@����&reader��b?�bE@�����%vec32��
b9�b>@@��b9�b>@@@@��b9�bE@@@@@��b�bE@��b�bE@���Р4bin_read_float64_vec��cFJ� cF^@����&reader��'cFg�(cFm@�����%vec64��0cFa�1cFf@@��3cFa�4cFf@@@@��6cFa�7cFm@@@@@��9cFF�:cFm@��<cFF�=cFm@���Р,bin_read_vec��Ednr�Fdn~@����&reader��Mdn��Ndn�@�����#vec��Vdn��Wdn�@@��Ydn��Zdn�@@@@��\dn��]dn�@@@@@��_dnn�`dn�@��bdnn�cdn�@���Р4bin_read_float32_mat��ke���le��@����&reader��se���te��@�����%mat32��|e���}e��@@��e����e��@@@@���e����e��@@@@@���e����e��@���e����e��@���Р4bin_read_float64_mat���f����f��@����&reader���f����f��@�����%mat64���f����f��@@���f����f��@@@@���f����f��@@@@@���f����f��@���f����f��@���Р,bin_read_mat���g����g��@����&reader���g����g��@�����#mat���g����g��@@���g����g��@@@@���g����g��@@@@@���g����g��@���g����g��@���Р2bin_read_bigstring���h����h�@����&reader���h���h�@�����#buf���h���h�@@���h���h�@@@@���h���h�@@@@@���h����h�@���h����h�@���Р4bin_read_float_array��i"�i6@����&reader��iE�iK@�����%array��i?�iD@�����%float��i9�i>@@�� i9�!i>@@@@��#i9�$iD@@@@��&i9�'iK@@@@@��)i�*iK@��,i�-iK@���Р4bin_read_variant_int��5jLP�6jLd@����&reader��=jLk�>jLq@�����#int��FjLg�GjLj@@��IjLg�JjLj@@@@��LjLg�MjLq@@@@@��OjLL�PjLq@��RjLL�SjLq@���Р1bin_read_int_8bit��[krv�\kr�@����&reader��ckr��dkr�@�����#int��lkr��mkr�@@��okr��pkr�@@@@��rkr��skr�@@@@@��ukrr�vkr�@��xkrr�ykr�@���Р2bin_read_int_16bit���l����l��@����&reader���l����l��@�����#int���l����l��@@���l����l��@@@@���l����l��@@@@@���l����l��@���l����l��@���Р2bin_read_int_32bit���m����m��@����&reader���m����m��@�����#int���m����m��@@���m����m��@@@@���m����m��@@@@@���m����m��@���m����m��@���Р2bin_read_int_64bit���n����n��@����&reader���n����n� @�����#int���n����n��@@���n����n��@@@@���n����n� @@@@@���n����n� @���n����n� @���Р3bin_read_int64_bits���o��o@����&reader���o!��o'@�����%int64��o�o @@��o�o @@@@��
o�o'@@@@@��o�o'@��o�o'@���Р6bin_read_network16_int��p(,�p(B@����&reader��!p(I�"p(O@�����#int��*p(E�+p(H@@��-p(E�.p(H@@@@��0p(E�1p(O@@@@@��3p((�4p(O@��6p((�7p(O@���Р6bin_read_network32_int��?qPT�@qPj@����&reader��GqPq�HqPw@�����#int��PqPm�QqPp@@��SqPm�TqPp@@@@��VqPm�WqPw@@@@@��YqPP�ZqPw@��\qPP�]qPw@���Р8bin_read_network32_int32��erx|�frx�@����&reader��mrx��nrx�@�����%int32��vrx��wrx�@@��yrx��zrx�@@@@��|rx��}rx�@@@@@��rxx��rx�@���rxx��rx�@���Р6bin_read_network64_int���s����s��@����&reader���s����s��@�����#int���s����s��@@���s����s��@@@@���s����s��@@@@@���s����s��@���s����s��@���Р8bin_read_network64_int64���t����t��@����&reader���t����t��@�����%int64���t����t��@@���t����t��@@@@���t����t��@@@@@���t����t��@���t����t��@���Р,bin_read_md5���u����u�@����&reader���u���u�@������'Md5_lib!t���u���u�@@���u���u�@@@@���u���u�@@@@@���u����u�@���u����u�@���Р:bin_read_list_with_max_len���xUY� xUs@���'max_len����#int��xU~�xU�@@��xU~�xU�@@@����'reader1��xU��xU�@���!a��xU��xU�@@@�����$list��&xU��'xU�@���!a��-xU��.xU�@@@@��0xU��1xU�@@@@��3xU��4xU�@@@��6xUv�7xU�@@@@������@@ ���@@ �A�������	2 Fail early if the list is larger than [max_len]. @��Gw�HwT@@@@��Jw�KwT@@���@@ ���@@ �A@��PxUU�QxU�@��SxUU�TxU�@@