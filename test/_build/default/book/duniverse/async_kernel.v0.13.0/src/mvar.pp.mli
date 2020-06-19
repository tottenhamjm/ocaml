Caml1999N026����   2         	0book/duniverse/async_kernel.v0.13.0/src/mvar.mli����  C�  
t  ,�  *������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � An [Mvar] is a mutable location that is either empty or contains a value.  One can
    [put] or [set] the value, and wait on [value_available] for the location to be filled
    in either way.

    Having an [Mvar.Read_write.t] gives the capability to mutate the mvar.

    The key difference between an [Mvar] and an {{!Async_kernel.Ivar}[Ivar]} is that an
    [Mvar] may be filled multiple times.

    This implementation of [Mvar] also allows one to replace the value without any
    guarantee that the reading side has seen it.  This is useful in situations where
    last-value semantics are desired (e.g., you want to signal whenever a config file is
    updated, but only care about the most recent contents).

    An [Mvar] can also be used as a baton-passing mechanism between a producer and
    consumer.  For instance, a producer reading from a socket and producing a set of
    deserialized messages can [put] the batch from a single read into an [Mvar] and can
    wait for [taken] to return as a pushback mechanism.  The consumer meanwhile waits on
    [value_available].  This way the natural batch size is passed between the two
    sub-systems with minimal overhead. @��	0book/duniverse/async_kernel.v0.13.0/src/mvar.mliA@@�T|�@@@@��A@@�T|�@@���@@ ���@@ �A��
A@@�T|�@������+Core_kernel��V���V��@@��V���V��@@��V���V��@������&Import��$W���%W��@@��'W���(W��@@��*W���+W��@���A�    �!t��4Y���5Y��@����!a��<Y���=Y��@@@B����'phantom��DY���EY��@@@A@@@A@���(deriving��KY���LY��@��������'sexp_of��WY���XY��@��ZY���[Y��@@@@��]Y���^Y��@@��`Y���aY��@@��cY���dY��@@��fY���gY��@�����������-ocaml.warning��uY���vY��@�������#-32@���Y����Y��@@@@���Y����Y��@@���Y����Y��@���Y����Y��@���Р)sexp_of_t���Y����Y��@��@��@��`���Y����Y��@@@������1Ppx_sexp_conv_lib$Sexp!t���Y����Y��@@���Y����Y��@@@���Y����Y��@@@��@��@��s���Y����Y��@@@���������Y����Y��@@���Y����Y��@@@���Y����Y��@@@��@��������Y����Y��@�������Y����Y��@@@�������Y����Y��@@@@���Y����Y��@@@������BA@���Y����Y��@@���Y����Y��@@@���Y����Y��@@@���Y����Y��@@@���Y����Y��@@@@@���Y����Y��@���Y����Y��@@���Y����Y��@@���Y����Y��@���)ocaml.doc��Y���Y��@�������'@inline@��Y���Y��@@@@��Y���Y��@@��Y���Y��@@��Y���Y��@�����*Read_write��"[���#[�@�����@�    �!t��.\�/\@����!a��6\�7\@@@B@@@A�����!t��?\2�@\3@���!a��F\"�G\$@@@�����*read_write��O\&�P\0@@��R\&�S\0@@@@��U\!�V\3@@@���(deriving��\\7�]\?@��������'sexp_of��h\@�i\G@��k\@�l\G@@@@��n\@�o\G@@��q\4�r\H@@��t\�u\H@@��w\�x\H@��������������\��\H@�������@���\��\H@@@@���\��\H@@���\��\H@���\��\H@���Р)sexp_of_t���\��\@��@��@��u���\��\@@@���������\��\@@���\��\@@@���\��\@@@��@��������\��\@�������\��\@@@@���\��\@@@������0/.���\��\@@���\��\@@@���\��\@@@���\��\@@@@@���\��\H@���\��\H@@���\��\H@@���\��\H@������\��\H@��������@���\��\H@@@@���\��\H@@���\� \H@@��\�\H@�����������)Invariant"S1��^JT�^J`@��^JT�^J`@@����!t��^Jn�^Jo@    ���"^Jn�#^Jo@����!a��*^Jk�+^Jm@@@B@@@A�����!t��3^Jv�4^Jw@���!a��:^Js�;^Ju@@@@��=^Js�>^Jw@@@@��@^Jf�A^Jw@@��C^JT�D^Jw@@��F^JL�G^Jw@@��I^JL�J^Jw@@��L[��M_x{@@@��O[���P_x{@��R[���S_x{@�����)Read_only��[a}��\a}�@�����@�    �!t��gb���hb��@����!a��ob���pb��@@@B@@@A�����!t��xb���yb��@���!a��b����b��@@@�����$read���b����b��@@���b����b��@@@@���b����b��@@@���(deriving���b����b��@��������'sexp_of���b����b��@���b����b��@@@@���b����b��@@���b����b��@@���b����b��@@���b����b��@�����������J���b����b��@�������I@���b����b��@@@@���b����b��@@���b����b��@���b����b��@���Р)sexp_of_t���b����b��@��@��@��u���b����b��@@@������HGF���b����b��@@���b����b��@@@���b����b��@@@��@��������b����b��@������b���b��@@@@��b���b��@@@������ihg��b���b��@@��b���b��@@@��b���b��@@@��b���b��@@@@@��b���b��@��b���b��@@��b��� b��@@��"b���#b��@���$��(b���)b��@�������#@��2b���3b��@@@@��5b���6b��@@��8b���9b��@@��;b���<b��@�����������)Invariant"S1��Kd���Ld��@��Nd���Od��@@����!t��Vd���Wd��@    ���[d���\d��@����!a��cd���dd��@@@B@@@A�����!t��ld���md��@���!a��sd���td��@@@@��vd���wd��@@@@��yd���zd��@@��|d���}d��@@��d����d��@@���d����d��@@���a}���e��@@@���a}}��e��@���a}}��e��@���Р&create���g���g�	@��@����$unit���g���g�@@���g���g�@@@�����*Read_write!t���g���g�#@���!a���g���g�@@@@���g���g�#@@@���g���g�#@@@@@���g����g�#@���g����g�#@���Р(is_empty���h$(��h$0@��@����!t���h$:��h$;@��@���h$4��h$5@@@��@���h$7��h$8@@@@���h$3��h$;@@@����$bool���h$?��h$C@@���h$?��h$C@@@���h$3��h$C@@@@@���h$$��h$C@���h$$��h$C@���Р#put���m��m@��@����!t��m/�m0@���!a��m�m!@@@����������%write��m&�m+@@��m&�m+@@@�� m&�!m+@@@A@��#m#�$m-@@@@��&m�'m0@@@��@��!a��.m4�/m6@@@�����(Deferred!t��8m?�9mI@�����$unit��Am:�Bm>@@��Dm:�Em>@@@@��Gm:�HmI@@@��Jm4�KmI@@@��Mm�NmI@@@@���)ocaml.doc��?@@ ��@@@ �A�������	� [put t a] waits until [is_empty t], and then does [set t a].  If there are multiple
    concurrent [put]s, there is no fairness guarantee (i.e., [put]s may happen out of
    order or may be starved). @��_jEE�`l�@@@@��bjEE�cl�@@��P@@ ��Q@@ �A@��hm�imI@��km�lmI@���Р#set��tq���uq��@��@����!t��~q���q��@���!a���q����q��@@@����������%write���q����q��@@���q����q��@@@���q����q��@@@A@���q����q��@@@@���q����q��@@@��@��!a���q����q��@@@����$unit���q���q�@@���q���q�@@@���q����q�@@@���q����q�@@@@���k���@@ ���@@ �A�������	� [set t a] sets the value in [t] to [a], even if [not (is_empty t)].  This is useful if
    you want takers to have last-value semantics. @���oKK��p��@@@@���oKK��p��@@���@@ ���@@ �A@���q����q�@���q����q�@���Р&update���u����u��@��@����!t���u����u��@���!a���u����u��@@@�����*read_write���u����u��@@���u����u��@@@@���u����u��@@@���!f��@����&option��u���u��@���!a��u���u��@@@@��u���u��@@@��!a��u���u��@@@��u��� u��@@@����$unit��'u���(u��@@��*u���+u��@@@��-u���.u��@@@��0u���1u��@@@@�����!@@ ��"@@ �A�������	� [update t ~f] applies [f] to the value in [t] and [set]s [t] to the result.  This is
    useful if you want takers to have accumulated-value semantics. @��As�Bt`�@@@@��Ds�Et`�@@��2@@ ��3@@ �A@��Ju���Ku��@��Mu���Nu��@���Р*update_exn��Vx	.	2�Wx	.	<@��@����!t��`x	.	P�ax	.	Q@���!a��gx	.	@�hx	.	B@@@�����*read_write��px	.	D�qx	.	N@@��sx	.	D�tx	.	N@@@@��vx	.	?�wx	.	Q@@@���!f��@��!a���x	.	X��x	.	Z@@@��!a���x	.	^��x	.	`@@@���x	.	X��x	.	`@@@����$unit���x	.	e��x	.	i@@���x	.	e��x	.	i@@@���x	.	U��x	.	i@@@���x	.	?��x	.	i@@@@���O���@@ ���@@ �A�������	B [update_exn] is like [update], except it raises if [is_empty t]. @���w����w�	-@@@@���w����w�	-@@���@@ ���@@ �A@���x	.	.��x	.	i@���x	.	.��x	.	i@���Р)read_only���z	k	o��z	k	x@��@����!t���z	k	���z	k	�@���!a���z	k	|��z	k	~@@@����������$read���z	k	���z	k	�@@���z	k	���z	k	�@@@���z	k	���z	k	�@@@A@���z	k	���z	k	�@@@@���z	k	{��z	k	�@@@����!t���z	k	���z	k	�@���!a���z	k	���z	k	�@@@�����$read��z	k	��z	k	�@@��z	k	��	z	k	�@@@@��z	k	��z	k	�@@@��z	k	{�z	k	�@@@@@��z	k	k�z	k	�@��z	k	k�z	k	�@���Р*write_only��{	�	��{	�	�@��@����!t��'{	�	��({	�	�@���!a��.{	�	��/{	�	�@@@����������%write��<{	�	��={	�	�@@��?{	�	��@{	�	�@@@��B{	�	��C{	�	�@@@A@��E{	�	��F{	�	�@@@@��H{	�	��I{	�	�@@@����!t��P{	�	��Q{	�	�@���!a��W{	�	��X{	�	�@@@�����%write��`{	�	��a{	�	�@@��c{	�	��d{	�	�@@@@��f{	�	��g{	�	�@@@��i{	�	��j{	�	�@@@@@��l{	�	��m{	�	�@��o{	�	��p{	�	�@���Р/value_available��x C;?�y C;N@��@����!t��� C;`�� C;a@��@��� C;R�� C;S@@@����������$read��� C;X�� C;\@@��� C;X�� C;\@@@��� C;X�� C;\@@@A@��� C;U�� C;^@@@@��� C;Q�� C;a@@@�����(Deferred!t��� C;j�� C;t@�����$unit��� C;e�� C;i@@��� C;e�� C;i@@@@��� C;e�� C;t@@@��� C;Q�� C;t@@@@���p���@@ ���@@ �A�������
  b [value_available t] returns a deferred [d] that becomes determined when a value is in
    [t].  [d] does not include the value in [t] because that value may change after [d]
    becomes determined and before a deferred bind on [d] gets to run.

    Repeated calls to [value_available t] will always return the same deferred until
    the [t] is filled. @���}	�	��� B!:@@@@���}	�	��� B!:@@���@@ ���@@ �A@��� C;;�� C;t@��� C;;�� C;t@���Р$take��� I���� I��@��@����!t��� I���� I��@���!a��� I���� I��@@@����������$read�� I��� I��@@�� I��� I��@@@�� I���	 I��@@@A@�� I��� I��@@@@�� I��� I��@@@�����(Deferred!t�� I��� I�@���!a�� I���  I��@@@@��" I���# I�@@@��% I���& I�@@@@���ذ�@@ ��@@ �A�������
  ] [take t] returns a deferred that, when [t] is filled, becomes determined with the
    value of [t] and and clears [t].  If there are multiple concurrent calls to [take]
    then only one of them will be fulfilled and the others will continue waiting on future
    values.  There is no ordering guarantee for which [take] call will be filled first. @��6 Evv�7 H~�@@@@��9 Evv�: H~�@@��'@@ ��(@@ �A@��? I���@ I�@��B I���C I�@���Р(take_now��K L:>�L L:F@��@����!t��U L:Y�V L:Z@���!a��\ L:J�] L:L@@@����������$read��j L:Q�k L:U@@��m L:Q�n L:U@@@��p L:Q�q L:U@@@A@��s L:N�t L:W@@@@��v L:I�w L:Z@@@����&option��~ L:a� L:g@���!a��� L:^�� L:`@@@@��� L:^�� L:g@@@��� L:I�� L:g@@@@���>��|@@ ��}@@ �A�������	, [take_now] is an immediate form of [take]. @��� K�� K9@@@@��� K�� K9@@���@@ ���@@ �A@��� L::�� L:g@��� L::�� L:g@���Р,take_now_exn��� Nim�� Niy@��@����!t��� Ni��� Ni�@���!a��� Ni}�� Ni@@@����������$read��� Ni��� Ni�@@��� Ni��� Ni�@@@��� Ni��� Ni�@@@A@��� Ni��� Ni�@@@@��� Ni|�� Ni�@@@��!a��� Ni��� Ni�@@@��� Ni|�� Ni�@@@@@��� Nii�� Ni�@��� Nii�� Ni�@���Р%taken��� Q���� Q��@��@����!t��� Q��� Q�@��@�� Q��� Q��@@@����������%write�� Q��� Q�@@�� Q��� Q�@@@�� Q��� Q�@@@A@�� Q��� Q�@@@@�� Q��� Q�@@@�����(Deferred!t��' Q��( Q�@�����$unit��0 Q�
�1 Q�@@��3 Q�
�4 Q�@@@@��6 Q�
�7 Q�@@@��9 Q���: Q�@@@@�����	*@@ ��	+@@ �A�������	N [taken t] returns a deferred that is filled the next time [take] clears [t]. @��J P���K P��@@@@��M P���N P��@@��	;@@ ��	<@@ �A@��S Q���T Q�@��V Q���W Q�@���Р$peek��_ U���` U��@��@����!t��i U���j U��@���!a��p U���q U��@@@����������$read��~ U��� U��@@��� U���� U��@@@��� U���� U��@@@A@��� U���� U��@@@@��� U���� U��@@@����&option��� U���� U��@���!a��� U���� U��@@@@��� U���� U��@@@��� U���� U��@@@@���R��	�@@ ��	�@@ �A�������	` [peek t] returns the value in [t] without clearing [t], or returns [None] is [is_empty
    t]. @��� S�� Tv�@@@@��� S�� Tv�@@��	�@@ ��	�@@ �A@��� U���� U��@��� U���� U��@���Р(peek_exn��� X���� X��@��@����!t��� X��� X�@���!a��� X��� X�@@@����������$read��� X�	�� X�@@��� X�	�� X�@@@��� X�	�� X�@@@A@��� X��� X�@@@@��� X��� X�@@@��!a��� X��� X�@@@��� X��� X�@@@@������	�@@ ��	�@@ �A�������	@ [peek_exn t] is like [peek], except it raises if [is_empty t]. @��	
 W���	 W��@@@@��	 W���	 W��@@��	�@@ ��	�@@ �A@��	 X���	 X�@��	 X���	 X�@���Р/pipe_when_ready��	 gQU�	  gQd@��@����!t��	) gQw�	* gQx@���!a��	0 gQh�	1 gQj@@@����������$read��	> gQo�	? gQs@@��	A gQo�	B gQs@@@��	D gQo�	E gQs@@@A@��	G gQl�	H gQu@@@@��	J gQg�	K gQx@@@������$Pipe&Reader!t��	V gQ�	W gQ�@���!a��	] gQ|�	^ gQ~@@@@��	` gQ|�	a gQ�@@@��	c gQg�	d gQ�@@@@�����
T@@ ��
U@@ �A�������
  1 [pipe_when_ready t] returns a pipe, then repeatedly takes a value from [t] and writes
    it to the pipe.  After each write, [pipe_when_ready] waits for the pipe to be ready to
    accept another value before taking the next value.  Once the pipe is closed,
    [pipe_when_ready] will no longer take values from [t].

    Notice that this implementation effectively creates an extra buffer of size 1, so when
    you read from the pipe you can read a stale value (even though a fresh one should come
    immediately afterwards), and a value will be taken from the MVar even if it's never
    read from the pipe.

    There is no protection against creating multiple pipes or otherwise multiple things
    trying to [take] concurrently.  If that happens, it's not specified which of the pipes
    will get the value. @��	t Z�	u f6P@@@@��	w Z�	x f6P@@��
e@@ ��
f@@ �A@��	} gQQ�	~ gQ�@��	� gQQ�	� gQ�@@