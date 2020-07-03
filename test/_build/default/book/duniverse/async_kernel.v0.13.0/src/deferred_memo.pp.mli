Caml1999N026����   ;         		9book/duniverse/async_kernel.v0.13.0/src/deferred_memo.mli����  p  ?  	@  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������	� Memoization functions like in [Core_kernel.Memo], with re-raising of exceptions
    thrown asynchronously.

    Also see [Lazy_deferred], of which [Deferred.Memo.unit] is a special case. @��	9book/duniverse/async_kernel.v0.13.0/src/deferred_memo.mliA@@�D p �@@@@��A@@�D p �@@���@@ ���@@ �A��
A@@�D p �@������+Core_kernel��F � ��F � �@@��F � ��F � �@@��F � ��F � �@������&Import��$G � ��%G � �@@��'G � ��(G � �@@��*G � ��+G � �@�����(Deferred��3H � ��4H � �@����)Deferred1��;H � ��<H � �@��>H � ��?H � �@@@��AH � ��BH � �@��DH � ��EH � �@���Р'general��MU���NU��@��@������(Hashable'S_plain��ZV���[V��@����!t��bV���cV��@��!a��hV���iV��@@@@��kV���lV��@���oV���pV��@@@��@��@��!a��yW���zW��@@@�����(Deferred!t���W����W�@���!b���W����W��@@@@���W����W�@@@���W����W�@@@�����&Staged!t���X��X&@���@��!a���X	��X@@@�����(Deferred!t���X��X@���!b���X��X@@@@���X��X@@@���X	��X@@@@���X��X&@@@���W����X&@@@���V����X&@@@@���)ocaml.doc���@@ ���@@ �A�������
  � [general hashable f] returns a memoized version of [f], where the results are stored
    in a hash table indexed according to [hashable].  If [f a] asynchronously raises, then
    the error is stored in the hash table and is reraised when [a] is demanded.

    Unlike [Core_kernel.Memo.general], this [general] does not support
    [cache_size_bound] due to complexities of asynchrony -- even when one has a deferred
    return by the memoized function, there still may be asynchronous jobs working to
    determine it.

    Unlike [Core_kernel.Memo.general], this [general] takes a required [Hashable]
    module argument, to avoid unintentional use of polymorphic comparison. @���J � ���T^�@@@@���J � ���T^�@@���@@ ���@@ �A@���U����X&@���U����X&@���Р$unit���Z(,��Z(0@��@��@����$unit���Z(4��Z(8@@���Z(4��Z(8@@@�����(Deferred!t��Z(?�Z(I@���!a��
Z(<�Z(>@@@@��Z(<�Z(I@@@��Z(4�Z(I@@@�����&Staged!t��Z(f�Z(n@���@����$unit��%Z(O�&Z(S@@��(Z(O�)Z(S@@@�����(Deferred!t��2Z(Z�3Z(d@���!a��9Z(W�:Z(Y@@@@��<Z(W�=Z(d@@@��?Z(O�@Z(d@@@@��BZ(N�CZ(n@@@��EZ(3�FZ(n@@@@@��HZ((�IZ(n@��KZ((�LZ(n@@