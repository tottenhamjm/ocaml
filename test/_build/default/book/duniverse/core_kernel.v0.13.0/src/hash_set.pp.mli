Caml1999N026����   5         	3book/duniverse/core_kernel.v0.13.0/src/hash_set.mli����  7�  
�  *
  )U�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������< A mutable set of elements. @��	3book/duniverse/core_kernel.v0.13.0/src/hash_set.mliA@@�A@a@@@@��A@@�A@a@@���@@ ���@@ �A��
A@@�A@a@������&Import��Cci�Cco@@��Ccc�Cco@@��Ccc�Cco@������-Hash_set_intf��$Dpu�%Dp B@A��'Dpp�(Dp B@@��*Dpp�+Dp B@���A�    �!t��4F D L�5F D M@����!a��<F D I�=F D K@@@B@@@A�������$Base(Hash_set!t��IF D S�JF D b@���!a��PF D P�QF D R@@@@��SF D P�TF D b@@@���(deriving��ZF D f�[F D n@��������'sexp_of��fF D o�gF D v@��iF D o�jF D v@@@@��lF D o�mF D v@@��oF D c�pF D w@@��rF D D�sF D w@@��uF D D�vF D w@�����������-ocaml.warning���F D D��F D w@�������#-32@���F D D��F D w@@@@���F D D��F D w@@���F D D��F D w@���F D D��F D w@���Р)sexp_of_t���F D L��F D M@��@��@��o���F D I��F D K@@@������1Ppx_sexp_conv_lib$Sexp!t���F D I��F D K@@���F D I��F D K@@@���F D I��F D K@@@��@��������F D L��F D M@�������F D I��F D K@@@@���F D L��F D M@@@������$#"���F D L��F D M@@���F D L��F D M@@@���F D L��F D M@@@���F D I��F D K@@@@@���F D D��F D w@���F D D��F D w@@���F D D��F D w@@���F D D��F D w@���)ocaml.doc���F D D��F D w@�������'@inline@���F D D��F D w@@@@��F D D�F D w@@��F D D�F D w@@��F D D�F D w@��������@@ ���@@ �A�������
  $ We use [[@@deriving sexp_of]] but not [[@@deriving sexp]] because we want people to be
    explicit about the hash and comparison functions used when creating hashtables.  One
    can use [Hash_set.Poly.t], which does have [[@@deriving sexp]], to use polymorphic
    comparison and hashing. @��H y y�K��@@@@��H y y�K��@@��@@ ��@@ �A��#H y y�$K��@����������(Creators��1M���2M��@��4M���5M��@@����!t��<M���=M��@    ���AM���BM��@����!a��IM���JM��@@@B@@@A�����!t��RM���SM��@���!a��YM���ZM��@@@@��\M���]M��@@@@��_M���`M��@@��bM���cM��@@��eM���fM��@@��hM���iM��@������������)Accessors��xN���yN��@��{N���|N��@@����!t���N����N��@    ����N����N��@����!a���N����N��@@@B@@@A�����!t���N����N��@���!a���N����N��@@@@���N����N��@@@@���N����N��@@���N����N��@@����#elt���N���N�@    ����N���N�@����!a���N����N�@@@B@@@A�����#elt���N���N�@���!a���N�	��N�@@@@���N�	��N�@@@@���N����N�@@���N����N�@@���N����N�@@���N����N�@���Р(hashable���P��P@��@����!t���P%��P&@���#key���P ��P$@@@@���P ��P&@@@������'Hashtbl(Hashable!t��P/�PA@���#key��P*�P.@@@@��P*�PA@@@��P �PA@@@@@��P�PA@��P�PA@�����)Elt_plain��"RCO�#RCX@������'Hashtbl)Key_plain��-RC[�.RCl@��0RC[�1RCl@@@��3RCC�4RCl@��6RCC�7RCl@�����#Elt��?Smy�@Sm|@������'Hashtbl#Key��JSm�KSm�@��MSm�NSm�@@@��PSmm�QSm�@��SSmm�TSm�@�����+Elt_binable��\T���]T��@������'Hashtbl+Key_binable��gT���hT��@��jT���kT��@@@��mT���nT��@��pT���qT��@�����'S_plain��yU���zU��@�������'S_plain���U����U��@���U����U��@@����(hash_set���U����U��@    ����U����U��@����!a���U����U��@@@B@@@A�����!t���U����U��@���!a���U����U��@@@@���U����U��@@@@���U����U��@@���U����U��@@@���U����U��@���U����U��@�����!S���V���V�@�������!S���V���V�@���V���V�@@����(hash_set���V���V�@    ����V���V�@����!a���V���V�@@@B@@@A�����!t���V�#��V�$@���!a���V� ��V�"@@@@���V� ��V�$@@@@���V���V�$@@�� V��V�$@@@��V���V�$@��V���V�$@�����)S_binable��W%1�W%:@�������)S_binable��W%=�W%F@��W%=�W%F@@����(hash_set��%W%T�&W%\@    ���*W%T�+W%\@����!a��2W%Q�3W%S@@@B@@@A�����!t��;W%c�<W%d@���!a��BW%`�CW%b@@@@��EW%`�FW%d@@@@��HW%L�IW%d@@��KW%=�LW%d@@@��NW%%�OW%d@��QW%%�RW%d@�����.Using_hashable��ZYfm�[Yf{@����������������0Creators_generic��n[���o[��@��q[���r[��@@����!t��y\���z\��@    ���~\���\��@����!a���\����\��@@@B@@@A�����!t���\����\��@���!a���\����\��@@@@���\����\��@@@@���\����\��@@���[����\��@@����#elt���]����]��@    ����]����]��@����!a���]����]��@@@B@@@A���!a���]����]��@@@@���]����]��@@���[����]��@@����.create_options���^����^��@    ����^����^��@����#key���^����^��@@@B����!z���^����^��@@@B@@@A�����	%create_options_with_hashable_required���_��_7@���#key���_��_@@@���!z���_��_@@@@���_��_7@@@@���^����_7@@���[����_7@@��Z���_7@@��Z���_7@@��Yf~�`8;@@@��
Yff�`8;@��Yff�`8;@�����$Poly��cqx�cq|@�����@�    �!t��"d���#d��@����!a��*d���+d��@@@B@@@A�����!t��3d���4d��@���!a��:d���;d��@@@@��=d���>d��@@@���(deriving��Dd���Ed��@��������$sexp��Pd���Qd��@��Sd���Td��@@@@��Vd���Wd��@@��Yd���Zd��@@��\d���]d��@@��_d���`d��@�������������md���nd��@��������@��wd���xd��@@@@��zd���{d��@@��}d���~d��@���d����d��@������������1Ppx_sexp_conv_lib(Sexpable"S1���d����d��@���d����d��@@����!t���d����d��@    �����d����d��@��������d����d��@@@B@@@A���������d����d��@�������d����d��@@@@���d����d��@@@@���d����d��@@���d����d��@@���d����d��@@���d����d��@@���d����d��@@���d����d��@������d����d��@��������@���d����d��@@@@���d����d��@@���d����d��@@���d����d��@��������������0Creators_generic���g����g��@���g����g��@@����!t��h���h��@    ���h���h��@����!a��h���h��@@@B@@@A�����!t��h���h��@���!a��h��� h��@@@@��"h���#h��@@@@��%h���&h��@@��(g���)h��@@����#elt��0i���1i��@    ���5i���6i��@����!a��=i���>i��@@@B@@@A���!a��Di��Ei�@@@@��Gi���Hi�@@��Jg���Ki�@@����.create_options��Rj�Sj+@    ���Wj�Xj+@����#key��_j�`j@@@B����!z��gj�hj@@@B@@@A�����	)create_options_without_first_class_module��pk/@�qk/i@���#key��wk/6�xk/:@@@���!z��~k/<�k/>@@@@���k/5��k/i@@@@���j��k/i@@���g����k/i@@���f����k/i@@���f����k/i@������������)Accessors���mku��mk~@���mku��mk~@@����!t���mk���mk�@    ����mk���mk�@����!a���mk���mk�@@@B@@@A�����!t���mk���mk�@���!a���mk���mk�@@@@���mk���mk�@@@@���mk���mk�@@���mku��mk�@@����#elt���mk���mk�@    ����mk���mk�@����!a���mk���mk�@@@B@@@A�����#elt���mk���mk�@���!a���mk���mk�@@@@���mk���mk�@@@@���mk���mk�@@���mku��mk�@@���mkm� mk�@@��mkm�mk�@@��cq�n��@@���)ocaml.doc���@@ ���@@ �A�������	. A hash set that uses polymorphic comparison. @��b==�b=p@@@@��b==�b=p@@��@@ ��	@@ �A@�� cqq�!n��@��#cqq�$n��@�����*Make_plain��,p���-p��@���#Elt��3p���4p��@�����)Elt_plain��<p���=p��@��?p���@p��@@������'S_plain��Ip���Jp��@��Lp���Mp��@@����#elt��Tp���Up��@    ���Yp���Zp��@@@@A������#Elt!t��dp���ep��@@��gp���hp��@@@@��jp���kp��@@��mp���np��@@��pp���qp��@@@��sp���tp��@��vp���wp��@�����$Make��q���q�@���#Elt���q���q�
@�����#Elt���q���q�@���q���q�@@������!S���q���q�@���q���q�@@����#elt���q� ��q�#@    ����q� ��q�#@@@@A������#Elt!t���q�&��q�+@@���q�&��q�+@@@@���q���q�+@@���q���q�+@@���q���q�+@@@���q����q�+@���q����q�+@�����,Make_binable���r,3��r,?@���#Elt���r,A��r,D@�����+Elt_binable���r,G��r,R@���r,G��r,R@@������)S_binable���r,V��r,_@���r,V��r,_@@����#elt���r,j��r,m@    ����r,j� r,m@@@@A������#Elt!t��
r,p�r,u@@��r,p�r,u@@@@��r,e�r,u@@��r,V�r,u@@��r,@�r,u@@@��r,,�r,u@��r,,�r,u@�����!M��%tw~�&tw@���#Elt��,tw��-tw�@������!T!T��7tw��8tw�@��:tw��;tw�@@�����@�    �!t��Fu���Gu��@@@@A�����!t��Ou���Pu��@������#Elt!t��Zu���[u��@@��]u���^u��@@@@��`u���au��@@@@��cu���du��@@��fu���gu��@@��itw��jv��@@��ltw��mv��@@@��otww�pv��@��rtww�sv��@�����)Sexp_of_m��{x���|x��@������A�    �!t���y����y��@@@@A@���(deriving���y����y��@��������'sexp_of���y����y��@���y����y��@@@@���y����y��@@���y����y��@@���y����y��@@���y����y��@�����������5���y����y��@�������4@���y����y��@@@@���y����y��@@���y����y��@���y����y��@���Р)sexp_of_t���y����y��@��@����V���y����y��@@���y����y��@@@������654���y����y��@@���y����y��@@@���y����y��@@@@@���y����y��@���y����y��@@���y����y��@@���y����y��@�����y���y��@�������@��y���y��@@@@��y���y��@@��y���y��@@��y���y��@@��x���z��@@@��x���z��@��x���z��@�����)M_of_sexp��&|���'|�@������A�    �!t��3}�4}@@@@A@���(deriving��:}�;} @��������'of_sexp��F}!�G}(@��I}!�J}(@@@@��L}!�M}(@@��O}�P})@@��R}�S})@@��U}�V})@�������������c}�d})@��������@��m}�n})@@@@��p}�q})@@��s}�t})@��v}�w})@���Р)t_of_sexp��}��}@��@������1Ppx_sexp_conv_lib$Sexp!t���}��}@@���}��}@@@����e���}��}@@���}��}@@@���}��}@@@@@���}��})@���}��})@@���}��})@@���}��})@�������}��})@��������@���}��})@@@@���}��})@@���}��})@@���}��})@�����������,Hashtbl_intf#Key���+5��+E@���+5��+E@@����!t���+P��+Q@    ����+P��+Q@@@@A�����!t���+U��+V@@���+U��+V@@@@���+K��+V@@���+5��+V@@���+-��+V@@���+-��+V@@���|��� @WZ@@@��	 |���	 @WZ@��	|���	 @WZ@���Р,sexp_of_m__t��	 B\`�	 B\l@��@�����)Sexp_of_m��	 B\w�	 B\�@����!t��	 B\��	  B\�@��#elt��	% B\��	& B\�@@@@��	( B\o�	) B\�@���	, B\w�	- B\�@@@��@����!t��	6 B\��	7 B\�@���#elt��	= B\��	> B\�@@@@��	@ B\��	A B\�@@@������$Base$Sexp!t��	L B\��	M B\�@@��	O B\��	P B\�@@@��	R B\��	S B\�@@@��	U B\o�	V B\�@@@@@��	X B\\�	Y B\�@��	[ B\\�	\ B\�@���Р,m__t_of_sexp��	d C���	e C��@��@�����)M_of_sexp��	o C���	p C��@����!t��	w C���	x C��@��#elt��	} C���	~ C��@@@@��	� C���	� C��@���	� C���	� C��@@@��@������$Base$Sexp!t��	� C���	� C��@@��	� C���	� C��@@@����!t��	� C���	� C��@���#elt��	� C���	� C��@@@@��	� C���	� C��@@@��	� C���	� C��@@@��	� C���	� C��@@@@@��	� C���	� C��@��	� C���	� C��@@