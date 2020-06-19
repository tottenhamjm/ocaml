Caml1999N026����   ;         		9book/duniverse/core.v0.13.0/nano_mutex/src/nano_mutex.mli����  $<  �  �  �����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  
] A nano-mutex is a lightweight mutex that can be used only within a single OCaml
    runtime.

    {2 Performance}

    Nano-mutexes are intended to be significantly cheaper than OS-level mutexes.  Creating
    a nano-mutex allocates a single OCaml record.  Locking and unlocking an uncontested
    nano-mutex each take a handful of instructions.  Only if a nano-mutex is contested
    will it fall back to using an OS-level mutex.  If a nano-mutex becomes uncontested
    again, it will switch back to using an OCaml-only lock.

    Nano-mutexes can be faster than using OS-level mutexes because OCaml uses a global
    lock on the runtime, and requires all running OCaml code to hold the lock.  The OCaml
    compiler only allows thread switches at certain points, and we can use that fact to
    get the atomic test-and-set used in the core of our implementation without needing any
    primitive locking, essentially because we're protected by the OCaml global lock.

    Here are some benchmarks comparing various mutexes available in OCaml:

    {v
      |-------------------------------------------------------------|
      |                       Name | Run time | S. dev. | Allocated |
      |----------------------------+----------+---------+-----------+
      |          Caml.Mutex create |   247 ns |    0 ns |         3 |
      |     Caml.Mutex lock/unlock |    49 ns |    0 ns |         0 |
      |          Core.Mutex create |   698 ns |    0 ns |         3 |
      |     Core.Mutex lock/unlock |    49 ns |    0 ns |         0 |
      |          Nano_mutex create |    10 ns |    0 ns |         4 |
      |     Nano_mutex lock/unlock |    28 ns |    0 ns |         0 |
      |-------------------------------------------------------------|
    v}

    The benchmark code is in core/extended/lib_test/bench_nano_mutex.ml.

    {2 Error handling}

    For any mutex, there are design choices as to how to behave in certain situations:

    - recursive locking (when a thread locks a mutex it already has)
    - unlocking an unlocked mutex
    - unlocking a mutex held by another thread

    Here is a table comparing how the various mutexes behave:

    {v
      |--------------------+------------+------------+------------+
      |                    | Caml.Mutex | Core.Mutex | Nano_mutex |
      |--------------------+------------+------------+------------+
      | recursive lock     | undefined  | error      | error      |
      | unlocking unlocked | undefined  | error      | error      |
      | t1:lock  t2:unlock | undefined  | error      | error      |
      |--------------------+------------+------------+------------+
    v}
@��	9book/duniverse/core.v0.13.0/nano_mutex/src/nano_mutex.mliA@@�v
`
b@@@@��A@@�v
`
b@@���@@ ���@@ �A��
A@@�v
`
b@������+Core_kernel��x
d
j�x
d
u@@��x
d
d�x
d
u@@��x
d
d�x
d
u@������&Import��$y
v
|�%y
v
�@@��'y
v
v�(y
v
�@@��*y
v
v�+y
v
�@���A�    �!t��4{
�
��5{
�
�@@@@A@���(deriving��;{
�
��<{
�
�@��������'sexp_of��G{
�
��H{
�
�@��J{
�
��K{
�
�@@@@��M{
�
��N{
�
�@@��P{
�
��Q{
�
�@@��S{
�
��T{
�
�@@��V{
�
��W{
�
�@�����������-ocaml.warning��e{
�
��f{
�
�@�������#-32@��p{
�
��q{
�
�@@@@��s{
�
��t{
�
�@@��v{
�
��w{
�
�@��y{
�
��z{
�
�@���Р)sexp_of_t���{
�
���{
�
�@��@����X���{
�
���{
�
�@@���{
�
���{
�
�@@@������1Ppx_sexp_conv_lib$Sexp!t���{
�
���{
�
�@@���{
�
���{
�
�@@@���{
�
���{
�
�@@@@@���{
�
���{
�
�@���{
�
���{
�
�@@���{
�
���{
�
�@@���{
�
���{
�
�@���)ocaml.doc���{
�
���{
�
�@�������'@inline@���{
�
���{
�
�@@@@���{
�
���{
�
�@@���{
�
���{
�
�@@���{
�
���{
�
�@���Р)invariant���}
�
���}
�
�@��@����!t���}
�
���}
�
�@@���}
�
���}
�
�@@@����$unit���}
�
���}
�
�@@���}
�
���}
�
�@@@���}
�
���}
�
�@@@@@���}
�
���}
�
�@���}
�
���}
�
�@���Р&create��� @
�
��� @
�
�@��@����$unit�� @
�
�� @
�
�@@�� @
�
�� @
�
�@@@����!t�� @
�� @
�@@�� @
�� @
�@@@�� @
�
�� @
�@@@@���)ocaml.doc��@@ ��@@ �A�������	, [create ()] returns a new, unlocked mutex. @��'
�
��(
�
�@@@@��*
�
��+
�
�@@��@@ ��@@ �A@��0 @
�
��1 @
�@��3 @
�
��4 @
�@���Р%equal��< C%)�= C%.@��@����!t��F C%1�G C%2@@��I C%1�J C%2@@@��@����!t��S C%6�T C%7@@��V C%6�W C%7@@@����$bool��^ C%;�_ C%?@@��a C%;�b C%?@@@��d C%6�e C%?@@@��g C%1�h C%?@@@@���R��X@@ ��Y@@ �A�������9 [equal] is [phys_equal] @��x B�y B$@@@@��{ B�| B$@@��i@@ ��j@@ �A@��� C%%�� C%?@��� C%%�� C%?@���Р7current_thread_has_lock��� F���� F��@��@����!t��� F���� F��@@��� F���� F��@@@����$bool��� F���� F��@@��� F���� F��@@@��� F���� F��@@@@�������@@ ���@@ �A�������	S [current_thread_has_lock t] returns [true] iff the current thread has [t] locked. @��� EAA�� EA�@@@@��� EAA�� EA�@@���@@ ���@@ �A@��� F���� F��@��� F���� F��@���Р$lock��� JZ^�� JZb@��@����!t��� JZe�� JZf@@��� JZe�� JZf@@@�����(Or_error!t��� JZo�� JZy@�����$unit��� JZj�� JZn@@��� JZj�� JZn@@@@��� JZj�� JZy@@@��� JZe�� JZy@@@@������@@ ���@@ �A�������	� [lock t] locks the mutex [t], blocking until it can be locked.  [lock] immediately
    returns [Error] if the current thread already holds [t]. @�� H���	 IY@@@@�� H��� IY@@���@@ ���@@ �A@�� JZZ� JZy@�� JZZ� JZy@���Р(lock_exn�� L{� L{�@��@����!t��' L{��( L{�@@��* L{��+ L{�@@@����$unit��2 L{��3 L{�@@��5 L{��6 L{�@@@��8 L{��9 L{�@@@@@��; L{{�< L{�@��> L{{�? L{�@���Р(try_lock��G Qgk�H Qgs@��@����!t��Q Qgv�R Qgw@@��T Qgv�U Qgw@@@�����(Or_error!t��^ Qg��_ Qg�@�������(Acquired��i Qg}�j Qg�@A@��l Qg}�m Qg�@@����,Not_acquired��t Qg��u Qg�@A@��w Qg��x Qg�@@@@@��z Qg{�{ Qg�@@@@��} Qg{�~ Qg�@@@��� Qgv�� Qg�@@@@���k��q@@ ��r@@ �A�������	� [try_lock t] locks [t] if it can immediately do so.  The result indicates whether
    [try_lock] succeeded in acquiring the lock.  [try_lock] returns [Error] if the current
    thread already holds [t]. @��� N���� PFf@@@@��� N���� PFf@@���@@ ���@@ �A@��� Qgg�� Qg�@��� Qgg�� Qg�@���Р,try_lock_exn��� S���� S��@��@����!t��� S���� S��@@��� S���� S��@@@������(Acquired��� S���� S��@A@��� S���� S��@@����,Not_acquired��� S���� S��@A@��� S���� S��@@@@@��� S���� S��@@@��� S���� S��@@@@@��� S���� S��@��� S���� S��@���Р&unlock��� Whl�� Whr@��@����!t��� Whu�� Whv@@��� Whu�� Whv@@@�����(Or_error!t��� Wh�� Wh�@�����$unit��  Whz� Wh~@@�� Whz� Wh~@@@@�� Whz� Wh�@@@��	 Whu�
 Wh�@@@@�������@@ ���@@ �A�������	� [unlock t] unlocks [t], if the current thread holds it.  [unlock] returns [Error] if
    the lock is not held by the calling thread. @�� U��� V5g@@@@�� U��� V5g@@��@@ ��@@ �A@��# Whh�$ Wh�@��& Whh�' Wh�@���Р*unlock_exn��/ Y���0 Y��@��@����!t��9 Y���: Y��@@��< Y���= Y��@@@����$unit��D Y���E Y��@@��G Y���H Y��@@@��J Y���K Y��@@@@@��M Y���N Y��@��P Y���Q Y��@���Р0critical_section��Y Z���Z Z��@��@����!t��c Z���d Z��@@��f Z���g Z��@@@���!f��@����$unit��t Z���u Z��@@��w Z���x Z��@@@��!a��} Z���~ Z��@@@��� Z���� Z��@@@��!a��� Z���� Z��@@@��� Z���� Z��@@@��� Z���� Z��@@@@@��� Z���� Z��@��� Z���� Z��@@