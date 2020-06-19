Caml1999N026����   4         	2book/duniverse/async.v0.13.0/async_rpc/src/rpc.mli����  Y&  �  9  6$�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  a This module just re-exports lots of modules from [Async_rpc_kernel] and adds some
    Unix-specific wrappers in [Connection] (for using [Reader], [Writer], and [Tcp]).  For
    documentation, see {{!Async_rpc_kernel.Rpc}[Rpc]} and
    {{!Async_rpc_kernel__.Connection_intf}[Connection_intf]} in the
    {{!Async_rpc_kernel}[Async_rpc_kernel]} library.
@��	2book/duniverse/async.v0.13.0/async_rpc/src/rpc.mliA@@�Fdf@@@@��A@@�Fdf@@���@@ ���@@ �A��
A@@�Fdf@������$Core��Hhn�Hhr@@��Hhh�Hhr@@��Hhh�Hhr@������&Import��$Isy�%Is@@��'Iss�(Is@@��*Iss�+Is@�����)Transport��3J���4J��@����-Rpc_transport��;J���<J��@��>J���?J��@@@��AJ���BJ��@��DJ���EJ��@�����5Low_latency_transport��MK���NK��@����9Rpc_transport_low_latency��UK���VK��@��XK���YK��@@@��[K���\K��@��^K���_K��@�����#Any��gL���hL��@�����*Rpc_kernel#Any��qL���rL��@��tL���uL��@@@��wL���xL��@��zL���{L��@�����+Description���M����M�@�����*Rpc_kernel+Description���M���M�!@���M���M�!@@@���M����M�!@���M����M�!@�����.Implementation���N")��N"7@�����*Rpc_kernel.Implementation���N":��N"S@���N":��N"S@@@���N""��N"S@���N""��N"S@�����/Implementations���OT[��OTj@�����*Rpc_kernel/Implementations���OTm��OT�@���OTm��OT�@@@���OTT��OT�@���OTT��OT�@�����'One_way���P����P��@�����*Rpc_kernel'One_way���P����P��@���P����P��@@@���P����P��@���P����P��@�����(Pipe_rpc���Q����Q��@�����*Rpc_kernel(Pipe_rpc���Q����Q��@�� Q���Q��@@@��Q���Q��@��Q���Q��@�����#Rpc��R���R��@�����*Rpc_kernel#Rpc��R���R��@��R���R��@@@��R��� R��@��"R���#R��@�����)State_rpc��+S���,S��@�����*Rpc_kernel)State_rpc��5S��6S�@��8S��9S�@@@��;S���<S�@��>S���?S�@�����1Pipe_close_reason��GT�HT.@�����*Rpc_kernel1Pipe_close_reason��QT1�RTM@��TT1�UTM@@@��WT�XTM@��ZT�[TM@�����*Connection��cVOV�dVO`@�������������������*Rpc_kernel*Connection��{X���|X��@��~X���X��@@���X����X��@@���X����X��@@���Wg���Y��@@���Wgq��Y��@@���Wgi��Y��@@���Wgi��Y��@���Р&create���c-3��c-9@���/implementations�����/Implementations!t���d:U��d:f@���!s���d:R��d:T@@@@���d:R��d:f@@@���0connection_state��@����!t���eg���eg�@@���eg���eg�@@@��!s���eg���eg�@@@���eg���eg�@@@���0max_message_size����#int���f����f��@@���f����f��@@@���1handshake_timeout������$Time$Span!t���g����g��@@���g����g��@@@���0heartbeat_config�����0Heartbeat_config!t���h����h��@@���h����h��@@@���+description�����$Info!t��i��i�@@��i��i�@@@��@�����&Reader!t��j�j"@@��j�j"@@@��@�����&Writer!t��*k#*�+k#2@@��-k#*�.k#2@@@�����(Deferred!t��7l3N�8l3X@������&Result!t��Bl3E�Cl3M@�����!t��Kl3;�Ll3<@@��Nl3;�Ol3<@@@������#Exn!t��Yl3>�Zl3C@@��\l3>�]l3C@@@@��_l3:�`l3M@@@@��bl3:�cl3X@@@��ek#*�fl3X@@@��hj�il3X@@@��ki���ll3X@@@��nh���ol3X@@@��qg���rl3X@@@��tf���ul3X@@@��wegn�xl3X@@@��zd:A�{l3X@@@@���)ocaml.doc��l@@ ��m@@ �A�������
  t These functions are mostly the same as the ones with the same names in
      [Async_rpc_kernel.Rpc.Connection]; see [Connection_intf] in that library for
      documentation. The differences are that:

      - they take an [Async_unix.Reader.t], [Async_unix.Writer.t] and
        [max_message_size] instead of a [Transport.t]
      - they use [Time] instead of [Time_ns] @���\����b�,@@@@���\����b�,@@��}@@ ��~@@ �A@���c-/��l3X@���c-/��l3X@���Р5contains_magic_prefix���v��v@��@�����&Reader!t���v��v'@@���v��v'@@@�����(Deferred!t���v0��v:@�����$bool���v+��v/@@���v+��v/@@@@���v+��v:@@@���v��v:@@@@���R���@@ ���@@ �A�������
  � As of Feb 2017, the RPC protocol started to contain a magic number so that one can
      identify RPC communication.  The bool returned by [contains_magic_prefix] says
      whether this magic number was observed.

      This operation is a "peek" that does not advance any pointers associated with the
      reader.  In particular, it makes sense to call [create] on a reader after calling
      this function.
  @���nZ\��u� @@@@���nZ\��u� @@���@@ ���@@ �A@���v��v:@���v��v:@���Р*with_close���x<B��x<L@���/implementations�����/Implementations!t�� yMh�yMy@���!s��yMe�yMg@@@@��
yMe�yMy@@@���0max_message_size����#int��zz��zz�@@��zz��zz�@@@���1handshake_timeout������$Time$Span!t��){���*{��@@��,{���-{��@@@���0heartbeat_config�����0Heartbeat_config!t��:|���;|��@@��=|���>|��@@@���0connection_state��@����!t��K}�	�L}�	@@��N}�	�O}�	@@@��!s��T}�	�U}�		@@@��W}�	�X}�		@@@��@�����&Reader!t��c~		�d~		@@��f~		�g~		@@@��@�����&Writer!t��r		"�s		*@@��u		"�v		*@@@���0dispatch_queries��@����!t��� @	+	D�� @	+	E@@��� @	+	D�� @	+	E@@@�����(Deferred!t��� @	+	L�� @	+	V@���!a��� @	+	I�� @	+	K@@@@��� @	+	I�� @	+	V@@@��� @	+	D�� @	+	V@@@���2on_handshake_error������%Raise��� A	X	t�� A	X	z@A@��� A	X	t�� A	X	z@@����$Call��� A	X	}�� A	X	�@@���@�����#Exn!t��� A	X	��� A	X	�@@��� A	X	��� A	X	�@@@�����(Deferred!t��� A	X	��� A	X	�@���!a��� A	X	��� A	X	�@@@@��� A	X	��� A	X	�@@@��� A	X	��� A	X	�@@@@��� A	X	}�� A	X	�@@@@@��� A	X	r�� A	X	�@@@�����(Deferred!t��� B	�	��� B	�	�@���!a��� B	�	��� B	�	�@@@@��� B	�	��� B	�	�@@@��� A	X	_�� B	�	�@@@��� @	+	2�� B	�	�@@@�� 		"� B	�	�@@@��~		� B	�	�@@@��}��� B	�	�@@@��	|���
 B	�	�@@@��{��� B	�	�@@@��zz�� B	�	�@@@��yMT� B	�	�@@@@@��x<>� B	�	�@��x<>� B	�	�@���Р1server_with_close��! D	�	��" D	�	�@���0max_message_size����#int��- E	�	��. E	�	�@@��0 E	�	��1 E	�	�@@@���1handshake_timeout������$Time$Span!t��@ F	�
�A F	�
@@��C F	�
�D F	�
@@@���0heartbeat_config�����0Heartbeat_config!t��Q G

)�R G

;@@��T G

)�U G

;@@@��@�����&Reader!t��` H
<
C�a H
<
K@@��c H
<
C�d H
<
K@@@��@�����&Writer!t��o I
L
S�p I
L
[@@��r I
L
S�s I
L
[@@@���/implementations�����/Implementations!t��� J
\
v�� J
\
�@���!s��� J
\
s�� J
\
u@@@@��� J
\
s�� J
\
�@@@���0connection_state��@����!t��� K
�
��� K
�
�@@��� K
�
��� K
�
�@@@��!s��� K
�
��� K
�
�@@@��� K
�
��� K
�
�@@@���2on_handshake_error������%Raise��� L
�
��� L
�
�@A@��� L
�
��� L
�
�@@����&Ignore��� L
�
��� L
�
�@A@��� L
�
��� L
�
�@@����$Call��� L
�
��� L
�
�@@���@�����#Exn!t��� L
�
��� L
�
�@@��� L
�
��� L
�
�@@@�����(Deferred!t��� L
�
��� L
�
�@�����$unit��� L
�
��� L
�
�@@��� L
�
��� L
�
�@@@@��� L
�
��� L
�
�@@@��� L
�
��� L
�
�@@@@��� L
�
��� L
�
�@@@@@��� L
�
��� L
�
�@@@�����(Deferred!t�� M
�	� M
�@�����$unit�� M
�� M
�@@�� M
�� M
�@@@@�� M
�� M
�@@@�� L
�
�� M
�@@@�� K
�
�� M
�@@@�� J
\
c� M
�@@@�� I
L
S�  M
�@@@��" H
<
C�# M
�@@@��% G

�& M
�@@@��( F	�	��) M
�@@@��+ E	�	��, M
�@@@@@��. D	�	��/ M
�@��1 D	�	��2 M
�@���A�    �/transport_maker��; Z���< Z�@@@@A���@�����"Fd!t��H Z��I Z�@@��K Z��L Z�@@@���0max_message_size����#int��W Z�(�X Z�+@@��Z Z�(�[ Z�+@@@�����)Transport!t��d Z�/�e Z�:@@��g Z�/�h Z�:@@@��j Z��k Z�:@@@��m Z��n Z�:@@@�����^@@ ��_@@ �A�������
  � A function creating a transport from a file descriptor. It is responsible for
      setting the low-level parameters of the underlying transport.

      For instance to set up a transport using [Async.{Reader,Writer}] and set a buffer
      age limit on the writer, you can pass this to the functions of this module:

      {[
        ~make_transport:(fun fd ~max_message_size ->
          Rpc.Transport.of_fd fd ~max_message_size ~buffer_age_limit:`Unlimited)
      ]}
  @��~ O� Y��@@@@��� O�� Y��@@��o@@ ��p@@ �A@��� Z���� Z�:@@��� Z���� Z�:@���A�    �2on_handshake_error��� ]=D�� ]=V@@@@A�������%Raise��� ^Y_�� ^Ye@A@��� ^Y_�� ^Ye@@����&Ignore��� _fl�� _fs@A@��� _fl�� _fs@@����$Call��� `tz�� `t@@���@�����#Exn!t��� `t��� `t�@@��� `t��� `t�@@@����$unit��� `t��� `t�@@��� `t��� `t�@@@��� `t��� `t�@@@@��� `tz�� `t�@@@@@��� ^Y]�� a��@@@@��� ]=?�� a��@@��� ]=?�� a��@���Р%serve��� j���� j��@���/implementations�����/Implementations!t��� k���� k��@���!s��� k���� k��@@@@��  k��� k��@@@���8initial_connection_state��@��'address�� l��� l��@@@��@����!t�� l��� l��@@�� l��� l��@@@��!s�� l���  l��@@@��" l���# l��@@@��% l���& l��@@@���/where_to_listen������#Tcp/Where_to_listen!t��5 m�&�6 m�;@���'address��< m��= m�@@@���,listening_on��C m��D m�$@@@@��F m��G m�;@@@���/max_connections����#int��R n<T�S n<W@@��U n<T�V n<W@@@���'backlog����#int��a oXh�b oXk@@��d oXh�e oXk@@@���0max_message_size����#int��p pl��q pl�@@��s pl��t pl�@@@���.make_transport����/transport_maker�� q���� q��@@��� q���� q��@@@���1handshake_timeout������$Time$Span!t��� r���� r��@@��� r���� r��@@@���0heartbeat_config�����0Heartbeat_config!t��� s���� s�@@��� s���� s�@@@���$auth��@��'address��� t�� t@@@����$bool��� t�� t @@��� t�� t @@@��� t�� t @@���F���@@ ���@@ �A�������6 default is [`Ignore] @��� t"�� t=@@@@��� t"�� t=@@���@@ ���@@ �A@���2on_handshake_error����2on_handshake_error��� u>Y�� u>k@@��� u>Y�� u>k@@���l���@@ ���@@ �A�������6 default is [`Ignore] @��� u>l�� u>�@@@@��� u>l�� u>�@@���@@ ���@@ �A@���0on_handler_error������%Raise�� v��� v��@A@�� v��� v��@@����&Ignore�� v��� v��@A@�� v��� v��@@����$Call��! v���" v��@@���@��'address��* v���+ v��@@@��@����#exn��4 v���5 v��@@��7 v���8 v��@@@����$unit��? v���@ v��@@��B v���C v��@@@��E v���F v��@@@��H v���I v��@@@@��K v���L v��@@@@@��N v���O v��@@@��@����$unit��X w���Y w��@@��[ w���\ w��@@@�����(Deferred!t��e x��f x�@�������#Tcp&Server!t��r x��s x�@���'address��y x���z x��@@@���,listening_on��� x���� x�@@@@��� x���� x�@@@@��� x���� x�@@@��� w���� x�@@@��� v���� x�@@@��� u>E�� x�@@@��� t	�� x�@@@��� s���� x�@@@��� r���� x�@@@��� q���� x�@@@��� pls�� x�@@@��� oX_�� x�@@@��� n<C�� x�@@@��� m���� x�@@@��� l���� x�@@@��� k���� x�@@@@���3���@@ ���@@ �A�������
  � [serve implementations ~port ?on_handshake_error ()] starts a server with the given
      implementation on [port].  The optional auth function will be called on all incoming
      connections with the address info of the client and will disconnect the client
      immediately if it returns false.  This auth mechanism is generic and does nothing
      other than disconnect the client -- any logging or record of the reasons is the
      responsibility of the auth function itself.
  @��� c���� i��@@@@��� c���� i��@@���@@ ���@@ �A@��� j���� x�@��� j���� x�@���Р4serve_with_transport��� z%�� z9@���1handshake_timeout����&option��� {:_�� {:e@�������$Time$Span!t��� {:S�� {:^@@��� {:S�� {:^@@@@��� {:S�� {:e@@@���0heartbeat_config����&option��� |f��� |f�@������0Heartbeat_config!t��	 |f~�
 |f�@@�� |f~� |f�@@@@�� |f~� |f�@@@���/implementations�����/Implementations!t�� }��� }��@���!s��$ }���% }��@@@@��' }���( }��@@@���+description�����$Info!t��5 ~���6 ~��@@��8 ~���9 ~��@@@���0connection_state��@����!t��F ���G ��@@��I ���J ��@@@��!s��O ���P ��@@@��R ���S ��@@@���2on_handshake_error����2on_handshake_error��^ � �_ � ,@@��a � �b � ,@@@��@�����)Transport!t��m �-4�n �-?@@��p �-4�q �-?@@@�����(Deferred!t��z �@L�{ �@V@�����$unit��� �@G�� �@K@@��� �@G�� �@K@@@@��� �@G�� �@V@@@��� �-4�� �@V@@@��� � �� �@V@@@��� ���� �@V@@@��� ~���� �@V@@@��� }���� �@V@@@��� |fm�� �@V@@@��� {:A�� �@V@@@@@��� z!�� �@V@��� z!�� �@V@���Р&client��� ����� ���@���/implementations�����6Client_implementations!t��� ���� ��&@��@��� ���� ��@@@@��� ���� ��&@@@���0max_message_size����#int��� �'@�� �'C@@��� �'@�� �'C@@@���.make_transport����/transport_maker��� �D[�� �Dj@@��� �D[�� �Dj@@@���1handshake_timeout������$Time$Span!t��� �k��� �k�@@��� �k��� �k�@@@���0heartbeat_config�����0Heartbeat_config!t��	 ����	 ���@@��	 ����	 ���@@@���+description�����$Info!t��	 ����	 ���@@��	 ����	 ���@@@��@������#Tcp0Where_to_connect!t��	$ ����	% ���@��@��	) ����	* ���@@@@��	, ����	- ���@@@�����(Deferred!t��	6 ���	7 ��@������&Result!t��	A ��
�	B ��@�����!t��	J �� �	K ��@@��	M �� �	N ��@@@������#Exn!t��	X ���	Y ��@@��	[ ���	\ ��@@@@��	^ ����	_ ��@@@@��	a ����	b ��@@@��	d ����	e ��@@@��	g ����	h ��@@@��	j ����	k ��@@@��	m �kr�	n ��@@@��	p �DK�	q ��@@@��	s �'.�	t ��@@@��	v ����	w ��@@@@������
g@@ ��
h@@ �A�������
  � [client where_to_connect ()] connects to the server at [where_to_connect] and
      returns the connection or an Error if a connection could not be made. It is the
      responsibility of the caller to eventually call [close].

      In [client] and [with_client], the [handshake_timeout] encompasses both the TCP
      connection timeout and the timeout for this module's own handshake.
  @��	� �XZ�	� ���@@@@��	� �XZ�	� ���@@��
x@@ ��
y@@ �A@��	� ����	� ��@��	� ����	� ��@���Р'client'��	� ����	� ���@���/implementations�����6Client_implementations!t��	� ����	� ���@��@��	� ����	� ���@@@@��	� ����	� ���@@@���0max_message_size����#int��	� ����	� ���@@��	� ����	� ���@@@���.make_transport����/transport_maker��	� ���	� ��@@��	� ���	� ��@@@���1handshake_timeout������$Time$Span!t��	� �9�	� �D@@��	� �9�	� �D@@@���0heartbeat_config�����0Heartbeat_config!t��	� �E^�	� �Ep@@��	� �E^�	� �Ep@@@���+description�����$Info!t��
 �q��
 �q�@@��
 �q��
 �q�@@@��@������#Tcp0Where_to_connect!t��
 ����
 ���@���)transport��
 ����
 ���@@@@��
 ����
 ���@@@�����(Deferred!t��
' ����
( ���@������&Result!t��
2 ����
3 ���@������)transport��
< ����
= ���@@@�����!t��
E ����
F ���@@��
H ����
I ���@@@@��
K ����
L ���@@@������#Exn!t��
V ����
W ���@@��
Y ����
Z ���@@@@��
\ ����
] ���@@@@��
_ ����
` ���@@@��
b ����
c ���@@@��
e �qx�
f ���@@@��
h �EL�
i ���@@@��
k �&�
l ���@@@��
n ����
o ���@@@��
q ����
r ���@@@��
t ����
u ���@@@@������e@@ ��f@@ �A�������	s Similar to [client], but additionally expose the [Socket.Address.t] of the RPC
      server that we connected to. @��
� �!�
� �t�@@@@��
� �!�
� �t�@@��v@@ ��w@@ �A@��
� ����
� ���@��
� ����
� ���@���Р+with_client��
� �&,�
� �&7@���/implementations�����6Client_implementations!t��
� �8R�
� �8j@��@��
� �8P�
� �8Q@@@@��
� �8P�
� �8j@@@���0max_message_size����#int��
� �k��
� �k�@@��
� �k��
� �k�@@@���.make_transport����/transport_maker��
� ����
� ���@@��
� ����
� ���@@@���1handshake_timeout������$Time$Span!t��
� ����
� ���@@��
� ����
� ���@@@���0heartbeat_config�����0Heartbeat_config!t��
� ����
� �� @@��
� ����
� �� @@@��@������#Tcp0Where_to_connect!t��  �
� � @��@�� �� �	@@@@�� ��	 � @@@��@��@����!t�� �!)� �!*@@�� �!)� �!*@@@�����(Deferred!t��! �!1�" �!;@���!a��( �!.�) �!0@@@@��+ �!.�, �!;@@@��. �!)�/ �!;@@@�����(Deferred!t��8 �=Y�9 �=c@������&Result!t��C �=P�D �=X@���!a��J �=E�K �=G@@@������#Exn!t��U �=I�V �=N@@��X �=I�Y �=N@@@@��[ �=D�\ �=X@@@@��^ �=D�_ �=c@@@��a �!(�b �=c@@@��d ��e �=c@@@��g ����h �=c@@@��j ����k �=c@@@��m ����n �=c@@@��p �kr�q �=c@@@��s �8?�t �=c@@@@������d@@ ��e@@ �A�������
  4 [with_client where_to_connect f] connects to the server at [where_to_connect] and
      runs f until an exception is thrown or until the returned Deferred is fulfilled.

      NOTE:  As with [with_close], you should be careful when using this with [Pipe_rpc].
      See [with_close] for more information.
  @��� ����� �!%@@@@��� ����� �!%@@��u@@ ��v@@ �A@��� �&(�� �=c@��� �&(�� �=c@���Р,with_client'��� ����� ���@���/implementations�����6Client_implementations!t��� ���� ��*@��@��� ���� ��@@@@��� ���� ��*@@@���0max_message_size����#int��� �+D�� �+G@@��� �+D�� �+G@@@���.make_transport����/transport_maker��� �H_�� �Hn@@��� �H_�� �Hn@@@���1handshake_timeout������$Time$Span!t��� �o��� �o�@@��� �o��� �o�@@@���0heartbeat_config�����0Heartbeat_config!t��� ����� ���@@��� ����� ���@@@��@������#Tcp0Where_to_connect!t��� ����  ���@���)transport�� ���� ���@@@@��	 ����
 ���@@@��@���-remote_server��)transport�� �� � ��
@@@��@����!t�� ���  ��@@��" ���# ��@@@�����(Deferred!t��, ���- �� @���!a��3 ���4 ��@@@@��6 ���7 �� @@@��9 ���: �� @@@��< ����= �� @@@�����(Deferred!t��F �">�G �"H@������&Result!t��Q �"5�R �"=@���!a��X �"*�Y �",@@@������#Exn!t��c �".�d �"3@@��f �".�g �"3@@@@��i �")�j �"=@@@@��l �")�m �"H@@@��o ����p �"H@@@��r ����s �"H@@@��u ����v �"H@@@��x �ov�y �"H@@@��{ �HO�| �"H@@@��~ �+2� �"H@@@��� ����� �"H@@@@���
��r@@ ��s@@ �A�������	x Similar to [with_client], but additionally expose the [Socket.Address.t] of the RPC
      server that we connected to. @��� �eg�� ���@@@@��� �eg�� ���@@���@@ ���@@ �A@��� ����� �"H@��� ����� �"H@@���VOc�� �IL@@@���VOO�� �IL@���VOO�� �IL@@