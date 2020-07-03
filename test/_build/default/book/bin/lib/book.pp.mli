Caml1999N026����            5book/bin/lib/book.mli����  ;    %  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ�����$Core��5book/bin/lib/book.mliF ��F �@@��F � ��F �@���)ocaml.doc���@@ ���@@ �A�������	� Book processing. The book's files are in HTMLBook format with some
    custom variations, e.g. we support <link rel="import"> nodes to
    enable inclusion of code blocks in external files. This module
    supports the processing of these files.
@��A@@�E � �@@@@��A@@�E � �@@���@@ ���@@ �A@��F � �� F �@������%Async��)G�*G@A��,G�-G@@��/G�0G@���A�    �#src��9Q49�:Q4<@@@@A�������'Chapter��DRAC�ERAK@@�����&string��MRAO�NRAU@@��PRAO�QRAU@@@@��SRAC�TRAU@@����)Frontpage��[SVX�\SVb@A@��^SVX�_SVb@@����(Toc_page��fTce�gTcn@A@��iTce�jTcn@@����$FAQs��qUoq�rUov@A@��tUoq�uUov@@����'Install��|Vwy�}Vw�@A@��Vwy��Vw�@@����%Latex���W����W��@A@���W����W��@@@@@���Q4?��X��@@@������t@@ ��u@@ �A�������
   Source from which to build an HTML page.

    - [`Chapter file] - The file for a chapter. Path must be relative
    to current working directory.

    - [`Frontpage] - No other information needed. We generate the
    whole page programmatically. Output file is named "index.html".
@���I��P13@@@@���I��P13@@���@@ ���@@ �A@���Q44��X��@@���Q44��X��@���Р$make���[����[��@���)repo_root����&string���\����\��@@���\����\��@@@���'out_dir����&string���]���]�	@@���]���]�	@@@��@����#src���^
��^
@@���^
��^
@@@�����(Deferred!t���_��_'@�����$unit���_��_@@���_��_@@@@���_��_'@@@���^
��_'@@@���]����_'@@@�� \���_'@@@@�������@@ ���@@ �A�������	B Make an HTML page from the given [src] and save it to [out_dir]. @��Z���Z��@@@@��Z���Z��@@���@@ ���@@ �A@��[���_'@��[���_'@@