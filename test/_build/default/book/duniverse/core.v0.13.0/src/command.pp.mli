Caml1999N026����   -         	+book/duniverse/core.v0.13.0/src/command.mli����  !�  ,    ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ�����&Import��	+book/duniverse/core.v0.13.0/src/command.mliA@F�A@L@@��A@@�A@L@@��A@@�A@L@���������������+Core_kernel'Command��CNf�CNy@��CNf�CNy@@��!CNW�"CNy@@����%Shape��)Dz P�*Dz U@���'Command%Shape��1Dz Y�2Dz f@@��4CNW�5Dz f@@����*Deprecated��<E g }�=E g �@���'Command*Deprecated��DE g ��EE g �@@��GCNW�HE g �@@��JCNN�KE g �@@��MCNN�NE g �@���Р#run��V]���W]��@���6verbose_on_parse_error����$bool��b^���c^��@@��e^���f^��@@@���'version����&string��q_���r_��@@��t_���u_��@@@���*build_info����&string���`���`�@@���`���`�@@@���$argv����$list���a&��a*@�����&string���a��a%@@���a��a%@@@@���a��a*@@@���&extend��@����$list���b+F��b+J@�����&string���b+?��b+E@@���b+?��b+E@@@@���b+?��b+J@@@����$list���b+U��b+Y@�����&string���b+N��b+T@@���b+N��b+T@@@@���b+N��b+Y@@@���b+?��b+Y@@@��@����!t���c[`��c[a@@���c[`��c[a@@@����$unit���dbg��dbk@@���dbg��dbk@@@���c[`��dbk@@@���b+0��dbk@@@���a��dbk@@@���`����dbk@@@���_����dbk@@@���^��� dbk@@@@���)ocaml.doc���@@ ���@@ �A�������
   Runs a command against [Sys.argv], or [argv] if it is specified.

    [extend] can be used to add extra command line arguments to basic subcommands of the
    command.  [extend] will be passed the (fully expanded) path to a command, and its
    output will be appended to the list of arguments being processed.  For example,
    suppose a program like this is compiled into [exe]:

    {[
      let bar = Command.basic ___
      let foo = Command.group ~summary:___ ["bar", bar]
      let main = Command.group ~summary:___ ["foo", foo]
      let () = Command.run ~extend:(fun _ -> ["-baz"]) main
    ]}

    Then if a user ran [exe f b], [extend] would be passed [["foo"; "bar"]] and ["-baz"]
    would be appended to the command line for processing by [bar].  This can be used to
    add a default flags section to a user config file.

    [verbose_on_parse_error] controls whether to print a line suggesting the user try the
    "-help" flag when an exception is raised while parsing the arguments.  By default it
    is true.
@��G � ��\��@@@@��G � ��\��@@���@@ ���@@ �A@��]���dbk@��]���dbk@�����$Path��&fmt�'fmx@�����A�    �!t��2i��3i�@@@@A@���3��@@ ��@@ �A�������	x [Path.t] is a top-level executable name and sequence of subcommand names that can be
      used to identify a command. @��Cg��Dh��@@@@��Fg��Gh��@@��*@@ ��+@@ �A@��Li��Mi�@@��Oi��Pi�@���Р&create��Xl]c�Yl]i@���+path_to_exe����&string��dl]x�el]~@@��gl]x�hl]~@@@����!t��ol]��pl]�@@��rl]��sl]�@@@��ul]l�vl]�@@@@���v��\@@ ��]@@ �A�������	L [create] creates a path from a toplevel executable given by [path_to_exe]. @���k	��k	\@@@@���k	��k	\@@��m@@ ��n@@ �A@���l]_��l]�@���l]_��l]�@���Р&append���o����o��@��@����!t���o����o��@@���o����o��@@@���*subcommand����&string���o����o��@@���o����o��@@@����!t���o����o��@@���o����o��@@@���o����o��@@@���o����o��@@@@���ɰ��@@ ���@@ �A�������	' [append] appends a subcommand to [t]. @���n����n��@@@@���n����n��@@���@@ ���@@ �A@���o����o��@���o����o��@���Р%parts���sIO��sIT@��@����!t���sIW��sIX@@���sIW��sIX@@@����$list��sIc�sIg@�����&string��sI\�sIb@@��sI\�sIb@@@@��sI\�sIg@@@��sIW�sIg@@@@������@@ ���@@ �A�������	a [parts] returns a list containing the path's executable name followed by its
      subcommands. @��&q���'r3H@@@@��)q���*r3H@@��@@ ��@@ �A@��/sIK�0sIg@��2sIK�3sIg@@��5fm{�6thk@@@��8fmm�9thk@��;fmm�<thk@�����%Shape��Dvmt�Evmy@��������������������+Core_kernel'Command%Shape��^w���_w��@��aw���bw��@@��dw���ew��@@��gw���hw��@@��jw���kw��@@��mw���nw��@@��pw���qw��@@��sw���tw��@���Р)help_text��| E	�	��} E	�	�@��@����!t��� F
 
�� F
 
@@��� F
 
�� F
 
@@@��@�����$Path!t��� G
	
�� G
	
@@��� G
	
�� G
	
@@@���+expand_dots����$bool��� H

*�� H

.@@��� H

*�� H

.@@@���%flags����$bool��� I
/
<�� I
/
@@@��� I
/
<�� I
/
@@@@���)recursive����$bool��� J
A
R�� J
A
V@@��� J
A
R�� J
A
V@@@����&string��� K
W
^�� K
W
d@@��� K
W
^�� K
W
d@@@��� J
A
H�� K
W
d@@@��� I
/
6�� K
W
d@@@��� H

�� K
W
d@@@��� G
	
�� K
W
d@@@��� F
 
�� K
W
d@@@@������@@ ���@@ �A�������
  ! Get the help text for a command shape.

      The [Path.t] argument should be the path that identifies the shape argument.

      [expand_dots]: expand subcommands in recursive help. (default: false)
      This is the same as the [help] subcommand's ["-expand-dots"] flag.

      [flags]: show flags in recursive help. (default: false)
      This is the same as the [help] subcommand's ["-flags"] flag.

      [recursive]: show subcommands of subcommands. (default: false)
      This is the same as the [help] subcommand's ["-recursive"] flag. @���y���� D	�	�@@@@���y���� D	�	�@@���@@ ���@@ �A@��� E	�	��� K
W
d@��� E	�	��� K
W
d@@���vm|�  L
e
h@@@��vmm� L
e
h@��vmm� L
e
h@���Р%shape�� O
�
�� O
�
�@��@����!t�� O
�
�� O
�
�@@�� O
�
�� O
�
�@@@�����%Shape!t��% O
�
��& O
�
�@@��( O
�
��) O
�
�@@@��+ O
�
��, O
�
�@@@@���,��@@ ��@@ �A�������	! Exposes the shape of a command. @��< N
j
j�= N
j
�@@@@��? N
j
j�@ N
j
�@@��#@@ ��$@@ �A@��E O
�
��F O
�
�@��H O
�
��I O
�
�@�����*Deprecated��Q S�R S!@��������������������+Core_kernel'Command*Deprecated��k T(P�l T(n@��n T(P�o T(n@@��q T(H�r T(n@@��t T(H�u T(n@@��w T(A�x T(r@@��z T(2�{ T(r@@��} T(*�~ T(r@@��� T(*�� T(r@���Р#run��� Vtz�� Vt}@��@����!t��� W~��� W~�@@��� W~��� W~�@@@���#cmd����&string��� X���� X��@@��� X���� X��@@@���$args����$list��� Y���� Y��@�����&string��� Y���� Y��@@��� Y���� Y��@@@@��� Y���� Y��@@@���'is_help����$bool��� Z���� Z��@@��� Z���� Z��@@@���+is_help_rec����$bool��� [��� [�@@��� [��� [�@@@���1is_help_rec_flags����$bool��� \+�� \/@@��� \+�� \/@@@���.is_expand_dots����$bool��� ]0K�� ]0O@@��� ]0K�� ]0O@@@����$unit�� ^PW� ^P[@@�� ^PW� ^P[@@@��
 ]07� ^P[@@@�� \� ^P[@@@�� [��� ^P[@@@�� Z��� ^P[@@@�� Y��� ^P[@@@�� X��� ^P[@@@�� W~�� ^P[@@@@@�� Vtv�  ^P[@��" Vtv�# ^P[@@��% S$�& _\_@@���&��@@ ��@@ �A�������	_ [Deprecated] should be used only by [Deprecated_command].  At some point
    it will go away. @��6 Q
�
��7 R
�@@@@��9 Q
�
��: R
�@@��@@ ��@@ �A@��? S�@ _\_@��B S�C _\_@@