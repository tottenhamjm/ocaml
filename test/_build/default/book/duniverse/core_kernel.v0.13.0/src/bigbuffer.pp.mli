Caml1999N026����   6         	4book/duniverse/core_kernel.v0.13.0/src/bigbuffer.mli����    j    Ơ����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � Extensible string buffers based on Bigstrings.

    This module implements string buffers that automatically expand as necessary.  It
    provides accumulative concatenation of strings in quasi-linear time (instead of
    quadratic time when strings are concatenated pairwise).

    This implementation uses Bigstrings instead of strings. This removes the 16MB limit
    on buffer size (on 32-bit machines), and improves I/O-performance when reading/writing
    from/to channels.
@��	4book/duniverse/core_kernel.v0.13.0/src/bigbuffer.mliA@@�J��@@@@��A@@�J��@@���@@ ���@@ �A��
A@@�J��@������&Import��L���L��@@��L���L��@@��L���L��@����������$Base&Buffer!S��*M���+M�
@��-M���.M�
@@��0M���1M�
@@��3M���4M�
@���Р,big_contents��<Q{�=Q{�@��@����!t��FQ{��GQ{�@@��IQ{��JQ{�@@@�����)Bigstring!t��SQ{��TQ{�@@��VQ{��WQ{�@@@��YQ{��ZQ{�@@@@���)ocaml.doc��K@@ ��L@@ �A�������	i Return a copy of the current contents of the buffer as a bigstring.
    The buffer itself is unchanged. @��kO�lPTz@@@@��nO�oPTz@@��\@@ ��]@@ �A@��tQ{{�uQ{�@��wQ{{�xQ{�@���Р1volatile_contents���V����V��@��@����!t���V����V��@@���V����V��@@@�����)Bigstring!t���V����V��@@���V����V��@@@���V����V��@@@@���D���@@ ���@@ �A�������	� Return the actual underlying bigstring used by this bigbuffer.
    No copying is involved.  To be safe, use and finish with the returned value
    before calling any other function in this module on the same [Bigbuffer.t]. @���S����U3�@@@@���S����U3�@@���@@ ���@@ �A@���V����V��@���V����V��@���Р-add_bigstring���Y��Y@��@����!t���Y��Y@@���Y��Y@@@��@�����)Bigstring!t���Y��Y'@@���Y��Y'@@@����$unit���Y+��Y/@@���Y+��Y/@@@���Y��Y/@@@���Y��Y/@@@@�������@@ ���@@ �A�������	M [add_bigstring b s] appends the bigstring [s] at the end of the buffer [b]. @��X���X�@@@@��X���X�@@���@@ ���@@ �A@��
Y�Y/@��Y�Y/@���Р,add_bin_prot��]���]��@��@����!t�� ]���!]��@@��#]���$]��@@@��@������(Bin_prot*Type_class&writer��1]���2]��@���!a��8]���9]��@@@@��;]���<]��@@@��@��!a��C]���D]��@@@����$unit��K]���L]��@@��N]���O]��@@@��Q]���R]��@@@��T]���U]��@@@��W]���X]��@@@@������H@@ ��I@@ �A�������	k [add_bin_prot b writer x] appends the bin-protted representation of [x] at the end of
    the buffer [b]. @��h[11�i\��@@@@��k[11�l\��@@��Y@@ ��Z@@ �A@��q]���r]��@��t]���u]��@���Р.add_substitute��}n.2�~n.@@��@����!t���n.C��n.D@@���n.C��n.D@@@��@��@����&string���n.I��n.O@@���n.I��n.O@@@����&string���n.S��n.Y@@���n.S��n.Y@@@���n.I��n.Y@@@��@����&string���n.^��n.d@@���n.^��n.d@@@����$unit���n.h��n.l@@���n.h��n.l@@@���n.^��n.l@@@���n.H��n.l@@@���n.C��n.l@@@@���o���@@ ���@@ �A�������
  A [add_substitute b f s] appends the string pattern [s] at the end
    of the buffer [b] with substitution.
    The substitution process looks for variables into
    the pattern and substitutes each variable name by its value, as
    obtained by applying the mapping [f] to the variable name. Inside the
    string pattern, a variable name immediately follows a non-escaped
    [$] character and is one of the following:
    - a non empty sequence of alphanumeric or [_] characters,
    - an arbitrary sequence of characters enclosed by a pair of
      matching parentheses or curly brackets.

    An escaped [$] character is a [$] that immediately follows a backslash
    character; it then stands for a plain [$].
    Raise [Caml.Not_found] or [Not_found_s] if the closing character of a
    parenthesized variable cannot be found. @���_����m�-@@@@���_����m�-@@���@@ ���@@ �A@���n..��n.l@���n..��n.l@���������@@ ���@@ �A�������! @���qoo��qou@@@@���qoo��qou@@���@@ ���@@ �A��qoo�qou@�����&Format��
sw~�sw�@��������&Format��t���t��@A��t���t��@@��t���t��@���Р3formatter_of_buffer��%v���&v��@��@����!t��/v���0v��@@��2v���3v��@@@����)formatter��:v���;v��@@��=v���>v��@@@��@v���Av��@@@@@��Cv���Dv��@��Fv���Gv��@���Р'bprintf��Ow���Pw��@��@����!t��Yw���Zw��@@��\w���]w��@@@��@����&format��fw���gw��@���!a��mw���nw��@@@�����)formatter��vw���ww��@@��yw���zw��@@@�����$unit���w����w��@@���w����w��@@@@���w����w��@@@��!a���w����w��@@@���w����w��@@@���w����w��@@@@@���w����w��@���w����w��@@���sw���x�	 @@@���sww��x�	 @���sww��x�	 @�����&Printf���z			��z		@�����Р'bprintf���{		��{		#@��@����!t���{		&��{		'@@���{		&��{		'@@@��@����'format4���{		D��{		K@���!a���{		,��{		.@@@�����$unit���{		0��{		4@@���{		0��{		4@@@�����&string���{		6��{		<@@���{		6��{		<@@@�����$unit���{		>��{		B@@���{		>��{		B@@@@���{		+��{		K@@@��!a��{		O�{		Q@@@��{		+�{		Q@@@��{		&�	{		Q@@@@@��{		�{		Q@��{		�{		Q@@��z		�|	R	U@@@��z		�|	R	U@��z		�|	R	U@�����+��
@@ ��@@ �A�������"/*@��*~	W	W�+~	W	^@@@@��-~	W	W�.~	W	^@@��@@ ��@@ �A��3~	W	W�4~	W	^@���Р*__internal��< A	�	��= A	�	�@��@����!t��F A	�	��G A	�	�@@��I A	�	��J A	�	�@@@�����2Bigbuffer_internal!t��S A	�	��T A	�	�@@��V A	�	��W A	�	�@@@��Y A	�	��Z A	�	�@@@@��� ��J@@ ��K@@ �A�������	$ For Core.Bigbuffer, not for users! @��j @	`	`�k @	`	�@@@@��m @	`	`�n @	`	�@@��[@@ ��\@@ �A@��s A	�	��t A	�	�@��v A	�	��w A	�	�@@