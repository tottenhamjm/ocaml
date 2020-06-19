Caml1999N026����   N         	Lbook/duniverse/ppx_module_timer.v0.13.0/runtime/ppx_module_timer_runtime.mli����  �  �  �  1�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@��������$Base��	Lbook/duniverse/ppx_module_timer.v0.13.0/runtime/ppx_module_timer_runtime.mliA@F�A@J@@��A@@�A@J@@��A@@�A@J@���Р,am_recording��E � ��E � �@����$bool��E � ��E � �@@��E � ��E � �@@@@���)ocaml.doc���@@ ���@@ �A�������	� If true, ppx_module_timer records module startup times and reports them on stdout at
    process exit. Controlled by [am_recording_environment_variable]. @��-CLL�.D e �@@@@��0CLL�1D e �@@���@@ ���@@ �A@��6E � ��7E � �@��9E � ��:E � �@���Р	!am_recording_environment_variable��BU���CU��@����&string��JU���KU��@@��MU���NU��@@@@���2���@@ ���@@ �A�������
  � If this environment variable is set (to anything) when this module starts up,
    [am_recording] is set to true.

    Equal to "PPX_MODULE_TIMER".

    If this is set to a valid duration string (see [Duration.format] below), that duration
    is used to override recorded times for each module. This is used to make test output
    deterministic.

    If this is set to "FAKE_MODULES", the entire set of recorded data is overridden with
    fake values. This is used to make test output both deterministic and stable, so that
    changes in external library dependencies do not affect it. The fake data is not
    particularly sensible, for example we are not careful to make the times for
    definitions add up to the time for the enclosing module. @��^G � ��_T|�@@@@��aG � ��bT|�@@���@@ ���@@ �A@��gU���hU��@��jU���kU��@�����(Duration��sW���tW��@�����A�    �!t��X	��X
@@@@A@@���X��X
@@���X��X
@���Р.to_nanoseconds���Z��Z @��@����!t���Z#��Z$@@���Z#��Z$@@@�����%Int63!t���Z(��Z/@@���Z(��Z/@@@���Z#��Z/@@@@@���Z��Z/@���Z��Z/@���Р.of_nanoseconds���[06��[0D@��@�����%Int63!t���[0G��[0N@@���[0G��[0N@@@����!t���[0R��[0S@@���[0R��[0S@@@���[0G��[0S@@@@@���[02��[0S@���[02��[0S@�����&Format���]Uc��]Ui@������Р)of_string���^px��^p�@��@����&string���^p���^p�@@���^p�� ^p�@@@����!t��^p��^p�@@��
^p��^p�@@@��^p��^p�@@@@@��^pt�^p�@��^pt�^p�@���Р8to_string_with_same_unit��_���_��@��@����$list��&_���'_��@�����!t��/_���0_��@@��2_���3_��@@@@��5_���6_��@@@����$list��=_���>_��@�����&string��F_���G_��@@��I_���J_��@@@@��L_���M_��@@@��O_���P_��@@@@@��R_���S_��@��U_���V_��@@��X]Ul�Y`��@@@��[]UW�\`��@��^]UW�_`��@���Р&format��gg	�hg	@����#ref��og	(�pg	+@������&Format��yg	 �zg	&@@��|g	�}g	'@����g	 ��g	&@@@@���g	��g	+@@@@���h��@@ ��@@ �A�������
  1 Determines the format of durations when reading [am_recording_environment_variable]
      and when printing results. Defaults to integer nanoseconds with a "ns" suffix.

      [Core_kernel.Time_ns] overrides this to use [Time_ns.Span.to_string] on input and
      [Time_ns.Span.to_string_hum] on output. @���b����f�@@@@���b����f�@@��+@@ ��,@@ �A@���g	��g	+@���g	��g	+@@���W����h,/@@@���W����h,/@���W����h,/@�����*ocaml.text��C@@ ��D@@ �A�������"/*@���j11��j18@@@@���j11��j18@@��T@@ ��U@@ �A���j11��j18@�������_@@ ��`@@ �A�������	T {2 For Rewritten Code}

    These definitions are not meant to be called manually. @���l::��nV�@@@@���l::��nV�@@��p@@ ��q@@ �A���l::��nV�@���Р,record_start���r+/��r+;@��@����&string���r+>��r+D@@���r+>��r+D@@@����$unit�� r+H�r+L@@��r+H�r+L@@@��r+>�r+L@@@@������@@ ���@@ �A�������	� If [am_recording], records when the specified module begins its startup effects.
    Raises if a previous module started and has not finished. @��p���q�*@@@@��p���q�*@@���@@ ���@@ �A@�� r++�!r+L@��#r++�$r+L@���Р,record_until��,v���-v��@��@����&string��6v���7v��@@��9v���:v��@@@����$unit��Av���Bv��@@��Dv���Ev��@@@��Gv���Hv��@@@@���,���@@ ���@@ �A�������	� If [am_recording], records when the specified module finishes its startup effects.
    Raises if there is no corresponding start time. @��XtNN�Yu��@@@@��[tNN�\u��@@���@@ ���@@ �A@��av���bv��@��dv���ev��@���Р7record_definition_start��m{���n{��@��@����&string��w{���x{�	@@��z{���{{�	@@@����$unit���{�	��{�	@@���{�	��{�	@@@���{����{�	@@@@���m��@@ �� @@ �A�������	� If [am_recording], records when the specified definition begins its startup effects.
    Raises if a previous definition started and has not finished, or if it is not called
    during startup of an enclosing module. @���x����z��@@@@���x����z��@@��0@@ ��1@@ �A@���{����{�	@���{����{�	@���Р7record_definition_until��� @	�	��� @	�	�@��@����&string��� @	�	��� @	�
@@��� @	�	��� @	�
@@@����$unit��� @	�
	�� @	�
@@��� @	�
	�� @	�
@@@��� @	�	��� @	�
@@@@������`@@ ��a@@ �A�������	� If [am_recording], records when the specified definition finishes its startup effects.
    Raises if there is no corresponding start time, or if it is not called during startup
    of an enclosing module. @���}		��	�	�@@@@���}		��	�	�@@��q@@ ��r@@ �A@��� @	�	��� @	�
@��� @	�	��� @	�
@���Р*__MODULE__��� C
<
E�� C
<
O@����&string��� C
<
R�� C
<
X@@��� C
<
R�� C
<
X@@@�+%loc_MODULE@������@@ ���@@ �A�������	' Duplicate of [Pervasives.__MODULE__]. @�� B

� B

;@@@@�� B

� B

;@@���@@ ���@@ �A@�� C
<
<� C
<
h@�� C
<
<� C
<
h@@