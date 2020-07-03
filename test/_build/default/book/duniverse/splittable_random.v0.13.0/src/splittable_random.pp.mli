Caml1999N026����   D         
	Bbook/duniverse/splittable_random.v0.13.0/src/splittable_random.mli����  ,E  �  0  o�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@�������*ocaml.text���@@ ���@@ �A�������
   A splittable pseudo-random number generator (SPRNG) functions like a PRNG in that it
    can be used as a stream of random values; it can also be "split" to produce a second,
    independent stream of random values.

    This module implements a splittable pseudo-random number generator that sacrifices
    cryptographic-quality randomness in favor of performance.

    The primary difference between [Splittable_random] and {!Random} is the [State.split]
    operation for generating new pseudo-random states.  While it is easy to simulate
    [State.split] using [Random], the result has undesirable statistical properties; the
    new state does not behave independently of the original.  It is better to switch to
    [Splittable_random] if you need an operation like [State.split], as this module has
    been implemented with the statistical properties of splitting in mind.  For most other
    purposes, [Random] is likely a better choice, as its implementation passes all Diehard
    tests, while [Splittable_random] fails some Diehard tests.
@��	Bbook/duniverse/splittable_random.v0.13.0/src/splittable_random.mliA@@�P "@@@@��A@@�P "@@���@@ ���@@ �A��
A@@�P "@������$Base��R$*�R$.@@��R$$�R$.@@��R$$�R$.@�����%State��#T07�$T0<@�����A�    �!t��/UCJ�0UCK@@@@A@@��2UCE�3UCK@@��5UCE�6UCK@���Р&create��>_Y_�?_Ye@��@������&Random%State!t��L_Yh�M_Yv@@��O_Yh�P_Yv@@@����!t��W_Yz�X_Y{@@��Z_Yz�[_Y{@@@��]_Yh�^_Y{@@@@���)ocaml.doc���@@ �� @@ �A�������
   Create a new [t] seeded from the given random state. This allows nondeterministic
      initialization, for example in the case that the input state was created using
      [Random.State.make_self_init].

      Constructors like [create] and [of_int] should be called once at the start of a
      randomized computation and the resulting state should be threaded through.
      Repeatedly creating splittable random states from seeds in the middle of computation
      can defeat the SPRNG's splittable properties. @��oWMO�p^"X@@@@��rWMO�s^"X@@��@@ ��@@ �A@��x_Y[�y_Y{@��{_Y[�|_Y{@���Р&of_int���c����c��@��@����#int���c����c��@@���c����c��@@@����!t���c���c�@@���c���c�@@@���c����c�@@@@���B��@@@ ��A@@ �A�������	g Create a new [t] that will return identical results to any other [t] created with
      that integer. @���a}��b��@@@@���a}��b��@@��Q@@ ��R@@ �A@���c����c�@���c����c�@���Р'perturb���fBH��fBO@��@����!t���fBR��fBS@@���fBR��fBS@@@��@����#int���fBW��fBZ@@���fBW��fBZ@@@����$unit���fB^��fBb@@���fB^��fBb@@@���fBW��fBb@@@���fBR��fBb@@@@�������@@ ���@@ �A�������	5 [perturb t salt] adds the entropy of [salt] to [t]. @��e�eA@@@@��e�eA@@���@@ ���@@ �A@��
fBD�fBb@��fBD�fBb@���Р$copy��i���i��@��@����!t�� i���!i��@@��#i���$i��@@@����!t��+i���,i��@@��.i���/i��@@@��1i���2i��@@@@���԰��@@ ���@@ �A�������	G Create a copy of [t] that will return the same random samples as [t]. @��Bhdf�Chd�@@@@��Ehdf�Fhd�@@���@@ ���@@ �A@��Ki���Li��@��Ni���Oi��@���Р%split��Wn���Xn��@��@����!t��an���bn��@@��dn���en��@@@����!t��ln���mn��@@��on���pn��@@@��rn���sn��@@@@�����@@ ��@@ �A�������	� [split t] produces a new state that behaves deterministically (i.e. only depending
      on the state of [t]), but pseudo-independently from [t]. This operation mutates
      [t], i.e., [t] will return different values than if this hadn't been called. @���k����mx�@@@@���k����mx�@@��$@@ ��%@@ �A@���n����n��@���n����n��@@���T0?��o��@@@���T00��o��@���T00��o��@���Р$bool���r		��r		@��@�����%State!t���r		��r		"@@���r		��r		"@@@����$bool���r		&��r		*@@���r		&��r		*@@@���r		��r		*@@@@���a��_@@ ��`@@ �A�������	" Produces a random, fair boolean. @���q����q�	@@@@���q����q�	@@��p@@ ��q@@ �A@���r		��r		*@���r		��r		*@���Р#int���v	�	���v	�	�@��@�����%State!t���v	�	���v	�	�@@���v	�	���v	�	�@@@���"lo����#int���v	�	�� v	�	�@@��v	�	��v	�	�@@@���"hi����#int��v	�
�v	�

@@��v	�
�v	�

@@@����#int��v	�
�v	�
@@��v	�
�v	�
@@@��v	�
� v	�
@@@��"v	�	��#v	�
@@@��%v	�	��&v	�
@@@@���Ȱ��@@ ���@@ �A�������	� Produce a random number uniformly distributed in the given inclusive range.  (In the
    case of [float], [hi] may or may not be attainable, depending on rounding.)  @��6t	,	,�7u	�	�@@@@��9t	,	,�:u	�	�@@���@@ ���@@ �A@��?v	�	��@v	�
@��Bv	�	��Cv	�
@���Р%int32��Kw

�Lw

!@��@�����%State!t��Ww

(�Xw

/@@��Zw

(�[w

/@@@���"lo����%int32��fw

6�gw

;@@��iw

6�jw

;@@@���"hi����%int32��uw

F�vw

K@@��xw

F�yw

K@@@����%int32���w

S��w

X@@���w

S��w

X@@@���w

C��w

X@@@���w

3��w

X@@@���w

(��w

X@@@@@���w

��w

X@���w

��w

X@���Р%int63���x
Y
]��x
Y
b@��@�����%State!t���x
Y
i��x
Y
p@@���x
Y
i��x
Y
p@@@���"lo�����%Int63!t���x
Y
w��x
Y
~@@���x
Y
w��x
Y
~@@@���"hi�����%Int63!t���x
Y
���x
Y
�@@���x
Y
���x
Y
�@@@�����%Int63!t���x
Y
���x
Y
�@@���x
Y
���x
Y
�@@@���x
Y
���x
Y
�@@@���x
Y
t��x
Y
�@@@���x
Y
i��x
Y
�@@@@@���x
Y
Y��x
Y
�@���x
Y
Y��x
Y
�@���Р%int64���y
�
���y
�
�@��@�����%State!t���y
�
���y
�
�@@�� y
�
��y
�
�@@@���"lo����%int64��y
�
��y
�
�@@��y
�
��y
�
�@@@���"hi����%int64��y
�
��y
�
�@@��y
�
��y
�
�@@@����%int64��&y
�
��'y
�
�@@��)y
�
��*y
�
�@@@��,y
�
��-y
�
�@@@��/y
�
��0y
�
�@@@��2y
�
��3y
�
�@@@@@��5y
�
��6y
�
�@��8y
�
��9y
�
�@���Р)nativeint��Az
�
��Bz
�
�@��@�����%State!t��Mz
�
��Nz
�
�@@��Pz
�
��Qz
�
�@@@���"lo����)nativeint��\z
�
��]z
�@@��_z
�
��`z
�@@@���"hi����)nativeint��kz
��lz
�@@��nz
��oz
�@@@����)nativeint��vz
��wz
�!@@��yz
��zz
�!@@@��|z
��}z
�!@@@��z
�
���z
�!@@@���z
�
���z
�!@@@@@���z
�
���z
�!@���z
�
���z
�!@���Р%float���{"&��{"+@��@�����%State!t���{"2��{"9@@���{"2��{"9@@@���"lo����%float���{"@��{"E@@���{"@��{"E@@@���"hi����%float���{"P��{"U@@���{"P��{"U@@@����%float���{"]��{"b@@���{"]��{"b@@@���{"M��{"b@@@���{"=��{"b@@@���{"2��{"b@@@@@���{""��{"b@���{""��{"b@���Р*unit_float���������@��@�����%State!t���������@@���������@@@����%float���������@@���������@@@���������@@@@�������@@ ���@@ �A�������	t [unit_float state = float state ~lo:0. ~hi:1.], but slightly more efficient (and
    right endpoint is exclusive). @��}dd�~��@@@@��}dd�~��@@���@@ ���@@ �A@�������@�������@�����+Log_uniform��$ A�% A@�����Р#int��/ I���0 I��@��@�����%State!t��; I���< I��@@��> I���? I��@@@���"lo����#int��J I���K I��@@��M I���N I��@@@���"hi����#int��Y I���Z I��@@��\ I���] I��@@@����#int��d I���e I��@@��g I���h I��@@@��j I���k I��@@@��m I���n I��@@@��p I���q I��@@@@�����@@ ��@@ �A�������
  � Produce a random number in the given inclusive range, where the number of bits in
      the representation is chosen uniformly based on the given range, and then the value
      is chosen uniformly within the range restricted to the chosen bit width. Raises if
      [lo < 0 || hi < lo].

      These functions are useful for choosing numbers that are weighted low within a given
      range. @��� B�� H��@@@@��� B�� H��@@��"@@ ��#@@ �A@��� I���� I��@��� I���� I��@���Р%int32��� J���� J��@��@�����%State!t��� J���� J�@@��� J���� J�@@@���"lo����%int32��� J��� J�@@��� J��� J�@@@���"hi����%int32��� J��� J�"@@��� J��� J�"@@@����%int32��� J�*�� J�/@@��� J�*�� J�/@@@��� J��� J�/@@@��� J�
�� J�/@@@��� J���� J�/@@@@@��� J���� J�/@��� J���� J�/@���Р%int63��� K06�� K0;@��@�����%State!t��� K0B�� K0I@@��� K0B�� K0I@@@���"lo�����%Int63!t�� K0P� K0W@@�� K0P� K0W@@@���"hi�����%Int63!t�� K0`� K0g@@�� K0`� K0g@@@�����%Int63!t��! K0m�" K0t@@��$ K0m�% K0t@@@��' K0]�( K0t@@@��* K0M�+ K0t@@@��- K0B�. K0t@@@@@��0 K02�1 K0t@��3 K02�4 K0t@���Р%int64��< Lu{�= Lu�@��@�����%State!t��H Lu��I Lu�@@��K Lu��L Lu�@@@���"lo����%int64��W Lu��X Lu�@@��Z Lu��[ Lu�@@@���"hi����%int64��f Lu��g Lu�@@��i Lu��j Lu�@@@����%int64��q Lu��r Lu�@@��t Lu��u Lu�@@@��w Lu��x Lu�@@@��z Lu��{ Lu�@@@��} Lu��~ Lu�@@@@@��� Luw�� Lu�@��� Luw�� Lu�@���Р)nativeint��� M���� M��@��@�����%State!t��� M���� M��@@��� M���� M��@@@���"lo����)nativeint��� M���� M��@@��� M���� M��@@@���"hi����)nativeint��� M���� M��@@��� M���� M��@@@����)nativeint��� M���� M��@@��� M���� M��@@@��� M���� M��@@@��� M���� M��@@@��� M���� M��@@@@@��� M���� M��@��� M���� M��@@��� A�� N�@@@��� A�� N�@��� A�� N�@@