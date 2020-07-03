Caml1999N026����   0         	.book/duniverse/core_kernel.v0.13.0/src/md5.mli����  ^z  Y  ?�  =Π����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  + This module implements the [MD5] message-digest algorithm as described IETF RFC 1321.
    [t] is the result type and [val digest_string : string -> t] is the implementation of
    the algorithm itself.

    This is currently a thin wrapper over the [Digest] module in INRIA's standard
    library. @��	.book/duniverse/core_kernel.v0.13.0/src/md5.mliA@@�F!0@@@@��A@@�F!0@@���@@ ���@@ �A��
A@@�F!0@������*Interfaces��H27�H2A@A��H22�H2A@@��H22�H2A@�����&Stable��#JCJ�$JCP@�������"V1��.KW`�/KWb@�����A�    �!t��:Lir�;Lis@@@@A������'Md5_lib!t��ELiv�FLi@@��HLiv�ILi@@@���(deriving��OLi��PLi�@�����������$sexp��^Li��_Li�@��aLi��bLi�@@@�����&bin_io��jLi��kLi�@��mLi��nLi�@@@�����'compare��vLi��wLi�@��yLi��zLi�@@@�����$hash���Li���Li�@���Li���Li�@@@@���Li���Li�@@@@���Li���Li�@@���Li���Li�@@���Lim��Li�@@���Lim��Li�@�����������-ocaml.warning���Lim��Li�@�������#-32@���Lim��Li�@@@@���Lim��Li�@@���Lim��Li�@���Lim��Li�@������������1Ppx_sexp_conv_lib(Sexpable!S���Lim��Li�@���Lim��Li�@@����!t���Lim��Li�@    �����Lir��Lis@@@@A���������Lir��Lis@@���Lim��Li�@@@@���Lim��Li�@@���Lim��Li�@@���Lim��Li�@@���Lim��Li�@������������(Bin_prot'Binable!S��Lim�Li�@��Lim�Li�@@����9��Lim�Li�@    �ذ�Lir�Lis@@@@A�������Lir�Lis@@��Lim�Li�@@@@��Lim� Li�@@��"Lim�#Li�@@��%Lim�&Li�@@��(Lim�)Li�@���Р'compare��1Lir�2Lis@��@������:Lir�;Lis@@��=Lir�>Lis@@@��@������FLir�GLis@@��ILir�JLis@@@����#int��QLir�RLis@@��TLir�ULis@@@��WLir�XLis@@@��ZLir�[Lis@@@@@��]Lim�^Li�@��`Lim�aLi�@���Р+hash_fold_t��iLir�jLis@��@�������,Ppx_hash_lib#Std$Hash%state��yLir�zLis@@��|Lir�}Lis@@@��@����L���Lir��Lis@@���Lir��Lis@@@����������Lir��Lis@@���Lir��Lis@@@���Lir��Lis@@@���Lir��Lis@@@@@���Lim��Li�@���Lim��Li�@���Р$hash���Lir��Lis@��@����z���Lir��Lis@@���Lir��Lis@@@�������,Ppx_hash_lib#Std$Hash*hash_value���Lir��Lis@@���Lir��Lis@@@���Lir��Lis@@@@@���Lim��Li�@���Lim��Li�@@���Lim��Li�@@���Lim��Li�@���)ocaml.doc���Lim��Li�@�������'@inline@���Lim��Li�@@@@���Lim��Li�@@���Lim��Li�@@���Lim��Li�@@���KWe��M��@@@���KWY��M��@���KWY��M��@@���JCS��N��@@@�� JCC�N��@��JCC�N��@�����0As_binary_string��Q�Q@�������&Stable��R#,�R#2@�������"V1��"S9D�#S9F@�����A�    �!t��.TMX�/TMY@@@@A������'Md5_lib!t��9TM\�:TMe@@��<TM\�=TMe@@@���(deriving��CTMi�DTMq@�����������$sexp��RTMr�STMv@��UTMr�VTMv@@@�����&bin_io��^TMx�_TM~@��aTMx�bTM~@@@�����'compare��jTM��kTM�@��mTM��nTM�@@@�����$hash��vTM��wTM�@��yTM��zTM�@@@@��|TMr�}TM�@@@@��TMr��TM�@@���TMf��TM�@@���TMS��TM�@@���TMS��TM�@���������������TMS��TM�@��������@���TMS��TM�@@@@���TMS��TM�@@���TMS��TM�@���TMS��TM�@������������1Ppx_sexp_conv_lib(Sexpable!S���TMS��TM�@���TMS��TM�@@�������TMS��TM�@    �����TMX��TMY@@@@A���������TMX��TMY@@���TMS��TM�@@@@���TMS��TM�@@���TMS��TM�@@���TMS��TM�@@���TMS��TM�@������������(Bin_prot'Binable!S���TMS��TM�@���TMS��TM�@@����*���TMS��TM�@    �հ�TMX�TMY@@@@A�����ݰ�
TMX�TMY@@��TMS�TM�@@@@��TMS�TM�@@��TMS�TM�@@��TMS�TM�@@��TMS�TM�@���Р��!TMX�"TMY@��@�������*TMX�+TMY@@��-TMX�.TMY@@@��@����	��6TMX�7TMY@@��9TMX�:TMY@@@������@TMX�ATMY@@��CTMX�DTMY@@@��FTMX�GTMY@@@��ITMX�JTMY@@@@@��LTMS�MTM�@��OTMS�PTM�@���Р+hash_fold_t��XTMX�YTMY@��@������������dTMX�eTMY@@��gTMX�hTMY@@@��@����C��pTMX�qTMY@@��sTMX�tTMY@@@���������}TMX�~TMY@@���TMX��TMY@@@���TMX��TMY@@@���TMX��TMY@@@@@���TMS��TM�@���TMS��TM�@���Р���TMX��TMY@��@����p���TMX��TMY@@���TMX��TMY@@@�������������TMX��TMY@@���TMX��TMY@@@���TMX��TMY@@@@@���TMS��TM�@���TMS��TM�@@���TMS��TM�@@���TMS��TM�@������TMS��TM�@��������@���TMS��TM�@@@@���TMS��TM�@@���TMS��TM�@@���TMS��TM�@@���S9I��U��@@@���S9=��U��@���S9=��U��@@���R#5��V��@@@���R#%��V��@���R#%��V��@���A�    �!t���X����X��@@@@A�������&Stable"V1!t���X����X��@@��X���X��@@@���(deriving��X���	X��@�����������&bin_io��X���X��@��X���X��@@@�����$sexp��#X���$X��@��&X���'X��@@@�����$hash��/X���0X��@��2X���3X��@@@@��5X���6X��@@@@��8X���9X��@@��;X���<X��@@��>X���?X��@@��AX���BX��@��������������OX���PX��@��������@��YX���ZX��@@@@��\X���]X��@@��_X���`X��@��bX���cX��@������������(Bin_prot'Binable!S��tX���uX��@��wX���xX��@@�������~X���X��@    �����X����X��@@@@A���������X����X��@@���X����X��@@@@���X����X��@@���X����X��@@���X����X��@@���X����X��@������������1Ppx_sexp_conv_lib(Sexpable!S���X����X��@���X����X��@@�������X����X��@    �˰��X����X��@@@@A�����Ӱ��X����X��@@���X����X��@@@@���X����X��@@���X����X��@@���X����X��@@���X����X��@���Р+hash_fold_t���X����X��@��@�������rqpo���X����X��@@���X����X��@@@��@�������X����X��@@���X����X��@@@������������� X���X��@@��X���X��@@@��X���X��@@@��	X���
X��@@@@@��X���X��@��X���X��@���Рn��X���X��@��@����0�� X���!X��@@��#X���$X��@@@�������mlkj��-X���.X��@@��0X���1X��@@@��3X���4X��@@@@@��6X���7X��@��9X���:X��@@��<X���=X��@@��?X���@X��@���i��EX���FX��@�������h@��OX���PX��@@@@��RX���SX��@@��UX���VX��@@��XX���YX��@����������*Comparable��fZ���gZ��@��iZ���jZ��@@����!t��qZ���rZ��@    ���vZ���wZ��@@@@A�����!t��Z����Z��@@���Z����Z��@@@@���Z����Z��@@���Z����Z��@@���Z����Z��@@���Z����Z��@����������'Binable���[���[�@���[���[�@@����!t���[���[�@    ����[���[�@@@@A�����!t���[���[�@@���[���[�@@@@���[���[�@@���[���[�@@���[����[�@@���[����[�@����������(Hashable���\)��\1@���\)��\1@@����!t���\<��\=@    ����\<��\=@@@@A�����!t���\A��\B@@���\A��\B@@@@���\7��\B@@���\)��\B@@���\!��\B@@���\!��\B@@���Q��]CF@@���)ocaml.doc���@@ ���@@ �A�������	K Both bin_io and sexp serializations produce a binary 16-character string. @��P���P�@@@@��P���P�@@�� @@ ��@@ �A@��Q�]CF@��Q�]CF@���A�    �!t��%cIN�&cIO@@@@A�������&Stable"V1!t��2cIR�3cI]@@��5cIR�6cI]@@@���8��&@@ ��'@@ �A�������	� Intended to represent a 16-byte string that is the output of MD5 algorithm.

    Note that any 16-byte string can be converted to this type, so a value of type [t] is
    not an evidence of someone having found an input corresponding to this output. @��F_HH�Gb�H@@@@��I_HH�Jb�H@@��7@@ ��8@@ �A���(deriving��ScIa�TcIi@�����������&bin_io��bcIj�ccIp@��ecIj�fcIp@@@�����$sexp��ncIr�ocIv@��qcIr�rcIv@@@�����$hash��zcIx�{cI|@��}cIx�~cI|@@@@���cIj��cI|@@@@���cIj��cI|@@���cI^��cI}@@���cII��cI}@@���cII��cI}@���������������cII��cI}@��������@���cII��cI}@@@@���cII��cI}@@���cII��cI}@���cII��cI}@������������(Bin_prot'Binable!S���cII��cI}@���cII��cI}@@��������cII��cI}@    �����cIN��cIO@@@@A���������cIN��cIO@@���cII��cI}@@@@���cII��cI}@@���cII��cI}@@���cII��cI}@@���cII��cI}@������������1Ppx_sexp_conv_lib(Sexpable!S���cII��cI}@���cII��cI}@@����.��cII�cI}@    ���cIN�cIO@@@@A�������cIN�cIO@@��cII�cI}@@@@��cII�cI}@@��cII�cI}@@��cII�cI}@@��cII�cI}@���Р+hash_fold_t��&cIN�'cIO@��@�������������2cIN�3cIO@@��5cIN�6cIO@@@��@������>cIN�?cIO@@��AcIN�BcIO@@@����������Ӱ�KcIN�LcIO@@��NcIN�OcIO@@@��QcIN�RcIO@@@��TcIN�UcIO@@@@@��WcII�XcI}@��ZcII�[cI}@���Р���bcIN�ccIO@��@����G��kcIN�lcIO@@��ncIN�ocIO@@@�������������xcIN�ycIO@@��{cIN�|cIO@@@��~cIN�cIO@@@@@���cII��cI}@���cII��cI}@@���cII��cI}@@���cII��cI}@�������cII��cI}@��������@���cII��cI}@@@@���cII��cI}@@���cII��cI}@@���cII��cI}@����������*Comparable���e���e�@���e���e�@@����!t���e���e�@    ����e���e�@@@@A�����!t���e���e�@@���e���e�@@@@���e���e�@@���e���e�@@���e��e�@@���e��e�@����������'Binable���f����f��@���f����f��@@����!t���f����f��@    ����f����f��@@@@A�����!t�� f���f��@@��f���f��@@@@��f���f��@@��	f���
f��@@��f���f��@@��f���f��@����������(Hashable��g���g��@�� g���!g��@@����!t��(g���)g��@    ���-g���.g��@@@@A�����!t��6g���7g��@@��9g���:g��@@@@��<g���=g��@@��?g���@g��@@��Bg���Cg��@@��Eg���Fg��@���Р0digest_num_bytes��Nj*.�Oj*>@����#int��Vj*A�Wj*D@@��Yj*A�Zj*D@@@@���\��	J@@ ��	K@@ �A�������	= [digest_num_bytes = 16] is the size of the digest in bytes. @��ji���ki�)@@@@��mi���ni�)@@��	[@@ ��	\@@ �A@��sj**�tj*D@��vj**�wj*D@���Р)to_binary��m����m��@��@����!t���m����m��@@���m����m��@@@����&string���m����m��@@���m����m��@@@���m����m��@@@@������	�@@ ��	�@@ �A�������	C Binary representations are 16 bytes long, and not human readable. @���lFF��lF�@@@@���lFF��lF�@@��	�@@ ��	�@@ �A@���m����m��@���m����m��@���Р-of_binary_exn���o����o��@��@����&string���o����o��@@���o����o��@@@����!t���o����o��@@���o����o��@@@���o����o��@@@@@���o����o��@���o����o��@���Р&to_hex���|PT��|PZ@��@����!t���|P]��|P^@@���|P]��|P^@@@����&string���|Pb�	 |Ph@@��	|Pb�	|Ph@@@��	|P]�	|Ph@@@@�����	�@@ ��	�@@ �A�������
  } [to_hex] prints each byte of [t] as a big-endian sequence of 2 hex digits
    (e.g. byte 31 is written as "1f") and then concatenates them.
    For example,
    {[
      Md5.to_hex (Md5.digest_string "a") =
      Md5.to_hex (
        Md5.of_binary_exn
          "\x0c\xc1\x75\xb9\xc0\xf1\xb6\xa8\x31\xc3\x99\xe2\x69\x77\x26\x61") =
      "0cc175b9c0f1b6a831c399e269772661"
    ]}
@��	q���	{MO@@@@��	q���	{MO@@��
@@ ��
@@ �A@��	|PP�	 |Ph@��	"|PP�	#|Ph@���Р*of_hex_exn��	+ @��	, @�@��@����&string��	5 @��	6 @�@@��	8 @��	9 @�@@@����!t��	@ @��	A @�@@��	C @��	D @�@@@��	F @��	G @�@@@@���I��
7@@ ��
8@@ �A�������	� The inverse of [to_hex]. This function ignores case. It will raise an
    exception if the string is not a 32-byte-long string of hex digits. @��	W~jj�	X��@@@@��	Z~jj�	[��@@��
H@@ ��
I@@ �A@��	` @���	a @�@��	c @���	d @�@���Р-digest_string��	l B!�	m B.@��@����&string��	v B1�	w B7@@��	y B1�	z B7@@@����!t��	� B;�	� B<@@��	� B;�	� B<@@@��	� B1�	� B<@@@@@��	� B�	� B<@��	� B�	� B<@���Р,digest_bytes��	� C=A�	� C=M@��@����%bytes��	� C=P�	� C=U@@��	� C=P�	� C=U@@@����!t��	� C=Y�	� C=Z@@��	� C=Y�	� C=Z@@@��	� C=P�	� C=Z@@@@@��	� C==�	� C=Z@��	� C==�	� C=Z@���Р/digest_subbytes��	� G���	� G��@��@����%bytes��	� G���	� G��@@��	� G���	� G��@@@���#pos����#int��	� G���	� G��@@��	� G���	� G��@@@���#len����#int��	� G�	�	� G�	@@��	� G�	�	� G�	@@@����!t��	� G�		�	� G�	
@@��	� G�		�	� G�	
@@@��	� G���	� G�	
@@@��	� G���	� G�	
@@@��	� G���
  G�	
@@@@�����
�@@ ��
�@@ �A�������	r [digest_subbytes m ~pos ~len] computes Md5 digest of the substring of [m] of length
    [len] starting at [pos]. @��
 E\\�
 F��@@@@��
 E\\�
 F��@@��@@ ��@@ �A@��
 G���
 G�	
@��
 G���
 G�	
@���Р4digest_file_blocking��
% K	v	z�
& K	v	�@��@����&string��
/ K	v	��
0 K	v	�@@��
2 K	v	��
3 K	v	�@@@����!t��
: K	v	��
; K	v	�@@��
= K	v	��
> K	v	�@@@��
@ K	v	��
A K	v	�@@@@���C��1@@ ��2@@ �A�������	d [digest_file_blocking filename] reads the contents of file [filename] and computes its
    digest. @��
Q I		�
R J	g	u@@@@��
T I		�
U J	g	u@@��B@@ ��C@@ �A@��
Z K	v	v�
[ K	v	�@��
] K	v	v�
^ K	v	�@���Р	6digest_channel_blocking_without_releasing_runtime_lock��
f Q
�
��
g Q
�
�@��@����*in_channel��
p Q
�
��
q Q
�
�@@��
s Q
�
��
t Q
�
�@@@���#len����#int��
 Q
�
��
� Q
�
�@@��
� Q
�
��
� Q
�
�@@@����!t��
� Q
�
��
� Q
�
�@@��
� Q
�
��
� Q
�
�@@@��
� Q
�
��
� Q
�
�@@@��
� Q
�
��
� Q
�
�@@@@�������@@ ���@@ �A�������	� Reads [len] bytes from the given channel and computes md5 digest of that.

    WARNING: This function does digest computation with OCaml global lock held, so it can
    be slow and make the other threads starve. See [digest_file_blocking]. @��
� M	�	��
� P
G
�@@@@��
� M	�	��
� P
G
�@@���@@ ���@@ �A@��
� Q
�
��
� Q
�
�@��
� Q
�
��
� Q
�
�@���Р.input_blocking��
� UKO�
� UK]@��@����*in_channel��
� UK`�
� UKj@@��
� UK`�
� UKj@@@����!t��
� UKn�
� UKo@@��
� UKn�
� UKo@@@��
� UK`�
� UKo@@@@���װ��@@ ���@@ �A�������	W Reads an Md5 digest from the given channel (in a format written by [output_blocking])
@��
� S
�
��
� THJ@@@@��
� S
�
��
� THJ@@���@@ ���@@ �A@��
� UKK�
� UKo@��
� UKK�
� UKo@���Р/output_blocking��
� X���
� X��@��@����!t�� X��� X��@@�� X��� X��@@@��@����+out_channel�� X��� X��@@�� X��� X��@@@����$unit�� X��� X��@@�� X���  X��@@@��" X���# X��@@@��% X���& X��@@@@���(��@@ ��@@ �A�������	- Writes the Md5 digest to the given channel. @��6 Wqq�7 Wq�@@@@��9 Wqq�: Wq�@@��'@@ ��(@@ �A@��? X���@ X��@��B X���C X��@���Р&string��K Z���L Z��@��@����&string��U Z���V Z��@@��X Z���Y Z��@@@����!t��` Z���a Z��@@��c Z���d Z��@@@��f Z���g Z��@@@@���0ocaml.deprecated��m Z���n Z� @�������	([since 2017-07] use [Md5.digest_string].@��x Z��y Z�+@@@@��{ Z��| Z�+@@��~ Z��� Z�,@@��� Z���� Z�,@��� Z���� Z�,@���Р%bytes��� [-1�� [-6@��@����%bytes��� [-9�� [->@@��� [-9�� [->@@@����!t��� [-B�� [-C@@��� [-B�� [-C@@@��� [-9�� [-C@@@@���0ocaml.deprecated��� [-G�� [-W@�������	'[since 2017-07] use [Md5.digest_bytes].@��� [-X�� [-�@@@@��� [-X�� [-�@@��� [-D�� [-�@@��� [--�� [-�@��� [--�� [-�@���Р(subbytes��� ]���� ]��@��@����%bytes��� ]���� ]��@@��� ]���� ]��@@@��@����#int��� ]���� ]��@@��� ]���� ]��@@@��@����#int��� ]���� ]��@@��� ]���� ]��@@@����!t��� ]���� ]��@@�� ]��� ]��@@@�� ]��� ]��@@@�� ]��� ]��@@@��
 ]��� ]��@@@@���0ocaml.deprecated�� ^��� ^��@�������	*[since 2017-07] use [Md5.digest_subbytes].@�� ^��� ^��@@@@�� ^���  ^��@@��" ^���# ^��@@��% ]���& ^��@��( ]���) ^��@���Р(from_hex��1 `���2 `��@��@����&string��; `���< `�@@��> `���? `�@@@����!t��F `��G `�	@@��I `��J `�	@@@��L `���M `�	@@@@���0ocaml.deprecated��S `��T `�@�������	![since 2017-07] use [of_hex_exn].@��^ `��_ `�A@@@@��a `��b `�A@@��d `�
�e `�B@@��g `���h `�B@��j `���k `�B@���Р$file��s bDH�t bDL@��@����&string��} bDO�~ bDU@@��� bDO�� bDU@@@����!t��� bDY�� bDZ@@��� bDY�� bDZ@@@��� bDO�� bDZ@@@@���0ocaml.deprecated��� c[^�� c[n@�������	b[since 2017-07] blocking functions should be avoided. Use [file_blocking] if you really want this.@��� doq�� e��@@@@��� doq�� e��@@��� c[[�� e��@@��� bDD�� e��@��� bDD�� e��@���Р'channel��� g���� g��@��@����*in_channel��� g���� g��@@��� g���� g��@@@��@����#int��� g���� g��@@��� g���� g��@@@����!t��� g� �� g�@@��� g� �� g�@@@��� g���� g�@@@��� g���� g�@@@@���0ocaml.deprecated��� h�� h@�������	e[since 2017-07] blocking functions should be avoided. Use [channel_blocking] if you really want this.@��� i�� jk�@@@@��� i�� jk�@@��� h�� jk�@@��� g���� jk�@��� g���� jk�@���Р&output�� l��� l��@��@����+out_channel�� l��� l��@@�� l��� l��@@@��@����!t�� l��� l��@@��! l���" l��@@@����$unit��) l���* l��@@��, l���- l��@@@��/ l���0 l��@@@��2 l���3 l��@@@@���0ocaml.deprecated��9 m���: m��@�������	I[since 2017-07] Use [to_binary] together with [Out_channel.output_string]@��D n���E n�@@@@��G n���H n�@@��J m���K n�@@��M l���N n�@��P l���Q n�@���Р%input��Y p�Z p@��@����*in_channel��c p�d p'@@��f p�g p'@@@����!t��n p+�o p,@@��q p+�r p,@@@��t p�u p,@@@@���0ocaml.deprecated��{ q-0�| q-@@�������	c[since 2017-07] blocking functions should be avoided. Use [input_blocking] if you really want this.@��� rAC�� s��@@@@��� rAC�� s��@@��� q--�� s��@@��� p�� s��@��� p�� s��@���Р/digest_bin_prot��� |=A�� |=P@��@������(Bin_prot*Type_class&writer��� |=V�� |=p@���!a��� |=S�� |=U@@@@��� |=S�� |=p@@@��@��!a��� |=t�� |=v@@@����!t��� |=z�� |={@@��� |=z�� |={@@@��� |=t�� |={@@@��� |=S�� |={@@@@���ϰ��@@ ���@@ �A�������
  � [digest_bin_prot w x] digests the serialization of [x] by [w].
    It is a cheap way (in dev time) to compute the digest of an ocaml value, for a
    fixed and deterministic serialization function.
    It is currently implemented inefficiently and allocates large strings.

    For a more efficient and resource-aware version, use [Bigbuffer.add_bin_prot]
    and [Bigbuffer_blocking.md5]. @��� u���� {<@@@@��� u���� {<@@���@@ ���@@ �A@��� |==�� |={@��� |==�� |={@���Р0digest_bigstring��� ~}��� ~}�@��@�����)Bigstring!t��� ~}��� ~}�@@�� ~}�� ~}�@@@����!t��	 ~}��
 ~}�@@�� ~}�� ~}�@@@�� ~}�� ~}�@@@@@�� ~}}� ~}�@�� ~}}� ~}�@���Р3digest_subbigstring�� ��� ��@��@�����)Bigstring!t��* ���+ ��@@��- ���. ��@@@���#pos����#int��9 ���: ��@@��< ���= ��@@@���#len����#int��H ���I ��@@��K ���L ��@@@����!t��S ���T ��@@��V ���W ��@@@��Y ���Z ��@@@��\ ���] ��@@@��_ ���` ��@@@@@��b ���c ��@��e ���f ��@@