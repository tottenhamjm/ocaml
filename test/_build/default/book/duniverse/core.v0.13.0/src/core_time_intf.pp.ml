Caml1999M026����   3         	1book/duniverse/core.v0.13.0/src/core_time_intf.ml����  ��  r  Y�  R8�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ��@������"()��	1book/duniverse/core.v0.13.0/src/core_time_intf.mlA@@�A@@@@��A@@�A@@@@@���������-Ppx_bench_lib5Benchmark_accumulator/Current_libname#set��A@@�A@@@��A@@�A@@@@@��@���$core@�� A@@�!A@@@@@@��#A@@�$A@@@@@@��&A@@�'A@@@@��)A@@�*A@@@���@������"()��6A@@�7A@@@@��9A@@�:A@@@@@��������5Expect_test_collector,Current_file#set��GA@@�HA@@@��JA@@�KA@@@@@���1absolute_filename���R@��TA@@�UA@@@@@@��WA@@�XA@@@@@@��ZA@@�[A@@@@��]A@@�^A@@@���@������4��iA@@�jA@@@@��lA@@�mA@@@@@��������3Ppx_inline_test_lib'Runtime5set_lib_and_partition��zA@@�{A@@@��}A@@�~A@@@@@��@���f@���A@@��A@@@@@��@��� @���A@@��A@@@@@@���A@@��A@@@@@@���A@@��A@@@@���A@@��A@@@�����*ocaml.text���@@ ���@@ �A�������	� A module for representing absolute points in time, independent of time zone.

    Note that on 32bit architecture, most functions will raise when used on time
    outside the range [1901-12-13 20:45:52 - 2038-01-19 03:14:07].
@���A@@��E � �@@@@���A@@��E � �@@���@@ ���@@ �A���A@@��E � �@��������&Import���G � ���G � �@���G � ���G � �@@@���G � ���G � �@@���G � ���G � �@�����!S���I ���I �@��������%Time0���J��J@�����$Time5S_kernel_without_zone���J��J7@���J��J7@@@���J��J7@���J��J7@�����$Time���K8A��K8E@�������$Time(S_kernel��K8I�K8V@��	K8I�
K8V@@����$Time��K8c�K8g@��%Time0��K8k�K8p@@��K8I�K8p@@@��K8:�K8p@�� K8:�!K8p@�����$Span��)Mr{�*Mr@�������������$Time$Span��;N���<N��@��>N���?N��@@��AN���BN��@@��DN���EN��@@��GN���HN��@���Р(arg_type��PP���QP��@�������+Core_kernel'Command(Arg_type!t��^P���_P��@�����!t��gP���hP��@@��jP���kP��@@@@��mP���nP��@@@@@��pP���qP��@��sP���tP��@@��vMr��wQ��@@@��yMrt�zQ��@��|Mrt�}Q��@�����$Zone���S����S��@�������������������$Time$Zone���T�&��T�/@���T�&��T�/@@���T���T�/@@���T���T�/@@���T���T�3@���4ocaml.remove_aliases���T�6��T�J@�@���T�4��T�K@@���T���T�K@@���T� ��T�K@@���T� ��T�K@�����������)Core_zone+Extend_zone���VMY��VMn@���VMY��VMn@@����!t���VMy��VMz@    ����VMy��VMz@@@@A�����!t���VM~��VM@@���VM~��VM@@@@���VMt��VM@@���VMY��VM@@���VMQ��VM@@���VMQ��VM@���Р(arg_type���X����X��@�������+Core_kernel'Command(Arg_type!t��X���X��@�����!t��X���X��@@��X���X��@@@@��X���X��@@@@@��X���X��@��!X���"X��@@��$S���%Y��@@@��'S���(Y��@��*S���+Y��@�����%Ofday��3[���4[��@�������������������$Time%Ofday��K\���L\�@��N\���O\�@@��Q\���R\�@@��T\���U\�@@��W\���X\�	@���4ocaml.remove_aliases��^\��_\� @�@��b\�
�c\�!@@��e\���f\�!@@��h\���i\�!@@��k\���l\�!@���Р(arg_type��t^#+�u^#3@�������+Core_kernel'Command(Arg_type!t���^#8��^#V@�����!t���^#6��^#7@@���^#6��^#7@@@@���^#6��^#V@@@@@���^#'��^#V@���^#'��^#V@�����%Zoned���`Xc��`Xh@�����A�    �!t���e��e@@@@A@���)ocaml.doc���@@ ���@@ �A�������	� Sexps look like "(12:01 nyc)"

          Two [t]'s may or may not correspond to the same times depending on which date
          they're evaluated. @���aou��d�@@@@���aou��d�@@���@@ ���@@ �A���(deriving���e ��e(@�����������&bin_io���e)��e/@���e)��e/@@@�����$sexp���e1��e5@���e1��e5@@@�����$hash���e7��e;@���e7��e;@@@@���e)��e;@@@@���e)��e;@@���e��e<@@��e�e<@@��e�e<@�����������-ocaml.warning��e�e<@�������#-32@��e�e<@@@@��!e�"e<@@��$e�%e<@��'e�(e<@������������(Bin_prot'Binable!S��9e�:e<@��<e�=e<@@����!t��De�Ee<@    ����Ie�Je@@@@A��������Qe�Re@@��Te�Ue<@@@@��We�Xe<@@��Ze�[e<@@��]e�^e<@@��`e�ae<@������������1Ppx_sexp_conv_lib(Sexpable!S��re�se<@��ue�ve<@@����9��|e�}e<@    �ְ��e��e@@@@A�����ް��e��e@@���e��e<@@@@���e��e<@@���e��e<@@���e��e<@@���e��e<@���Р+hash_fold_t���e��e@��@�������,Ppx_hash_lib#Std$Hash%state���e��e@@���e��e@@@��@�������e��e@@���e��e@@@����������e��e@@���e��e@@@���e��e@@@���e��e@@@@@���e��e<@���e��e<@���Р$hash���e��e@��@����@���e��e@@���e��e@@@�������,Ppx_hash_lib#Std$Hash*hash_value���e��e@@���e� e@@@��e�e@@@@@��e�e<@��e�	e<@@��e�e<@@��e�e<@���)ocaml.doc��e�e<@�������'@inline@�� e�!e<@@@@��#e�$e<@@��&e�'e<@@��)e�*e<@�����������.Pretty_printer!S��9g>L�:g>\@��<g>L�=g>\@@����!t��Dg>j�Eg>k@    ���Ig>j�Jg>k@@@@A�����!t��Rg>o�Sg>p@@��Ug>o�Vg>p@@@@��Xg>e�Yg>p@@��[g>L�\g>p@@��^g>D�_g>p@@��ag>D�bg>p@����������*Stringable��ohq�phq�@��rhq�shq�@@����!t��zhq��{hq�@    ���hq���hq�@@@@A�����!t���hq���hq�@@���hq���hq�@@@@���hq���hq�@@���hq��hq�@@���hqw��hq�@�����~@@ ��@@ �A�������? Strings look like "12:01 nyc" @���hq���hq�@@@@���hq���hq�@@���@@ ���@@ �A@���hqw��hq�@���Р(arg_type���j����j��@�������+Core_kernel'Command(Arg_type!t���j����j��@�����!t���j����j��@@���j����j��@@@@���j����j��@@@@@���j����j��@���j����j��@���Р&create���l��l@��@������$Time%Ofday!t���l��l&@@���l��l&@@@��@�����$Zone!t�� l*�l0@@��l*�l0@@@����!t��l4�l5@@��l4�l5@@@��l*�l5@@@��l�l5@@@@@��l�l5@��l�l5@���Р,create_local��#m6@�$m6L@��@������$Time%Ofday!t��1m6O�2m6[@@��4m6O�5m6[@@@����!t��<m6i�=m6j@@��?m6i�@m6j@@@��Bm6O�Cm6j@@@@@��Em6<�Fm6j@��Hm6<�Im6j@���Р%ofday��Qolv�Rol{@��@����!t��[ol~�\ol@@��^ol~�_ol@@@������$Time%Ofday!t��jol��kol�@@��mol��nol�@@@��pol~�qol�@@@@@��solr�tol�@��volr�wol�@���Р$zone��p����p��@��@����!t���p����p��@@���p����p��@@@�����$Zone!t���p����p��@@���p����p��@@@���p����p��@@@@@���p����p��@���p����p��@���Р'to_time���r����r��@��@����!t���r����r��@@���r����r��@@@��@�����$Date!t���r����r��@@���r����r��@@@�����$Time!t���r����r��@@���r����r��@@@���r����r��@@@���r����r��@@@@@���r����r��@���r����r��@�����=With_nonchronological_compare���t����t�@�����@�    �!t���y3G��y3H@@@@A�����!t���y3K��y3L@@��y3K�y3L@@@���U���@@ ���@@ �A�������
   It is possible to consistently compare [t]'s, but due to the complexities of
            time zones and daylight savings, the resulting ordering is not chronological.
            That is, [compare t1 t2 > 0] does not imply [t2] occurs after [t1] every day,
            or any day. @��u�x2@@@@��u�x2@@���@@ ���@@ �A���(deriving��y3P� y3X@�����������&bin_io��.y3Y�/y3_@��1y3Y�2y3_@@@�����$sexp��:y3a�;y3e@��=y3a�>y3e@@@�����'compare��Fy3g�Gy3n@��Iy3g�Jy3n@@@�����%equal��Ry3p�Sy3u@��Uy3p�Vy3u@@@�����$hash��^y3w�_y3{@��ay3w�by3{@@@@��dy3Y�ey3{@@@@��gy3Y�hy3{@@��jy3M�ky3|@@��my3;�ny3|@@��py3;�qy3|@�����������l��~y3;�y3|@�������k@���y3;��y3|@@@@���y3;��y3|@@���y3;��y3|@���y3;��y3|@������������(Bin_prot'Binable!S���y3;��y3|@���y3;��y3|@@����j���y3;��y3|@    �����y3G��y3H@@@@A�����ư��y3G��y3H@@���y3;��y3|@@@@���y3;��y3|@@���y3;��y3|@@���y3;��y3|@@���y3;��y3|@������������1Ppx_sexp_conv_lib(Sexpable!S���y3;��y3|@���y3;��y3|@@��������y3;��y3|@    �����y3G��y3H@@@@A���������y3G��y3H@@���y3;��y3|@@@@���y3;��y3|@@���y3;��y3|@@���y3;��y3|@@��y3;�y3|@���Р'compare��
y3G�y3H@��@������y3G�y3H@@��y3G�y3H@@@��@����+��y3G� y3H@@��"y3G�#y3H@@@����#int��*y3G�+y3H@@��-y3G�.y3H@@@��0y3G�1y3H@@@��3y3G�4y3H@@@@@��6y3;�7y3|@��9y3;�:y3|@���Р%equal��By3G�Cy3H@��@����W��Ky3G�Ly3H@@��Ny3G�Oy3H@@@��@����c��Wy3G�Xy3H@@��Zy3G�[y3H@@@����$bool��by3G�cy3H@@��ey3G�fy3H@@@��hy3G�iy3H@@@��ky3G�ly3H@@@@@��ny3;�oy3|@��qy3;�ry3|@���Р+hash_fold_t��zy3G�{y3H@��@����������ְ��y3G��y3H@@���y3G��y3H@@@��@��������y3G��y3H@@���y3G��y3H@@@�������������y3G��y3H@@���y3G��y3H@@@���y3G��y3H@@@���y3G��y3H@@@@@���y3;��y3|@���y3;��y3|@���Рհ��y3G��y3H@��@����˰��y3G��y3H@@���y3G��y3H@@@����������Ѱ��y3G��y3H@@���y3G��y3H@@@���y3G��y3H@@@@@���y3;��y3|@���y3;��y3|@@���y3;��y3|@@���y3;��y3|@���а��y3;��y3|@��������@���y3;��y3|@@@@���y3;��y3|@@���y3;��y3|@@���y3;��y3|@@���t���z}�@@@���t����z}�@�� t���z}�@@��`Xk�{��@@@��`X\�{��@��	`X\�
{��@���Р#now��}���}��@���$zone�����$Zone!t�� }���!}��@@��#}���$}��@@@����!t��+}���,}��@@��.}���/}��@@@��1}���2}��@@@@@��4}���5}��@��7}���8}��@@��:[���;~��@@@��=[���>~��@��@[���A~��@���A�    �!t��J A� �K A�@@@@A������$Time!t��U A��V A�
@@��X A��Y A�
@@@������	B@@ ��	C@@ �A�������	; A fully qualified point in time, independent of timezone. @��i @���j @��@@@@��l @���m @��@@��	S@@ ��	T@@ �A���(deriving��v A��w A�@�����������&bin_io��� A��� A�@��� A��� A�@@@�����'compare��� A��� A�&@��� A��� A�&@@@�����$hash��� A�(�� A�,@��� A�(�� A�,@@@�����$sexp��� A�.�� A�2@��� A�.�� A�2@@@�����'typerep��� A�4�� A�;@��� A�4�� A�;@@@@��� A��� A�;@@@@��� A��� A�;@@��� A��� A�<@@��� A���� A�<@@��� A���� A�<@�����������ð�� A���� A�<@��������@��� A���� A�<@@@@��� A���� A�<@@��� A���� A�<@��� A���� A�<@������������(Bin_prot'Binable!S��� A���� A�<@��� A���� A�<@@�������	 A���	 A�<@    ����		 A� �	
 A�@@@@A�����Ȱ�	 A� �	 A�@@��	 A���	 A�<@@@@��	 A���	 A�<@@��	 A���	 A�<@@��	 A���	 A�<@@��	  A���	! A�<@���Р��	( A� �	) A�@��@������	1 A� �	2 A�@@��	4 A� �	5 A�@@@��@�������	= A� �	> A�@@��	@ A� �	A A�@@@������	G A� �	H A�@@��	J A� �	K A�@@@��	M A� �	N A�@@@��	P A� �	Q A�@@@@@��	S A���	T A�<@��	V A���	W A�<@���Р+hash_fold_t��	_ A� �	` A�@��@�������������	k A� �	l A�@@��	n A� �	o A�@@@��@����.��	w A� �	x A�@@��	z A� �	{ A�@@@����������԰�	� A� �	� A�@@��	� A� �	� A�@@@��	� A� �	� A�@@@��	� A� �	� A�@@@@@��	� A���	� A�<@��	� A���	� A�<@���Р���	� A� �	� A�@��@����[��	� A� �	� A�@@��	� A� �	� A�@@@�������������	� A� �	� A�@@��	� A� �	� A�@@@��	� A� �	� A�@@@@@��	� A���	� A�<@��	� A���	� A�<@������������1Ppx_sexp_conv_lib(Sexpable!S��	� A���	� A�<@��	� A���	� A�<@@�������	� A���	� A�<@    ����	� A� �	� A�@@@@A��������	� A� �	� A�@@��	� A���	� A�<@@@@��	� A���	� A�<@@��	� A���	� A�<@@��	� A���	� A�<@@��	� A���	� A�<@������������+Typerep_lib+Typerepable!S��
 A���
 A�<@��

 A���
 A�<@@����ΰ�
 A���
 A�<@    �Ͱ�
 A� �
 A�@@@@A�����հ�
 A� �
 A�@@��
! A���
" A�<@@@@��
$ A���
% A�<@@��
' A���
( A�<@@��
* A���
+ A�<@@��
- A���
. A�<@@��
0 A���
1 A�<@@��
3 A���
4 A�<@���%��
9 A���
: A�<@�������$@��
C A���
D A�<@@@@��
F A���
G A�<@@��
I A���
J A�<@@��
L A���
M A�<@������������$Time��
\ C>X�
] C>\@��
_ C>X�
` C>\@@��
b C>I�
c C>\@@����!t��
j D]u�
k D]v@    ���
o D]u�
p D]v@@@@A�����!t��
x D]~�
y D]@@��
{ D]~�
| D]@@@@��
~ D]n�
 D]@����$Zone��
� E���
� E��@���$Time$Zone��
� E���
� E��@����%Ofday��
� F���
� F��@���$Time%Ofday��
� F���
� F��@����$Span��
� G���
� G��@���$Time$Span��
� G���
� G�	@@��
� C>I�
� G�	@@��
� C>@�
� G�	@@��
� C>@�
� G�	@���Р(arg_type��
� I		
�
� I		@�������+Core_kernel'Command(Arg_type!t��
� I		�
� I		5@�����!t��
� I		�
� I		@@��
� I		�
� I		@@@@��
� I		�
� I		5@@@@@��
� I		�
� I		5@��
� I		�
� I		5@�����������,Identifiable!S��
� R
�
��
� R
�
�@��
� R
�
��
� R
�
�@@����!t��
� S
��
� S
�@    ��� S
�� S
�@@@@A�����!t�� S
�!� S
�"@@�� S
�!� S
�"@@@@�� S
�
�� S
�"@����2comparator_witness�� T#3� T#E@    ��� T#3�  T#E@@@@A�����2comparator_witness��( T#R�) T#d@@��+ T#R�, T#d@@@@��. T#,�/ T#d@����;Replace_polymorphic_compare��6 Ueu�7 Ue�@��;Replace_polymorphic_compare��< Ue��= Ue�@@��? R
�
��@ Ue�@@��B R
�
��C Ue�@������,@@ ��-@@ �A�������
  � String conversions use the local timezone by default. Sexp conversions use
      [get_sexp_zone ()] by default, which can be overridden by calling [set_sexp_zone].
      These default time zones are used when writing a time, and when reading a time with
      no explicit zone or UTC offset.

      Sexps and strings display the date, ofday, and UTC offset of [t] relative to the
      appropriate time zone. @��S K	7	9�T Q
�
�@@@@��V K	7	9�W Q
�
�@@��=@@ ��>@@ �A@��\ R
�
��] Ue�@���Р-get_sexp_zone��e W���f W��@��@����$unit��o W���p W��@@��r W���s W��@@@�����$Zone!t��| W���} W��@@�� W���� W��@@@��� W���� W��@@@@@��� W���� W��@��� W���� W��@���Р-set_sexp_zone��� X���� X��@��@�����$Zone!t��� X���� X��@@��� X���� X��@@@����$unit��� X���� X��@@��� X���� X��@@@��� X���� X��@@@@@��� X���� X��@��� X���� X��@����������3Robustly_comparable��� Z��� Z�@��� Z��� Z�@@����!t��� Z�$�� Z�%@    ���� Z�$�� Z�%@@@@A�����!t��� Z�)�� Z�*@@��� Z�)�� Z�*@@@@��� Z��� Z�*@@��� Z��� Z�*@@��� Z���� Z�*@@��� Z���� Z�*@���Р%of_tm��� ^���� ^��@��@�����)Core_unix"tm��� ^���  ^��@@�� ^��� ^��@@@���$zone�����$Zone!t�� ^� � ^�@@�� ^� � ^�@@@����!t�� ^�
� ^�@@�� ^�
� ^�@@@��! ^���" ^�@@@��$ ^���% ^�@@@@���	x��@@ ��@@ �A�������	� [of_tm] converts a [Unix.tm] (mirroring a [struct tm] from the C stdlib) into a
      [Time.t].  Note that the [tm_wday], [tm_yday], and [tm_isdst] fields are ignored. @��5 \,.�6 ]��@@@@��8 \,.�9 ]��@@��@@ �� @@ �A@��> ^���? ^�@��A ^���B ^�@���Р3of_date_ofday_zoned��J b���K b��@��@�����$Date!t��V b���W b��@@��Y b���Z b��@@@��@������%Ofday%Zoned!t��g b���h b��@@��j b���k b��@@@����!t��r b���s b��@@��u b���v b��@@@��x b���y b��@@@��{ b���| b��@@@@���	ϰ�e@@ ��f@@ �A�������	| Conversion functions that involved Ofday.Zoned.t, exactly analogous to the
      conversion functions that involve Ofday.t @��� `�� a^�@@@@��� `�� a^�@@��v@@ ��w@@ �A@��� b���� b��@��� b���� b��@���Р3to_date_ofday_zoned��� c���� c��@��@����!t��� c���� c��@@��� c���� c��@@@���$zone������$Time$Zone!t��� c���� c��@@��� c���� c��@@@��������$Date!t��� c���� c�@@��� c���� c�@@@�������%Ofday%Zoned!t��� c��� c�@@��� c��� c�@@@@��� c���� c�@@@��� c���� c�@@@��� c���� c�@@@@@��� c���� c�@��� c���� c�@���Р.to_ofday_zoned��� d�� d*@��@����!t�� d-� d.@@�� d-� d.@@@���$zone������$Time$Zone!t�� d7� dB@@�� d7� dB@@@������%Ofday%Zoned!t��% dF�& dS@@��( dF�) dS@@@��+ d2�, dS@@@��. d-�/ dS@@@@@��1 d�2 dS@��4 d�5 dS@���Р3to_string_fix_proto��= fU[�> fUn@��@������#Utc��I fUr�J fUv@A@��L fUr�M fUv@@����%Local��T fUy�U fU@A@��W fUy�X fU@@@@@��Z fUq�[ fU�@@@��@����!t��d fU��e fU�@@��g fU��h fU�@@@����&string��o fU��p fU�@@��r fU��s fU�@@@��u fU��v fU�@@@��x fUq�y fU�@@@@@��{ fUW�| fU�@��~ fUW� fU�@���Р3of_string_fix_proto��� g���� g��@��@������#Utc��� g���� g��@A@��� g���� g��@@����%Local��� g���� g��@A@��� g���� g��@@@@@��� g���� g��@@@��@����&string��� g���� g��@@��� g���� g��@@@����!t��� g���� g��@@��� g���� g��@@@��� g���� g��@@@��� g���� g��@@@@@��� g���� g��@��� g���� g��@���Р-of_string_abs��� k]c�� k]p@��@����&string��� k]s�� k]y@@��� k]s�� k]y@@@����!t��� k]}�� k]~@@��� k]}�� k]~@@@��� k]s�� k]~@@@@���@���@@ ���@@ �A�������	� This is like [of_string] except that if the string doesn't specify the zone then it
      raises rather than assume the local timezone. @��� i���� j&\@@@@��  i��� j&\@@���@@ ���@@ �A@�� k]_� k]~@��	 k]_�
 k]~@���Р-of_string_gen�� o� o&@���.if_no_timezone������$Fail��  p'?�! p'D@A@��# p'?�$ p'D@@����%Local��+ p'G�, p'M@A@��. p'G�/ p'M@@����,Use_this_one��6 p'P�7 p']@@������$Zone!t��A p'a�B p'g@@��D p'a�E p'g@@@@��G p'P�H p'g@@@@@��J p'=�K p'i@@@��@����&string��T qjq�U qjw@@��W qjq�X qjw@@@����!t��_ rx�` rx�@@��b rx�c rx�@@@��e qjq�f rx�@@@��h p'.�i rx�@@@@������R@@ ��S@@ �A�������	� [of_string_gen ~if_no_timezone s] attempts to parse [s] to a [t].  If [s] doesn't
      supply a time zone [if_no_timezone] is consulted. @��y m���z n�@@@@��| m���} n�@@��c@@ ��d@@ �A@��� o�� rx�@��� o�� rx�@���Р-t_of_sexp_abs��� v��� v�@��@�����$Sexp!t��� v��� v�@@��� v��� v�@@@����!t��� v��� v�@@��� v��� v�@@@��� v��� v�@@@@�������@@ ���@@ �A�������	t [t_of_sexp_abs sexp] as [t_of_sexp], but demands that [sexp] indicate the timezone
      the time is expressed in. @��� t���� u��@@@@��� t���� u��@@���@@ ���@@ �A@��� v� �� v�@��� v� �� v�@���Р-sexp_of_t_abs��� w &�� w 3@��@����!t��� w 6�� w 7@@��� w 6�� w 7@@@���$zone�����$Zone!t��� w @�� w F@@��� w @�� w F@@@�����$Sexp!t��� w J�� w P@@��� w J�� w P@@@��� w ;�  w P@@@�� w 6� w P@@@@@�� w "� w P@�� w "�	 w P@�����q���@@ ���@@ �A�������3 {6 Miscellaneous} @�� yRT� yRl@@@@�� yRT� yRl@@��@@ ��@@ �A��$ yRT�% yRl@���Р%pause��- |���. |��@��@�����$Span!t��9 |���: |��@@��< |���= |��@@@����$unit��D |���E |��@@��G |���H |��@@@��J |���K |��@@@@������4@@ ��5@@ �A�������	$ [pause span] sleeps for span time. @��[ {np�\ {n�@@@@��^ {np�_ {n�@@��E@@ ��F@@ �A@��d |���e |��@��g |���h |��@���Р3interruptible_pause��p �kq�q �k�@��@�����$Span!t��| �k��} �k�@@�� �k��� �k�@@@������"Ok��� �k��� �k�@A@��� �k��� �k�@@����)Remaining��� �k��� �k�@@������$Span!t��� �k��� �k�@@��� �k��� �k�@@@@��� �k��� �k�@@@@@��� �k��� �k�@@@��� �k��� �k�@@@@�������@@ ���@@ �A�������	� [interruptible_pause span] sleeps for span time unless interrupted (e.g. by delivery
      of a signal), in which case the remaining unslept portion of time is returned. @��� ~���� j@@@@��� ~���� j@@���@@ ���@@ �A@��� �km�� �k�@��� �km�� �k�@���Р-pause_forever��� ����� ���@��@����$unit��� ����� ���@@��� ����� ���@@@����-never_returns��� ����� ��@@��� ����� ��@@@��� ����� ��@@@@���@���@@ ���@@ �A�������	& [pause_forever] sleeps indefinitely. @��� ����� ���@@@@��  ���� ���@@���@@ ���@@ �A@�� ���� ��@��	 ����
 ��@���Р&format�� ���� ���@��@����!t�� ���� ���@@�� ����  ���@@@��@����&string��) ����* ���@@��, ����- ���@@@���$zone�����$Zone!t��: ����; ���@@��= ����> ���@@@����&string��E ����F ��@@��H ����I ��@@@��K ����L ��@@@��N ����O ��@@@��Q ����R ��@@@@������;@@ ��<@@ �A�������
  � [format t fmt] formats the given time according to fmt, which follows the formatting
      rules given in 'man strftime'.  The time is output in the given timezone. Here are
      some commonly used control codes:

      {v
      %Y - year (4 digits)
      %y - year (2 digits)
      %m - month
      %d - day
      %H - hour
      %M - minute
      %S - second
    v}

      a common choice would be: %Y-%m-%d %H:%M:%S

      Although %Z and %z are interpreted as format strings, neither are correct in the
      current implementation. %Z always refers to the local machine timezone, and does not
      correctly detect whether DST is active. The effective local timezone can be
      controlled by setting the "TZ" environment variable before calling [format]. %z
      behaves unreliably and should be avoided.

      Not all strftime control codes are standard; the supported subset will depend on the
      C libraries linked into a given executable.
  @��b �
�c ���@@@@��e �
�f ���@@��L@@ ��M@@ �A@��k ����l ��@��n ����o ��@���Р%parse��w �fl�x �fq@��@����&string��� �ft�� �fz@@��� �ft�� �fz@@@���#fmt����&string��� �f��� �f�@@��� �f��� �f�@@@���$zone�����$Zone!t��� �f��� �f�@@��� �f��� �f�@@@����!t��� �f��� �f�@@��� �f��� �f�@@@��� �f��� �f�@@@��� �f~�� �f�@@@��� �ft�� �f�@@@@������@@ ���@@ �A�������
  W [parse string ~fmt ~zone] parses [string], according to [fmt], which follows the
      formatting rules given in 'man strptime'.  The time is assumed to be in the given
      timezone.

      {v
      %Y - year (4 digits)
      %y - year (2 digits)
      %m - month
      %d - day
      %H - hour
      %M - minute
      %S - second
    v}
  @��� �	�� �ae@@@@��� �	�� �ae@@���@@ ���@@ �A@��� �fh�� �f�@��� �fh�� �f�@�����1Exposed_for_tests��� ����� ���@�����Р6ensure_colon_in_offset��� ����� ���@��@����&string��� ����� ���@@��� ����� ���@@@����&string��� ����� ���@@�� ���� ���@@@�� ���� ���@@@@@�� ���� ���@��
 ���� ���@@�� ���� ���@@@�� ���� ���@�� ���� ���@@��I �� ���@@@��I � �� ���@��I � �� ���@�����)Core_time��% ���& ��@��������!S��1 �&�2 �'@�����!S��: �*�; �+@��= �*�> �+@@@��@ ��A �+@��C ��D �+@�����$Make��L �-6�M �-:@���%Time0��S �;B�T �;G@������$Time5S_kernel_without_zone��^ �;J�_ �;d@��a �;J�b �;d@@���$Time��h �fm�i �fq@��������$Time(S_kernel��u �fu�v �f�@��x �fu�y �f�@@����$Time��� �f��� �f�@��%Time0��� �f��� �f�@@��� �fu�� �f�@@������!S��� ����� ���@��� ����� ���@@����%Time0��� ����� ���@��%Time0��� ����� ���@����$Time��� ����� ���@��$Time��� ����� ���@@��� ����� ���@@��� �fl�� ���@@��� �;A�� ���@@@��� �-/�� ���@��� �-/�� ���@@��� ���� ���@@@��� ����� ���@��� ����� ���@�����3���@@ ���@@ �A�������
  %� {1 Notes on time}

    This library replicates and extends the functionality of the standard Unix time
    handling functions (currently exposed in the Unix module, and indirectly through the
    Time module).

    Things you should know before delving into the mess of time...

    {2 Some general resources (summarized information also appears below) }

    {v
    general overview   - http://www.twinsun.com/tz/tz-link.htm
    zone abbreviations - http://blogs.msdn.com/oldnewthing/archive/2008/03/07/8080060.aspx
    leap seconds       - http://en.wikipedia.org/wiki/Leap_second
    epoch time         - http://en.wikipedia.org/wiki/Unix_time
    UTC/GMT time       - http://www.apparent-wind.com/gmt-explained.html
    TAI time           - http://en.wikipedia.org/wiki/International_Atomic_Time
    Almost every possible time measurement -
      http://www.ucolick.org/~sla/leapsecs/timescales.html
  v}

    {2 Standards for measuring time }

    - Epoch time/Unix time/Posix time: Defined as the number of seconds that have passed
      since midnight, January 1st, 1970 GMT.  However, under epoch time, a day is always
      86,400 seconds long, and a minute never contains more than 60 total seconds.  In other
      words, epoch time does not take leap seconds into account properly.  What a POSIX
      compliant system does during a leap second depends on the way in which its clock is
      managed.  It either ignores it, replays the second, or causes a second to last longer
      than a second (retards the second).  The important thing to remember is that however
      the transition is managed, all days start on an evenly divisible multiple of 86,400.
    - GMT/Greenwich Mean Time/Greenwich Civil Time: The time based on the movement of the
      sun relative to the meridian through the Old Greenwich Observatory (0 degrees).  The
      movement of the sun in this case is a "mean" movement of the sun to adjust for slight
      eccentricities in the rotation of the earth, as well as for the effect of the tilt of
      the earth on the visible speed of the sun across the sky at different times of the
      year.  GMT is often used synonymously with the term UTC (see below), but may also be
      used to refer to the time system described here, which differs from UTC (as of 2009)
      by ~1 second.
    - Standard Time: The time based on the adjusted (as in GMT) movement of the sun over a
      point on the earth that is not Greenwich.  Colloquially, the time in a time zone
      without accounting for any form of daylight savings time.
    - Wall Clock Time: The time as it appears on a clock on the wall in a given time zone.
      Essentially this is standard time with DST adjustments.
    - TAI: International atomic time.  The time based on a weighted average of the time kept
      by roughly 300 atomic clocks worldwide.  TAI is written using the same format as
      normal solar (also called civil) times, but is not based on, or adjusted for the
      apparent solar time.  Thus, as of 2009 TAI appears to be ahead of most other time
      systems by ~34 seconds when written out in date/time form (2004-09-17T00:00:32 TAI is
      2004-09-17T00:00:00 UTC)
    - UTC/Universal Coordinated Time: Often taken as just another term for GMT, UTC is
      actually TAI adjusted with leap seconds to keep it in line with apparent solar time.
      Each UTC day is not an exact number of seconds long (unlike TAI or epoch time), and
      every second is exactly one real second long (unlike GMT, which is based entirely on
      the apparent motion of the sun, meaning that seconds under GMT slowly get longer as
      the earth's rotation slows down).  Leap seconds are determined by the rotation of
      the earth, which is carefully measured by the International Earth Rotation Service
      in Paris, France using a combination of satellite and lunar laser ranging, very
      long baseline interferometry, and Navstar Global Positioning System (GPS) stations.
      This isn't important for using UTC, but is very cool.  UTC is not well defined before
      about 1960.
    - Windows File Time: The number of 100-nanosecond intervals that have elapsed since
      12:00 A.M. January 1, 1601, UTC.  This is great because UTC has no meaning in 1601
      (being based on atomic timekeeping technologies that didn't exist then), and also
      because 1601 predates the development of even reasonably accurate clocks of any sort.
      The reasoning behind the Windows epoch time choice is that "The Gregorian calendar
      operates on a 400-year cycle, and 1601 is the first year of the cycle that was
      active at the time Windows NT was being designed. In other words, it was chosen to
      make the math come out nicely."
      (http://blogs.msdn.com/oldnewthing/archive/2009/03/06/9461176.aspx)
    - VBScript (this is my favorite):
      http://blogs.msdn.com/ericlippert/archive/2003/09/16/eric-s-complete-guide-to-vt-date.aspx

    All of these systems start to exhibit problems as you go further back in time, partly
    because truly accurate timekeeping didn't make an appearance until roughly 1958, and
    partly because different parts of the world didn't actually have well defined time zones
    for a long time.  If you go back far enough, you run into the switch between the Julian
    (old) and the Gregorian calendar, which happened at different times in history in
    different places in the world.

    {2 How does a system determine what time zone it is in? }

    + Check to see if the TZ environment variable is set.  If it is, it can be set to one
    of three forms, two of which are rarely, if ever used see:

    http://www.opengroup.org/onlinepubs/000095399/basedefs/xbd_chap08.html

    for more information on the obscure forms.  The common form represents a relative path
    from the base /usr/share/zoneinfo/posix, and is generally in the form of a continent
    or country name paired with a city name (Europe/London, America/New_York).  This is
    used to load the specified file from disk, which contains a time zone database in zic
    format (man tzfile).

    + If TZ is not set, the system will try to read the file located at /etc/localtime,
    which must be a zic timezone database (and which is often just a symlink into
    /usr/share/zoneinfo/posix).
    + If /etc/localtime cannot be found, then the system is assumed to be in GMT.

    It's worth noting that under this system there is no place on the system to go to get
    the name of the file you are using (/etc/localtime may not be a link, and may just be a
    copy, or its own database not represented in /usr/share/zoneinfo).  Additionally, the
    names of the files in the system zoneinfo database follow an internal standard, and
    there is no established standard for naming timezones.  So even if you were using one of
    these files, and you did know its name, you cannot assume that that name matches any
    timezone specified by any other system or description.

    One common misconception about time zones is that the standard time zone abbreviations
    can be used.  For instance, EST surely refers to Eastern Standard Time.  This is
    unfortunately not true - CST can refer to China Central Time, Central Standard Time, or
    Cuba Summer Time for instance - and time zone libraries that appear to correctly parse
    times that use time zone abbreviations do so by using a heuristic that usually assumes
    you mean a time in the US or Europe, in that order.  Time zones also sometimes use two
    different abbreviations depending on whether the time in question is in standard time,
    or daylight savings time.  These abbreviations are kept in the timezone databases, which
    is how programs like date manage to output meaningful abbreviations, it is only reading
    in times with abbreviations that is poorly specified.

    This library contains a function that attempts to make an accurate determination of the
    machine timezone by testing the md5 sum of the currently referenced timezone file
    against all of the possible candidates in the system database.  It additionally makes
    some adjustments to return the more common timezone names since some files in the
    database are duplicated under several names.  It returns an option because of the
    problems mentioned above.

    {2 The problems with string time conversions }

    There are two cases where string time conversions are problematic, both related to
    daylight savings time.

    In the case where time jumps forward one hour, there are possible representations of
    times that never happened 2006-04-02T02:30:00 in the eastern U.S. never happened for
    instance, because the clock jumped forward one hour directly from 2 to 3.  Unix time
    zone libraries asked to convert one of these times will generally produce the epoch time
    that represents the time 1/2 hour after 2 am, which when converted back to a string
    representation will be T03:30:00.

    The second case is when the clocks are set back one hour, which causes one hour of time
    to happen twice.  Converting a string in this range without further specification into
    an epoch time is indeterminate since it could be referring to either of two times.  Unix
    libraries handle this by either allowing you to pass in a dst flag to the conversion
    function to specify which time you mean, or by using a heuristic to guess which time you
    meant.

    The existence of both cases make a strong argument for serializing all times in UTC,
    which doesn't suffer from these issues.
@��� �����O?�?�@@@@��� �����O?�?�@@���@@ ���@@ �A��� �����O?�?�@���@����������O?�?���O?�?�@@���O?�?���O?�?�@@@��������3Ppx_inline_test_lib'Runtime)unset_lib��O?�?��O?�?�@��O?�?��O?�?�@@@��@����@��O?�?��O?�?�@@@@��O?�?��O?�?�@@@@��O?�?��O?�?�@@��O?�?��O?�?�@���@��������#O?�?��$O?�?�@@��&O?�?��'O?�?�@@@��������5Expect_test_collector,Current_file%unset��4O?�?��5O?�?�@��7O?�?��8O?�?�@@@��@����"()��AO?�?��BO?�?�@@��DO?�?��EO?�?�@@@@��GO?�?��HO?�?�@@@@��JO?�?��KO?�?�@@��MO?�?��NO?�?�@���@������Z��YO?�?��ZO?�?�@@��\O?�?��]O?�?�@@@���������-Ppx_bench_lib5Benchmark_accumulator/Current_libname%unset��lO?�?��mO?�?�@��oO?�?��pO?�?�@@@��@����"()��yO?�?��zO?�?�@@��|O?�?��}O?�?�@@@@��O?�?���O?�?�@@@@���O?�?���O?�?�@@���O?�?���O?�?�@@