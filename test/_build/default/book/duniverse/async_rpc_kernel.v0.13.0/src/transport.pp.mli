Caml1999N026����   ;         		9book/duniverse/async_rpc_kernel.v0.13.0/src/transport.mli����   �  �  d  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  . RPC transport layer

    A transport is a way to send and receive messages.  It is split between a [Reader] and
    a [Writer] part.

    [Async_rpc_kernel] only provides an async [Pipe.t] transport.
    [Async_rpc] provides a unix transport based on [Async_unix]'s
    [Reader] and [Writer] modules.
@��	9book/duniverse/async_rpc_kernel.v0.13.0/src/transport.mliA@@�I13@@@@��A@@�I13@@���@@ ���@@ �A��
A@@�I13@������+Core_kernel��K5;�K5F@@��K55�K5F@@��K55�K5F@������,Async_kernel��$LGM�%LGY@@��'LGG�(LGY@@��*LGG�+LGY@�����&Header��3P���4P��@�����Р&length��>Q���?Q��@����#int��FQ���GQ��@@��IQ���JQ��@@@@@��LQ���MQ��@��OQ���PQ��@���Р9unsafe_get_payload_length��XS���YS�@��@�����)Bigstring!t��dS��eS�&@@��gS��hS�&@@@���#pos����#int��sS�.�tS�1@@��vS�.�wS�1@@@����#int��~S�5�S�8@@���S�5��S�8@@@���S�*��S�8@@@���S���S�8@@@@@���S����S�8@���S����S�8@���Р9unsafe_set_payload_length���T9?��T9X@��@�����)Bigstring!t���T9[��T9f@@���T9[��T9f@@@���#pos����#int���T9n��T9q@@���T9n��T9q@@@��@����#int���T9u��T9x@@���T9u��T9x@@@����$unit���T9|��T9�@@���T9|��T9�@@@���T9u��T9�@@@���T9j��T9�@@@���T9[��T9�@@@@@���T9;��T9�@���T9;��T9�@@���P����U��@@���)ocaml.doc���@@ ���@@ �A�������	p Binary headers containing message lengths.  All transports should use this to ensure
    binary compatibility. @���N[[��O��@@@@���N[[��O��@@���@@ ���@@ �A@���P����U��@���P����U��@�����.Handler_result��W���W��@�����.Transport_intf.Handler_result��W���W��@��W���W��@@@��W���W��@��W���W��@�����&Reader��!Y���"Y��@�������!S��,Z���-Z��@������.Transport_intf&Reader��7Z���8Z��@��:Z���;Z��@@@��=Z���>Z��@��@Z���AZ��@��������!S��L[��M[�@��O[��P[�@@��R[���S[�@@��U[���V[�@���Р$pack��^]�_]@��@�����!S��i]�j]@����!t��q]'�r](@��!a��w]+�x]-@@@@��z]�{].@���~]�]-@@@��@��!a���]2��]4@@@����!t���]8��]9@@���]8��]9@@@���]2��]9@@@���]��]9@@@@@���]��]9@���]��]9@���Р9read_one_message_bin_prot���c����c�@��@����!t���d��d@@���d��d@@@��@������(Bin_prot*Type_class&reader���e��e9@���!a���e��e@@@@���e��e9@@@�����(Deferred!t���f:c��f:m@������&Result!t���f:Z��f:b@���!a���f:B��f:D@@@�������&Closed���f:H��f:O@A@���f:H��f:O@@����#Eof���f:R��f:V@A@�� f:R�f:V@@@@@��f:F�f:X@@@@��f:A�f:b@@@@��	f:A�
f:m@@@��e�f:m@@@��d�f:m@@@@���1�� @@ ��@@ �A�������	� Convenience function to wait for the first message and un-bin_prot it.

      Async RPC uses this to handle the handshake at the beginning of the message
      stream. @�� _;=�!b��@@@@��#_;=�$b��@@��@@ ��@@ �A@��)c���*f:m@��,c���-f:m@@��/Y���0gnq@@@��2Y���3gnq@��5Y���6gnq@�����+Send_result��>isz�?is�@�����.Transport_intf+Send_result��His��Iis�@��Kis��Lis�@@@��Niss�Ois�@��Qiss�Ris�@�����&Writer��Zk���[k��@�������!S��el���fl��@������.Transport_intf&Writer��pl���ql��@��sl���tl��@@@��vl���wl��@��yl���zl��@��������!S���m����m��@���m����m��@@���m����m��@@���m����m��@���Р$pack���o����o��@��@�����!S���o���o�@����!t���o���o�@��!a���o���o�@@@@���o����o�@����o���o�@@@��@��!a���o���o�@@@����!t���o���o� @@���o���o� @@@���o���o� @@@���o����o� @@@@@���o����o� @���o����o� @���Р(can_send���rrx��rr�@��@����!t���rr���rr�@@���rr���rr�@@@����$bool���rr���rr�@@���rr���rr�@@@���rr���rr�@@@@������@@ ���@@ �A�������	H [can_send t = not (is_closed t || Deferred.is_determined (stopped t))] @��q"$�q"q@@@@��q"$�q"q@@���@@ ���@@ �A@��rrt�rr�@��rrt�rr�@���Р(transfer�� v)/�!v)7@��@����!t��*w8?�+w8@@@��-w8?�.w8@@@@���7max_num_values_per_read����#int��9xAa�:xAd@@��<xAa�=xAd@@@��@������$Pipe&Reader!t��Jyz��Kyz�@���!a��Qyz��Ryz�@@@@��Tyz��Uyz�@@@��@��@��!a��^z���_z��@@@����$unit��fz���gz��@@��iz���jz��@@@��lz���mz��@@@�����(Deferred!t��v{���w{��@�����$unit��{����{��@@���{����{��@@@@���{����{��@@@���z����{��@@@���yz���{��@@@���xAH��{��@@@���w8?��{��@@@@�������@@ ���@@ �A�������	� This function is similar to [Async_unix.Writer.transfer], except that it doesn't
      wait on [Pipe.upstream_flushed] when the writer is closed. @���t����u�(@@@@���t����u�(@@���@@ ���@@ �A@���v)+��{��@���v)+��{��@@���k����|��@@@���k����|��@���k����|��@���A�    �!t���~����~��@@@��Р&reader���������@@�����&Reader!t���������@@���������@@@������� @��@@�Р&writer��� @���� @��@@�����&Writer!t��� @���� @��@@��� @���� @��@@@��� @���� @��@@@A@���(deriving��� B���� B�@��������'sexp_of�� B�� B�@�� B�� B�@@@@��	 B��
 B�@@�� B��� B�@@��~��� B�@@��~��� B�@�����������-ocaml.warning��!~���" B�@�������#-32@��,~���- B�@@@@��/~���0 B�@@��2~���3 B�@��5~���6 B�@���Р)sexp_of_t��>~���?~��@��@�������G~���H~��@@��J~���K~��@@@������1Ppx_sexp_conv_lib$Sexp!t��V~���W~��@@��Y~���Z~��@@@��\~���]~��@@@@@��_~���` B�@��b~���c B�@@��e~���f B�@@��h~���i B�@���)ocaml.doc��o~���p B�@�������'@inline@��z~���{ B�@@@@��}~���~ B�@@���~���� B�@@���~���� B�@���Р%close��� E<@�� E<E@��@����!t��� E<H�� E<I@@��� E<H�� E<I@@@�����(Deferred!t��� E<R�� E<\@�����$unit��� E<M�� E<Q@@��� E<M�� E<Q@@@@��� E<M�� E<\@@@��� E<H�� E<\@@@@���װ��@@ ���@@ �A�������	% Closes both parts of the transport. @��� D�� D;@@@@��� D�� D;@@���@@ ���@@ �A@��� E<<�� E<\@��� E<<�� E<\@@