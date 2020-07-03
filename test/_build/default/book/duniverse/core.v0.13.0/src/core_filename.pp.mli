Caml1999N026����   3         	1book/duniverse/core.v0.13.0/src/core_filename.mli����  l  �  �  ���1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������	? Warning! this library assumes we are in a POSIX compliant OS. @��	1book/duniverse/core.v0.13.0/src/core_filename.mliA@@�A@ D@@@@��A@@�A@ D@@���@@ ���@@ �A��
A@@�A@ D@������&Import��C F L�C F R@@��C F F�C F R@@��C F F�C F R@�����������+Core_kernel(Filename��*E T k�+E T @��-E T k�.E T @@��0E T \�1E T @@��3E T T�4E T @@��6E T T�7E T @���Р(realpath��?I � ��@I � �@��@����&string��II � ��JI �@@��LI � ��MI �@@@����&string��TI �	�UI �@@��WI �	�XI �@@@��ZI � ��[I �@@@@���)ocaml.doc��L@@ ��M@@ �A�������	i [realpath path] @return the canonicalized absolute pathname of [path].
    @raise Unix_error on errors. @��lG � ��mH � �@@@@��oG � ��pH � �@@��]@@ ��^@@ �A@��uI � ��vI �@��xI � ��yI �@���Р.open_temp_file���Pcg��Pcu@���$perm����#int���Qv���Qv�@@���Qv���Qv�@@@���&in_dir����&string���Qv���Qv�@@���Qv���Qv�@@@��@����&string���Qv���Qv�@@���Qv���Qv�@@@��@����&string���Qv���Qv�@@���Qv���Qv�@@@�������&string���Qv���Qv�@@���Qv���Qv�@@@������+Out_channel!t���Qv���Qv�@@���Qv���Qv�@@@@���Qv���Qv�@@@���Qv���Qv�@@@���Qv���Qv�@@@���Qv���Qv�@@@���Qvz��Qv�@@@@�������@@ ���@@ �A�������
  L Same as {!Core_filename.temp_file}, but returns both the name of a fresh
    temporary file, and an output channel opened (atomically) on
    this file.  This function is more secure than [temp_file]: there
    is no risk that the temporary file will be modified (e.g. replaced
    by a symbolic link) before the program opens it. @���K��O+b@@@@���K��O+b@@���@@ ���@@ �A@���Pcc��Qv�@��Pcc�Qv�@��������@@ ���@@ �A�������
  % [temp_file ?perm ?in_dir_name prefix suffix]

    Returns the name of a fresh temporary file in the temporary directory. The base name
    of the temporary file is formed by concatenating prefix, then [.tmp.], then a 6-digit
    hex number, then suffix. The temporary file is created empty. The file is guaranteed
    to be fresh, i.e. not already existing in the directory.

    @param in_dir the directory in which to create the temporary file.  The default is
    [temp_dir_name]

    @param perm the permission of the temporary file. The default value is [0o600]
    (readable and writable only by the file owner)

    Note that prefix and suffix will be changed when necessary to make the final filename
    valid POSIX.

    [temp_dir] is the same as [temp_file] but creates a temporary directory. @��S���c��@@@@��S���c��@@��@@ ��@@ �A��S���c��@���Р)temp_file��&e���'e� @���$perm����#int��2e��3e�@@��5e��6e�@@@���&in_dir����&string��Ae��Be�@@��De��Ee�@@@��@����&string��Ne�"�Oe�(@@��Qe�"�Re�(@@@��@����&string��[e�,�\e�2@@��^e�,�_e�2@@@����&string��fe�6�ge�<@@��ie�6�je�<@@@��le�,�me�<@@@��oe�"�pe�<@@@��re��se�<@@@��ue��ve�<@@@@@��xe���ye�<@��{e���|e�<@���Р(temp_dir���f=A��f=I@���$perm����#int���f=R��f=U@@���f=R��f=U@@@���&in_dir����&string���f=b��f=h@@���f=b��f=h@@@��@����&string���f=l��f=r@@���f=l��f=r@@@��@����&string���f=v��f=|@@���f=v��f=|@@@����&string���f=���f=�@@���f=���f=�@@@���f=v��f=�@@@���f=l��f=�@@@���f=Y��f=�@@@���f=L��f=�@@@@@���f==��f=�@���f==��f=�@���Р/create_arg_type���i����i��@���#key�������(Univ_map%Multi#Key!t���j���j�@���!a���j���j�@@@@���j���j�@@@��@��@����&string��
k�k%@@��k�k%@@@��!a��k)�k+@@@��k�k+@@@�������+Core_kernel'Command(Arg_type!t��$l-5�%l-S@���!a��+l-2�,l-4@@@@��.l-2�/l-S@@@��1k�2l-S@@@��4j���5l-S@@@@���ڰ�%@@ ��&@@ �A�������	U [create_arg_type]'s resulting [Arg_type.t] does bash autocompletion, via [compgen]. @��Eh���Fh��@@@@��Hh���Ih��@@��6@@ ��7@@ �A@��Ni���Ol-S@��Qi���Rl-S@���Р(arg_type��Zo���[o��@�������+Core_kernel'Command(Arg_type!t��ho���io��@�����&string��qo���ro��@@��to���uo��@@@@��wo���xo��@@@@�����h@@ ��i@@ �A�������	' [arg_type] is [create_arg_type Fn.id] @���nUU��nU�@@@@���nUU��nU�@@��y@@ ��z@@ �A@���o����o��@���o����o��@@