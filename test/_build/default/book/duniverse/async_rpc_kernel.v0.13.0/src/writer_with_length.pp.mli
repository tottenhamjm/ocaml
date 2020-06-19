Caml1999N026����   D         
	Bbook/duniverse/async_rpc_kernel.v0.13.0/src/writer_with_length.mli����  �  ~  �  ڠ����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  * A hack to make the bin-prot representation of things look as though they are
    packed into bigstrings, for backwards compatibility.

    The original version of the protocol used bigstrings to hide away user-defined types.
    The bin-prot representation of a record with such a bigstring in it looks like

    {v
      {field1|field2|...|{length|content}}
    v}

    where the content is the bin-prot representation of the value being written, and the
    length is that content's length.  This writer writes data in the same format without
    using an intermediate bigstring by first calculating the size of the content, then
    writing that as a Nat0 before writing the actual content.

    When reading, we use the fact that the length can be interpreted as a bin-prot encoded
    Nat0.  The grouping is changed from:

    {v
      {field1|field2|...|{length|content}}
    v}

    (only one bin-prot read) to:

    {v
      {field1|field2|...|length}|{content}
    v}

    (two bin-prot reads).

    If the last field is a variant type, there will be a variant tag before the length,
    but the exact same change of grouping will work.

    Note that this only works when the bigstrings are in the last field of a record (or a
    variant in the last field of a record).  It's easy to verify that this is true.
@��	Bbook/duniverse/async_rpc_kernel.v0.13.0/src/writer_with_length.mliA@@�d-/@@@@��A@@�d-/@@���@@ ���@@ �A��
A@@�d-/@���Р)of_writer��f15�f1>@��@������(Bin_prot*Type_class&writer��!f1H�"f1b@���!a��(f1E�)f1G@@@@��+f1E�,f1b@@@������(Bin_prot*Type_class&writer��7f1i�8f1�@���!a��>f1f�?f1h@@@@��Af1f�Bf1�@@@��Df1E�Ef1�@@@@@��Gf11�Hf1�@��Jf11�Kf1�@���Р-of_type_class��Sg���Tg��@��@������(Bin_prot*Type_class!t��ag���bg��@���!a��hg���ig��@@@@��kg���lg��@@@������(Bin_prot*Type_class&writer��wg���xg��@���!a��~g���g��@@@@���g����g��@@@���g����g��@@@@@���g����g��@���g����g��@@