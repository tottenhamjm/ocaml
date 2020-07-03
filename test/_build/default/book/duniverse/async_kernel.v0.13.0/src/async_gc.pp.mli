Caml1999N026����   6         	4book/duniverse/async_kernel.v0.13.0/src/async_gc.mli����  �  ,  �  -�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������	% Async's analog of [Core_kernel.Gc]. @��	4book/duniverse/async_kernel.v0.13.0/src/async_gc.mliA@@�A@j@@@@��A@@�A@j@@���@@ ���@@ �A��
A@@�A@j@������+Core_kernel��Clr�Cl}@@��Cll�Cl}@@��Cll�Cl}@�������������+Core_kernel"Gc��,H � ��-H � �@��/H � ��0H � �@@��2H � ��3H � �@@����&Expert��:H � ��;H � �@����+Core_kernel"Gc&Expert��DH � ��EH �@@��GH � ��HH �@@��JG � ��KH �@���)ocaml.doc��<@@ ��=@@ �A�������	o We remove the [Expert] module, which has functions that are superseded by
    Async-friendly functions below. @��\E�]F � �@@@@��_E�`F � �@@��M@@ ��N@@ �A@��eG � ��fH �@���Р-add_finalizer��niei�oiev@��@�����*Heap_block!t��zie|�{ie�@���!a���iey��ie{@@@@���iey��ie�@@@��@��@�����*Heap_block!t���ie���ie�@���!a���ie���ie�@@@@���ie���ie�@@@����$unit���ie���ie�@@���ie���ie�@@@���ie���ie�@@@����$unit���ie���ie�@@���ie���ie�@@@���ie���ie�@@@���iey��ie�@@@@���q���@@ ���@@ �A�������
  V [add_finalizer b f] ensures that [f] runs after [b] becomes unreachable.  [f b] will
    run in its own Async job.  If [f] raises, the unhandled exception will be raised to
    the monitor that called [add_finalizer b f].

    The OCaml runtime only supports finalizers on heap blocks, hence [add_finalizer]
    requires [b : _ Heap_block.t].

    The runtime essentially maintains a set of finalizer pairs:

    {[
      'a Heap_block.t * ('a Heap_block.t -> unit)
    ]}

    Each call to [add_finalizer] adds a new pair to the set.  It is allowed for many pairs
    to have the same heap block, the same function, or both.  Each pair is a distinct
    element of the set.

    After a garbage collection determines that a heap block [b] is unreachable, it removes
    from the set of finalizers all finalizer pairs [(b, f)] whose block is [b], and then
    and runs [f b] for all such pairs.  Thus, a finalizer registered with [add_finalizer]
    will run at most once.

    In a finalizer pair [(b, f)], it is a mistake for the closure of [f] to reference
    (directly or indirectly) [b] -- [f] should only access [b] via its argument.
    Referring to [b] in any other way will cause [b] to be kept alive forever, since [f]
    itself is a root of garbage collection, and can itself only be collected after the
    pair [(b, f)] is removed from the set of finalizers.

    The [f] function can use all features of OCaml and Async, since it runs as an ordinary
    Async job.  [f] can even make [b] reachable again.  It can even call [add_finalizer]
    on [b] or other values to register other finalizer functions. @���J		��h d@@@@���J		��h d@@���@@ ���@@ �A@���iee��ie�@���iee��ie�@���Р1add_finalizer_exn���m(,��m(=@��@��!a���m(@��m(B@@@��@��@��!a���m(G��m(I@@@����$unit���m(M��m(Q@@���m(M��m(Q@@@��m(G�m(Q@@@����$unit��	m(V�
m(Z@@��m(V�m(Z@@@��m(F�m(Z@@@��m(@�m(Z@@@@���Ȱ�@@ ��@@ �A�������	s [add_finalizer_exn b f] is like {{!add_finalizer}[add_finalizer]}, but will raise if
    [b] is not a heap block. @��#k���$l'@@@@��&k���'l'@@��@@ ��@@ �A@��,m((�-m(Z@��/m((�0m(Z@���Р2add_finalizer_last��8t	�	��9t	�	�@��@�����*Heap_block!t��Dt	�	��Et	�	�@���!a��Kt	�	��Lt	�	�@@@@��Nt	�	��Ot	�	�@@@��@��@����$unit��Zt	�	��[t	�
@@��]t	�	��^t	�
@@@����$unit��et	�
�ft	�
@@��ht	�
�it	�
@@@��kt	�	��lt	�
@@@����$unit��st	�
�tt	�
@@��vt	�
�wt	�
@@@��yt	�	��zt	�
@@@��|t	�	��}t	�
@@@@���2��m@@ ��n@@ �A�������
  p Same as {{!add_finalizer}[add_finalizer]} except that the function is not called until
    the value has become unreachable for the last time.  This means that the finalization
    function does not receive the value as an argument.  Every weak pointer and ephemeron
    that contained this value as key or data is unset before running the finalization
    function. @���o\\��s	�	�@@@@���o\\��s	�	�@@��~@@ ��@@ �A@���t	�	���t	�
@���t	�	���t	�
@���Р6add_finalizer_last_exn���v

��v

0@��@��!a���v

3��v

5@@@��@��@����$unit���v

:��v

>@@���v

:��v

>@@@����$unit���v

B��v

F@@���v

B��v

F@@@���v

:��v

F@@@����$unit���v

K��v

O@@���v

K��v

O@@@���v

9��v

O@@@���v

3��v

O@@@@@���v

��v

O@���v

��v

O@�����%Alarm���y
�
���y
�
�@�����A�    �!t���z
�
���z
�
�@@@@A@���(deriving���z
�
���z
�
�@��������'sexp_of��z
�
��z
�
�@��	z
�
��
z
�
�@@@@��z
�
��z
�
�@@��z
�
��z
�
�@@��z
�
��z
�
�@@��z
�
��z
�
�@�����������-ocaml.warning��$z
�
��%z
�
�@�������#-32@��/z
�
��0z
�
�@@@@��2z
�
��3z
�
�@@��5z
�
��6z
�
�@��8z
�
��9z
�
�@���Р)sexp_of_t��Az
�
��Bz
�
�@��@����X��Jz
�
��Kz
�
�@@��Mz
�
��Nz
�
�@@@������1Ppx_sexp_conv_lib$Sexp!t��Yz
�
��Zz
�
�@@��\z
�
��]z
�
�@@@��_z
�
��`z
�
�@@@@@��bz
�
��cz
�
�@��ez
�
��fz
�
�@@��hz
�
��iz
�
�@@��kz
�
��lz
�
�@���)ocaml.doc��rz
�
��sz
�
�@�������'@inline@��}z
�
��~z
�
�@@@@���z
�
���z
�
�@@���z
�
���z
�
�@@���z
�
���z
�
�@���Р&create���������@��@��@����$unit���������@@���������@@@����$unit���������@@���������@@@���������@@@����!t���������@@���������@@@���������@@@@���p���@@ ���@@ �A�������	� [create f] arranges for [f] to be called after the end of each major GC cycle,
      starting with the current cycle or the next one.  [f] will be run in the monitor
      that [create] was called in. @���|
�
���~}�@@@@���|
�
���~}�@@���@@ ���@@ �A@���������@���������@���Р&delete��� CCI�� CCO@��@����!t��� CCR�� CCS@@��� CCR�� CCS@@@����$unit��� CCW�� CC[@@��� CCW�� CC[@@@��� CCR�� CC[@@@@�������@@ ���@@ �A�������	t [delete t] will stop the calls to the function associated with [t].  Calling [delete
      t] again has no effect. @�� A��� B"B@@@@�� A��� B"B@@���@@ ���@@ �A@�� CCE� CC[@�� CCE� CC[@@��y
�
�� D\_@@���Ѱ�@@ ��@@ �A�������	H A GC alarm calls a user function after the end of each major GC cycle. @��,x
Q
Q�-x
Q
�@@@@��/x
Q
Q�0x
Q
�@@��@@ ��@@ �A@��5y
�
��6 D\_@��8y
�
��9 D\_@@