Caml1999N026����   J         	Hbook/duniverse/async.v0.13.0/async_rpc/src/rpc_transport_low_latency.mli����  �      Ӡ����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������	C This module implements a RPC transport optimized for low-latency. @��	Hbook/duniverse/async.v0.13.0/async_rpc/src/rpc_transport_low_latency.mliA@@�A@ H@@@@��A@@�A@ H@@���@@ ���@@ �A��
A@@�A@ H@������$Core��C J P�C J T@@��C J J�C J T@@��C J J�C J T@������&Import��$D U [�%D U a@@��'D U U�(D U a@@��*D U U�+D U a@�����&Config��3F c j�4F c p@�����A�    �!t��?G w ~�@G w @@@@A@���(deriving��FG w ��GG w �@��������$sexp��RG w ��SG w �@��UG w ��VG w �@@@@��XG w ��YG w �@@��[G w ��\G w �@@��^G w y�_G w �@@��aG w y�bG w �@�����������-ocaml.warning��pG w y�qG w �@�������#-32@��{G w y�|G w �@@@@��~G w y�G w �@@���G w y��G w �@���G w y��G w �@������������1Ppx_sexp_conv_lib(Sexpable!S���G w y��G w �@���G w y��G w �@@����!t���G w y��G w �@    �h���G w ~��G w @@@@A�����p���G w ~��G w @@���G w y��G w �@@@@���G w y��G w �@@���G w y��G w �@@���G w y��G w �@@���G w y��G w �@@���G w y��G w �@@���G w y��G w �@���)ocaml.doc���G w y��G w �@�������'@inline@���G w y��G w �@@@@���G w y��G w �@@���G w y��G w �@@���G w y��G w �@���Р&create���`{���`{�@���0max_message_size����#int���a����a��@@���a����a��@@���)ocaml.doc���@@ ���@@ �A�������7 default Int.max_value @��a���	a��@@@@��a���a��@@���@@ ���@@ �A@���3initial_buffer_size����#int��b���b��@@��b���b��@@���'��@@ ��@@ �A�������/ default 64 KB @��.b���/b��@@@@��1b���2b��@@��@@ �� @@ �A@���/max_buffer_size����#int��@c��Ac�@@��Cc��Dc�@@���M��4@@ ��5@@ �A�������7 default Int.max_value @��Tc��Uc�/@@@@��Wc��Xc�/@@��E@@ ��F@@ �A@���-write_timeout������'Time_ns$Span!t��jd0F�kd0T@@��md0F�nd0T@@���w��^@@ ��_@@ �A�������3 default 2 minutes @��~d0U�d0m@@@@���d0U��d0m@@��o@@ ��p@@ �A@���<buffering_threshold_in_bytes����#int���en���en�@@���en���en�@@�������@@ ���@@ �A�������/ default 32 KB @���en���en�@@@@���en���en�@@���@@ ���@@ �A@���	!start_batching_after_num_messages����#int���f����f��@@���f����f��@@���ð��@@ ���@@ �A�������+ default 2 @���f����f��@@@@���f����f��@@���@@ ���@@ �A@��@����$unit���g����g��@@���g����g��@@@����!t���h����h��@@���h����h��@@@���g����h��@@@���f����h��@@@���enu��h��@@@���d07��h��@@@���c����h��@@@���b����h��@@@���a����h��@@@@������@@ ���@@ �A�������
  � - [max_message_size] is the maximum message size a reader/writer will accept to
      receive/send.

      - [max_buffer_size] is the maximum size the internal reader/writer's buffer will
        ever grow.

      - [write_timeout] is the maximum time allowed for a write operation to complete
        before an error is reported.

      - When the writer's internal buffer is filled at [buffering_threshold_in_bytes] or
        more, the writer will try to flush its buffer immediately. This is to get good
        latency and avoid buffering too much when sending big batches of messages.

      - If the application hasn't sent any messages in the current Async job and nothing
        is buffered, the first [start_batching_after_num_messages] messages will be sent
        immediately. After that the writer will start buffering. This is to give good
        latency when the application sends a few messages occasionally but still get good
        throughput when sending a batch of messages.

      Note that [start_batching_after_num_messages] and [buffering_threshold_in_bytes]
      have somewhat opposite meanings: the former determines when to start batching and
      the latter determines when to write data that has been batched.
  @��I � ��_vz@@@@��I � ��_vz@@���@@ �� @@ �A@��`{}�h��@��`{}�h��@@��F c s�i @@@�� F c c�!i @��#F c c�$i @�����7��@@ ��@@ �A�������
  k All the following [create] functions take a [max_message_size] argument in addition to
    a [Config.t]. The final [max_message_size] will be the min of both.

    The rationale for this is that [max_message_size] is more a property of the protocol
    and should be specified by the programmer, while other configuration parameters are
    for tuning purposes.
@��6k�7qsu@@@@��9k�:qsu@@��'@@ ��(@@ �A��?k�@qsu@�����&Reader��Hsw~�Isw�@��������������������*Rpc_kernel)Transport&Reader��bu���cu��@��eu���fu��@@��hu���iu��@@��ku���lu��@@��nt���ov��@@��qt���rv��@@��tt���uv��@@��wt���xv��@���Р&create���x����x��@���&config�����&Config!t���x����x��@@���x����x��@@@���0max_message_size����#int���x�	��x�	@@���x�	��x�	@@@��@�����"Fd!t���x�	��x�	@@���x�	��x�	@@@����!t���x�	��x�	@@���x�	��x�	@@@���x�	��x�	@@@���x����x�	@@@���x����x�	@@@@@���x����x�	@���x����x�	@@���sw���y		"@@@���sww��y		"@���sww��y		"@�����&Writer���{	$	+��{	$	1@��������������������*Rpc_kernel)Transport&Writer���}	X	d��}	X	@���}	X	d��}	X	@@���}	X	\��}	X	@@���}	X	\��}	X	@@��|	8	Q�~	�	�@@��|	8	B�~	�	�@@��|	8	:�~	�	�@@��
|	8	:�~	�	�@���Р&create�� @	�	�� @	�	�@���&config�����&Config!t��! @	�	��" @	�	�@@��$ @	�	��% @	�	�@@@���0max_message_size����#int��0 @	�	��1 @	�	�@@��3 @	�	��4 @	�	�@@@��@�����"Fd!t��? @	�	��@ @	�	�@@��B @	�	��C @	�	�@@@����!t��J @	�	��K @	�	�@@��M @	�	��N @	�	�@@@��P @	�	��Q @	�	�@@@��S @	�	��T @	�	�@@@��V @	�	��W @	�	�@@@@@��Y @	�	��Z @	�	�@��\ @	�	��] @	�	�@@��_{	$	4�` A	�	�@@@��b{	$	$�c A	�	�@��e{	$	$�f A	�	�@���������������������*Rpc_kernel)Transport�� D	�	��� D	�
@��� D	�	��� D	�
@@��� D	�	��� D	�
@@��� D	�	��� D	�
@@��� C	�	��� E

@@��� C	�	��� E

@@����&Reader��� F

�� F

$@����*Rpc_kernel)Transport&Reader��� F

(�� F

C@@��� C	�	��� F

C@@����&Writer��� G
D
P�� G
D
V@����*Rpc_kernel)Transport&Writer��� G
D
Z�� G
D
u@@��� C	�	��� G
D
u@@��� C	�	��� G
D
u@@��� C	�	��� G
D
u@���Р&create��� I
w
{�� I
w
�@���&config�����&Config!t��� I
w
��� I
w
�@@��� I
w
��� I
w
�@@@���0max_message_size����#int��� I
w
��� I
w
�@@��� I
w
��� I
w
�@@@��@�����"Fd!t��� I
w
��� I
w
�@@��� I
w
��� I
w
�@@@����!t��� I
w
��� I
w
�@@�� I
w
�� I
w
�@@@�� I
w
�� I
w
�@@@�� I
w
�� I
w
�@@@��
 I
w
�� I
w
�@@@@@�� I
w
w� I
w
�@�� I
w
w� I
w
�@@