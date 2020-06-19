Caml1999N026����   0         	.book/duniverse/core_kernel.v0.13.0/src/bus.mli����  s�  �  J�  G������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � A [Bus] is a publisher/subscriber system within the memory space of the program.  A
    bus has a mutable set of subscribers, which can be modified using [subscribe_exn] and
    [unsubscribe].

    [create] returns a [Bus.Read_write.t], which you can use to [write] values to the bus.
    [write] calls the callbacks of all current subscribers before returning.

    In a [('callback, 'phantom) Bus.t], ['phantom] is a read-write phantom type that
    controls whether one can read values from or write values to the bus.  The phantom
    type states the capabilities one could ever have access to, not the capabilities that
    are immediately available.  In particular, if one wants to subscribe to a
    [Bus.Read_write.t], one must call [read_only] on it in order to get a
    [Bus.Read_only.t] that can be passed to [subscribe_exn].  This is deliberate, and is
    meant to avoid unintentional reads from code that should only be writing. @��	.book/duniverse/core_kernel.v0.13.0/src/bus.mliA@@�Nf�@@@@��A@@�Nf�@@���@@ ���@@ �A��
A@@�Nf�@������&Import��P���P��@@��P���P��@@��P���P��@������,Std_internal��$Q���%Q��@A��'Q���(Q��@@��*Q���+Q��@�����.Callback_arity��3[���4[��@�����A�    �!t��?\�@\@���@��E\�F\@@@B@@��Р&Arity1��M]�N]@�@�����!t��W]/�X]0@���@��!a��`]#�a]%@@@����$unit��h])�i]-@@��k])�l]-@@@��n]#�o]-@@@@��q]"�r]0@@@��t]�u]0@@�Р&Arity2��{^17�|^1=@�@�����!t���^1S��^1T@���@��!a���^1A��^1C@@@��@��!b���^1G��^1I@@@����$unit���^1M��^1Q@@���^1M��^1Q@@@���^1G��^1Q@@@���^1A��^1Q@@@@���^1@��^1T@@@���^15��^1T@@�Р&Arity3���_U[��_Ua@�@�����!t���_U}��_U~@���@��!a���_Ue��_Ug@@@��@��!b���_Uk��_Um@@@��@��!c���_Uq��_Us@@@����$unit���_Uw��_U{@@���_Uw��_U{@@@���_Uq��_U{@@@���_Uk��_U{@@@���_Ue��_U{@@@@���_Ud��_U~@@@���_UY��_U~@@�Р&Arity4���`���`�@�@�����!t��`��`�@���@��!a��`��`�@@@��@��!b��`��`�@@@��@��!c��`��`�@@@��@��!d��#`��$`�@@@����$unit��+`��,`�@@��.`��/`�@@@��1`��2`�@@@��4`��5`�@@@��7`��8`�@@@��:`��;`�@@@@��=`��>`�@@@��@`��A`�@@@A@���(deriving��Ga���Ha��@��������'sexp_of��Sa���Ta��@��Va���Wa��@@@@��Ya���Za��@@��\a���]a��@@��_\�`a��@@��b\�ca��@�����������-ocaml.warning��q\�ra��@�������#-32@��|\�}a��@@@@��\��a��@@���\��a��@���\��a��@���Р)sexp_of_t���\��\@��@��@��)v_x__001_���\��\@@@������1Ppx_sexp_conv_lib$Sexp!t���\��\@@���\��\@@@���\��\@@@��@����u���\��\@���"���\��\@@@@���\��\@@@������$#"���\��\@@���\��\@@@���\��\@@@���\��\@@@@@���\��a��@���\��a��@@���\��a��@@���\��a��@���)ocaml.doc���\��a��@�������'@inline@���\��a��@@@@���\��a��@@���\��a��@@���\��a��@@���[���b��@@���)ocaml.doc���@@ ���@@ �A�������
   [Callback_arity] states the type of callbacks stored in a bus. Using [Callback_arity]
    is an implementation technique that allows callbacks to be defined as ordinary n-ary
    curried functions (e.g., [a1 -> a2 -> a3 -> r]), instead of forcing n-ary-variadic
    callbacks to use tuples (e.g., [a1 * a2 * a3 -> r]).  This also avoids extra
    allocation.

    When reading the bus interface, keep in mind that each ['callback] is limited, through
    [create], to the types exposed by the variants in [Callback_arity]. @��
S���Z��@@@@��S���Z��@@���@@ ���@@ �A@��[���b��@��[���b��@���A�    �!t�� d���!d��@����(callback��(d���)d��@@@B����'phantom��0d���1d��@@@B@@@A@���(deriving��7d���8d��@��������'sexp_of��Cd���Dd��@��Fd���Gd��@@@@��Id���Jd��@@��Ld���Md��@@��Od���Pd��@@��Rd���Sd��@�������������`d���ad��@��������@��jd���kd��@@@@��md���nd��@@��pd���qd��@��sd���td��@���Р)sexp_of_t��|d���}d��@��@��@��^���d����d��@@@�����������d����d��@@���d����d��@@@���d����d��@@@��@��@��n���d����d��@@@���������d����d��@@���d����d��@@@���d����d��@@@��@��������d����d��@�������d����d��@@@�������d����d��@@@@���d����d��@@@������,+*���d����d��@@���d����d��@@@���d����d��@@@���d����d��@@@���d����d��@@@@@���d����d��@���d����d��@@���d����d��@@���d����d��@������d����d��@�������
@���d����d��@@@@���d����d��@@���d����d��@@���d����d��@���A�    �#bus��e��	e�@����(callback��e��e�@@@B����'phantom��e��e�@@@B@@@A�����!t��!e�4�"e�5@���(callback��(e��)e�(@@@���'phantom��/e�*�0e�2@@@@��2e��3e�5@@@@��5e���6e�5@@��8e���9e�5@�����*Read_write��Ag7>�Bg7H@�����A�    �!t��MhO`�NhOa@����(callback��UhOV�VhO_@@@B@@@A�����#bus��^hO|�_hO@���(callback��ehOe�fhOn@@@�����*read_write��nhOp�ohOz@@��qhOp�rhOz@@@@��thOd�uhO@@@���(deriving��{hO��|hO�@��������'sexp_of���hO���hO�@���hO���hO�@@@@���hO���hO�@@���hO���hO�@@���hOQ��hO�@@���hOQ��hO�@�����������4���hOQ��hO�@�������3@���hOQ��hO�@@@@���hOQ��hO�@@���hOQ��hO�@���hOQ��hO�@���Р)sexp_of_t���hO`��hOa@��@��@��u���hOV��hO_@@@������10/���hOV��hO_@@���hOV��hO_@@@���hOV��hO_@@@��@��������hO`��hOa@�������hOV��hO_@@@@���hO`��hOa@@@������RQP���hO`��hOa@@���hO`��hOa@@@���hO`��hOa@@@���hOV��hO_@@@@@���hOQ� hO�@��hOQ�hO�@@��hOQ�hO�@@��hOQ�	hO�@���.��hOQ�hO�@�������-@��hOQ�hO�@@@@��hOQ�hO�@@��hOQ�hO�@@��!hOQ�"hO�@�����������)Invariant"S1��1j���2j��@��4j���5j��@@����!t��<j���=j��@    ���Aj���Bj��@����!a��Ij���Jj��@@@B@@@A�����!t��Rj���Sj��@���!a��Yj���Zj��@@@@��\j���]j��@@@@��_j���`j��@@��bj���cj��@@��ej���fj��@@��hj���ij��@@��kg7K�lk��@@@��ng77�ok��@��qg77�rk��@�����)Read_only��zm���{m��@�����A�    �!t���n����n��@����(callback���n����n��@@@B@@@A�����#bus���n���n�
@���(callback���n����n��@@@�����$read���n���n�@@���n���n�@@@@���n����n�
@@@���(deriving���n���n�@��������'sexp_of���n���n�@���n���n�@@@@���n���n�@@���n���n�@@���n����n�@@���n����n�@�����������m���n����n�@�������l@���n����n�@@@@���n����n�@@���n����n�@���n����n�@���Р)sexp_of_t���n����n��@��@��@��u��n���n��@@@������jih��n���n��@@��n���n��@@@��n���n��@@@��@�������n���n��@������ n���!n��@@@@��#n���$n��@@@�����������,n���-n��@@��/n���0n��@@@��2n���3n��@@@��5n���6n��@@@@@��8n���9n�@��;n���<n�@@��>n���?n�@@��An���Bn�@���g��Gn���Hn�@�������f@��Qn���Rn�@@@@��Tn���Un�@@��Wn���Xn�@@��Zn���[n�@�����������)Invariant"S1��jp!+�kp!7@��mp!+�np!7@@����!t��up!E�vp!F@    ���zp!E�{p!F@����!a���p!B��p!D@@@B@@@A�����!t���p!M��p!N@���!a���p!J��p!L@@@@���p!J��p!N@@@@���p!=��p!N@@���p!+��p!N@@���p!#��p!N@@���p!#��p!N@@���m����qOR@@@���m����qOR@���m����qOR@�����	!On_subscription_after_first_write���sT[��sT|@�����A�    �!t���t����t��@@@��Р%Allow���u����u��@�@@���u����u��@@�Р9Allow_and_send_last_value���v����v��@�@@���v����v��@@�Р%Raise���w����w��@�@@���w����w��@@@A@���(deriving���x����x��@��������'sexp_of���x����x��@���x����x��@@@@���x����x��@@���x����x��@@�� t���x��@@��t���x��@��������������t���x��@��������@��t���x��@@@@��t���x��@@��!t���"x��@��$t���%x��@���Р)sexp_of_t��-t���.t��@��@����x��6t���7t��@@��9t���:t��@@@�����������Bt���Ct��@@��Et���Ft��@@@��Ht���It��@@@@@��Kt���Lx��@��Nt���Ox��@@��Qt���Rx��@@��Tt���Ux��@���z��Zt���[x��@�������y@��dt���ex��@@@@��gt���hx��@@��jt���kx��@@��mt���nx��@@��psT�qy��@@@��ssTT�ty��@��vsTT�wy��@���Р)read_only��{����{��@��@����!t���{�	��{�	@���(callback���{����{��@@@��@���{����{��@@@@���{����{�	@@@�����)Read_only!t���{�	��{�	@���(callback���{�	��{�	@@@@���{�	��{�	@@@���{����{�	@@@@@���{����{�	@���{����{�	@���Р&create��� K���� K��@���$name�����$Info!t��� L�
�� L�@@��� L�
�� L�@@@��@�����4Source_code_position!t��� M�� M,@@��� M�� M,@@@��@�����.Callback_arity!t��� N-<�� N-L@���(callback��� N-2�� N-;@@@@��� N-2�� N-L@@@���	!on_subscription_after_first_write�����	!On_subscription_after_first_write!t�� OMt� OM�@@�� OMt� OM�@@@���1on_callback_raise��@�����%Error!t�� P��� P��@@�� P��� P��@@@����$unit��  P���! P��@@��# P���$ P��@@@��& P���' P��@@@�����*Read_write!t��0 Q���1 Q��@���(callback��7 Q���8 Q��@@@@��: Q���; Q��@@@��= P���> Q��@@@��@ OMR�A Q��@@@��C N-2�D Q��@@@��F M�G Q��@@@��I L��J Q��@@@@���Q��:@@ ��;@@ �A�������
  � In [create [%here] ArityN ~on_subscription_after_first_write ~on_callback_raise],
    [[%here]] is stored in the resulting bus, and contained in [%sexp_of: t], which can
    help with debugging.

    If [on_subscription_after_first_write] is [Raise], then [subscribe_exn] will raise if
    it is called after [write] has been called the first time.  If
    [on_subscription_after_first_write] is [Allow_and_send_last_value], then the bus will
    remember the last value written and will send it to new subscribers.

    If a callback raises, [on_callback_raise] is called with an error containing the
    exception.

    If [on_callback_raise] raises, then the exception is raised to [write] and the bus is
    closed. @��Z}		�[ J��@@@@��]}		�^ J��@@��K@@ ��L@@ �A@��c K���d Q��@��f K���g Q��@���Р.callback_arity��o S���p S��@��@����!t��y S��z S�@���(callback��� S���� S��@@@��@��� S���� S� @@@@��� S���� S�@@@�����.Callback_arity!t��� S��� S�!@���(callback��� S��� S�@@@@��� S��� S�!@@@��� S���� S�!@@@@@��� S���� S�!@��� S���� S�!@���Р/num_subscribers��� T"&�� T"5@��@����!t��� T"?�� T"@@��@��� T"9�� T":@@@��@��� T"<�� T"=@@@@��� T"8�� T"@@@@����#int��� T"D�� T"G@@��� T"D�� T"G@@@��� T"8�� T"G@@@@@��� T""�� T"G@��� T""�� T"G@���Р)is_closed��� UHL�� UHU@��@����!t��� UH_�� UH`@��@��� UHY�� UHZ@@@��@��� UH\�� UH]@@@@��� UHX�� UH`@@@����$bool�� UHd� UHh@@�� UHd� UHh@@@�� UHX� UHh@@@@@��
 UHH� UHh@�� UHH� UHh@���Р%close�� [��� [��@��@�����*Read_write!t��" [���# [��@���(callback��) [���* [��@@@@��, [���- [��@@@����$unit��4 [���5 [��@@��7 [���8 [��@@@��: [���; [��@@@@���B��	+@@ ��	,@@ �A�������
  9 [close] disallows future [write]s -- once [close t] is called, all further calls to
    [write t] will raise.  [close] is idempotent.  If [close] is called from within a
    callback, the current message will still be sent to all subscribed callbacks that
    have not yet seen it before the close takes effect. @��K Wjj�L Zn�@@@@��N Wjj�O Zn�@@��	<@@ ��	=@@ �A@��T [���U [��@��W [���X [��@�����k��	J@@ ��	K@@ �A�������
  7 [write] ... [write4] call all callbacks currently subscribed to the bus, with no
    guarantee on the order in which they will be called.  [write] is non-allocating,
    though the callbacks themselves may allocate.  Calling [writeN t] raises if called
    from within a callback on [t] or when [is_closed t]. @��j ]���k `�@@@@��m ]���n `�@@��	[@@ ��	\@@ �A��s ]���t `�@���Р%write��| b�} b@��@�����*Read_write!t��� b,�� b8@���@��!a��� b �� b"@@@����$unit��� b&�� b*@@��� b&�� b*@@@��� b �� b*@@@@��� b�� b8@@@��@��!a��� b<�� b>@@@����$unit��� bB�� bF@@��� bB�� bF@@@��� b<�� bF@@@��� b�� bF@@@@@��� b�� bF@��� b�� bF@���Р&write2��� cGK�� cGQ@��@�����*Read_write!t��� cGg�� cGs@���@��!a��� cGU�� cGW@@@��@��!b��� cG[�� cG]@@@����$unit��� cGa�� cGe@@��� cGa�� cGe@@@��� cG[�� cGe@@@��� cGU�� cGe@@@@��� cGT�� cGs@@@��@��!a��	 cGw�	 cGy@@@��@��!b��	 cG}�	 cG@@@����$unit��	 cG��	 cG�@@��	 cG��	 cG�@@@��	 cG}�	 cG�@@@��	 cGw�	 cG�@@@��	 cGT�	  cG�@@@@@��	" cGG�	# cG�@��	% cGG�	& cG�@���Р&write3��	. d���	/ d��@��@�����*Read_write!t��	: d���	; d��@���@��!a��	C d���	D d��@@@��@��!b��	K d���	L d��@@@��@��!c��	S d���	T d��@@@����$unit��	[ d���	\ d��@@��	^ d���	_ d��@@@��	a d���	b d��@@@��	d d���	e d��@@@��	g d���	h d��@@@@��	j d���	k d��@@@��@��!a��	r d���	s d��@@@��@��!b��	z d���	{ d��@@@��@��!c��	� d���	� d��@@@����$unit��	� d���	� d��@@��	� d���	� d��@@@��	� d���	� d��@@@��	� d���	� d��@@@��	� d���	� d��@@@��	� d���	� d��@@@@@��	� d���	� d��@��	� d���	� d��@���Р&write4��	� e���	� e��@��@�����*Read_write!t��	� e��	� e�@���@��!a��	� e���	� e��@@@��@��!b��	� e���	� e��@@@��@��!c��	� e���	� e��@@@��@��!d��	� e���	� e��@@@����$unit��	� e���	� e��@@��	� e���	� e��@@@��	� e���	� e��@@@��	� e���	� e��@@@��	� e���	� e��@@@��	� e���	� e��@@@@��	� e���	� e�@@@��@��!a��	� e��	� e�@@@��@��!b��	� e��
  e�@@@��@��!c��
 e��
 e�@@@��@��!d��
 e�#�
 e�%@@@����$unit��
 e�)�
 e�-@@��
 e�)�
 e�-@@@��
 e�#�
 e�-@@@��
  e��
! e�-@@@��
# e��
$ e�-@@@��
& e��
' e�-@@@��
) e���
* e�-@@@@@��
, e���
- e�-@��
/ e���
0 e�-@�����*Subscriber��
8 g/6�
9 g/@@�����A�    �!t��
D hGX�
E hGY@����(callback��
L hGN�
M hGW@@@B@@@A@���(deriving��
S hG]�
T hGe@��������'sexp_of��
_ hGf�
` hGm@��
b hGf�
c hGm@@@@��
e hGf�
f hGm@@��
h hGZ�
i hGn@@��
k hGI�
l hGn@@��
n hGI�
o hGn@�����������	��
| hGI�
} hGn@�������	@��
� hGI�
� hGn@@@@��
� hGI�
� hGn@@��
� hGI�
� hGn@��
� hGI�
� hGn@���Р)sexp_of_t��
� hGX�
� hGY@��@��@��V��
� hGN�
� hGW@@@������				��
� hGN�
� hGW@@��
� hGN�
� hGW@@@��
� hGN�
� hGW@@@��@����v��
� hGX�
� hGY@���t��
� hGN�
� hGW@@@@��
� hGX�
� hGY@@@������	*	)	(��
� hGX�
� hGY@@��
� hGX�
� hGY@@@��
� hGX�
� hGY@@@��
� hGN�
� hGW@@@@@��
� hGI�
� hGn@��
� hGI�
� hGn@@��
� hGI�
� hGn@@��
� hGI�
� hGn@���	��
� hGI�
� hGn@�������	@��
� hGI�
� hGn@@@@��
� hGI�
� hGn@@��
� hGI�
� hGn@@��
� hGI�
� hGn@@��
� g/C�
� ior@@@��
� g//�  ior@�� g//� ior@���Р-subscribe_exn�� |��� |�@���+extract_exn����$bool�� }� }@@�� }� }@@���	"��@@ ��@@ �A�������4 default is [false] @��+ }�, }5@@@@��. }�/ }5@@��@@ ��@@ �A@���1on_callback_raise��@�����%Error!t��A ~6O�B ~6V@@��D ~6O�E ~6V@@@����$unit��L ~6Z�M ~6^@@��O ~6Z�P ~6^@@@��R ~6O�S ~6^@@@���(on_close��@����$unit��` `p�a `t@@��c `p�d `t@@@����$unit��k `x�l `|@@��n `x�o `|@@@��q `p�r `|@@@��@����!t��{ �~��| �~�@���(callback��� �~��� �~�@@@����������$read��� �~��� �~�@@��� �~��� �~�@@@��� �~��� �~�@@@A@��� �~��� �~�@@@@��� �~��� �~�@@@��@�����4Source_code_position!t��� ����� ���@@��� ����� ���@@@���!f��(callback��� ����� ���@@@�����*Subscriber!t��� ����� ���@���(callback��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@��� �~��� ���@@@��� `e�� ���@@@��� ~6;�� ���@@@��� }
�� ���@@@@���	���@@ ���@@ �A�������
  y [subscribe_exn t [%here] ~f] adds the callback [f] to the set of [t]'s subscribers,
    and returns a [Subscriber.t] that can later be used to [unsubscribe].  [[%here]] is
    stored in the [Subscriber.t], and contained in [%sexp_of: Subscriber.t], which can
    help with debugging.  If [subscribe_exn t] is called by a callback in [t], i.e.,
    during [write t], the subscription takes effect for the next [write], but does not
    affect the current [write].  [subscribe_exn] takes amortized constant time.

    If [on_callback_raise] is supplied, then it will be called by [write] whenever [f]
    raises; only if that subsequently raises will [t]'s [on_callback_raise] be called.  If
    [on_callback_raise] is not supplied, then [t]'s [on_callback_raise] will be called
    whenever [f] raises.

    If [on_callback_raise] is supplied and [extract_exn] is set to true, then the error
    passed to the [on_callback_raise] method will contain only the exception raised by [f]
    without any additional information about the bus subscription or backtrace.

    [on_close] is called if you are still subscribed when [Bus.close] is called. @��� ktt�� {��@@@@��� ktt�� {��@@���@@ ���@@ �A@��� |���� ���@��� |���� ���@���Р(iter_exn�� ���� ���@��@����!t�� ���� ���@���(callback�� ���� ���@@@����������$read��  ����! ���@@��# ����$ ���@@@��& ����' ���@@@A@��) ����* ���@@@@��, ����- ���@@@��@�����4Source_code_position!t��8 ����9 ���@@��; ����< ���@@@���!f��(callback��E ����F ���@@@����$unit��M ����N ���@@��P ����Q ���@@@��S ����T ���@@@��V ����W ���@@@��Y ����Z ���@@@@���
a��J@@ ��K@@ �A�������	� [iter_exn t [%here] ~f] is [ignore (subscribe_exn t [%here] ~callback:f)].  This
    captures the common usage in which one never wants to unsubscribe from a bus. @��j ����k �<�@@@@��m ����n �<�@@��[@@ ��\@@ �A@��s ����t ���@��v ����w ���@�����*Fold_arity�� ����� ���@�����A�    �!t��� ��� �@���@��� ��� �@@@B���@��� ��� �@@@B���@��� ��� �@@@B@@��Р&Arity1��� ��� �$@�@�����!t��� �H�� �I@���@��!a��� �(�� �*@@@����$unit��� �.�� �2@@��� �.�� �2@@@��� �(�� �2@@@���@��!s��� �4�� �6@@@��@��!a��� �:�� �<@@@��!s��� �@�� �B@@@��� �:�� �B@@@��� �4�� �B@@@���!s��� �D�� �F@@@@��� �'�� �I@@@��� ��� �I@@�Р&Arity2��� �JP�� �JV@�@�����!t�� �J�� �J�@���@��!a��
 �JZ� �J\@@@��@��!b�� �J`� �Jb@@@����$unit�� �Jf� �Jj@@�� �Jf� �Jj@@@��  �J`�! �Jj@@@��# �JZ�$ �Jj@@@���@��!s��, �Jl�- �Jn@@@��@��!a��4 �Jr�5 �Jt@@@��@��!b��< �Jx�= �Jz@@@��!s��B �J~�C �J�@@@��E �Jx�F �J�@@@��H �Jr�I �J�@@@��K �Jl�L �J�@@@���!s��R �J��S �J�@@@@��U �JY�V �J�@@@��X �JN�Y �J�@@�Р&Arity3��_ ����` ���@�@�����!t��i ����j ���@���@��!a��r ����s ���@@@��@��!b��z ����{ ���@@@��@��!c��� ����� ���@@@����$unit��� ����� ���@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@���@��!s��� ����� ���@@@��@��!a��� ����� ���@@@��@��!b��� ����� ���@@@��@��!c��� ����� ���@@@��!s��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@���!s��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@�Р&Arity4��� ����� ���@�@�����!t��� ��&�� ��'@���@��!a��� ����� ���@@@��@��!b��� ����� ���@@@��@��!c��  ���� ���@@@��@��!d�� ����	 ���@@@����$unit�� ���� ���@@�� ���� ���@@@�� ���� ���@@@�� ���� ���@@@�� ���� ���@@@�� ����  ���@@@���@��!s��( �� �) ��@@@��@��!a��0 ���1 ��@@@��@��!b��8 ���9 ��@@@��@��!c��@ ���A ��@@@��@��!d��H ���I ��@@@��!s��N ���O �� @@@��Q ���R �� @@@��T ���U �� @@@��W ���X �� @@@��Z ���[ �� @@@��] �� �^ �� @@@���!s��d ��"�e ��$@@@@��g ����h ��'@@@��j ����k ��'@@@A@���(deriving��q �(-�r �(5@��������'sexp_of��} �(6�~ �(=@��� �(6�� �(=@@@@��� �(6�� �(=@@��� �(*�� �(>@@��� ��� �(>@@��� ��� �(>@�����������*��� ��� �(>@�������)@��� ��� �(>@@@@��� ��� �(>@@��� ��� �(>@��� ��� �(>@���Р)sexp_of_t��� ��� �@��@��@��)v_x__002_��� ��� �@@@������('&��� ��� �@@��� ��� �@@@��� ��� �@@@��@��@��)v_x__003_��� ��� �@@@������A@?��� ��� �@@��� ��� �@@@��� ��� �@@@��@��@��)v_x__004_��� ��� �@@@������ZYX��� ��� �@@��� ��� �@@@�� �� �@@@��@�������
 �� �@���Q�� �� �@@@���>�� �� �@@@���+�� �� �@@@@�� ��  �@@@�����������( ��) �@@��+ ��, �@@@��. ��/ �@@@��1 ��2 �@@@��4 ��5 �@@@��7 ��8 �@@@@@��: ��; �(>@��= ��> �(>@@��@ ��A �(>@@��C ��D �(>@���i��I ��J �(>@�������h@��S ��T �(>@@@@��V ��W �(>@@��Y ��Z �(>@@��\ ��] �(>@@��_ ����` �?B@@@��b ����c �?B@��e ����f �?B@���Р(fold_exn��n ����o ���@��@����!t��x ���y ��@���(callback�� ����� ���@@@����������$read��� ����� ��@@��� ����� ��@@@��� ����� ��@@@A@��� ����� ��@@@@��� ����� ��@@@��@�����4Source_code_position!t��� ��� �#@@��� ��� �#@@@��@�����*Fold_arity!t��� �$=�� �$I@���(callback��� �$*�� �$3@@@���!f��� �$5�� �$7@@@���!s��� �$9�� �$;@@@@��� �$)�� �$I@@@���$init��!s��� �JT�� �JV@@@���!f��!f��� �W^�� �W`@@@����$unit��� �af�� �aj@@��� �af�� �aj@@@��� �W\�� �aj@@@��� �JO�� �aj@@@��� �$)�� �aj@@@��� ��� �aj@@@��� ����� �aj@@@@������@@ ���@@ �A�������	� [fold_exn t [%here] arity ~init ~f] folds over the bus events, threading a state value
    to every call.  It is otherwise similar to [iter_exn]. @�� �DD� ���@@@@�� �DD� ���@@���@@ ���@@ �A@�� ���� �aj@�� ���� �aj@���Р+unsubscribe��  ����! ���@��@����!t��* ����+ ���@���(callback��1 ����2 ���@@@����������$read��? ����@ ���@@��B ����C ���@@@��E ����F ���@@@A@��H ����I ���@@@@��K ����L ���@@@��@�����*Subscriber!t��W ����X ���@���(callback��^ ����_ ���@@@@��a ����b ���@@@����$unit��i ���j ��@@��l ���m ��@@@��o ����p ��@@@��r ����s ��@@@@���z��c@@ ��d@@ �A�������
  H [unsubscribe t subscriber] removes the callback corresponding to [subscriber] from
    [t].  [unsubscribe] never raises and is idempotent.  As with [subscribe_exn],
    [unsubscribe t] during [write t] takes effect after the current [write] finishes.
    Also like [subscribe_exn], [unsubscribe] takes amortized constant time. @��� �ll�� �k�@@@@��� �ll�� �k�@@��t@@ ��u@@ �A@��� ����� ��@��� ����� ��@@