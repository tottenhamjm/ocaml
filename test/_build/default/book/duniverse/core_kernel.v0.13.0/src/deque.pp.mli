Caml1999N026����   2         	0book/duniverse/core_kernel.v0.13.0/src/deque.mli����  U�  �  :]  8l�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
    A double-ended queue that can shrink and expand on both ends.

    An index is assigned to an element when it enters the queue, and the index of an
    element is static (i.e., an index refers to a distinct element until that element is
    removed from the queue, no matter how many intervening push/pop operations occur).

    One consequence of this is that the minimum index may be less than zero.

    The "front" is the smallest valid index, while the "back" is the largest.

    All operations are amortized O(1) with a small constant. @��	0book/duniverse/core_kernel.v0.13.0/src/deque.mliBAA�L�&@@@@��BAA�L�&@@���@@ ���@@ �A��
BAA�L�&@������&Import��N(.�N(4@@��N((�N(4@@��N((�N(4@���A�    �!t��$P6>�%P6?@����!a��,P6;�-P6=@@@B@@@A@���(deriving��3P6C�4P6K@�����������&bin_io��BP6L�CP6R@��EP6L�FP6R@@@�����$sexp��NP6T�OP6X@��QP6T�RP6X@@@@��TP6L�UP6X@@@@��WP6L�XP6X@@��ZP6@�[P6Y@@��]P66�^P6Y@@��`P66�aP6Y@�����������-ocaml.warning��oP66�pP6Y@�������#-32@��zP66�{P6Y@@@@��}P66�~P6Y@@���P66��P6Y@���P66��P6Y@������������(Bin_prot'Binable"S1���P66��P6Y@���P66��P6Y@@����!t���P66��P6Y@    �����P6>��P6?@��������P6;��P6=@@@B@@@A���������P6>��P6?@�������P6;��P6=@@@@���P66��P6Y@@@@���P66��P6Y@@���P66��P6Y@@���P66��P6Y@@���P66��P6Y@������������1Ppx_sexp_conv_lib(Sexpable"S1���P66��P6Y@���P66��P6Y@@����F���P66��P6Y@    �ǰ��P6>��P6?@����ư��P6;��P6=@@@B@@@A�����ְ��P6>��P6?@���԰��P6;� P6=@@@@��P66�P6Y@@@@��P66�P6Y@@��P66�	P6Y@@��P66�P6Y@@��P66�P6Y@@��P66�P6Y@@��P66�P6Y@���)ocaml.doc��P66�P6Y@�������'@inline@��&P66�'P6Y@@@@��)P66�*P6Y@@��,P66�-P6Y@@��/P66�0P6Y@�����������1Binary_searchable"S1��?R[c�@R[w@��BR[c�CR[w@@����!t��JR[��KR[�@    ���OR[��PR[�@����!a��WR[��XR[�@@@B@@@A�����!t��`R[��aR[�@���!a��gR[��hR[�@@@@��jR[��kR[�@@@@��mR[}�nR[�@@��pR[c�qR[�@@��sR[[�tR[�@@��vR[[�wR[�@�����������)Container"S1���U����U��@���U����U��@@����!t���U����U��@    ����U����U��@����!a���U����U��@@@B@@@A�����!t���U����U��@���!a���U����U��@@@@���U����U��@@@@���U����U��@@���U����U��@@���U����U��@@���U����U��@���Р&create���`����`��@���.initial_length����#int���a����a��@@���a����a��@@���)ocaml.doc���@@ ���@@ �A�������2 defaults to [7]. @���a����a��@@@@���a����a��@@���@@ ���@@ �A@���,never_shrink����$bool���b����b�@@���b����b�@@@��@����$unit��c�c@@��	c�
c@@@����!t��d�d@��@��d�d@@@@��d�d@@@��c�d@@@��b��� d@@@��"a���#d@@@@���M��@@ ��@@ �A�������
  � [create ?initial_length ?never_shrink ()] creates a new [t]. [initial_length] is the
    initial length of the dequeue; it will be able to hold [initial_length] elements
    without resizing. It must be positive. If [never_shrink] is true, the physical array
    will never shrink, only expand. If [initial_length] is given without [never_shrink],
    then [never_shrink] is presumed to be [true], otherwise [never_shrink] defaults to
    [false].

    @param initial_length defaults to 7
@��3W���4_��@@@@��6W���7_��@@��$@@ ��%@@ �A@��<`���=d@��?`���@d@���Р(of_array��Hi���Ii��@��@����%array��Ri���Si��@���!a��Yi���Zi��@@@@��\i���]i��@@@����!t��di���ei��@���!a��ki���li��@@@@��ni���oi��@@@��qi���ri��@@@@������b@@ ��c@@ �A�������	� [of_array arr] creates a dequeue containing the elements of [arr].  The first element
    of the array will be at the front of the dequeue. @���g��hq�@@@@���g��hq�@@��s@@ ��t@@ �A@���i����i��@���i����i��@���Р+front_index���l��l@��@����!t���l!��l"@��@���l��l @@@@���l��l"@@@����&option���l*��l0@�����#int���l&��l)@@���l&��l)@@@@���l&��l0@@@���l��l0@@@@������@@ ���@@ �A�������	< [front_index t] return the index of the front item in [t]. @���k����k�@@@@���k����k�@@���@@ ���@@ �A@���l��l0@���l��l0@���Р/front_index_exn���p����p��@��@����!t���p����p��@��@���p����p��@@@@���p����p��@@@����#int��p���p��@@��p���p��@@@��	p���
p��@@@@���4���@@ ���@@ �A�������	t [front_index_exn t] throws an exception if [t] is empty, otherwise returns the index
    of the front item in [t]. @��n22�o��@@@@��n22�o��@@��@@ ��@@ �A@��#p���$p��@��&p���'p��@���Р*back_index��/s�0s@��@����!t��9s!�:s"@��@��>s�?s @@@@��As�Bs"@@@����&option��Is*�Js0@�����#int��Rs&�Ss)@@��Us&�Vs)@@@@��Xs&�Ys0@@@��[s�\s0@@@@������L@@ ��M@@ �A�������	: [back_index t] return the index of the back item in [t]. @��lr���mr�@@@@��or���pr�@@��]@@ ��^@@ �A@��us�vs0@��xs�ys0@���Р.back_index_exn���w����w��@��@����!t���w����w��@��@���w����w��@@@@���w����w��@@@����#int���w����w��@@���w����w��@@@���w����w��@@@@���̰��@@ ���@@ �A�������	r [back_index_exn t] throws an exception if [t] is empty, otherwise returns the index
    of the back item in [t]. @���u22��v��@@@@���u22��v��@@���@@ ���@@ �A@���w����w��@���w����w��@���Р'get_opt���z#'��z#.@��@����!t���z#4��z#5@���!a���z#1��z#3@@@@���z#1��z#5@@@��@����#int���z#9��z#<@@���z#9��z#<@@@����&option���z#C��z#I@���!a���z#@��z#B@@@@���z#@��z#I@@@���z#9��z#I@@@�� z#1�z#I@@@@���+���@@ ���@@ �A�������	R [get_opt t i] returns the element at index [i]. Return [None] if [i] is invalid. @��y���y�"@@@@��y���y�"@@��@@ ��@@ �A@��z##�z#I@��z##�z#I@���Р#get��&~���'~��@��@����!t��0~���1~��@���!a��7~���8~��@@@@��:~���;~��@@@��@����#int��D~���E~��@@��G~���H~��@@@��!a��M~���N~��@@@��P~���Q~��@@@��S~���T~��@@@@���~��D@@ ��E@@ �A�������	W [get t i] returns the element at index [i]. Raise an exception if [i] is
    invalid. @��d|KK�e}��@@@@��g|KK�h}��@@��U@@ ��V@@ �A@��m~���n~��@��p~���q~��@���Р$peek��y B	2	6�z B	2	:@��@����!t��� B	2	@�� B	2	A@���!a��� B	2	=�� B	2	?@@@@��� B	2	=�� B	2	A@@@��@������$back��� B	2	G�� B	2	L@A@��� B	2	G�� B	2	L@@����%front��� B	2	O�� B	2	U@A@��� B	2	O�� B	2	U@@@@@��� B	2	E�� B	2	W@@@����&option��� B	2	^�� B	2	d@���!a��� B	2	[�� B	2	]@@@@��� B	2	[�� B	2	d@@@��� B	2	E�� B	2	d@@@��� B	2	=�� B	2	d@@@@�������@@ ���@@ �A�������	g [peek t back_or_front] returns the value at the back or front of the dequeue without
    removing it. @��� @���� A		1@@@@��� @���� A		1@@���@@ ���@@ �A@��� B	2	2�� B	2	d@��� B	2	2�� B	2	d@���Р*peek_front��� D	f	j�� D	f	t@��@����!t��� D	f	z�� D	f	{@���!a��� D	f	w�� D	f	y@@@@��� D	f	w�� D	f	{@@@����&option�� D	f	�� D	f	�@���!a�� D	f	� D	f	�@@@@�� D	f	� D	f	�@@@�� D	f	w� D	f	�@@@@@�� D	f	f� D	f	�@�� D	f	f� D	f	�@���Р.peek_front_exn��  E	�	��! E	�	�@��@����!t��* E	�	��+ E	�	�@���!a��1 E	�	��2 E	�	�@@@@��4 E	�	��5 E	�	�@@@��!a��: E	�	��; E	�	�@@@��= E	�	��> E	�	�@@@@@��@ E	�	��A E	�	�@��C E	�	��D E	�	�@���Р)peek_back��L F	�	��M F	�	�@��@����!t��V F	�	��W F	�	�@���!a��] F	�	��^ F	�	�@@@@��` F	�	��a F	�	�@@@����&option��h F	�	��i F	�	�@���!a��o F	�	��p F	�	�@@@@��r F	�	��s F	�	�@@@��u F	�	��v F	�	�@@@@@��x F	�	��y F	�	�@��{ F	�	��| F	�	�@���Р-peek_back_exn��� G	�	��� G	�	�@��@����!t��� G	�	��� G	�	�@���!a��� G	�	��� G	�	�@@@@��� G	�	��� G	�	�@@@��!a��� G	�	��� G	�	�@@@��� G	�	��� G	�	�@@@@@��� G	�	��� G	�	�@��� G	�	��� G	�	�@���Р'set_exn��� J

"�� J

)@��@����!t��� J

/�� J

0@���!a��� J

,�� J

.@@@@��� J

,�� J

0@@@��@����#int��� J

4�� J

7@@��� J

4�� J

7@@@��@��!a��� J

;�� J

=@@@����$unit��� J

A�� J

E@@��� J

A�� J

E@@@��� J

;�� J

E@@@��� J

4�� J

E@@@��� J

,�� J

E@@@@������@@ ���@@ �A�������	- [set_exn t i v] mutates the element at [i]. @��� I	�	��� I	�
@@@@�� I	�	�� I	�
@@���@@ ���@@ �A@�� J

� J

E@��
 J

� J

E@���Р%iter'�� M
~
�� M
~
�@��@����!t�� M
~
�� M
~
�@���!a��$ M
~
��% M
~
�@@@@��' M
~
��( M
~
�@@@��@������-front_to_back��3 M
~
��4 M
~
�@A@��6 M
~
��7 M
~
�@@����-back_to_front��> M
~
��? M
~
�@A@��A M
~
��B M
~
�@@@@@��D M
~
��E M
~
�@@@���!f��@��!a��P M
~
��Q M
~
�@@@����$unit��X M
~
��Y M
~
�@@��[ M
~
��\ M
~
�@@@��^ M
~
��_ M
~
�@@@����$unit��f M
~
��g M
~
�@@��i M
~
��j M
~
�@@@��l M
~
��m M
~
�@@@��o M
~
��p M
~
�@@@��r M
~
��s M
~
�@@@@������c@@ ��d@@ �A�������	1 [iter' t ~f] iterates over the elements of [t]. @��� L
G
G�� L
G
}@@@@��� L
G
G�� L
G
}@@��t@@ ��u@@ �A@��� M
~
~�� M
~
�@��� M
~
~�� M
~
�@���Р%iteri��� Q26�� Q2;@��@����!t��� Q2A�� Q2B@���!a��� Q2>�� Q2@@@@@��� Q2>�� Q2B@@@���!f��@����#int��� Q2I�� Q2L@@��� Q2I�� Q2L@@@��@��!a��� Q2P�� Q2R@@@����$unit��� Q2V�� Q2Z@@��� Q2V�� Q2Z@@@��� Q2P�� Q2Z@@@��� Q2I�� Q2Z@@@����$unit��� Q2_�� Q2c@@��� Q2_�� Q2c@@@��� Q2F�� Q2c@@@��� Q2>�� Q2c@@@@������@@ ���@@ �A�������	[ [iteri t ~f] iterates over the elements of [t] [`front_to_back] passing in the
    index. @��� O
�
��� P$1@@@@��� O
�
��� P$1@@���@@ ���@@ �A@�� Q22� Q2c@�� Q22� Q2c@���Р&iteri'�� U��� U��@��@����!t�� U��� U��@���!a�� U��� U��@@@@��! U���" U��@@@��@������-front_to_back��- U���. U��@A@��0 U���1 U��@@����-back_to_front��8 U���9 U�@A@��; U���< U�@@@@@��> U���? U�@@@���!f��@����#int��L U�
�M U�@@��O U�
�P U�@@@��@��!a��W U��X U�@@@����$unit��_ U��` U�@@��b U��c U�@@@��e U��f U�@@@��h U�
�i U�@@@����$unit��p U� �q U�$@@��s U� �t U�$@@@��v U��w U�$@@@��y U���z U�$@@@��| U���} U�$@@@@������m@@ ��n@@ �A�������	` [iteri' t ~f] is the same as [iter'], but also passes in the index of the current
    element. @��� See�� T��@@@@��� See�� T��@@��~@@ ��@@ �A@��� U���� U�$@��� U���� U�$@���Р%fold'��� X`d�� X`i@��@����!t��� Yjr�� Yjs@���!a��� Yjo�� Yjq@@@@��� Yjo�� Yjs@@@��@������-front_to_back��� Zt{�� Zt�@A@��� Zt{�� Zt�@@����-back_to_front��� Zt��� Zt�@A@��� Zt��� Zt�@@@@@��� Zty�� Zt�@@@���$init��!b��� [���� [��@@@���!f��@��!b��� \���� \��@@@��@��!a��� \���� \��@@@��!b��� \���� \��@@@��� \���� \��@@@��� \���� \��@@@��!b�� ]��� ]��@@@�� \��� ]��@@@��	 [���
 ]��@@@�� Zty� ]��@@@�� Yjo� ]��@@@@���:��	 @@ ��	@@ �A�������	4 [fold' t ~init ~f] folds over the elements of [t]. @��  W&&�! W&_@@@@��# W&&�$ W&_@@��	@@ ��	@@ �A@��) X``�* ]��@��, X``�- ]��@���Р%foldi��5 a<@�6 a<E@��@����!t��? a<K�@ a<L@���!a��F a<H�G a<J@@@@��I a<H�J a<L@@@���$init��!b��S a<U�T a<W@@@���!f��@����#int��a a<^�b a<a@@��d a<^�e a<a@@@��@��!b��l a<e�m a<g@@@��@��!a��t a<k�u a<m@@@��!b��z a<q�{ a<s@@@��} a<k�~ a<s@@@��� a<e�� a<s@@@��� a<^�� a<s@@@��!b��� a<x�� a<z@@@��� a<[�� a<z@@@��� a<P�� a<z@@@��� a<H�� a<z@@@@������	�@@ ��	�@@ �A�������	k [foldi t ~init ~f] is the same as [fold], but also passes in the index of the current
    element to [f]. @��� _���� `%;@@@@��� _���� `%;@@��	�@@ ��	�@@ �A@��� a<<�� a<z@��� a<<�� a<z@���Р&foldi'��� e���� e��@��@����!t��� f��� f�@���!a��� f���� f�@@@@��� f���� f�@@@��@������-front_to_back��� g�� g@A@��� g�� g@@����-back_to_front��� g�� g*@A@��� g�� g*@@@@@��� g	�� g,@@@���$init��!b��� h-7�� h-9@@@���!f��@����#int��	 i:B�	 i:E@@��	 i:B�	 i:E@@@��@��!b��	 i:I�	 i:K@@@��@��!a��	 i:O�	 i:Q@@@��!b��	 i:U�	 i:W@@@��	 i:O�	 i:W@@@��	  i:I�	! i:W@@@��	# i:B�	$ i:W@@@��!b��	) jY^�	* jY`@@@��	, i:?�	- jY`@@@��	/ h-2�	0 jY`@@@��	2 g	�	3 jY`@@@��	5 f���	6 jY`@@@@���`��
&@@ ��
'@@ �A�������	m [foldi' t ~init ~f] is the same as [fold'], but also passes in the index of the
    current element to [f]. @��	F c||�	G d��@@@@��	I c||�	J d��@@��
7@@ ��
8@@ �A@��	O e���	P jY`@��	R e���	S jY`@���Р'enqueue��	[ m���	\ m��@��@����!t��	e m���	f m��@���!a��	l m���	m m��@@@@��	o m���	p m��@@@��@������$back��	{ m���	| m��@A@��	~ m���	 m��@@����%front��	� m���	� m��@A@��	� m���	� m��@@@@@��	� m���	� m��@@@��@��!a��	� m���	� m��@@@����$unit��	� m���	� m��@@��	� m���	� m��@@@��	� m���	� m��@@@��	� m���	� m��@@@��	� m���	� m��@@@@���Ӱ�
�@@ ��
�@@ �A�������	I [enqueue t back_or_front v] pushes [v] onto the [back_or_front] of [t]. @��	� lbb�	� lb�@@@@��	� lbb�	� lb�@@��
�@@ ��
�@@ �A@��	� m���	� m��@��	� m���	� m��@���Р-enqueue_front��	� o���	� o��@��@����!t��	� o� �	� o�@���!a��	� o���	� o��@@@@��	� o���	� o�@@@��@��!a��	� o��	� o�@@@����$unit��	� o��	� o�@@��	� o��	� o�@@@��	� o��	� o�@@@��	� o���	� o�@@@@@��	� o���	� o�@��
 o���
 o�@���Р,enqueue_back��

 p�
 p @��@����!t��
 p&�
 p'@���!a��
 p#�
 p%@@@@��
 p#�
 p'@@@��@��!a��
& p+�
' p-@@@����$unit��
. p1�
/ p5@@��
1 p1�
2 p5@@@��
4 p+�
5 p5@@@��
7 p#�
8 p5@@@@@��
: p�
; p5@��
= p�
> p5@���Р%clear��
F sgk�
G sgp@��@����!t��
P sgu�
Q sgv@��@��
U sgs�
V sgt@@@@��
X sgs�
Y sgv@@@����$unit��
` sgz�
a sg~@@��
c sgz�
d sg~@@@��
f sgs�
g sg~@@@@������W@@ ��X@@ �A�������	* [clear t] removes all elements from [t]. @��
w r77�
x r7f@@@@��
z r77�
{ r7f@@��h@@ ��i@@ �A@��
� sgg�
� sg~@��
� sgg�
� sg~@���Р$drop��
� w �
� w$@���!n����#int��
� w*�
� w-@@��
� w*�
� w-@@@��@����!t��
� w3�
� w4@��@��
� w1�
� w2@@@@��
� w1�
� w4@@@��@������$back��
� w:�
� w?@A@��
� w:�
� w?@@����%front��
� wB�
� wH@A@��
� wB�
� wH@@@@@��
� w8�
� wJ@@@����$unit��
� wN�
� wR@@��
� wN�
� wR@@@��
� w8�
� wR@@@��
� w1�
� wR@@@��
� w'�
� wR@@@@���		���@@ ���@@ �A�������	� [drop ?n t back_or_front] drops [n] elements (default 1) from the [back_or_front] of
    [t]. If [t] has fewer than [n] elements then it is cleared. @��
� u���
� v�@@@@��
� u���
� v�@@���@@ ���@@ �A@��
� w�
� wR@��
� w�
� wR@���Р*drop_front�� yTX� yTb@���!n����#int�� yTh� yTk@@�� yTh� yTk@@@��@����!t�� yTq� yTr@��@��" yTo�# yTp@@@@��% yTo�& yTr@@@����$unit��- yTv�. yTz@@��0 yTv�1 yTz@@@��3 yTo�4 yTz@@@��6 yTe�7 yTz@@@@@��9 yTT�: yTz@��< yTT�= yTz@���Р)drop_back��E z{�F z{�@���!n����#int��Q z{��R z{�@@��T z{��U z{�@@@��@����!t��^ z{��_ z{�@��@��c z{��d z{�@@@@��f z{��g z{�@@@����$unit��n z{��o z{�@@��q z{��r z{�@@@��t z{��u z{�@@@��w z{��x z{�@@@@@��z z{{�{ z{�@��} z{{�~ z{�@���Р'dequeue��� }���� }��@��@����!t��� }��� }�@���!a��� }��� }�@@@@��� }��� }�@@@��@������$back��� }��� }�@A@��� }��� }�@@����%front��� }��� }�@A@��� }��� }�@@@@@��� }�	�� }�@@@����&option��� }�"�� }�(@���!a��� }��� }�!@@@@��� }��� }�(@@@��� }�	�� }�(@@@��� }��� }�(@@@@���	����@@ ���@@ �A�������	K [dequeue t back_or_front] removes and returns the [back_or_front] of [t]. @��� |���� |��@@@@��� |���� |��@@���@@ ���@@ �A@��� }���� }�(@��� }���� }�(@���Р+dequeue_exn��� *.�� *9@��@����!t��� *?�  *@@���!a�� *<� *>@@@@��	 *<�
 *@@@@��@������$back�� *F� *K@A@�� *F� *K@@����%front��  *N�! *T@A@��# *N�$ *T@@@@@��& *D�' *V@@@��!a��, *Z�- *\@@@��/ *D�0 *\@@@��2 *<�3 *\@@@@@��5 **�6 *\@��8 **�9 *\@���Р-dequeue_front��A �]a�B �]n@��@����!t��K �]t�L �]u@���!a��R �]q�S �]s@@@@��U �]q�V �]u@@@����&option��] �]|�^ �]�@���!a��d �]y�e �]{@@@@��g �]y�h �]�@@@��j �]q�k �]�@@@@@��m �]]�n �]�@��p �]]�q �]�@���Р1dequeue_front_exn��y ����z ���@��@����!t��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@��!a��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��� ����� ���@���Р,dequeue_back��� ����� ���@��@����!t��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@����&option��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��� ����� ���@���Р0dequeue_back_exn��� ����� ���@��@����!t��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@��!a��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��  ���� ���@@