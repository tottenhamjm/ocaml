Caml1999N026����   2         	0book/duniverse/async_kernel.v0.13.0/src/pipe.mli���� na  ,�  �g  �������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � A buffered FIFO communication channel.

    A pipe has a "writer" end and a "reader" end.  The intent is that a writer feeds
    values into the pipe and then waits until it is notified that it should put more data
    in (referred to as "pushback").

    Each pipe contains a buffer that is a queue of values that have been written to the
    pipe but not yet read from the pipe.  The length of the queue is not bounded; whenever
    the pipe is written to, values are immediately enqueued.  However, writers are
    supposed to respect pushback from readers, either via the [unit Deferred.t] returned
    by [write] calls or by explicitly calling [pushback].

    If a pipe is empty, then readers queue up, waiting for values to be written.  As soon
    as values are written, if a reader is available to consume them, the values will be
    handed to the reader.

    One can use [downstream_flushed] to get notified by a pipe when all prior writes have
    been consumed by a reader.

    There are distinct [Reader] and [Writer] modules and types, but all of the operations
    on readers and writers are available directly from the [Pipe] module. @��	0book/duniverse/async_kernel.v0.13.0/src/pipe.mliA@@�U;�@@@@��A@@�U;�@@���@@ ���@@ �A��
A@@�U;�@������+Core_kernel��W���W��@@��W���W��@@��W���W��@���A�    �!t��$Y���%Y��@����!a��,Y���-Y��@@@B����'phantom��4Y���5Y��@@@B@@@A@���(deriving��;Y���<Y��@��������'sexp_of��GY���HY��@��JY���KY��@@@@��MY���NY��@@��PY���QY��@@��SY���TY��@@��VY���WY��@�����������-ocaml.warning��eY���fY��@�������#-32@��pY���qY��@@@@��sY���tY��@@��vY���wY��@��yY���zY��@���Р)sexp_of_t���Y����Y��@��@��@��`���Y����Y��@@@������1Ppx_sexp_conv_lib$Sexp!t���Y����Y��@@���Y����Y��@@@���Y����Y��@@@��@��@��s���Y����Y��@@@���������Y����Y��@@���Y����Y��@@@���Y����Y��@@@��@��������Y����Y��@�������Y����Y��@@@�������Y����Y��@@@@���Y����Y��@@@������BA@���Y����Y��@@���Y����Y��@@@���Y����Y��@@@���Y����Y��@@@���Y����Y��@@@@@���Y����Y��@���Y����Y��@@���Y����Y��@@���Y����Y��@���)ocaml.doc���Y����Y��@�������'@inline@�� Y���Y��@@@@��Y���Y��@@��Y���Y��@@��	Y���
Y��@���A�    �$pipe��Z���Z��@����!a��Z���Z��@@@B����'phantom��#Z���$Z��@@@B@@@A�����!t��,Z���-Z��@���!a��3Z���4Z��@@@���'phantom��:Z���;Z��@@@@��=Z���>Z��@@@���(deriving��DZ���EZ��@��������'sexp_of��PZ���QZ�@��SZ���TZ�@@@@��VZ���WZ�@@��YZ���ZZ�@@��\Z���]Z�@@��_Z���`Z�@�����������	��mZ���nZ�@�������@��wZ���xZ�@@@@��zZ���{Z�@@��}Z���~Z�@���Z����Z�@���Р,sexp_of_pipe���Z����Z��@��@��@��x���Z����Z��@@@���������Z����Z��@@���Z����Z��@@@���Z����Z��@@@��@��@������Z����Z��@@@���������Z����Z��@@���Z����Z��@@@���Z����Z��@@@��@��������Z����Z��@�������Z����Z��@@@�������Z����Z��@@@@���Z����Z��@@@������FED���Z����Z��@@���Z����Z��@@@���Z����Z��@@@���Z����Z��@@@���Z����Z��@@@@@���Z����Z�@���Z����Z�@@���Z����Z�@@���Z����Z�@������Z����Z�@�������@��Z���Z�@@@@��Z���Z�@@��Z���	Z�@@��Z���Z�@��������@@ ���@@ �A�������? {2 Reader and Writer modules} @��\		�\	-@@@@��!\		�"\	-@@��@@ ��@@ �A��'\		�(\	-@�����;��@@ ��@@ �A�������	I These provide reader- and writer-specific types for the base pipe type. @��:^//�;^/}@@@@��=^//�>^/}@@��+@@ ��,@@ �A��C^//�D^/}@�����&Writer��L`��M`�@�����A�    �'phantom��Xa���Ya��@@@@A@@��[a���\a��@@��^a���_a��@���A�    �!t��hb���ib��@����!a��pb���qb��@@@B@@@A�����$pipe��yb���zb��@���!a���b����b��@@@�����'phantom���b����b��@@���b����b��@@@@���b����b��@@@���(deriving���b����b��@��������'sexp_of���b����b��@���b����b��@@@@���b����b��@@���b����b��@@���b����b��@@���b����b��@�����������[���b����b��@�������Z@���b����b��@@@@���b����b��@@���b����b��@���b����b��@���Р)sexp_of_t���b����b��@��@��@��u���b����b��@@@������YXW���b����b��@@���b����b��@@@���b����b��@@@��@��������b����b��@������b���b��@@@@��b���b��@@@������zyx��b���b��@@��b���b��@@@��b���b��@@@��b���b��@@@@@��b���b��@��b���b��@@�� b���!b��@@��#b���$b��@���5��)b���*b��@�������4@��3b���4b��@@@@��6b���7b��@@��9b���:b��@@��<b���=b��@���Р)invariant��Ee���Fe��@��@����!t��Oe���Pe��@��@��Te���Ue��@@@@��We���Xe��@@@����$unit��_e���`e��@@��be���ce��@@@��ee���fe��@@@@@��he���ie��@��ke���le��@@��n`��of��@@@��q`�rf��@��t`�uf��@�����&Reader��}h��~h�
@�����A�    �'phantom���i��i@@@@A@@���i��i@@���i��i@���A�    �!t���j *��j +@����!a���j '��j )@@@B@@@A�����$pipe���j <��j @@���!a���j /��j 1@@@�����'phantom���j 3��j :@@���j 3��j :@@@@���j .��j @@@@���(deriving���j D��j L@��������'sexp_of���j M��j T@���j M��j T@@@@���j M��j T@@���j A��j U@@���j "��j U@@���j "��j U@���������������j "��j U@��������@���j "��j U@@@@���j "��j U@@�� j "�j U@��j "�j U@���Р)sexp_of_t��j *�j +@��@��@��u��j '�j )@@@�����������j '�j )@@��!j '�"j )@@@��$j '�%j )@@@��@�������-j *�.j +@������3j '�4j )@@@@��6j *�7j +@@@�����������?j *�@j +@@��Bj *�Cj +@@@��Ej *�Fj +@@@��Hj '�Ij )@@@@@��Kj "�Lj U@��Nj "�Oj U@@��Qj "�Rj U@@��Tj "�Uj U@���f��Zj "�[j U@�������e@��dj "�ej U@@@@��gj "�hj U@@��jj "�kj U@@��mj "�nj U@���Р)invariant��vmX^�wmXg@��@����!t���mXl��mXm@��@���mXj��mXk@@@@���mXj��mXm@@@����$unit���mXq��mXu@@���mXq��mXu@@@���mXj��mXu@@@@@���mXZ��mXu@���mXZ��mXu@@���h���nvy@@@���h����nvy@���h����nvy@���������@@ ���@@ �A�������. {2 Creation} @���p{{��p{�@@@@���p{{��p{�@@���@@ ���@@ �A���p{{��p{�@���Р-create_reader���}	�	���}	�	�@���2close_on_exception����$bool���~	�
��~	�
	@@���~	�
��~	�
	@@@��@��@�����&Writer!t���


��


@���!a���


��


@@@@���


��


@@@�����(Deferred!t���


$��


.@�����$unit��


�


#@@��


�


#@@@@��



�


.@@@��


�


.@@@�����&Reader!t�� @
0
8� @
0
@@���!a�� @
0
5� @
0
7@@@@��! @
0
5�" @
0
@@@@��$


�% @
0
@@@@��'~	�	��( @
0
@@@@@���)ocaml.doc��@@ ��@@ �A�������
  E [create_reader ~close_on_exception f] creates a new pipe, applies [f] to its writer
    end, and returns its reader end.  [create_reader] closes the writer end when the
    result of [f] becomes determined.  If [f] raises, then the exception is raised
    to the caller of [create_reader].  Whether or not [create_reader] closes the writer
    end upon [f] raising is determined by [close_on_exception].

    Choosing [~close_on_exception:false] is recommended, because normally closing the
    write end of a pipe is taken to mean that the writer completed successfully.  With
    [close_on_exception:true], the caller will both see the pipe closed and an exception
    will be raised to the monitor in effect when [create_reader] was called.  There is a
    race between those two actions, which can easily lead to confusion or bugs. @��9r���:|	�	�@@@@��<r���=|	�	�@@��*@@ ��+@@ �A@��B}	�	��C @
0
@@��E}	�	��F @
0
@@���Р-create_writer��N IX\�O IXi@��@��@�����&Reader!t��\ IXp�] IXx@���!a��c IXm�d IXo@@@@��f IXm�g IXx@@@�����(Deferred!t��p IX��q IX�@�����$unit��y IX|�z IX�@@��| IX|�} IX�@@@@�� IX|�� IX�@@@��� IXm�� IX�@@@�����&Writer!t��� IX��� IX�@���!a��� IX��� IX�@@@@��� IX��� IX�@@@��� IXl�� IX�@@@@���r���@@ ���@@ �A�������
   [create_writer] is symmetric with {{!create_reader}[create_reader]}.  It creates a new
    pipe, applies [f] to its reader end, and returns its writer end.  [create_writer]
    calls [close_read] when the result of [f] becomes determined.  If [f] raises,
    [create_writer] closes the pipe and raises the exception to the caller of
    [create_writer].  [create_writer] closes on exception, unlike [create_reader], because
    closing closing the read end of a pipe is a signal to the writer that the consumer has
    failed. @��� B
B
B�� HIW@@@@��� B
B
B�� HIW@@���@@ ���@@ �A@��� IXX�� IX�@��� IXX�� IX�@���Р$init��� K���� K��@��@��@�����&Writer!t��� K���� K��@���!a��� K���� K��@@@@��� K���� K��@@@�����(Deferred!t��� K���� K��@�����$unit��� K���� K��@@��� K���� K��@@@@��� K���� K��@@@��� K���� K��@@@�����&Reader!t��� K���� K��@���!a�� K��� K��@@@@�� K��� K��@@@��
 K��� K��@@@@���*deprecated�� L��� L��@�������	�[since 2016-03] Use [create_reader ~close_on_exception:true] to preserve behavior, though
you might want to consider changing the argument [close_on_exception] to the recommended
[false].� �� M��� O��@@@@��! M���" O��@@��$ L���% O��@@��' K���( O��@��* K���+ O��@���Р&create��3 Tsw�4 Ts}@��@����$unit��= Ts��> Ts�@@��@ Ts��A Ts�@@@��������&Reader!t��M Ts��N Ts�@���!a��T Ts��U Ts�@@@@��W Ts��X Ts�@@@������&Writer!t��b Ts��c Ts�@���!a��i Ts��j Ts�@@@@��l Ts��m Ts�@@@@��o Ts��p Ts�@@@��r Ts��s Ts�@@@@���K��c@@ ��d@@ �A�������	� [create ()] creates a new pipe.  It is preferable to use [create_reader] or
    [create_writer] instead of [create], since they provide exception handling and
    automatic closing of the pipe. @��� Q���� SMr@@@@��� Q���� SMr@@��t@@ ��u@@ �A@��� Tss�� Ts�@��� Tss�� Ts�@���Р'of_list��� W���� W��@��@����$list��� W��� W�	@���!a��� W��� W�@@@@��� W��� W�	@@@�����&Reader!t��� W��� W�@���!a��� W��� W�@@@@��� W��� W�@@@��� W��� W�@@@@�������@@ ���@@ �A�������	K [of_list l] returns a closed pipe reader filled with the contents of [l]. @��� V���� V��@@@@��� V���� V��@@���@@ ���@@ �A@��� W���� W�@��� W���� W�@���Р)singleton��� Znr�� Zn{@��@��!a��� Zn~�� Zn�@@@�����&Reader!t��� Zn��� Zn�@���!a�� Zn�� Zn�@@@@�� Zn�� Zn�@@@�� Zn~�	 Zn�@@@@������@@ ���@@ �A�������	N [singleton x] returns a closed pipe reader filled with the single value [x]. @�� Y� Ym@@@@�� Y� Ym@@��
@@ ��@@ �A@��" Znn�# Zn�@��% Znn�& Zn�@���Р&unfold��. e48�/ e4>@���$init��!s��8 e4F�9 e4H@@@���!f��@��!s��D e4O�E e4Q@@@�����(Deferred!t��N e4f�O e4p@�����&option��W e4_�X e4e@������!a��a e4V�b e4X@@@���!s��h e4[�i e4]@@@@��k e4V�l e4]@@@@��n e4U�o e4e@@@@��q e4U�r e4p@@@��t e4O�u e4p@@@�����&Reader!t��~ e4x� e4�@���!a��� e4u�� e4w@@@@��� e4u�� e4�@@@��� e4L�� e4�@@@��� e4A�� e4�@@@@���g��@@ ���@@ �A�������
  � [unfold ~init ~f] returns a pipe that it fills with ['a]s by repeatedly applying [f]
    to values of the state type ['s].  When [f] returns [None], the resulting pipe is
    closed.  [unfold] respects pushback on the resulting pipe.  If [f] raises, then the
    pipe is not closed.

    For example, to create a pipe of natural numbers:

    {[
      Pipe.unfold ~init:0 ~f:(fun n -> return (Some (n, n+1))) ]} @��� \���� d�3@@@@��� \���� d�3@@���@@ ���@@ �A@��� e44�� e4�@��� e44�� e4�@���Р+of_sequence��� i$(�� i$3@��@�����(Sequence!t��� i$9�� i$C@���!a��� i$6�� i$8@@@@��� i$6�� i$C@@@�����&Reader!t��� i$J�� i$R@���!a��� i$G�� i$I@@@@��� i$G�� i$R@@@��� i$6�� i$R@@@@�������@@ ���@@ �A�������	� [of_sequence sequence] returns a pipe reader that gets filled with the elements of
    [sequence].  [of_sequence] respects pushback on the resulting pipe. @��� g���� h�#@@@@��� g���� h�#@@���@@ ���@@ �A@��� i$$�� i$R@��� i$$�� i$R@���A�    �/to_sequence_elt�� o���	 o��@����!a�� o��� o��@@@B@@��Р%Value�� p��� p��@����!a��  p���! p��@@@@@��# p���$ p��@@�Р(Wait_for��* q���+ q��@�������(Deferred!t��6 q���7 q��@��@��; q���< q��@@@@��> q���? q��@@@@�����/to_sequence_elt��G q���H q��@��@��L q���M q��@@@@��O q���P q��@@@��R q���S q��@@@A@���+��	C@@ ��	D@@ �A�������
  - [to_sequence reader] returns a sequence that can be consumed to extract values from
    [reader].  If [Wait_for d] is returned, the consumer must wait for [d] to become
    determined before pulling the next value.  Repeatedly asking for the next value
    without waiting on [d] will infinite loop. @��c kTT�d nU�@@@@��f kTT�g nU�@@��	T@@ ��	U@@ �A@��l o���m q��@@��o o���p q��@���Р+to_sequence��x s���y s��@��@�����&Reader!t��� s���� s� @���!a��� s���� s��@@@@��� s���� s� @@@�����(Sequence!t��� s��� s�!@�����/to_sequence_elt��� s��� s�@���!a��� s��� s�@@@@��� s��� s�@@@@��� s��� s�!@@@��� s���� s�!@@@@@��� s���� s�!@��� s���� s�!@�����˰�	�@@ ��	�@@ �A�������- {2 Closing} @��� u##�� u#5@@@@��� u##�� u#5@@��	�@@ ��	�@@ �A��� u##�� u#5@���Р%close��� �FJ�� �FO@��@�����&Writer!t��� �FT�� �F\@��@��� �FR�� �FS@@@@��� �FR�� �F\@@@����$unit��� �F`�� �Fd@@��� �F`�� �Fd@@@��� �FR�� �Fd@@@@���װ�	�@@ ��	�@@ �A�������
  	 [close t] closes the write end of the pipe:

    - Future write attempts will fail, raising an exception.

    - If, at the time of the close, there are reads blocked waiting for data, these reads
      will unblock, producing [`Eof].

    - Future read attempts will drain the data that was in the pipe at the time of the
      close, until the pipe's buffer has been exhausted; subsequent reads will immediately
      get [`Eof].

    Thus, after a pipe has been closed, reads never block.

    [close] is idempotent. @��	 w77�	 �(E@@@@��	 w77�	 �(E@@��
 @@ ��
@@ �A@��	 �FF�	 �Fd@��	 �FF�	 �Fd@���Р*close_read��	$ �vz�	% �v�@��@�����&Reader!t��	0 �v��	1 �v�@��@��	5 �v��	6 �v�@@@@��	8 �v��	9 �v�@@@����$unit��	@ �v��	A �v�@@��	C �v��	D �v�@@@��	F �v��	G �v�@@@@�����
7@@ ��
8@@ �A�������
  
 [close_read t] closes both the read and write ends of the pipe.  It does everything
    [close] does, and in addition:

    - all pending flushes become determined with [`Reader_closed].
    - the pipe buffer is cleared.
    - all subsequent reads will get [`Eof]. @��	W �ff�	X �Gu@@@@��	Z �ff�	[ �Gu@@��
H@@ ��
I@@ �A@��	` �vv�	a �v�@��	c �vv�	d �v�@���Р)is_closed��	l ����	m ���@��@����!t��	v ���	w ��@��@��	{ ���	| ��@@@��@��	� ���	� ��@@@@��	� �� �	� ��@@@����$bool��	� ���	� ��@@��	� ���	� ��@@@��	� �� �	� ��@@@@���j��
�@@ ��
�@@ �A�������	O [is_closed t] returns [true] iff [close t] or [close_read t] has been called. @��	� ����	� ���@@@@��	� ����	� ���@@��
�@@ ��
�@@ �A@��	� ����	� ��@��	� ����	� ��@���Р&closed��	� ���	� ��@��@����!t��	� ���	� ��@��@��	� ���	� ��@@@��@��	� ���	� ��@@@@��	� ���	� ��@@@�����(Deferred!t��	� ���	� ��@�����$unit��	� ���	� ��@@��	� ���	� ��@@@@��	� ���	� ��@@@��	� ���	� ��@@@@���ð�
�@@ ��
�@@ �A�������	g [closed t] returns a deferred that becomes determined when [close t] or [close_read t]
    is called. @��	� ��	� �m~@@@@��	� ��	� �m~@@��
�@@ ��
�@@ �A@��
 ��
 ��@��
 ��
 ��@�����
��
�@@ ��
�@@ �A�������. {2 Flushing} @��
 ����
 ���@@@@��
 ����
 ���@@��@@ ��@@ �A��
# ����
$ ���@�����.Flushed_result��
, ����
- ���@�����A�    �!t��
8 ����
9 ���@@@@A�������"Ok��
C ����
D ���@A@��
F ����
G ���@@����-Reader_closed��
N ����
O ��@A@��
Q ����
R ��@@@@@��
T ����
U �	@@@���(deriving��
[ �
�
\ �
@��������'sexp_of��
g �
�
h �
@��
j �
�
k �
@@@@��
m �
�
n �
@@��
p �
�
q �
 @@��
s ����
t �
 @@��
v ����
w �
 @�����������
 ��
� ����
� �
 @�������
@��
� ����
� �
 @@@@��
� ����
� �
 @@��
� ����
� �
 @��
� ����
� �
 @���Р)sexp_of_t��
� ����
� ���@��@����r��
� ����
� ���@@��
� ����
� ���@@@������
!
 
��
� ����
� ���@@��
� ����
� ���@@@��
� ����
� ���@@@@@��
� ����
� �
 @��
� ����
� �
 @@��
� ����
� �
 @@��
� ����
� �
 @���	ٰ�
� ����
� �
 @�������	�@��
� ����
� �
 @@@@��
� ����
� �
 @@��
� ����
� �
 @@��
� ����
� �
 @@��
� ����
� �!$@@@��
� ����
� �!$@��
� ����
� �!$@�����
����@@ ���@@ �A�������
  o Deferreds returned by [upstream_flushed] and [downstream_flushed] become determined
    when all values written prior to the call have been consumed, or if the reader end of
    the pipe is closed.  The difference between "upstream" and "downstream" comes if one
    has a chain of pipes that are linked (e.g., by [Pipe.map]):

    {v P1 --> P2 --> P3 v}

    Calling [downstream_flushed P2] ensures that everything in P2 has made it out of P3.
    Calling [upstream_flushed P2] ensures that everything in P1 has made it out of P3.
    More generally, [downstream_flushed] starts at the current pipe and follows the chain
    to the final downstream consumer(s).  [upstream_flushed] follows the chain to the
    initial upstream pipe(s), and then calls [downstream_flushed].

    For a pipe in isolation, "consumed" means "read from the pipe".  However, for pipes
    linked together with [transfer] or any function built from [transfer], "consumed"
    means "propagated all the way downstream through the chain and read from the final
    pipe in the chain".  Furthermore, for a pipe ultimately connected to an
    [Async.Writer], "consumed" means the OS write() system call has completed on the bytes
    read from the final pipe in the chain.

    The following [Pipe] functions automatically link their input and output pipes
    together so that [*_flushed] on upstream pipes will propagate to downstream pipes:
    [transfer*], [map*], [filter_map*], [filter], [interleave], [concat].  There is {e
    not} automatic linking with [iter*]; however, user code can customize the behavior of
    flush functions using {{!Consumer}[Consumer]}. @��
� �&&�
� �e�@@@@��
� �&&�  �e�@@���@@ ���@@ �A�� �&&� �e�@���Р0upstream_flushed�� ���� ���@��@����!t�� ���� ���@��@�� ���� ���@@@��@��" ����# ���@@@@��% ����& ���@@@�����(Deferred!t��/ ����0 ���@������.Flushed_result!t��: ����; ���@@��= ����> ���@@@@��@ ����A ���@@@��C ����D ���@@@@@��F ����G ���@��I ����J ���@���Р2downstream_flushed��R ����S ���@��@����!t��\ ����] ���@��@��a ����b ���@@@��@��f ����g ���@@@@��i ����j ���@@@�����(Deferred!t��s �� �t �� @������.Flushed_result!t��~ ��  � �� @@��� ��  �� �� @@@@��� ��  �� �� @@@��� ����� �� @@@@@��� ����� �� @��� ����� �� @�����(Consumer��� �  $�� �  ,@�����������@@ ���@@ �A�������
  	$ A [Consumer] is used to augment our notion of flushing ([Pipe.upstream_flushed] and
      [Pipe.downstream_flushed]) to include the time spent processing an element once it
      has been removed from the pipe.  It can be thought of as sitting at the end of a
      pipe, or between two pipes, and it provides more detailed feedback on the time an
      element spends outside of the pipe proper.  So we have the following two cases:

      {v
        Pipe --> Consumer
        Pipe --> Consumer --> Pipe --> ...
      v}


      The time outside of the pipe can be broken down into two parts: a part (probably
      short-lived) during which the consumer processes the elements in some way, and a
      downstream portion where the consumer acts as a sentinel to report when the element
      has been fully processed.

      For instance, consider the simple case of a pipe attached to an [Async.Writer]
      that is writing elements to disk.  Part one would be whatever transform the consumer
      applies to the elements in the pipe before it hands them off to the writer, and part
      two would be waiting for the writer to finish writing the transformed element to
      disk.  A more complex case is chaining two pipes together (maybe with a transform
      like [map]).  Part one in this case is the transform and the write to the downstream
      pipe, and part two is waiting for that pipe (and any further pipes in the chain) to
      flush.

      In each case the consumer is responsible for indicating when:

      - it has finished any local work (by attaching itself to elements via the ~consumer
        argument to [read] and [read']) and calling [values_sent_downstream] when it has
        sent the values downstream.

      - when any further processing has been completed (by providing an appropriate
        function to [~downstream_flushed] when [add_consumer] is called).

      If a reader does not use a consumer to do the reading then an element is considered
      flushed the moment it leaves the pipe.  This may lead to odd results as entire
      queues of elements are removed by a call to [read'] but are processed over a long
      period.  In particular, the [fold*] and [iter*] functions cause values to be flushed
      as soon as they are read, unless one passes [~flushed:When_value_processed]. @��� � 3 5�� �)	)^@@@@��� � 3 5�� �)	)^@@���@@ ���@@ �A��� � 3 5�� �)	)^@���A�    �!t��� �)`)g�� �)`)h@@@@A@@��� �)`)b�� �)`)h@@��� �)`)b�� �)`)h@���Р6values_sent_downstream��� �)j)p�� �)j)�@��@����!t��� �)j)��� �)j)�@@��� �)j)��� �)j)�@@@����$unit��� �)j)��� �)j)�@@��� �)j)��� �)j)�@@@��� �)j)��� �)j)�@@@@@��� �)j)l�� �)j)�@��� �)j)l�� �)j)�@@��� �  /�� �)�)�@@@��� �  �� �)�)�@��� �  �� �)�)�@���Р,add_consumer��  �+�,� �+�,@��@�����&Reader!t�� �,,� �,,@��@�� �,,� �,,@@@@�� �,,� �,,@@@���2downstream_flushed��@����$unit��" �,,7�# �,,;@@��% �,,7�& �,,;@@@�����(Deferred!t��/ �,,P�0 �,,Z@������.Flushed_result!t��: �,,?�; �,,O@@��= �,,?�> �,,O@@@@��@ �,,?�A �,,Z@@@��C �,,7�D �,,Z@@@�����(Consumer!t��M �,\,a�N �,\,k@@��P �,\,a�Q �,\,k@@@��S �,,#�T �,\,k@@@��V �,,�W �,\,k@@@@���/��G@@ ��H@@ �A�������
  _ [add_consumer reader ~downstream_flushed] creates a new consumer of [reader], and
    causes future calls to [flushed_downstream reader] to take this consumer into account.
    Thereafter, [Pipe.flushed_downstream reader] will first ensure that values previously
    written to [reader] have been read, then that they have been sent downstream by the
    consumer that read them, and finally that they have been flushed downstream.

    One should only supply the resulting consumer to read operations on [reader].  Using
    a consumer created from one reader with another reader will raise an exception. @��g �)�)��h �+�+�@@@@��j �)�)��k �+�+�@@��X@@ ��Y@@ �A@��p �+�+��q �,\,k@��s �+�+��t �,\,k@��������f@@ ��g@@ �A�������= {2 Generic pipe operations} @��� �,m,m�� �,m,�@@@@��� �,m,m�� �,m,�@@��w@@ ��x@@ �A��� �,m,m�� �,m,�@���������@@ ���@@ �A�������	a These operations apply to all values of type [(_, _) t], that is, both readers and
    writers. @��� �,�,��� �,�,�@@@@��� �,�,��� �,�,�@@���@@ ���@@ �A��� �,�,��� �,�,�@���Р&length��� �-C-G�� �-C-M@��@����!t��� �-C-W�� �-C-X@��@��� �-C-Q�� �-C-R@@@��@��� �-C-T�� �-C-U@@@@��� �-C-P�� �-C-X@@@����#int��� �-C-\�� �-C-_@@��� �-C-\�� �-C-_@@@��� �-C-P�� �-C-_@@@@�������@@ ���@@ �A�������	D [length t] returns the number of elements currently queued in [t]. @��� �,�,��� �,�-B@@@@��� �,�,��� �,�-B@@���@@ ���@@ �A@��� �-C-C�� �-C-_@��� �-C-C�� �-C-_@���Р(is_empty���-�-�� -�-�@��@����!t��	-�-��
-�-�@��@��-�-��-�-�@@@��@��-�-��-�-�@@@@��-�-��-�-�@@@����$bool��-�-��-�-�@@��!-�-��"-�-�@@@��$-�-��%-�-�@@@@������@@ ��@@ �A�������	; [is_empty t] is true iff there are no values in the pipe. @��5-a-a�6-a-�@@@@��8-a-a�9-a-�@@��&@@ ��'@@ �A@��>-�-��?-�-�@��A-�-��B-�-�@�����U��4@@ ��5@@ �A�������- {2 Writing} @��T-�-��U-�-�@@@@��W-�-��X-�-�@@��E@@ ��F@@ �A��]-�-��^-�-�@�����q��P@@ ��Q@@ �A�������
  \ The write operations return a deferred value that is determined when either (1) it is
    OK to write again to the pipe or (2) the pipe has been closed.  This deferred is the
    data-producer's interface to the pipe pushback mechanism: it tells the producer when
    it should proceed after doing a write -- either to produce and write more data to the
    pipe, or to abandon production entirely.  The pushback mechanism is just advisory: a
    producer task can, but typically should not, dump arbitrary amounts of data into a
    pipe even if there is no consumer draining it.

    Producers that write a sequence of values to a pipe should be aware that the consumers
    who read from the pipe can close the pipe early -- that is, before the producer has
    finished doing all of its writes.  If this happens, further writes will raise an
    exception.  To avoid these errors, all writes must be atomically guarded by
    [is_closed] tests.  Thus, a typical writer loop should look like this:

    {[
      fun countup hi w = (* Send the ints in range \[0,hi) to writer W. *)
        let rec loop i =
          if i < hi and not (is_closed w) then (* Guard write w/closed test. *)
      write i w >>>            (* Do the write then block until datum     *)
      fun () -> loop (i+1)     (*   fits or the pipe is closed.           *)
      else close w (* No harm done if reader has already closed the pipe.*)
    in
    loop 0 ]}

    If the pipe's consumer stops reading early and closes the pipe, [countup] won't error
    out trying to write further values down the pipe: it will immediately wake up and
    exit. @��p-�-��q 4,48@@@@��s-�-��t 4,48@@��a@@ ��b@@ �A��y-�-��z 4,48@���Р(pushback���$4�4���$4�4�@��@�����&Writer!t���$4�4���$4�4�@���!a���$4�4���$4�4�@@@@���$4�4���$4�4�@@@�����(Deferred!t���$4�4���$4�4�@�����$unit���$4�4���$4�4�@@���$4�4���$4�4�@@@@���$4�4���$4�4�@@@���$4�4���$4�4�@@@@�������@@ ���@@ �A�������	s [pushback writer] becomes determined when either [writer] has been closed or
    the pipe can accept a new write. @���"4:4:��#4�4�@@@@���"4:4:��#4�4�@@���@@ ���@@ �A@���$4�4���$4�4�@���$4�4���$4�4�@���Р%write���67�7���67�7�@��@�����&Writer!t���67�7���67�7�@���!a���67�7���67�7�@@@@���67�7���67�7�@@@��@��!a���67�7���67�7�@@@�����(Deferred!t��67�7��67�7�@�����$unit��67�7��67�7�@@��67�7��67�7�@@@@��67�7��67�7�@@@��67�7��67�7�@@@��67�7��67�7�@@@@�����@@ ��	@@ �A�������
  � [write writer a] enqueues [a] in [writer], returning a pushback deferred, as described
    above.

    [transfer_in writer ~from:q] transfers the elements from [q] into [writer], leaving
    [q] empty, and returning a pushback deferred.

    [write_without_pushback] and [transfer_in_without_pushback] are alternatives to
    [transfer_in] and [write] that can be used when you don't care about the pushback
    deferred.  They add data to the pipe and return immediately.

    The following equivalences hold:

    - [write t a = write_without_pushback t a; pushback t]
    - [transfer_in t ~from = transfer_in_without_pushback t ~from; pushback t]

    If [is_closed writer], then all of these functions raise. @��(&4�4��)57q7�@@@@��+&4�4��,57q7�@@��@@ ��@@ �A@��167�7��267�7�@��467�7��567�7�@���Р6write_without_pushback��=87�7��>87�7�@��@�����&Writer!t��I87�8�J87�8@���!a��P87�8�Q87�8@@@@��S87�8�T87�8@@@��@��!a��[87�8�\87�8@@@����$unit��c87�8�d87�8@@��f87�8�g87�8@@@��i87�8�j87�8@@@��l87�8�m87�8@@@@@��o87�7��p87�8@��r87�7��s87�8@���Р+transfer_in��{988�|988*@��@�����&Writer!t���9880��9888@���!a���988-��988/@@@@���988-��9888@@@���$from�����%Queue!t���988D��988K@���!a���988A��988C@@@@���988A��988K@@@�����(Deferred!t���988T��988^@�����$unit���988O��988S@@���988O��988S@@@@���988O��988^@@@���988<��988^@@@���988-��988^@@@@@���988��988^@���988��988^@���Р<transfer_in_without_pushback���:8_8c��:8_8@��@�����&Writer!t���:8_8���:8_8�@���!a���:8_8���:8_8�@@@@���:8_8���:8_8�@@@���$from�����%Queue!t���:8_8���:8_8�@���!a��:8_8��:8_8�@@@@��:8_8��:8_8�@@@����$unit��:8_8��:8_8�@@��:8_8��:8_8�@@@��:8_8��:8_8�@@@��:8_8��:8_8�@@@@@��:8_8_�:8_8�@��:8_8_�:8_8�@���Р0write_when_ready��%@::�&@::@��@�����&Writer!t��1A: :(�2A: :0@���!a��8A: :%�9A: :'@@@@��;A: :%�<A: :0@@@���!f��@��@��!a��IB:1::�JB:1:<@@@����$unit��QB:1:@�RB:1:D@@��TB:1:@�UB:1:D@@@��WB:1::�XB:1:D@@@��!b��]B:1:I�^B:1:K@@@��`B:1:9�aB:1:K@@@�����(Deferred!t��jC:M:j�kC:M:t@�������&Closed��uC:M:T�vC:M:[@A@��xC:M:T�yC:M:[@@����"Ok���C:M:^��C:M:a@@���!b���C:M:e��C:M:g@@@@���C:M:^��C:M:g@@@@@���C:M:R��C:M:i@@@@���C:M:R��C:M:t@@@���B:1:6��C:M:t@@@���A: :%��C:M:t@@@@���
o���@@ ���@@ �A�������
  [ [write_when_ready writer ~f] waits until there is space available in the pipe, and
    then calls [f write], where [write] can be used by [f] to write a single value into
    the pipe at a time.  [write_when_ready] guarantees that the pipe is open when it calls
    [f], and hence that the writes will succeed, unless [f] itself closes the pipe. @���<8�8���?9�:
@@@@���<8�8���?9�:
@@���@@ ���@@ �A@���@::��C:M:t@���@::��C:M:t@���Р-write_if_open���P;�<��P;�<@��@�����&Writer!t���P;�<��P;�<@���!a���P;�<��P;�<@@@@���P;�<��P;�<@@@��@��!a���P;�<"��P;�<$@@@�����(Deferred!t���P;�<-��P;�<7@�����$unit���P;�<(��P;�<,@@���P;�<(��P;�<,@@@@���P;�<(��P;�<7@@@���P;�<"��P;�<7@@@���P;�<��P;�<7@@@@���
Ұ��@@ ���@@ �A�������
  � [write_if_open w e] is equivalent to:

    {[
      let x = e in
      if not (is_closed w) then (write w x) else (return ()) ]}

    Note the difference in allocation and potential side effects when [w] is closed and
    [e] is a complex expression.

    [write_without_pushback_if_open] is the same as [write_if_open], except it calls
    [write_without_pushback] instead of [write]. @��
E:v:v�O;�;�@@@@��E:v:v�O;�;�@@���@@ ���@@ �A@��P;�;��P;�<7@��P;�;��P;�<7@���Р>write_without_pushback_if_open��R<9<=� R<9<[@��@�����&Writer!t��+R<9<a�,R<9<i@���!a��2R<9<^�3R<9<`@@@@��5R<9<^�6R<9<i@@@��@��!a��=R<9<m�>R<9<o@@@����$unit��ER<9<s�FR<9<w@@��HR<9<s�IR<9<w@@@��KR<9<m�LR<9<w@@@��NR<9<^�OR<9<w@@@@@��QR<9<9�RR<9<w@��TR<9<9�UR<9<w@�����h��G@@ ��H@@ �A�������- {2 Reading} @��gT<y<y�hT<y<�@@@@��jT<y<y�kT<y<�@@��X@@ ��Y@@ �A��pT<y<y�qT<y<�@��������c@@ ��d@@ �A�������
  3 With two special exceptions, all read procedures have a best-effort/forward-progress
    semantics:

    - Best effort: When you do a read, you get what's available {e right now}, which might
      be less than you requested.

    - Forward progress: However, if {e nothing is available}, you block until some data
      comes in (unless you're at EOF, in which case there's obviously no point in waiting).
      So the only time you ever get an empty, 0-item read is when you're at EOF.

    The best-effort semantics allows you to program in a style that processes data in big
    slabs, yet also moves data through your processing in as timely a way as possible.

    The forward-progress semantics means that every call produces {e some} data, so you
    can process an n-element input with at most n reads; you cannot burn an unbounded
    number of cycles "spinning" doing an unbounded number of empty-result "polling" calls
    (which, in a non-preemptive system like Async could lock up the process).

    The two exceptions to best-effort/forward-progress semantics are [read_now], which
    polls for data, thus abandoning the forward-progress guarantee, and [read_exactly],
    which loops until it has read the entire amount requested (or encountered EOF), thus
    abandoning the best-effort guarantee of timeliness. @���V<�<���kA�A�@@@@���V<�<���kA�A�@@��t@@ ��u@@ �A���V<�<���kA�A�@���Р%read'���qCC��qCC@���(consumer�����(Consumer!t���rCC,��rCC6@@���rCC,��rCC6@@@���0max_queue_length����#int���sC7CN��sC7CQ@@���sC7CN��sC7CQ@@�������@@ ���@@ �A�������< default is [Int.max_value] @���sC7CR��sC7Cs@@@@���sC7CR��sC7Cs@@���@@ ���@@ �A@��@�����&Reader!t���tCtC|��tCtC�@���!a���tCtCy��tCtC{@@@@���tCtCy��tCtC�@@@�����(Deferred!t���uC�C���uC�C�@�������#Eof���uC�C���uC�C�@A@���uC�C���uC�C�@@����"Ok��uC�C��uC�C�@@������%Queue!t��uC�C��uC�C�@���!a��uC�C��uC�C�@@@@��uC�C��uC�C�@@@@��uC�C��uC�C�@@@@@��uC�C��uC�C�@@@@�� uC�C��!uC�C�@@@��#tCtCy�$uC�C�@@@��&sC7C<�'uC�C�@@@��)rCC"�*uC�C�@@@@�����@@ ��@@ �A�������
  F [read' pipe] reads values available in the pipe, as soon as any value becomes
    available.  The resulting queue will satisfy [0 < Queue.length q <= max_queue_length].
    [read'] raises if [max_queue_length <= 0].  The [consumer] is used to extend the
    meaning of values being flushed (see the [Consumer] module above). @��:mA�A��;pB�C@@@@��=mA�A��>pB�C@@��+@@ ��,@@ �A@��CqCC�DuC�C�@��FqCC�GuC�C�@���Р$read��OyDWD[�PyDWD_@���(consumer�����(Consumer!t��]yDWDl�^yDWDv@@��`yDWDl�ayDWDv@@@��@�����&Reader!t��lyDWD}�myDWD�@���!a��syDWDz�tyDWD|@@@@��vyDWDz�wyDWD�@@@�����(Deferred!t���yDWD���yDWD�@�������#Eof���yDWD���yDWD�@A@���yDWD���yDWD�@@����"Ok���yDWD���yDWD�@@���!a���yDWD���yDWD�@@@@���yDWD���yDWD�@@@@@���yDWD���yDWD�@@@@���yDWD���yDWD�@@@���yDWDz��yDWD�@@@���yDWDb��yDWD�@@@@�������@@ ���@@ �A�������	� [read pipe] reads a single value from the pipe.  The [consumer] is used to extend the
    meaning of values being flushed (see the [Consumer] module above). @���wC�C���xDDV@@@@���wC�C���xDDV@@���@@ ���@@ �A@���yDWDW��yDWD�@���yDWDW��yDWD�@���Р,read_at_most���|D�D���|D�E	@���(consumer�����(Consumer!t���}E
E��}E
E#@@���}E
E��}E
E#@@@��@�����&Reader!t���~E$E,��~E$E4@���!a���~E$E)��~E$E+@@@@���~E$E)��~E$E4@@@���*num_values����#int��E5EE�E5EH@@��E5EE�	E5EH@@@�����(Deferred!t���EIEk��EIEu@�������#Eof���EIEP��EIET@A@�� �EIEP�!�EIET@@����"Ok��(�EIEW�)�EIEZ@@������%Queue!t��3�EIEa�4�EIEh@���!a��:�EIE^�;�EIE`@@@@��=�EIE^�>�EIEh@@@@��@�EIEW�A�EIEh@@@@@��C�EIEN�D�EIEj@@@@��F�EIEN�G�EIEu@@@��IE5E:�J�EIEu@@@��L~E$E)�M�EIEu@@@��O}E
E�P�EIEu@@@@���(��@@@ ��A@@ �A�������	I [read_at_most t ~num_values] is [read' t ~max_queue_length:num_values]. @��`{D�D��a{D�D�@@@@��c{D�D��d{D�D�@@��Q@@ ��R@@ �A���*deprecated��m�EvEy�n�EvE�@�������	-[since 2015-12] Use [read' ~max_queue_length]@��x�EvE��y�EvE�@@@@��{�EvE��|�EvE�@@��~�EvEv��EvE�@@���|D�D����EvE�@���|D�D����EvE�@���Р,read_exactly����G�G����G�G�@���(consumer�����(Consumer!t����G�G����G�G�@@����G�G����G�G�@@@��@�����&Reader!t����H H���H H@���!a����H H���H H@@@@����H H���H H@@@���*num_values����#int����HH!���HH$@@����HH!���HH$@@@�����(Deferred!t����H�H����H�H�@�������#Eof����H%H,���H%H0@A@����H%H,���H%H0@@����%Fewer����H1H8���H1H>@@������%Queue!t����H1HE���H1HL@���!a����H1HB���H1HD@@@@����H1HB���H1HL@@@@����H1H8���H1HL@���԰��@@ ���@@ �A�������? [0 < Q.length q < num_values] @���H1HM��H1Hq@@@@���H1HM��H1Hq@@���@@ ���@@ �A@����'Exactly���HrHy��HrH�@@������%Queue!t��%�HrH��&�HrH�@���!a��,�HrH��-�HrH�@@@@��/�HrH��0�HrH�@@@@��2�HrHy�3�HrH�@�����#@@ ��$@@ �A�������; [Q.length q = num_values] @��C�HrH��D�HrH�@@@@��F�HrH��G�HrH�@@��4@@ ��5@@ �A@@@@��L�H%H*�M�H�H�@@@@��O�H%H*�P�H�H�@@@��R�HH�S�H�H�@@@��U�H H�V�H�H�@@@��X�G�G��Y�H�H�@@@@���1��I@@ ��J@@ �A�������
   [read_exactly r ~num_values] reads exactly [num_values] items, unless EOF is
    encountered.  [read_exactly] performs a sequence of [read_at_most] operations, so
    there is no guarantee that the queue of values it returns comprise a contiguous
    segment of the written stream of values -- other readers might pick off elements
    in-between [read_exactly]'s atomic reads.  [read_exactly] raises if [num_values <= 0].
    The [consumer] is used to extend the meaning of values being flushed (see the
    [Consumer] module above). @��i�E�E��j�G�G�@@@@��l�E�E��m�G�G�@@��Z@@ ��[@@ �A@��r�G�G��s�H�H�@��u�G�G��v�H�H�@���Р)read_now'��~�JzJ~��JzJ�@���(consumer�����(Consumer!t����J�J����J�J�@@����J�J����J�J�@@@���0max_queue_length����#int����J�J����J�J�@@����J�J����J�J�@@���w���@@ ���@@ �A�������< default is [Int.max_value] @����J�J����J�J�@@@@����J�J����J�J�@@���@@ ���@@ �A@��@�����&Reader!t����J�J����J�J�@���!a����J�J����J�J�@@@@����J�J����J�J�@@@������#Eof����J�J����J�J�@A@����J�J����J�J�@@����1Nothing_available����J�J����J�K@A@����J�J����J�K@@����"Ok����J�K���J�K@@������%Queue!t����J�K���J�K$@���!a����J�K���J�K@@@@�� �J�K��J�K$@@@@���J�K��J�K$@@@@@���J�J���J�K&@@@��	�J�J��
�J�K&@@@���J�J���J�K&@@@���J�J���J�K&@@@@����� @@ ��@@ �A�������
  � [read_now' reader] reads values from [reader] that are immediately available.  If
    [reader] is closed, [read_now'] returns [`Eof].  If [reader] is empty, [read_now']
    returns [`Nothing_available].  Otherwise, [`Ok q] is returned, and the resulting queue
    will satisfy [0 < Q.length q <= max_queue_length].  The [consumer] is used to extend
    the meaning of values being flushed (see the [Consumer] module above). @�� �H�H��!�J,Jy@@@@��#�H�H��$�J,Jy@@��@@ ��@@ �A@��)�JzJz�*�J�K&@��,�JzJz�-�J�K&@���Р(read_now��5�K�K��6�K�K�@���(consumer�����(Consumer!t��C�K�K��D�K�K�@@��F�K�K��G�K�K�@@@��@�����&Reader!t��R�K�K��S�K�K�@���!a��Y�K�K��Z�K�K�@@@@��\�K�K��]�K�K�@@@������#Eof��f�K�K��g�K�K�@A@��i�K�K��j�K�K�@@����1Nothing_available��q�K�K��r�K�K�@A@��t�K�K��u�K�K�@@����"Ok��|�K�K��}�K�K�@@���!a����K�L���K�L@@@@����K�K����K�L@@@@@����K�K����K�L@@@����K�K����K�L@@@����K�K����K�L@@@@���h���@@ ���@@ �A�������	s [read_now] is like [read_now'], except that it reads a single value rather than
    everything that is available. @����K(K(���K|K�@@@@����K(K(���K|K�@@���@@ ���@@ �A@����K�K����K�L@����K�K����K�L@���Р0read_now_at_most����L_Lc���L_Ls@���(consumer�����(Consumer!t����LtL����LtL�@@����LtL����LtL�@@@��@�����&Reader!t����L�L����L�L�@���!a����L�L����L�L�@@@@����L�L����L�L�@@@���*num_values����#int����L�L����L�L�@@����L�L����L�L�@@@������#Eof����L�L����L�L�@A@����L�L����L�L�@@����1Nothing_available�� �L�L���L�L�@A@���L�L���L�L�@@����"Ok���L�L���L�L�@@������%Queue!t���L�L���L�L�@���!a���L�L���L�L�@@@@�� �L�L��!�L�L�@@@@��#�L�L��$�L�L�@@@@@��&�L�L��'�L�L�@@@��)�L�L��*�L�L�@@@��,�L�L��-�L�L�@@@��/�LtLy�0�L�L�@@@@����� @@ ��!@@ �A�������	P [read_now_at_most t ~num_values] is [read_now' t ~max_queue_length:num_values] @��@�L	L	�A�L	L^@@@@��C�L	L	�D�L	L^@@��1@@ ��2@@ �A���*deprecated��M�L�L��N�L�L�@�������	0[since 2015-12] Use [read_now' ~max_queue_length@��X�L�L��Y�L�M*@@@@��[�L�L��\�L�M*@@��^�L�L��_�L�M+@@��a�L_L_�b�L�M+@��d�L_L_�e�L�M+@���Р$peek��m�M.M2�n�M.M6@��@�����&Reader!t��y�M.M<�z�M.MD@���!a����M.M9���M.M;@@@@����M.M9���M.MD@@@����&option����M.MK���M.MQ@���!a����M.MH���M.MJ@@@@����M.MH���M.MQ@@@����M.M9���M.MQ@@@@@����M.M.���M.MQ@����M.M.���M.MQ@���Р%clear����M�M����M�M�@��@�����&Reader!t����M�M����M�M�@���!a����M�M����M�M�@@@@����M�M����M�M�@@@����$unit����M�M����M�M�@@����M�M����M�M�@@@����M�M����M�M�@@@@�������@@ ���@@ �A�������	| [clear reader] consumes all of the values currently in [reader], and all blocked
    flushes become determined with [`Ok]. @����MSMS���M�M�@@@@����MSMS���M�M�@@���@@ ���@@ �A@����M�M����M�M�@����M�M����M�M�@���Р(read_all����N{N���N{N�@��@�����&Reader!t����N{N����N{N�@���!a���N{N���N{N�@@@@���N{N���N{N�@@@�����(Deferred!t���N{N���N{N�@������%Queue!t���N{N���N{N�@���!a��#�N{N��$�N{N�@@@@��&�N{N��'�N{N�@@@@��)�N{N��*�N{N�@@@��,�N{N��-�N{N�@@@@�����@@ ��@@ �A�������	 [read_all reader] reads all the values from the pipe until it is closed.  An
    alternative name might be [Reader.to_queue]. @��=�M�M��>�NGNz@@@@��@�M�M��A�NGNz@@��.@@ ��/@@ �A@��F�N{N{�G�N{N�@��I�N{N{�J�N{N�@���Р0values_available��R�QoQs�S�QoQ�@��@�����&Reader!t��^�QoQ��_�QoQ�@��@��c�QoQ��d�QoQ�@@@@��f�QoQ��g�QoQ�@@@�����(Deferred!t��p�QoQ��q�QoQ�@�������#Eof��{�QoQ��|�QoQ�@A@��~�QoQ���QoQ�@@����"Ok����QoQ����QoQ�@A@����QoQ����QoQ�@@@@@����QoQ����QoQ�@@@@����QoQ����QoQ�@@@����QoQ����QoQ�@@@@���k���@@ ���@@ �A�������
  � [values_available reader] returns a deferred that becomes determined when there are
    values in the pipe.  If there are multiple readers (a rare situation), there is no
    guarantee that some other reader hasn't become active because of ordinary Async
    scheduling and removed some or all of the values between the time the result of
    [values_available] becomes determined and the time something waiting [upon] that
    result runs.

    [values_available] is useful when one wants to [choose] on values being available in a
    pipe, so that one can be sure and not remove values and drop them on the floor.

    [values_available] is roughly equivalent to [read' ~max_queue_length:0]. @����N�N����QQn@@@@����N�N����QQn@@���@@ ���@@ �A@����QoQo���QoQ�@����QoQo���QoQ�@���Р+read_choice����T�T����T�T�@��@�����&Reader!t����T�T����T�T�@���!a����T�T����T�T�@@@@����T�T����T�T�@@@�����(Deferred&choice����T�T����T�T�@�������#Eof����T�T����T�T�@A@����T�T����T�T�@@����"Ok����T�T����T�T�@@���!a����T�T����T�T�@@@@����T�T����T�T�@@����1Nothing_available�� �T�T���T�T�@A@���T�T���T�T�@@@@@���T�T���T�T�@@@@��	�T�T��
�T�T�@@@���T�T���T�T�@@@@������@@ ���@@ �A�������
  � [read_choice reader] is:

    {[
      choice
        (values_available reader)
        (fun (_ : [ `Ok | `Eof ]) -> read_now reader) ]}

    [read_choice] consumes a value from [reader] iff the choice is taken.  [read_choice]
    exists to discourage the broken idiom:

    {[
      choice (read reader) (fun ...) ]}

    which is broken because it reads from [reader] even if the choice isn't taken.
    [`Nothing_available] can only be returned if there is a race condition with one or
    more other consumers.

    [read_choice_single_consumer_exn reader [%here]] is like [read_choice reader], but it
    raises in the case of [`Nothing_available].  It is intended to be used when [reader]
    has no other consumers. @���Q�Q���TjT�@@@@�� �Q�Q��!�TjT�@@��@@ ��@@ �A@��&�T�T��'�T�T�@��)�T�T��*�T�T�@���Р?read_choice_single_consumer_exn��2�T�T��3�T�U@��@�����&Reader!t��>�UU�?�UU@���!a��E�UU�F�UU@@@@��H�UU�I�UU@@@��@�����4Source_code_position!t��T�UU$�U�UU:@@��W�UU$�X�UU:@@@�����(Deferred&choice��a�U;UU�b�U;Ud@�������#Eof��l�U;UB�m�U;UF@A@��o�U;UB�p�U;UF@@����"Ok��w�U;UI�x�U;UL@@���!a��~�U;UP��U;UR@@@@����U;UI���U;UR@@@@@����U;U@���U;UT@@@@����U;U@���U;Ud@@@����UU$���U;Ud@@@����UU���U;Ud@@@@@����T�T����U;Ud@����T�T����U;Ud@���������@@ ���@@ �A�������8 {2 Sequence functions} @����UfUf���UfU�@@@@����UfUf���UfU�@@���@@ ���@@ �A����UfUf���UfU�@�����'Flushed����U�U����U�U�@�����A�    �!t����U�U����U�U�@@@��Р(Consumer����U�U����U�U�@�������(Consumer!t����U�U����U�U�@@����U�U����U�U�@@@@@����U�U����U�U�@@�Р4When_value_processed����U�U����U�U�@�@@����U�U����U�U�@@�Р/When_value_read����U�U����U�U�@�@@����U�U����U�U�@@@A@���(deriving����U�U����U�V@��������'sexp_of���U�V��U�V	@��
�U�V��U�V	@@@@���U�V��U�V	@@���U�U���U�V
@@���U�U���U�V
@@���U�U���U�V
@��������������$�U�U��%�U�V
@��������@��.�U�U��/�U�V
@@@@��1�U�U��2�U�V
@@��4�U�U��5�U�V
@��7�U�U��8�U�V
@���Р)sexp_of_t��@�U�U��A�U�U�@��@�������I�U�U��J�U�U�@@��L�U�U��M�U�U�@@@�����������U�U�U��V�U�U�@@��X�U�U��Y�U�U�@@@��[�U�U��\�U�U�@@@@@��^�U�U��_�U�V
@��a�U�U��b�U�V
@@��d�U�U��e�U�V
@@��g�U�U��h�U�V
@���y��m�U�U��n�U�V
@�������x@��w�U�U��x�U�V
@@@@��z�U�U��{�U�V
@@��}�U�U��~�U�V
@@����U�U����U�V
@@����U�U����VV@@@����U�U����VV@����U�U����VV@��������|@@ ��}@@ �A�������
  ~ Issues: {ul
    {- Scalar & batch sequence processing:

    Each of the sequence functions ([fold], [iter], [transfer], [map]) comes in two
    versions: "scalar" and "batch" processing.  The scalar version has the ordinary type
    for [f], which handles an element at a time in a non-deferred way.  In the batch
    version, [f] deals with a queue of elements from the pipe at a time, and can block,
    which will cause pushback on writers due to elements not being consumed.}

    {- Early-close and functions that copy between pipes:

    Some functions ([transfer], [map], [filter_map], [filter], [interleave], [concat], and
    their primed, batch-processing variants) spawn a background task that copies data from
    some upstream pipe to some downstream pipe, perhaps with some processing inserted
    in between.  These copying tasks finish under two circumstances.  The standard,
    "normal" case is when the copying task gets EOF from the upstream pipe -- there is no
    more data to copy.  In this case, the copying task closes the downstream pipe, if
    necessary, and exits.

    Somewhat less common is when the downstream consumer decides to stop reading early,
    while the upstream producer is still sending data to the copy task.  (E.g., perhaps
    the consumer was searching its incoming stream for some value, and it found that
    value, so there's no need to search further.)  In this case, the consumer closes its
    pipe to indicate it's done reading values.  When the copy task discovers that its
    downstream pipe is closed, it propagates the close to the upstream producer by closing
    its pipe and stops processing. } } @����VV��	\j\�@@@@����VV��	\j\�@@���@@ ���@@ �A����VV��	\j\�@���Р%fold'���]�]���]�]�@���'flushed�����'Flushed!t���]�]���]�]�@@���]�]���]�]�@@�������@@ ���@@ �A�������> default is [When_value_read] @���]�]���]�]�@@@@���]�]���]�]�@@���@@ ���@@ �A@���0max_queue_length����#int���]�]���]�]�@@���]�]���]�]�@@�������@@ ���@@ �A�������< default is [Int.max_value] @���]�]���]�^@@@@���]�]���]�^@@���@@ ���@@ �A@��@�����&Reader!t��^^�	^^@���!a��^^�^^@@@@��^^�^^@@@���$init��%accum��^^"�^^(@@@���!f��@��%accum��(^)^1�)^)^7@@@��@�����%Queue!t��4^)^>�5^)^E@���!a��;^)^;�<^)^=@@@@��>^)^;�?^)^E@@@�����(Deferred!t��H^)^P�I^)^Z@���%accum��O^)^I�P^)^O@@@@��R^)^I�S^)^Z@@@��U^)^;�V^)^Z@@@��X^)^1�Y^)^Z@@@�����(Deferred!t��b^\^h�c^\^r@���%accum��i^\^a�j^\^g@@@@��l^\^a�m^\^r@@@��o^)^.�p^\^r@@@��r^^�s^\^r@@@��u^^�v^\^r@@@��x]�]��y^\^r@@@��{]�]��|^\^r@@@@���T��l@@ ��m@@ �A�������	� [fold' reader ~init ~f] reads a batch of elements from [reader], supplies them to [f],
    waits for [f] to finish, and then repeats.  [fold'] finishes when the call to [f] on
    the final batch of elements from [reader] finishes. @���\�\���]I]�@@@@���\�\���]I]�@@��}@@ ��~@@ �A@���]�]���^\^r@���]�]���^\^r@���������@@ ���@@ �A�������	� [fold reader ~init ~f] folds over the elements of [reader], consuming them as they
    come in.  [fold] finishes when the final call to [f] returns. @���^u^u��^�_@@@@���^u^u��^�_@@���@@ ���@@ �A���^u^u��^�_@���Р$fold���__��__@���'flushed�����'Flushed!t���__)��__2@@���__)��__2@@�������@@ ���@@ �A�������> default is [When_value_read] @���__3��__V@@@@���__3��__V@@���@@ ���@@ �A@��@�����&Reader!t���_W__��_W_g@���!a���_W_\��_W_^@@@@���_W_\��_W_g@@@���$init��%accum��_h_r�_h_x@@@���!f��@��%accum��_y_��_y_�@@@��@��!a��_y_��_y_�@@@�����(Deferred!t��#_y_��$_y_�@���%accum��*_y_��+_y_�@@@@��-_y_��._y_�@@@��0_y_��1_y_�@@@��3_y_��4_y_�@@@�����(Deferred!t��=_�_��>_�_�@���%accum��D_�_��E_�_�@@@@��G_�_��H_�_�@@@��J_y_~�K_�_�@@@��M_h_m�N_�_�@@@��P_W_\�Q_�_�@@@��S__ �T_�_�@@@@@��V__�W_�_�@��Y__�Z_�_�@���Р5fold_without_pushback��b!_�_��c!_�_�@���(consumer�����(Consumer!t��p"_�_��q"_�_�@@��s"_�_��t"_�_�@@@��@�����&Reader!t��#_�_���#_�` @���!a���#_�_���#_�_�@@@@���#_�_���#_�` @@@���$init��%accum���$``��$``@@@���!f��@��%accum���%``��%`` @@@��@��!a���%``$��%``&@@@��%accum���%``*��%``0@@@���%``$��%``0@@@���%``��%``0@@@�����(Deferred!t���&`2`>��&`2`H@���%accum���&`2`7��&`2`=@@@@���&`2`7��&`2`H@@@���%``��&`2`H@@@���$``��&`2`H@@@���#_�_���&`2`H@@@���"_�_���&`2`H@@@@@���!_�_���&`2`H@���!_�_���&`2`H@���Р%iter'���/bb��/bb@���1continue_on_error����$bool���0bb4��0bb8@@���0bb4��0bb8@@���ʰ��@@ ���@@ �A�������> default is [false]           @��0bb9�0bb\@@@@��0bb9�0bb\@@���@@ ���@@ �A@���'flushed�����'Flushed!t��1b]bk�1b]bt@@��1b]bk�1b]bt@@�����
@@ ��@@ �A�������> default is [When_value_read] @��*1b]bu�+1b]b�@@@@��-1b]bu�.1b]b�@@��@@ ��@@ �A@���0max_queue_length����#int��<2b�b��=2b�b�@@��?2b�b��@2b�b�@@�����0@@ ��1@@ �A�������> default is [Int.max_value]   @��P2b�b��Q2b�b�@@@@��S2b�b��T2b�b�@@��A@@ ��B@@ �A@��@�����&Reader!t��b3b�b��c3b�b�@���!a��i3b�b��j3b�b�@@@@��l3b�b��m3b�b�@@@���!f��@�����%Queue!t��|4b�b��}4b�b�@���!a���4b�b���4b�b�@@@@���4b�b���4b�b�@@@�����(Deferred!t���4b�c��4b�c@�����$unit���4b�b���4b�c@@���4b�b���4b�c@@@@���4b�b���4b�c@@@���4b�b���4b�c@@@�����(Deferred!t���5cc��5cc$@�����$unit���5cc��5cc@@���5cc��5cc@@@@���5cc��5cc$@@@���4b�b���5cc$@@@���3b�b���5cc$@@@���2b�b���5cc$@@@���1b]bb��5cc$@@@���0bb!��5cc$@@@@�������@@ ���@@ �A�������
  � [iter' reader ~f ] repeatedly applies [f] to batches of elements of [reader], waiting
    for each call to [f] to finish before continuing.  The deferred returned by [iter']
    becomes determined when the call to [f] on the final batch of elements finishes.
    [~continue_on_error:true] causes the iteration to continue even if [f] raises.

    [~flushed:When_value_processed] means values in batch [b] are flushed only after [f
    b] is filled. @���(`J`J��.a�b@@@@���(`J`J��.a�b@@���@@ ���@@ �A@���/bb��5cc$@���/bb��5cc$@���Р$iter���9c�c���9c�c�@���1continue_on_error����$bool���:c�c���:c�c�@@���:c�c�� :c�c�@@���ذ��@@ ���@@ �A�������> default is [false]           @��:c�c��:c�d!@@@@��:c�c��:c�d!@@��@@ ��@@ �A@���'flushed�����'Flushed!t��$;d"d0�%;d"d9@@��';d"d0�(;d"d9@@��� ��@@ ��@@ �A�������> default is [When_value_read] @��8;d"d:�9;d"d]@@@@��;;d"d:�<;d"d]@@��)@@ ��*@@ �A@��@�����&Reader!t��J<d^df�K<d^dn@���!a��Q<d^dc�R<d^de@@@@��T<d^dc�U<d^dn@@@���!f��@��!a��`=dodw�a=dody@@@�����(Deferred!t��j=dod��k=dod�@�����$unit��s=dod}�t=dod�@@��v=dod}�w=dod�@@@@��y=dod}�z=dod�@@@��|=dodw�}=dod�@@@�����(Deferred!t���>d�d���>d�d�@�����$unit���>d�d���>d�d�@@���>d�d���>d�d�@@@@���>d�d���>d�d�@@@���=dodt��>d�d�@@@���<d^dc��>d�d�@@@���;d"d'��>d�d�@@@���:c�c���>d�d�@@@@���z���@@ ���@@ �A�������	� [iter t f] is a specialization of [iter'] that applies the [f] to each element in the
    batch, waiting for one call to [f] to finish before making the next call to [f]. @���7c&c&��8c�c�@@@@���7c&c&��8c�c�@@���@@ ���@@ �A@���9c�c���>d�d�@���9c�c���>d�d�@���Р5iter_without_pushback���EfLfP��EfLfe@���(consumer�����(Consumer!t���Ffffu��Ffff@@���Ffffu��Ffff@@@���1continue_on_error����$bool���Gf�f���Gf�f�@@���Gf�f���Gf�f�@@�������@@ ���@@ �A�������4 default is [false] @���Gf�f���Gf�f�@@@@���Gf�f���Gf�f�@@���@@ ���@@ �A@���6max_iterations_per_job����#int��
Hf�f��Hf�f�@@��Hf�f��Hf�f�@@������@@ ���@@ �A�������< default is [Int.max_value] @��Hf�f��Hf�f�@@@@��!Hf�f��"Hf�f�@@��@@ ��@@ �A@��@�����&Reader!t��0If�g�1If�g
@���!a��7If�f��8If�g@@@@��:If�f��;If�g
@@@���!f��@��!a��FJgg�GJgg@@@����$unit��NJgg�OJgg@@��QJgg�RJgg@@@��TJgg�UJgg@@@�����(Deferred!t��^Kgg)�_Kgg3@�����$unit��gKgg$�hKgg(@@��jKgg$�kKgg(@@@@��mKgg$�nKgg3@@@��pJgg�qKgg3@@@��sIf�f��tKgg3@@@��vHf�f��wKgg3@@@��yGf�f��zKgg3@@@��|Ffffk�}Kgg3@@@@���U��m@@ ��n@@ �A�������
  � [iter_without_pushback t ~f] applies [f] to each element in [t], without giving [f] a
    chance to pushback on the iteration continuing.  If [f] raises on some element of [t],
    [iter_without_pushback] will not consume any further elements.
    [iter_without_pushback] will not make more than [max_iterations_per_job] calls to [f]
    in a single Async_job; this can be used to increase Async-scheduling fairness. @���@d�d���De�fK@@@@���@d�d���De�fK@@��~@@ ��@@ �A@���EfLfL��Kgg3@���EfLfL��Kgg3@���Р)transfer'���Ti1i5��Ti1i>@���0max_queue_length����#int���Ui?iV��Ui?iY@@���Ui?iV��Ui?iY@@�������@@ ���@@ �A�������< default is [Int.max_value] @���Ui?iZ��Ui?i{@@@@���Ui?iZ��Ui?i{@@���@@ ���@@ �A@��@�����&Reader!t���Vi|i���Vi|i�@���!a���Vi|i���Vi|i�@@@@���Vi|i���Vi|i�@@@��@�����&Writer!t���Wi�i���Wi�i�@���!b���Wi�i���Wi�i�@@@@���Wi�i���Wi�i�@@@���!f��@�����%Queue!t��Xi�i��Xi�i�@���!a��Xi�i��Xi�i�@@@@��Xi�i��Xi�i�@@@�����(Deferred!t��Xi�i��Xi�i�@������%Queue!t��#Xi�i��$Xi�i�@���!b��*Xi�i��+Xi�i�@@@@��-Xi�i��.Xi�i�@@@@��0Xi�i��1Xi�i�@@@��3Xi�i��4Xi�i�@@@�����(Deferred!t��=Yi�i��>Yi�i�@�����$unit��FYi�i��GYi�i�@@��IYi�i��JYi�i�@@@@��LYi�i��MYi�i�@@@��OXi�i��PYi�i�@@@��RWi�i��SYi�i�@@@��UVi|i��VYi�i�@@@��XUi?iD�YYi�i�@@@@���1��I@@ ��J@@ �A�������
  � [transfer' input output ~f] repeatedly reads a batch of elements from [input], applies
    [f] to the batch, writes the result as a batch to [output], and then waits on
    [pushback] in [output] before continuing.  [transfer'] finishes if [input] is closed
    or [output] is closed.  If [output] is closed, then [transfer'] closes [input].  Use
    [~max_queue_length:1] to cause elements to appear on the output pipe as soon as they
    are processed, without having to wait for the entire queue. @��iNg6g6�jSh�i0@@@@��lNg6g6�mSh�i0@@��Z@@ ��[@@ �A@��rTi1i1�sYi�i�@��uTi1i1�vYi�i�@���Р(transfer��~\j8j<�\j8jD@��@�����&Reader!t���\j8jJ��\j8jR@���!a���\j8jG��\j8jI@@@@���\j8jG��\j8jR@@@��@�����&Writer!t���\j8jY��\j8ja@���!b���\j8jV��\j8jX@@@@���\j8jV��\j8ja@@@���!f��@��!a���\j8jh��\j8jj@@@��!b���\j8jn��\j8jp@@@���\j8jh��\j8jp@@@�����(Deferred!t���\j8jz��\j8j�@�����$unit���\j8ju��\j8jy@@���\j8ju��\j8jy@@@@���\j8ju��\j8j�@@@���\j8je��\j8j�@@@���\j8jV��\j8j�@@@���\j8jG��\j8j�@@@@�������@@ ���@@ �A�������	Q [transfer] is like [transfer'], except that it processes one element at a time. @���[i�i���[i�j7@@@@���[i�i���[i�j7@@���@@ ���@@ �A@���\j8j8��\j8j�@���\j8j8��\j8j�@���Р+transfer_id��_j�j��_j�j�@���0max_queue_length����#int��`j�j��`j�j�@@��`j�j��`j�j�@@����� @@ �� @@ �A�������< default is [Int.max_value] @��'`j�j��(`j�k@@@@��*`j�j��+`j�k@@�� @@ �� @@ �A@��@�����&Reader!t��9akk%�:akk-@���!a��@akk"�Aakk$@@@@��Cakk"�Dakk-@@@��@�����&Writer!t��Obk.k6�Pbk.k>@���!a��Vbk.k3�Wbk.k5@@@@��Ybk.k3�Zbk.k>@@@�����(Deferred!t��cck?kI�dck?kS@�����$unit��lck?kD�mck?kH@@��ock?kD�pck?kH@@@@��rck?kD�sck?kS@@@��ubk.k3�vck?kS@@@��xakk"�yck?kS@@@��{`j�j��|ck?kS@@@@���T�� l@@ �� m@@ �A�������	D [transfer_id] is a specialization of [transfer'] with [f = Fn.id]. @���^j�j���^j�j�@@@@���^j�j���^j�j�@@�� }@@ �� ~@@ �A@���_j�j���ck?kS@���_j�j���ck?kS@���Р$map'���km?mC��km?mG@���0max_queue_length����#int���lmHm_��lmHmb@@���lmHm_��lmHmb@@������ �@@ �� �@@ �A�������< default is [Int.max_value] @���lmHmc��lmHm�@@@@���lmHmc��lmHm�@@�� �@@ �� �@@ �A@��@�����&Reader!t���mm�m���mm�m�@���!a���mm�m���mm�m�@@@@���mm�m���mm�m�@@@���!f��@�����%Queue!t���nm�m���nm�m�@���!a���nm�m���nm�m�@@@@���nm�m���nm�m�@@@�����(Deferred!t�� nm�m�� nm�m�@������%Queue!t�� nm�m�� nm�m�@���!b�� nm�m�� nm�m�@@@@�� nm�m�� nm�m�@@@@�� nm�m�� nm�m�@@@�� nm�m�� nm�m�@@@�����&Reader!t�� &om�m�� 'om�m�@���!b�� -om�m�� .om�m�@@@@�� 0om�m�� 1om�m�@@@�� 3nm�m�� 4om�m�@@@�� 6mm�m�� 7om�m�@@@�� 9lmHmM� :om�m�@@@@�����!*@@ ��!+@@ �A�������
  � [map' input ~f] returns a reader, [output], and repeatedly applies [f] to batches of
    elements from [input], with the results appearing in [output].  If values are not
    being consumed from [output], [map'] will pushback and stop consuming values from
    [input]. If [output] is closed, then [map'] will close [input].  Use
    [~max_queue_length:1] to cause elements to appear on the output pipe as soon as they
    are processed, without having to wait for the entire queue. @�� JekUkU� Kjl�m>@@@@�� MekUkU� Njl�m>@@��!;@@ ��!<@@ �A@�� Skm?m?� Tom�m�@�� Vkm?m?� Wom�m�@���Р#map�� _rn"n&� `rn"n)@��@�����&Reader!t�� krn"n/� lrn"n7@���!a�� rrn"n,� srn"n.@@@@�� urn"n,� vrn"n7@@@���!f��@��!a�� �rn"n>� �rn"n@@@@��!b�� �rn"nD� �rn"nF@@@�� �rn"n>� �rn"nF@@@�����&Reader!t�� �rn"nN� �rn"nV@���!b�� �rn"nK� �rn"nM@@@@�� �rn"nK� �rn"nV@@@�� �rn"n;� �rn"nV@@@�� �rn"n,� �rn"nV@@@@���}��!�@@ ��!�@@ �A�������	G [map] is like [map'], except that it processes one element at a time. @�� �qm�m�� �qm�n!@@@@�� �qm�m�� �qm�n!@@��!�@@ ��!�@@ �A@�� �rn"n"� �rn"nV@�� �rn"n"� �rn"nV@���Р+folding_map�� �vn�n�� �vn�n�@���0max_queue_length����#int�� �wn�n�� �wn�n�@@�� �wn�n�� �wn�n�@@������!�@@ ��!�@@ �A�������< default is [Int.max_value] @�� �wn�n�� �wn�o@@@@�� �wn�n�� �wn�o@@��!�@@ ��!�@@ �A@��@�����&Reader!t�� �xoo
� �xoo@���!a��!xoo�!xoo	@@@@��!xoo�!xoo@@@���$init��%accum��!yoo�!yoo#@@@���!f��@��%accum��!zo$o,�!zo$o2@@@��@��!a��!$zo$o6�!%zo$o8@@@�����%accum��!-zo$o<�!.zo$oB@@@���!b��!4zo$oE�!5zo$oG@@@@��!7zo$o<�!8zo$oG@@@��!:zo$o6�!;zo$oG@@@��!=zo$o,�!>zo$oG@@@�����&Reader!t��!G{oIoQ�!H{oIoY@���!b��!N{oIoN�!O{oIoP@@@@��!Q{oIoN�!R{oIoY@@@��!Tzo$o)�!U{oIoY@@@��!Wyoo�!X{oIoY@@@��!Zxoo�![{oIoY@@@��!]wn�n��!^{oIoY@@@@���6��"N@@ ��"O@@ �A�������	W [folding_map] is a version of [map] that threads an accumulator through calls to [f].
@��!ntnXnX�!oun�n�@@@@��!qtnXnX�!run�n�@@��"_@@ ��"`@@ �A@��!wvn�n��!x{oIoY@��!zvn�n��!{{oIoY@���Р(fold_map��!�}o[o_�!�}o[og@���0max_queue_length����#int��!�~oho�!�~oho�@@��!�~oho�!�~oho�@@���k��"�@@ ��"�@@ �A�������< default is [Int.max_value] @��!�~oho��!�~oho�@@@@��!�~oho��!�~oho�@@��"�@@ ��"�@@ �A@��@�����&Reader!t��!�o�o��!�o�o�@���!a��!�o�o��!�o�o�@@@@��!�o�o��!�o�o�@@@���$init��%accum��!��o�o��!��o�o�@@@���!f��@��%accum��!��o�o��!��o�o�@@@��@��!a��!��o�o��!��o�o�@@@�����%accum��!��o�o��!��o�o�@@@���!b��!��o�o��!��o�o�@@@@��!��o�o��!��o�o�@@@��!��o�o��!��o�o�@@@��!��o�o��!��o�o�@@@�����&Reader!t��" �o�o��"�o�o�@���!b��"�o�o��"�o�o�@@@@��"
�o�o��"�o�o�@@@��"�o�o��"�o�o�@@@��"�o�o��"�o�o�@@@��"o�o��"�o�o�@@@��"~ohom�"�o�o�@@@@���*deprecated��"�o�p �"�o�p
@�������	'[since 2017-03] Use folding_map instead@��"(�o�p�")�o�p4@@@@��"+�o�p�",�o�p4@@��".�o�o��"/�o�p5@@��"1}o[o[�"2�o�p5@��"4}o[o[�"5�o�p5@���Р+filter_map'��"=�r[r_�">�r[rj@���0max_queue_length����#int��"I�rkr��"J�rkr�@@��"L�rkr��"M�rkr�@@���%��#=@@ ��#>@@ �A�������< default is [Int.max_value] @��"]�rkr��"^�rkr�@@@@��"`�rkr��"a�rkr�@@��#N@@ ��#O@@ �A@��@�����&Reader!t��"o�r�r��"p�r�r�@���!a��"v�r�r��"w�r�r�@@@@��"y�r�r��"z�r�r�@@@���!f��@��!a��"��r�r��"��r�r�@@@�����(Deferred!t��"��r�r��"��r�r�@�����&option��"��r�r��"��r�r�@���!b��"��r�r��"��r�r�@@@@��"��r�r��"��r�r�@@@@��"��r�r��"��r�r�@@@��"��r�r��"��r�r�@@@�����&Reader!t��"��r�r��"��r�r�@���!b��"��r�r��"��r�r�@@@@��"��r�r��"��r�r�@@@��"��r�r��"��r�r�@@@��"��r�r��"��r�r�@@@��"��rkrp�"��r�r�@@@@������#�@@ ��#�@@ �A�������
   [filter_map' input ~f] returns a reader, [output], and repeatedly applies [f] to
    elements from [input], with the results that aren't [None] appearing in [output].  If
    values are not being consumed from [output], [filter_map'] will pushback and stop
    consuming values from [input].  If [output] is closed, then [filter_map'] will close
    [input].  [filter_map'] processes elements in batches as per [max_queue_length]; in a
    single batch, all outputs will propagate to the result only when all inputs have been
    processed. @��"��p7p7�"��rIrZ@@@@��"��p7p7�"��rIrZ@@��#�@@ ��#�@@ �A@��"��r[r[�"��r�r�@��"��r[r[�"��r�r�@���Р*filter_map��"��s.s2�"��s.s<@���0max_queue_length����#int��"��s=sT�"��s=sW@@��"��s=sT�"��s=sW@@���Ӱ�#�@@ ��#�@@ �A�������< default is [Int.max_value] @��#�s=sX�#�s=sy@@@@��#�s=sX�#�s=sy@@��#�@@ ��#�@@ �A@��@�����&Reader!t��#�szs��#�szs�@���!a��#$�szs�#%�szs�@@@@��#'�szs�#(�szs�@@@���!f��@��!a��#3�s�s��#4�s�s�@@@����&option��#;�s�s��#<�s�s�@���!b��#B�s�s��#C�s�s�@@@@��#E�s�s��#F�s�s�@@@��#H�s�s��#I�s�s�@@@�����&Reader!t��#R�s�s��#S�s�s�@���!b��#Y�s�s��#Z�s�s�@@@@��#\�s�s��#]�s�s�@@@��#_�s�s��#`�s�s�@@@��#b�szs�#c�s�s�@@@��#e�s=sB�#f�s�s�@@@@���>��$V@@ ��$W@@ �A�������	9 [filter_map] is a specialized version of [filter_map']. @��#v�r�r��#w�r�s-@@@@��#y�r�r��#z�r�s-@@��$g@@ ��$h@@ �A@��#�s.s.�#��s�s�@��#��s.s.�#��s�s�@���Р2folding_filter_map��#��t"t&�#��t"t8@���0max_queue_length����#int��#��t9tP�#��t9tS@@��#��t9tP�#��t9tS@@���s��$�@@ ��$�@@ �A�������< default is [Int.max_value] @��#��t9tT�#��t9tu@@@@��#��t9tT�#��t9tu@@��$�@@ ��$�@@ �A@��@�����&Reader!t��#��tvt~�#��tvt�@���!a��#��tvt{�#��tvt}@@@@��#��tvt{�#��tvt�@@@���$init��%accum��#��t�t��#��t�t�@@@���!f��@��%accum��#��t�t��#��t�t�@@@��@��!a��#��t�t��#��t�t�@@@�����%accum��#��t�t��#��t�t�@@@�����&option��#��t�t��#��t�t�@���!b��#��t�t��#��t�t�@@@@��$�t�t��$�t�t�@@@@��$�t�t��$�t�t�@@@��$�t�t��$�t�t�@@@��$
�t�t��$�t�t�@@@�����&Reader!t��$�t�t��$�t�t�@���!b��$�t�t��$�t�t�@@@@��$�t�t��$�t�t�@@@��$!�t�t��$"�t�t�@@@��$$�t�t��$%�t�t�@@@��$'�tvt{�$(�t�t�@@@��$*�t9t>�$+�t�t�@@@@�����%@@ ��%@@ �A�������	f [folding_filter_map] is a version [filter_map] that threads an accumulator through
    calls to [f]. @��$;�s�s��$<�tt!@@@@��$>�s�s��$?�tt!@@��%,@@ ��%-@@ �A@��$D�t"t"�$E�t�t�@��$G�t"t"�$H�t�t�@���Р/fold_filter_map��$P�t�t��$Q�t�t�@���0max_queue_length����#int��$\�t�u�$]�t�u@@��$_�t�u�$`�t�u@@���8��%P@@ ��%Q@@ �A�������< default is [Int.max_value] @��$p�t�u�$q�t�u&@@@@��$s�t�u�$t�t�u&@@��%a@@ ��%b@@ �A@��@�����&Reader!t��$��u'u/�$��u'u7@���!a��$��u'u,�$��u'u.@@@@��$��u'u,�$��u'u7@@@���$init��%accum��$��u8uB�$��u8uH@@@���!f��@��%accum��$��uIuQ�$��uIuW@@@��@��!a��$��uIu[�$��uIu]@@@�����%accum��$��uIua�$��uIug@@@�����&option��$��uIum�$��uIus@���!b��$��uIuj�$��uIul@@@@��$��uIuj�$��uIus@@@@��$��uIua�$��uIus@@@��$��uIu[�$��uIus@@@��$��uIuQ�$��uIus@@@�����&Reader!t��$��uuu}�$��uuu�@���!b��$��uuuz�$��uuu|@@@@��$��uuuz�$��uuu�@@@��$��uIuN�$��uuu�@@@��$��u8u=�$��uuu�@@@��$��u'u,�$��uuu�@@@��$��t�t��$��uuu�@@@@���*deprecated��$��u�u��$��u�u�@�������	.[since 2017-03] Use folding_filter_map instead@��%�u�u��%�u�u�@@@@��%�u�u��%�u�u�@@��%�u�u��%�u�u�@@��%
�t�t��%�u�u�@��%�t�t��%�u�u�@���Р&filter��%�v�v��%�v�v�@��@�����&Reader!t��%"�v�v��%#�v�v�@���!a��%)�v�v��%*�v�v�@@@@��%,�v�v��%-�v�v�@@@���!f��@��!a��%8�v�v��%9�v�v�@@@����$bool��%@�v�v��%A�v�v�@@��%C�v�v��%D�v�v�@@@��%F�v�v��%G�v�v�@@@�����&Reader!t��%P�v�v��%Q�v�v�@���!a��%W�v�v��%X�v�v�@@@@��%Z�v�v��%[�v�v�@@@��%]�v�v��%^�v�v�@@@��%`�v�v��%a�v�v�@@@@��� 9��&Q@@ ��&R@@ �A�������	� [filter input ~f] returns a reader, [output], and copies to [output] each element from
    [input] that satisfies the predicate [f].  If [output] is closed, then [filter] closes
    [input]. @��%q�u�u��%r�v}v�@@@@��%t�u�u��%u�v}v�@@��&b@@ ��&c@@ �A@��%z�v�v��%{�v�v�@��%}�v�v��%~�v�v�@���Р*interleave��%��x�x��%��x�y@��@����$list��%��x�y�%��x�y@������&Reader!t��%��x�y
�%��x�y@���!a��%��x�y�%��x�y	@@@@��%��x�y�%��x�y@@@@��%��x�y�%��x�y@@@�����&Reader!t��%��x�y�%��x�y&@���!a��%��x�y�%��x�y@@@@��%��x�y�%��x�y&@@@��%��x�y�%��x�y&@@@@��� ���&�@@ ��&�@@ �A�������
  ( [interleave inputs] returns a reader, [output], and, for each input, transfers batches
    of values from that input to [output], using [transfer_id].  Each input is transferred
    to [output] independently.  So, batches of values from different inputs can be in
    flight to [output] simultaneously, but at most one batch at a time from any particular
    input.  The operation is complete when either all the [inputs] produce EOF, or when
    [output] is closed by the downstream consumer (in which case [interleave] closes all
    the [inputs]). @��%��v�v��%��x�x�@@@@��%��v�v��%��x�x�@@��&�@@ ��&�@@ �A@��%��x�x��%��x�y&@��%��x�x��%��x�y&@���Р/interleave_pipe��%��y(y,�%��y(y;@��@�����&Reader!t��%��y(yJ�%��y(yR@������&Reader!t��%��y(yA�%��y(yI@���!a��&�y(y>�&�y(y@@@@@��&�y(y>�&�y(yI@@@@��&	�y(y>�&
�y(yR@@@�����&Reader!t��&�y(yY�&�y(ya@���!a��&�y(yV�&�y(yX@@@@��&�y(yV�&�y(ya@@@��& �y(y>�&!�y(ya@@@@@��&#�y(y(�&$�y(ya@��&&�y(y(�&'�y(ya@���Р%merge��&/�z�z��&0�z�z�@��@����$list��&9�z�z��&:�z�z�@������&Reader!t��&D�z�z��&E�z�z�@���!a��&K�z�z��&L�z�z�@@@@��&N�z�z��&O�z�z�@@@@��&Q�z�z��&R�z�z�@@@���'compare��@��!a��&]�z�z��&^�z�z�@@@��@��!a��&e�z�z��&f�z�z�@@@����#int��&m�z�z��&n�z�z�@@��&p�z�z��&q�z�z�@@@��&s�z�z��&t�z�z�@@@��&v�z�z��&w�z�z�@@@�����&Reader!t��&��z�z��&��z�z�@���!a��&��z�z��&��z�z�@@@@��&��z�z��&��z�z�@@@��&��z�z��&��z�z�@@@��&��z�z��&��z�z�@@@@���!i��'�@@ ��'�@@ �A�������
  = [merge inputs ~compare] returns a reader, [output], that merges all the inputs.
    Assuming that for each input, values are sorted according to the comparison function
    [compare], values for each input will be transfered to [output] and the values
    returned by [output] will be sorted according to [compare]. @��&��ycyc�&��zcz�@@@@��&��ycyc�&��zcz�@@��'�@@ ��'�@@ �A@��&��z�z��&��z�z�@��&��z�z��&��z�z�@���Р&concat��&��{�{��&��{�{�@��@����$list��&��{�{��&��{�{�@������&Reader!t��&��{�{��&��{�{�@���!a��&��{�{��&��{�{�@@@@��&��{�{��&��{�{�@@@@��&��{�{��&��{�{�@@@�����&Reader!t��&��{�|�&��{�|@���!a��&��{�|�&��{�|@@@@��&��{�|�&��{�|@@@��&��{�{��&��{�|@@@@���!Ȱ�'�@@ ��'�@@ �A�������	� [concat inputs] return a reader, [output], with the values from each pipe in [inputs]
    in sequence.  [concat] closes [output] once it reaches EOF on the final input.
    If [output] is closed, then [concat] closes all its inputs. @��' �z�z��'�{�{�@@@@��'�z�z��'�{�{�@@��'�@@ ��'�@@ �A@��'	�{�{��'
�{�|@��'�{�{��'�{�|@���Р$fork��'����'���@��@�����&Reader!t��'!��  ��'"��  �@���!a��'(��  ��')��  �@@@@��'+��  ��',��  �@@@���-pushback_uses������.Both_consumers��'9�  �  �%�':�  �  �4@A@��'<�  �  �%�'=�  �  �4@@����2Fast_consumer_only��'D�  �  �7�'E�  �  �J@A@��'G�  �  �7�'H�  �  �J@@@@@��'J�  �  �#�'K�  �  �L@@@��������&Reader!t��'W�  �M  �U�'X�  �M  �]@���!a��'^�  �M  �R�'_�  �M  �T@@@@��'a�  �M  �R�'b�  �M  �]@@@������&Reader!t��'l�  �M  �c�'m�  �M  �k@���!a��'s�  �M  �`�'t�  �M  �b@@@@��'v�  �M  �`�'w�  �M  �k@@@@��'y�  �M  �R�'z�  �M  �k@@@��'|�  �  ��'}�  �M  �k@@@��'��  ��'��  �M  �k@@@@���"X��(p@@ ��(q@@ �A�������
  � [fork input] returns a pair of readers and transfers each of the values in [input]
    into both of the returned readers.  It closes [input] early if both of the readers are
    closed early.

    If [pushback_uses = `Both_consumers], then [fork] waits for [pushback] on both readers
    when writing.  If one of the readers is not read from or is slow to be read from, it
    may block the other from receiving data.  Beware of possible deadlocks in downstream
    code due to blocking on reading too many elements from one before reading the other.

    If [pushback_uses = `Fast_consumer_only], then [fork] waits for [pushback] only on the
    faster of the two readers when writing.  In this case the slow reader cannot block the
    faster one, but [fork] could be forced to buffer arbitrarily many elements.  Beware of
    unbounded resource usage in downstream code where one reader might fall behind.

    Note that {!upstream_flushed} will not work with the pipes returned by [fork]. @��'��||�'����@@@@��'��||�'����@@��(�@@ ��(�@@ �A@��'�����'��  �M  �k@��'�����'��  �M  �k@���Р4to_stream_deprecated��'��  �Q  �U�'��  �Q  �i@��@�����&Reader!t��'��  �Q  �o�'��  �Q  �w@���!a��'��  �Q  �l�'��  �Q  �n@@@@��'��  �Q  �l�'��  �Q  �w@@@�����,Async_stream!t��'��  �Q  �~�'��  �Q  ��@���!a��'��  �Q  �{�'��  �Q  �}@@@@��'��  �Q  �{�'��  �Q  ��@@@��'��  �Q  �l�'��  �Q  ��@@@@���"���(�@@ ��(�@@ �A�������	� [to_stream_deprecated reader] returns a stream that reads everything from the pipe.
    This function is deprecated because one should change the code that is consuming
    a stream to instead consume from a pipe reader. @��'��  �m  �m�'��  �  �P@@@@��'��  �m  �m�'��  �  �P@@��(�@@ ��(�@@ �A@��'��  �Q  �Q�'��  �Q  ��@��'��  �Q  �Q�'��  �Q  ��@���Р4of_stream_deprecated��'��  �}  ���'��  �}  ��@��@�����,Async_stream!t��(�  �}  ���(�  �}  ��@���!a��(�  �}  ���(�  �}  ��@@@@��(�  �}  ���(�  �}  ��@@@�����&Reader!t��(�  �}  ���(�  �}  ��@���!a��(�  �}  ���( �  �}  ��@@@@��("�  �}  ���(#�  �}  ��@@@��(%�  �}  ���(&�  �}  ��@@@@���"���)@@ ��)@@ �A�������	� [of_stream_deprecated reader] returns a pipe that has one element for every element on
    the stream.  This function is deprecated because one should change the code that is
    producing a stream to instead produce a pipe reader. @��(6�  ��  ���(7�  �A  �|@@@@��(9�  ��  ���(:�  �A  �|@@��)'@@ ��)(@@ �A@��(?�  �}  �}�(@�  �}  ��@��(B�  �}  �}�(C�  �}  ��@���Р%drain��(K�  �p  �t�(L�  �p  �y@��@�����&Reader!t��(W�  �p  ��(X�  �p  ��@���!a��(^�  �p  �|�(_�  �p  �~@@@@��(a�  �p  �|�(b�  �p  ��@@@�����(Deferred!t��(k�  �p  ���(l�  �p  ��@�����$unit��(t�  �p  ���(u�  �p  ��@@��(w�  �p  ���(x�  �p  ��@@@@��(z�  �p  ���({�  �p  ��@@@��(}�  �p  �|�(~�  �p  ��@@@@���#V��)n@@ ��)o@@ �A�������	� [drain reader] repeatedly reads values from [reader] and throws them away.

    [drain_and_count] is like [drain], except it also counts the number of values it
    has read. @��(��  ��  ���(��  �_  �o@@@@��(��  ��  ���(��  �_  �o@@��)@@ ��)�@@ �A@��(��  �p  �p�(��  �p  ��@��(��  �p  �p�(��  �p  ��@���Р/drain_and_count��(��  ��  ���(��  ��  ��@��@�����&Reader!t��(��  ��  ���(��  ��  ��@���!a��(��  ��  ���(��  ��  ��@@@@��(��  ��  ���(��  ��  ��@@@�����(Deferred!t��(��  ��  ���(��  ��  ��@�����#int��(��  ��  ���(��  ��  ��@@��(��  ��  ���(��  ��  ��@@@@��(��  ��  ���(��  ��  ��@@@��(��  ��  ���(��  ��  ��@@@@@��(��  ��  ���(��  ��  ��@��(��  ��  ���(��  ��  ��@���Р'to_list��(��  �E  �I�(��  �E  �P@��@�����&Reader!t��(��  �E  �V�(��  �E  �^@���!a��(��  �E  �S�(��  �E  �U@@@@��(��  �E  �S�(��  �E  �^@@@�����(Deferred!t��)�  �E  �j�)�  �E  �t@�����$list��)�  �E  �e�)�  �E  �i@���!a��)�  �E  �b�)�  �E  �d@@@@��)�  �E  �b�)�  �E  �i@@@@��)�  �E  �b�)�  �E  �t@@@��)�  �E  �S�)�  �E  �t@@@@���#���*@@ ��*@@ �A�������	n [to_list input] reads everything from [input]; on EOF, it produces the accumulated
    list of these values. @��).�  ��  ���)/�  �(  �D@@@@��)1�  ��  ���)2�  �(  �D@@��*@@ ��* @@ �A@��)7�  �E  �E�)8�  �E  �t@��):�  �E  �E�);�  �E  �t@�����)N��*-@@ ��*.@@ �A�������3 {2 Miscellaneous} @��)M�  �v  �v�)N�  �v  ��@@@@��)P�  �v  �v�)Q�  �v  ��@@��*>@@ ��*?@@ �A��)V�  �v  �v�)W�  �v  ��@���Р$hash��)_�  ��  ���)`�  ��  ��@��@����!t��)i�  ��  ���)j�  ��  ��@��@��)n�  ��  ���)o�  ��  ��@@@��@��)s�  ��  ���)t�  ��  ��@@@@��)v�  ��  ���)w�  ��  ��@@@����#int��)~�  ��  ���)�  ��  ��@@��)��  ��  ���)��  ��  ��@@@��)��  ��  ���)��  ��  ��@@@@���$]��*u@@ ��*v@@ �A�������	A [hash] is a hash function based on the internal id of the pipe. @��)��  ��  ���)��  ��  ��@@@@��)��  ��  ���)��  ��  ��@@��*�@@ ��*�@@ �A@��)��  ��  ���)��  ��  ��@��)��  ��  ���)��  ��  ��@���Р%equal��)��  �!  �%�)��  �!  �*@��@����!t��)��  �!  �6�)��  �!  �7@���!a��)��  �!  �.�)��  �!  �0@@@���!b��)��  �!  �2�)��  �!  �4@@@@��)��  �!  �-�)��  �!  �7@@@��@����!t��)��  �!  �D�)��  �!  �E@���!a��)��  �!  �<�)��  �!  �>@@@���!b��)��  �!  �@�)��  �!  �B@@@@��)��  �!  �;�)��  �!  �E@@@����$bool��)��  �!  �I�)��  �!  �M@@��)��  �!  �I�)��  �!  �M@@@��)��  �!  �;�)��  �!  �M@@@��)��  �!  �-�)��  �!  �M@@@@���$ʰ�*�@@ ��*�@@ �A�������	( [equal] on pipes is physical equality. @��*�  ��  ���*�  ��  � @@@@��*�  ��  ���*�  ��  � @@��*�@@ ��*�@@ �A@��*�  �!  �!�*�  �!  �M@��*�  �!  �!�*�  �!  �M@���Р'compare��*�  ��  ���*�  ��  ��@��@����!t��*!�  ��  ���*"�  ��  ��@��@��*&�  ��  ���*'�  ��  ��@@@��@��*+�  ��  ���*,�  ��  ��@@@@��*.�  ��  ���*/�  ��  ��@@@��@����!t��*8�  ��  ���*9�  ��  ��@��@��*=�  ��  ���*>�  ��  ��@@@��@��*B�  ��  ���*C�  ��  ��@@@@��*E�  ��  ���*F�  ��  ��@@@����#int��*M�  ��  ���*N�  ��  ��@@��*P�  ��  ���*Q�  ��  ��@@@��*S�  ��  ���*T�  ��  ��@@@��*V�  ��  ���*W�  ��  ��@@@@���%/��+G@@ ��+H@@ �A�������	= [compare] on pipes is based on the internal id of the pipe. @��*g�  �O  �O�*h�  �O  ��@@@@��*j�  �O  �O�*k�  �O  ��@@��+X@@ ��+Y@@ �A@��*p�  ��  ���*q�  ��  ��@��*s�  ��  ���*t�  ��  ��@�����*���+f@@ ��+g@@ �A�������1 {2 Size budget} @��*��  ��  ���*��  ��  ��@@@@��*��  ��  ���*��  ��  ��@@��+w@@ ��+x@@ �A��*��  ��  ���*��  ��  ��@���Р+size_budget��*�  ��  ���*�  ��  ��@��@����!t��*�  ��  ���*�  ��  ��@��@��*�  ��  ���*�  ��  ��@@@��@��*�  ��  ���*�  ��  ��@@@@��*�  ��  ���*�  ��  ��@@@����#int��*�  ��  ���*�  ��  ��@@��*�  ��  ���*�  ��  ��@@@��*�  ��  ���*�  ��  ��@@@@���%���+�@@ ��+�@@ �A�������
  � Every pipe has a "size budget", which governs the pushback that is used to discourage
    writers from enqueueing arbitrarily large amounts of data.  As long as the length of
    the pipe exceeds the size budget, writers will not be notified to do further writing.
    Whenever the length is less than or equal to the size budget, writers will be notified
    to continue.

    Every pipe's initial size budget is zero. @��*��  ��  ���*�  �O  �@@@@��*��  ��  ���*�  �O  �@@��+�@@ ��+�@@ �A@��*�  ��  ���*�  ��  ��@��*�  ��  ���*�  ��  ��@���Р/set_size_budget��*�  �  ��*�  �  �!@��@����!t��*�  �  �+�*�  �  �,@��@��*�  �  �%�*�  �  �&@@@��@��*�  �  �(�*�  �  �)@@@@��*�  �  �$�*�  �  �,@@@��@����#int��+  �  �0�+  �  �3@@��+  �  �0�+  �  �3@@@����$unit��+  �  �7�+  �  �;@@��+  �  �7�+  �  �;@@@��+  �  �0�+  �  �;@@@��+  �  �$�+  �  �;@@@@���%��,	@@ ��,
@@ �A�������	e [set_size_budget t i] changes the size budget of [t] to [i].  Any nonnegative value is
    allowed. @��+)  ��  ���+*  ��  �@@@@��+,  ��  ���+-  ��  �@@��,@@ ��,@@ �A@��+2  �  ��+3  �  �;@��+5  �  ��+6  �  �;@�����+I��,(@@ ��,)@@ �A�������/ {2 Debugging} @��+H	  �=  �=�+I	  �=  �Q@@@@��+K	  �=  �=�+L	  �=  �Q@@��,9@@ ��,:@@ �A��+Q	  �=  �=�+R	  �=  �Q@���Р3show_debug_messages��+Z  ��  ���+[  ��  ��@����#ref��+b  ��  ��+c  ��  �	@�����$bool��+k  ��  ��+l  ��  �@@��+n  ��  ��+o  ��  �@@@@��+q  ��  ��+r  ��  �	@@@@���&J��,b@@ ��,c@@ �A�������	� [show_debug_messages], if true, will cause a message to be printed at the start of
    each operation, showing the pipe and other arguments. @��+�  �S  �S�+�  ��  ��@@@@��+�  �S  �S�+�  ��  ��@@��,s@@ ��,t@@ �A@��+�  ��  ���+�  ��  �	@��+�  ��  ���+�  ��  �	@���Р/check_invariant��+�  �}  ���+�  �}  ��@����#ref��+�  �}  ���+�  �}  ��@�����$bool��+�  �}  ���+�  �}  ��@@��+�  �}  ���+�  �}  ��@@@@��+�  �}  ���+�  �}  ��@@@@���&���,�@@ ��,�@@ �A�������	l [check_invariant], if true, will cause pipes' invariants to be checked at the start of
    each operation. @��+�  �  ��+�  �f  �|@@@@��+�  �  ��+�  �f  �|@@��,�@@ ��,�@@ �A@��+�  �}  �}�+�  �}  ��@��+�  �}  �}�+�  �}  ��@@