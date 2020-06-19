Caml1999M026����   @         		>book/duniverse/async_rpc_kernel.v0.13.0/src/connection_intf.ml����  N�  U  1E  .�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ��@������"()��	>book/duniverse/async_rpc_kernel.v0.13.0/src/connection_intf.mlA@@�A@@@@��A@@�A@@@@@���������-Ppx_bench_lib5Benchmark_accumulator/Current_libname#set��A@@�A@@@��A@@�A@@@@@��@���0async_rpc_kernel@�� A@@�!A@@@@@@��#A@@�$A@@@@@@��&A@@�'A@@@@��)A@@�*A@@@���@������"()��6A@@�7A@@@@��9A@@�:A@@@@@��������5Expect_test_collector,Current_file#set��GA@@�HA@@@��JA@@�KA@@@@@���1absolute_filename���R@��TA@@�UA@@@@@@��WA@@�XA@@@@@@��ZA@@�[A@@@@��]A@@�^A@@@���@������4��iA@@�jA@@@@��lA@@�mA@@@@@��������3Ppx_inline_test_lib'Runtime5set_lib_and_partition��zA@@�{A@@@��}A@@�~A@@@@@��@���f@���A@@��A@@@@@��@��� @���A@@��A@@@@@@���A@@��A@@@@@@���A@@��A@@@@���A@@��A@@@��������+Core_kernel���A@E��A@P@���A@E��A@P@@A���A@@��A@P@@���A@@��A@P@��������,Async_kernel���BQV��BQb@���BQV��BQb@@A���BQQ��BQb@@���BQQ��BQb@�����!S���F � ���F � �@������A�    �!t���G � ���G � �@@@@A@���(deriving���G � ���G � �@��������'sexp_of���G � ���G � �@���G � ���G � �@@@@���G � ���G � �@@���G � ���G � �@@���G � ���G � �@@���G � ���G � �@�����������-ocaml.warning��G � ��	G � �@�������#-32@��G � ��G � �@@@@��G � ��G � �@@��G � ��G � �@��G � ��G � �@���Р)sexp_of_t��%G � ��&G � �@��@����X��.G � ��/G � �@@��1G � ��2G � �@@@������1Ppx_sexp_conv_lib$Sexp!t��=G � ��>G � �@@��@G � ��AG � �@@@��CG � ��DG � �@@@@@��FG � ��GG � �@��IG � ��JG � �@@��LG � ��MG � �@@��OG � ��PG � �@���)ocaml.doc��VG � ��WG � �@�������'@inline@��aG � ��bG � �@@@@��dG � ��eG � �@@��gG � ��hG � �@@��jG � ��kG � �@�����0Heartbeat_config��sI � ��tI � �@�����A�    �!t��J ���J �@@@@A@���(deriving���J ���J �@�����������$sexp���J ���J �@���J ���J �@@@�����&bin_io���J ���J �@���J ���J �@@@@���J ���J �@@@@���J ���J �@@���J ���J �@@���J � ���J �@@���J � ���J �@���������������J � ���J �@��������@���J � ���J �@@@@���J � ���J �@@���J � ���J �@���J � ���J �@������������1Ppx_sexp_conv_lib(Sexpable!S���J � ���J �@���J � ���J �@@����!t���J � ���J �@    �x���J ���J �@@@@A���������J ���J �@@��J � ��J �@@@@��J � ��J �@@��J � ��J �@@��
J � ��J �@@��J � ��J �@������������(Bin_prot'Binable!S��J � �� J �@��"J � ��#J �@@����9��)J � ��*J �@    ����.J ��/J �@@@@A��������6J ��7J �@@��9J � ��:J �@@@@��<J � ��=J �@@��?J � ��@J �@@��BJ � ��CJ �@@��EJ � ��FJ �@@��HJ � ��IJ �@@��KJ � ��LJ �@������QJ � ��RJ �@��������@��[J � ��\J �@@@@��^J � ��_J �@@��aJ � ��bJ �@@��dJ � ��eJ �@���Р&create��mP���nP��@���'timeout������'Time_ns$Span!t��}Q���~Q��@@���Q����Q��@@@���*send_every������'Time_ns$Span!t���R����R��@@���R����R��@@@��@����$unit���S����S��@@���S����S��@@@����!t���T����T��@@���T����T��@@@���S����T��@@@���R����T��@@@���Q����T��@@@@���)ocaml.doc���@@ ���@@ �A�������
  ] Each side of the connection has its own heartbeat config. It sends a heartbeat
        every [send_every]. If it doesn't receive a heartbeat for [timeout], it drops the
        connection. It only checks whether [timeout] has elapsed when it sends heartbeats,
        so effectively [timeout] is rounded up to the nearest multiple of [send_every]. @���L $��O,�@@@@���L $��O,�@@���@@ ���@@ �A@���P����T��@���P����T��@���Р'timeout���V���V�@��@����!t���V���V�@@���V���V�@@@������'Time_ns$Span!t���V���V�@@���V���V�@@@���V���V�@@@@@���V����V�@�� V���V�@���Р*send_every��	W'�
W1@��@����!t��W4�W5@@��W4�W5@@@������'Time_ns$Span!t��"W9�#WG@@��%W9�&WG@@@��(W4�)WG@@@@@��+W#�,WG@��.W#�/WG@@��1I � ��2XHM@@@��4I � ��5XHM@��7I � ��8XHM@�����6Client_implementations��@ZOX�AZOn@�����@�    �!t��L[u��M[u�@����!s��T[u��U[u�@@@B@@��Р0connection_state��\\���]\��@@��@����!t��f\���g\��@@��i\���j\��@@@��!s��o\���p\��@@@��r\���s\��@@@��u\���v]��@@�Р/implementations��|]���}]��@@�����/Implementations!t���]����]��@���!s���]����]��@@@@���]����]��@@@���]����]��@@@A@@���[uy��^��@@���[uy��^��@���Р$null���`����`��@��@����$unit���`����`��@@���`����`��@@@����!t���`���`�@�����$unit���`����`�@@���`����`�@@@@���`����`�@@@���`����`�@@@@@���`����`�@���`����`�@@���ZOq��a@@@���ZOQ��a@���ZOQ��a@���Р&create���uKQ��uKW@���/implementations�����/Implementations!t���vXw��vX�@���!s���vXt��vXv@@@@���vXt��vX�@@@���0connection_state��@����!t��w���w��@@��
w���w��@@@��!s��w���w��@@@��w���w��@@@���1handshake_timeout������'Time_ns$Span!t��#x���$x��@@��&x���'x��@@@���0heartbeat_config�����0Heartbeat_config!t��4y���5y�	@@��7y���8y�	@@@���+description�����$Info!t��Ez			%�Fz			+@@��Hz			%�Iz			+@@@���+time_source�����7Synchronous_time_source!t��V{	,	H�W{	,	a@@��Y{	,	H�Z{	,	a@@@��@�����)Transport!t��e|	b	i�f|	b	t@@��h|	b	i�i|	b	t@@@�����(Deferred!t��r}	u	��s}	u	�@������&Result!t��}}	u	��~}	u	�@�����!t���}	u	}��}	u	~@@���}	u	}��}	u	~@@@������#Exn!t���}	u	���}	u	�@@���}	u	���}	u	�@@@@���}	u	|��}	u	�@@@@���}	u	|��}	u	�@@@���|	b	i��}	u	�@@@���{	,	3��}	u	�@@@���z			��}	u	�@@@���y����}	u	�@@@���x����}	u	�@@@���w����}	u	�@@@���vX_��}	u	�@@@@�������@@ ���@@ �A�������
  6 Initiate an Rpc connection on the given transport.  [implementations] should be the
      bag of implementations that the calling side implements; it defaults to
      [Implementations.null] (i.e., "I implement no RPCs").

      [connection_state] will be called once, before [create]'s result is determined, on
      the same connection that [create] returns.  Its output will be provided to the
      [implementations] when queries arrive.

      WARNING: If specifying a custom [heartbeat_config], make sure that both ends of the
      Rpc connection use compatible settings for timeout and send frequency. Otherwise,
      your Rpc connections might close unexpectedly.

      [description] can be used to give some extra information about the connection, which
      will then show up in error messages and the connection's sexp. If you have lots of
      connections in your program, this can be useful for distinguishing them.

      [time_source] can be given to define the time_source for which the heartbeating
      events will be scheduled. Defaults to wall-clock. @���c��tJ@@@@���c��tJ@@���@@ ���@@ �A@���uKM��}	u	�@���uKM��}	u	�@���Р5contains_magic_prefix��� B
{
��� B
{
�@������(Bin_prot*Type_class&reader��� B
{
��� B
{
�@�����$bool��� B
{
��� B
{
�@@��� B
{
��� B
{
�@@@@��� B
{
��� B
{
�@@@@���?���@@ ���@@ �A�������	� As of Feb 2017, the RPC protocol started to contain a magic number so that one can
      identify RPC communication.  The bool returned by [contains_magic_prefix] says
      whether this magic number was observed. @��	�	�� A
J
z@@@@��	�	�� A
J
z@@���@@ ���@@ �A@�� B
{
}� B
{
�@�� B
{
}� B
{
�@���Р+description�� D
�
�� D
�
�@��@����!t��# D
�
��$ D
�
�@@��& D
�
��' D
�
�@@@�����$Info!t��0 D
�
��1 D
�
�@@��3 D
�
��4 D
�
�@@@��6 D
�
��7 D
�
�@@@@@��9 D
�
��: D
�
�@��< D
�
��= D
�
�@���Р6add_heartbeat_callback��E HJP�F HJf@��@����!t��O HJi�P HJj@@��R HJi�S HJj@@@��@��@����$unit��^ HJo�_ HJs@@��a HJo�b HJs@@@����$unit��i HJw�j HJ{@@��l HJw�m HJ{@@@��o HJo�p HJ{@@@����$unit��w HJ��x HJ�@@��z HJ��{ HJ�@@@��} HJn�~ HJ�@@@��� HJi�� HJ�@@@@���̰�j@@ ��k@@ �A�������	g After [add_heartbeat_callback t f], [f ()] will be called on every subsequent
      heartbeat to [t]. @��� F
�
��� G/I@@@@��� F
�
��� G/I@@��{@@ ��|@@ �A@��� HJL�� HJ�@��� HJL�� HJ�@���Р%close��� U���� U��@���	!streaming_responses_flush_timeout������'Time_ns$Span!t��� V� �� V�.@@��� V� �� V�.@@@���&reason�����$Info!t��� WHW�� WH]@@��� WHW�� WH]@@@��@����!t��� X^e�� X^f@@��� X^e�� X^f@@@�����(Deferred!t��� Ygs�� Yg}@�����$unit��� Ygn�� Ygr@@��� Ygn�� Ygr@@@@��� Ygn�� Yg}@@@��� X^e�� Yg}@@@��� WHO�� Yg}@@@��� V���� Yg}@@@@���E���@@ ���@@ �A�������
  \ [close] starts closing the connection's transport, and returns a deferred that
      becomes determined when its close completes.  It is ok to call [close] multiple
      times on the same [t]; calls subsequent to the initial call will have no effect, but
      will return the same deferred as the original call.

      Before closing the underlying transport's writer, [close] waits for all streaming
      reponses to be [Pipe.upstream_flushed] with a timeout of
      [streaming_responses_flush_timeout].

      The [reason] for closing the connection will be passed to callers of [close_reason].
  @��
 J��� T��@@@@�� J��� T��@@���@@ ���@@ �A@�� U��� Yg}@�� U��� Yg}@���Р.close_finished�� ^���  ^��@��@����!t��) ^���* ^��@@��, ^���- ^��@@@�����(Deferred!t��6 ^���7 ^��@�����$unit��? ^���@ ^��@@��B ^���C ^��@@@@��E ^���F ^��@@@��H ^���I ^��@@@@������2@@ ��3@@ �A�������	� [close_finished] becomes determined after the close of the connection's transport
      completes, i.e. the same deferred that [close] returns.  [close_finished] differs
      from [close] in that it does not have the side effect of initiating a close. @��Y [��Z ]/�@@@@��\ [��] ]/�@@��C@@ ��D@@ �A@��b ^���c ^��@��e ^���f ^��@���Р,close_reason��n clr�o cl~@��@����!t��x cl��y cl�@@��{ cl��| cl�@@@���(on_close������'started��� cl��� cl�@A@��� cl��� cl�@@����(finished��� cl��� cl�@A@��� cl��� cl�@@@@@��� cl��� cl�@@@�����(Deferred!t��� cl��� cl�@������$Info!t��� cl��� cl�@@��� cl��� cl�@@@@��� cl��� cl�@@@��� cl��� cl�@@@��� cl��� cl�@@@@������@@ ���@@ �A�������	� [close_reason ~on_close t] becomes determined when close starts or finishes
      based on [on_close], but additionally returns the reason that the connection was
      closed. @��� `���� b[k@@@@��� `���� b[k@@���@@ ���@@ �A@��� cln�� cl�@��� cln�� cl�@���Р)is_closed��� gCI�� gCR@��@����!t��� gCU�� gCV@@��� gCU�� gCV@@@����$bool��� gCZ�� gC^@@��� gCZ�� gC^@@@��� gCU�� gC^@@@@���H���@@ ���@@ �A�������	~ [is_closed t] returns [true] iff [close t] has been called.  [close] may be called
      internally upon errors or timeouts. @�� e��� fB@@@@�� e��� fB@@���@@ ���@@ �A@�� gCE� gC^@�� gCE� gC^@���Р.bytes_to_write��" k���# k��@��@����!t��, k���- k��@@��/ k���0 k��@@@����#int��7 k��8 k�@@��: k��; k�@@@��= k���> k�@@@@������'@@ ��(@@ �A�������	 [bytes_to_write] and [flushed] just call the similarly named functions on the
      [Transport.Writer.t] within a connection. @��N i`b�O j��@@@@��Q i`b�R j��@@��8@@ ��9@@ �A@��W k���X k�@��Z k���[ k�@���Р'flushed��c l�d l@��@����!t��m l�n l@@��p l�q l@@@�����(Deferred!t��z l!�{ l+@�����$unit��� l�� l @@��� l�� l @@@@��� l�� l+@@@��� l�� l+@@@@@��� l	�� l+@��� l	�� l+@���Р*with_close��� ����� ���@���/implementations�����/Implementations!t��� ����� ���@���!s��� ����� ���@@@@��� ����� ���@@@���1handshake_timeout������'Time_ns$Span!t��� ���� ��$@@��� ���� ��$@@@���0heartbeat_config�����0Heartbeat_config!t��� �%B�� �%T@@��� �%B�� �%T@@@���0connection_state��@����!t��� �Us�� �Ut@@��� �Us�� �Ut@@@��!s��� �Ux�� �Uz@@@��� �Us�� �Uz@@@��@�����)Transport!t��� �|��� �|�@@��  �|�� �|�@@@���0dispatch_queries��@����!t�� ���� ���@@�� ���� ���@@@�����(Deferred!t�� ���� ���@���!a��" ����# ���@@@@��% ����& ���@@@��( ����) ���@@@���2on_handshake_error������%Raise��6 ����7 ���@A@��9 ����: ���@@����$Call��A ����B ���@@���@�����#Exn!t��N ����O ���@@��Q ����R ���@@@�����(Deferred!t��[ ����\ ��	@���!a��b ����c ���@@@@��e ����f ��	@@@��h ����i ��	@@@@��k ����l ��
@@@@@��n ����o ��@@@�����(Deferred!t��x ��y �!@���!a�� ��� �@@@@��� ��� �!@@@��� ����� �!@@@��� ����� �!@@@��� �|��� �!@@@��� �U\�� �!@@@��� �%,�� �!@@@��� �� �� �!@@@��� ����� �!@@@@�����	�@@ ��	�@@ �A�������
  � [with_close] tries to create a [t] using the given transport.  If a handshake error
      is the result, it calls [on_handshake_error], for which the default behavior is to
      raise an exception.  If no error results, [dispatch_queries] is called on [t].

      After [dispatch_queries] returns, if [server] is None, the [t] will be closed and
      the deferred returned by [dispatch_queries] wil be determined immediately.
      Otherwise, we'll wait until the other side closes the connection and then close [t]
      and determine the deferred returned by [dispatch_queries].

      When the deferred returned by [with_close] becomes determined, [Transport.close] has
      finished.

      NOTE: Because this connection is closed when the [Deferred.t] returned by
      [dispatch_queries] is determined, you should be careful when using this with
      [Pipe_rpc].  For example, simply returning the pipe when you get it will close the
      pipe immediately.  You should instead either use the pipe inside [dispatch_queries]
      and not determine its result until you are done with the pipe, or use a different
      function like [create]. @��� n-/�� ��@@@@��� n-/�� ��@@��	�@@ ��	�@@ �A@��� ����� �!@��� ����� �!@���Р1server_with_close��� �!'�� �!8@���1handshake_timeout������'Time_ns$Span!t��� �9V�� �9d@@��� �9V�� �9d@@@���0heartbeat_config�����0Heartbeat_config!t��� �e��� �e�@@��� �e��� �e�@@@��@�����)Transport!t��� ����� ���@@��� ����� ���@@@���/implementations�����/Implementations!t��� ����� ���@���!s��	 ����	 ���@@@@��	 ����		 ���@@@���0connection_state��@����!t��	 ����	 ���@@��	 ����	 ���@@@��!s��	 ����	  ���@@@��	" ����	# ���@@@���2on_handshake_error������%Raise��	0 � �	1 �&@A@��	3 � �	4 �&@@����&Ignore��	; �)�	< �0@A@��	> �)�	? �0@@����$Call��	F �3�	G �8@@���@�����#Exn!t��	S �=�	T �B@@��	V �=�	W �B@@@�����(Deferred!t��	` �K�	a �U@�����$unit��	i �F�	j �J@@��	l �F�	m �J@@@@��	o �F�	p �U@@@��	r �=�	s �U@@@@��	u �3�	v �V@@@@@��	x ��	y �X@@@�����(Deferred!t��	� �Ye�	� �Yo@�����$unit��	� �Y`�	� �Yd@@��	� �Y`�	� �Yd@@@@��	� �Y`�	� �Yo@@@��	� ��	� �Yo@@@��	� ����	� �Yo@@@��	� ����	� �Yo@@@��	� ����	� �Yo@@@��	� �el�	� �Yo@@@��	� �9@�	� �Yo@@@@�����
�@@ ��
�@@ �A�������	� Runs [with_close] but dispatches no queries. The implementations are required
      because this function doesn't let you dispatch any queries (i.e., act as a client),
      it would be pointless to call it if you didn't want to act as a server.@��	� �#%�	� �� @@@@��	� �#%�	� �� @@��
�@@ ��
�@@ �A@��	� �!#�	� �Yo@��	� �!#�	� �Yo@@��	�F � ��	� �ps@@@��	�F � ��	� �ps@��	�F � ��	� �ps@���@������	���	� �ps�	� �ps@@��	� �ps�	� �ps@@@��������3Ppx_inline_test_lib'Runtime)unset_lib��	� �ps�	� �ps@��	� �ps�	� �ps@@@��@���	�@��	� �ps�	� �ps@@@@��	� �ps�	� �ps@@@@��	� �ps�	� �ps@@��	� �ps�	� �ps@���@������	Ѱ�
 �ps�
 �ps@@��
	 �ps�

 �ps@@@��������5Expect_test_collector,Current_file%unset��
 �ps�
 �ps@��
 �ps�
 �ps@@@��@����"()��
$ �ps�
% �ps@@��
' �ps�
( �ps@@@@��
* �ps�
+ �ps@@@@��
- �ps�
. �ps@@��
0 �ps�
1 �ps@���@������
=��
< �ps�
= �ps@@��
? �ps�
@ �ps@@@���������-Ppx_bench_lib5Benchmark_accumulator/Current_libname%unset��
O �ps�
P �ps@��
R �ps�
S �ps@@@��@����"()��
\ �ps�
] �ps@@��
_ �ps�
` �ps@@@@��
b �ps�
c �ps@@@@��
e �ps�
f �ps@@��
h �ps�
i �ps@@