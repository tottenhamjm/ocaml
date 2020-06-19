Caml1999N026����   .         	,book/duniverse/core.v0.13.0/src/core_sys.mli����  [&  �  6   2�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������3 System interface. @��	,book/duniverse/core.v0.13.0/src/core_sys.mliA@@�A@X@@@@��A@@�A@X@@���@@ ���@@ �A��
A@@�A@X@������&Import��CZ`�CZf@@��CZZ�CZf@@��CZZ�CZf@���Р(get_argv��#K}��$K}�@��@����$unit��-K}��.K}�@@��0K}��1K}�@@@����%array��8K}��9K}�@�����&string��AK}��BK}�@@��DK}��EK}�@@@@��GK}��HK}�@@@��JK}��KK}�@@@@���)ocaml.doc��<@@ ��=@@ �A�������
  O The command line arguments given to the process.  The first element is the command
    name used to invoke the program.  The following elements are the command-line
    arguments given to the program.

    [get_argv] is a function because the external function [caml_sys_modify_argv] can
    replace the array starting in OCaml 4.09. @��\Ehh�]JL|@@@@��_Ehh�`JL|@@��M@@ ��N@@ �A@��eK}}�fK}�@��hK}}�iK}�@���Р$argv��qN���rN��@����%array��yN���zN��@�����&string���N����N��@@���N����N��@@@@���N����N��@@@@���>��y@@ ��z@@ �A�������	% A single result from [get_argv ()]. @���M����M��@@@@���M����M��@@���@@ ���@@ �A���*deprecated���O����O��@�������	q[since 2019-08] Use [Sys.get_argv] instead, which has the correct behavior when [caml_sys_modify_argv] is called.@���P����QHm@@@@���P����QHm@@���O����QHn@@���N����QHn@���N����QHn@���Р/executable_name���T����T��@����&string���T����T��@@���T����T��@@@@�������@@ ���@@ �A�������	C The name of the file containing the executable currently running. @���Spp��Sp�@@@@���Spp��Sp�@@���@@ ���@@ �A@���T����T��@���T����T��@��������@@ ���@@ �A�������	L For all of the following functions, [?follow_symlinks] defaults to [true]. @��W���W�)@@@@��W���W�)@@���@@ ���@@ �A��
W���W�)@���Р+file_exists��b���b��@���/follow_symlinks����$bool��c��� c��@@��"c���#c��@@���ذ�@@ ��@@ �A�������2 defaults to true @��3c���4c�	@@@@��6c���7c�	@@��$@@ ��%@@ �A@��@����&string��Cc��Dc�@@��Fc��Gc�@@@������#Yes��Pc��Qc�@A@��Sc��Tc�@@����"No��[c�!�\c�$@A@��^c�!�_c�$@@����'Unknown��fc�'�gc�/@A@��ic�'�jc�/@@@@@��lc��mc�1@@@��oc��pc�1@@@��rc���sc�1@@@@���(��c@@ ��d@@ �A�������
  � [file_exists ~follow_symlinks path]

    Test whether the file in [path] exists on the file system.
    If [follow_symlinks] is [true] and [path] is a symlink the result concerns
    the target of the symlink.

    [`Unknown] is returned for files for which we cannot successfully determine
    whether they are on the system or not (e.g. files in directories to which we
    do not have read permission). @���Y++��a��@@@@���Y++��a��@@��t@@ ��u@@ �A@���b����c�1@���b����c�1@���Р/file_exists_exn���fko��fk~@���/follow_symlinks����$bool���g���g�@@���g���g�@@���]���@@ ���@@ �A�������2 defaults to true @���g���g�@@@@���g���g�@@���@@ ���@@ �A@��@����&string���g���g�@@���g���g�@@@����$bool���g���g�@@���g���g�@@@���g���g�@@@���g���g�@@@@�������@@ ���@@ �A�������	2 Same as [file_exists] but blows up on [`Unknown] @���e33��e3j@@@@���e33��e3j@@���@@ ���@@ �A@���fkk��g�@���fkk��g�@���Р,is_directory��j��j�@���/follow_symlinks����$bool��k%�k)@@��k%�k)@@���ǰ�@@ ��@@ �A�������2 defaults to true @��"k*�#kA@@@@��%k*�&kA@@��@@ ��@@ �A@��@����&string��2kE�3kK@@��5kE�6kK@@@������#Yes��?kQ�@kU@A@��BkQ�CkU@@����"No��JkX�Kk[@A@��MkX�Nk[@@����'Unknown��Uk^�Vkf@A@��Xk^�Ykf@@@@@��[kO�\kh@@@��^kE�_kh@@@��ak�bkh@@@@�����R@@ ��S@@ �A�������	5 Returns [`Yes] if the file exists and is a directory@��ri���si��@@@@��ui���vi��@@��c@@ ��d@@ �A@��{j���|kh@��~j���kh@���Р'is_file���n����n��@���/follow_symlinks����$bool���o����o��@@���o����o��@@���L���@@ ���@@ �A�������2 defaults to true @���o����o��@@@@���o����o��@@���@@ ���@@ �A@��@����&string���o����o��@@���o����o��@@@������#Yes���o����o��@A@���o����o��@@����"No���o����o� @A@���o����o� @@����'Unknown���o���o�@A@���o���o�@@@@@���o����o�@@@���o����o�@@@���o����o�@@@@�������@@ ���@@ �A�������	9 Returns [`Yes] if the file exists and is a regular file @���mjj��mj�@@@@���mjj��mj�@@���@@ ���@@ �A@�� n���o�@��n���o�@���Р0is_directory_exn��p�p"@���/follow_symlinks����$bool��p6�p:@@��p6�p:@@���Ѱ�@@ ��@@ �A�������2 defaults to true @��,p;�-pR@@@@��/p;�0pR@@��@@ ��@@ �A@��@����&string��<pV�=p\@@��?pV�@p\@@@����$bool��Gp`�Hpd@@��Jp`�Kpd@@@��MpV�Npd@@@��Pp%�Qpd@@@@@��Sp�Tpd@��Vp�Wpd@���Р+is_file_exn��_qei�`qet@���/follow_symlinks����$bool��kqe��lqe�@@��nqe��oqe�@@���$��_@@ ��`@@ �A�������2 defaults to true @��qe���qe�@@@@���qe���qe�@@��p@@ ��q@@ �A@��@����&string���qe���qe�@@���qe���qe�@@@����$bool���qe���qe�@@���qe���qe�@@@���qe���qe�@@@���qe|��qe�@@@@@���qee��qe�@���qee��qe�@���Р&remove���t����t��@��@����&string���t���t�@@���t���t�@@@����$unit���t���t�@@���t���t�@@@���t���t�@@@@�������@@ ���@@ �A�������	2 Remove the given file name from the file system. @���s����s��@@@@���s����s��@@���@@ ���@@ �A@���t����t�@���t����t�@���Р&rename���y�	 ��y�	@��@����&string���y�		��y�	@@�� y�		�y�	@@@��@����&string��
y�	�y�	@@��y�	�y�	@@@����$unit��y�	�y�	!@@��y�	�y�	!@@@��y�	�y�	!@@@��y�		�y�	!@@@@���԰�@@ ��@@ �A�������	� Rename a file. The first argument is the old name and the second is the new
    name. If there is already another file under the new name, [rename] may
    replace it, or raise an exception, depending on your operating system. @��/v�0x��@@@@��2v�3x��@@�� @@ ��!@@ �A@��8y���9y�	!@��;y���<y�	!@���Р&getenv��D~	�	��E~	�	�@��@����&string��N~	�	��O~	�
@@��Q~	�	��R~	�
@@@����&option��Y~	�
�Z~	�
@�����&string��b~	�
	�c~	�
@@��e~	�
	�f~	�
@@@@��h~	�
	�i~	�
@@@��k~	�	��l~	�
@@@@���!��\@@ ��]@@ �A�������	� Return the value associated to a variable in the process environment unless the
    process has special privileges. Return [None] if the variable is unbound or the
    process has special privileges. @��|{	#	#�}}	�	�@@@@��{	#	#��}	�	�@@��m@@ ��n@@ �A@���~	�	���~	�
@���~	�	���~	�
@���Р*getenv_exn���

��

%@��@����&string���

(��

.@@���

(��

.@@@����&string���

2��

8@@���

2��

8@@@���

(��

8@@@@@���

��

8@���

��

8@���Р-unsafe_getenv��� I���� I�@��@����&string��� I��� I�@@��� I��� I�@@@����&option��� I��� I�@�����&string��� I��� I�@@��� I��� I�@@@@��� I��� I�@@@��� I��� I�@@@@�������@@ ���@@ �A�������
  � Return the value associated to a variable in the process environment.

    Unlike {!getenv}, this function returns the value even if the
    process has special privileges. It is considered unsafe because the
    programmer of a setuid or setgid program must be careful to avoid
    using maliciously crafted environment variables in the search path
    for executables, the locations for temporary files or logs, and the
    like. @��� A
:
:�� H��@@@@��� A
:
:�� H��@@���@@ ���@@ �A@��� I���� I�@��� I���  I�@���Р1unsafe_getenv_exn�� J!�	 J2@��@����&string�� J5� J;@@�� J5� J;@@@����&string�� J?� JE@@��  J?�! JE@@@��# J5�$ JE@@@@@��& J�' JE@��) J�* JE@���Р'command��2 M���3 M��@��@����&string��< M���= M��@@��? M���@ M��@@@����#int��G M���H M��@@��J M���K M��@@@��M M���N M��@@@@�����>@@ ��?@@ �A�������	; Execute the given shell command and return its exit code. @��^ LGG�_ LG�@@@@��a LGG�b LG�@@��O@@ ��P@@ �A@��g M���h M��@��j M���k M��@���Р+command_exn��s Q�t Q)@��@����&string��} Q,�~ Q2@@��� Q,�� Q2@@@����$unit��� Q6�� Q:@@��� Q6�� Q:@@@��� Q,�� Q:@@@@���D��@@ ���@@ �A�������	o [command_exn command] runs [command] and then raises an exception if it
    returns with nonzero exit status. @��� O���� P�@@@@��� O���� P�@@���@@ ���@@ �A@��� Q�� Q:@��� Q�� Q:@���Р%quote��� Y���� Y��@��@����&string��� Y���� Y��@@��� Y���� Y��@@@����&string��� Y���� Y��@@��� Y���� Y��@@@��� Y���� Y��@@@@�������@@ ���@@ �A�������
  D [quote s] quotes the string in a format suitable for the shell of the current system
    (e.g. suitable for [command]).  On Unix, this function only quotes as necessary, which
    makes its output more legible than [Filename.quote].

    WARNING: This may not work with some shells, but should work with sh, bash, and zsh.
@��� S<<�� X��@@@@��� S<<�� X��@@���@@ ���@@ �A@��� Y���� Y��@��� Y���� Y��@���Р%chdir��� \���� \��@��@����&string��� \���  \��@@�� \��� \��@@@����$unit��
 \��� \��@@�� \��� \��@@@�� \��� \��@@@@���ư�@@ ��@@ �A�������	6 Change the current working directory of the process. @��! [���" [��@@@@��$ [���% [��@@��@@ ��@@ �A@��* \���+ \��@��- \���. \��@���Р&getcwd��6 _8<�7 _8B@��@����$unit��@ _8E�A _8I@@��C _8E�D _8I@@@����&string��K _8M�L _8S@@��N _8M�O _8S@@@��Q _8E�R _8S@@@@�����B@@ ��C@@ �A�������	6 Return the current working directory of the process. @��b ^���c ^�7@@@@��e ^���f ^�7@@��S@@ ��T@@ �A@��k _88�l _8S@��n _88�o _8S@���Р'readdir��w g�x g@��@����&string��� g�� g%@@��� g�� g%@@@����%array��� g0�� g5@�����&string��� g)�� g/@@��� g)�� g/@@@@��� g)�� g5@@@��� g�� g5@@@@���T���@@ ���@@ �A�������
  � Return the names of all files present in the given directory.  Names
    denoting the current directory and the parent directory (["."] and [".."] in
    Unix) are not returned.  Each string in the result is a file name rather
    than a complete path.  There is no guarantee that the name strings in the
    resulting array will appear in any specific order; they are not, in
    particular, guaranteed to appear in alphabetical order. @��� aUU�� f�@@@@��� aUU�� f�@@���@@ ���@@ �A@��� g�� g5@��� g�� g5@���Р(fold_dir��� o�� o@���$init��#acc��� o&�� o*@@@���!f��@��#acc��� o1�� o5@@@��@����&string��� o9�� o?@@��� o9�� o?@@@��#acc��� oC�� oG@@@��� o9�� oG@@@��� o1�� oG@@@��@����&string��� oL�� oR@@��  oL� oR@@@��#acc�� oV� oZ@@@��	 oL�
 oZ@@@�� o.� oZ@@@�� o!� oZ@@@@���Ű� @@ ��@@ �A�������	�
   Call [readdir], and fold over the elements of the array.
   @raise Sys_error _ if readdir fails.
   As with [readdir], ["."] and [".."] are not returned
   raises the same exception than opendir and closedir.
@��  i77�! n@@@@��# i77�$ n@@��@@ ��@@ �A@��) o�* oZ@��, o�- oZ@���Р&ls_dir��5 t���6 t��@��@����&string��? t���@ t��@@��B t���C t��@@@����$list��J t���K t��@�����&string��S t���T t��@@��V t���W t��@@@@��Y t���Z t��@@@��\ t���] t��@@@@�����M@@ ��N@@ �A�������	?
   Same as [readdir], but return a list rather than an array.
@��m q\\�n s��@@@@��p q\\�q s��@@��^@@ ��_@@ �A@��v t���w t��@��y t���z t��@���Р+interactive��� yqu�� yq�@����#ref��� yq��� yq�@�����$bool��� yq��� yq�@@��� yq��� yq�@@@@��� yq��� yq�@@@@���O���@@ ���@@ �A�������	� This reference is initially set to [false] in standalone programs and to
    [true] if the code is being executed under the interactive toplevel system
    [ocaml]. @��� v���� xap@@@@��� v���� xap@@���@@ ���@@ �A@��� yqq�� yq�@��� yqq�� yq�@���Р'os_type��� ���� ��@����&string��� ���� ��@@��� ���� ��@@@@�������@@ ���@@ �A�������
   Operating system currently executing the Caml program. One of
    -  ["Unix"] (for all Unix versions, including Linux and Mac OS X),
    -  ["Win32"] (for MS-Windows, OCaml compiled with MSVC++ or Mingw),
    -  ["Cygwin"] (for MS-Windows, OCaml compiled with Cygwin). @��� {���� ~^�@@@@��� {���� ~^�@@���@@ ���@@ �A@��� ���� ��@��� ���� ��@���Р)word_size��� ��� �(@����#int��� �+�� �.@@��� �+�� �.@@@@�������@@ ���@@ �A�������	^ Size of one word on the machine currently executing the Caml program, in
    bits: 32 or 64. @�� ���� �@@@@�� ���� �@@���@@ ���@@ �A@�� �� �.@�� �� �.@���Р(int_size��! �EI�" �EQ@����#int��) �ET�* �EW@@��, �ET�- �EW@@@@�����	@@ ��	@@ �A�������
   Size of an int. It is 31 bits (resp. 63 bits) when using the OCaml compiler on a 32
    bits (resp. 64 bits) platform. It may differ for other compilers, e.g. it is 32 bits
    when compiling to JavaScript. This is the same as [Core.Int.size_in_bits]. @since
    4.03.0 @��= �00�> �7D@@@@��@ �00�A �7D@@��	.@@ ��	/@@ �A@��F �EE�G �EW@��I �EE�J �EW@���Р*big_endian��R ����S ���@����$bool��Z ����[ ���@@��] ����^ ���@@@@�����	N@@ ��	O@@ �A�������	I Whether the machine currently executing the Caml program is big-endian. @��n �YY�o �Y�@@@@��q �YY�r �Y�@@��	_@@ ��	`@@ �A@��w ����x ���@��z ����{ ���@������%Break��� ��� �@��@@��� ��� �@���?��	z@@ ��	{@@ �A�������	H Exception raised on interactive interrupt if {!Sys.catch_break} is on. @��� ����� ��@@@@��� ����� ��@@��	�@@ ��	�@@ �A@��	�@@ ��	�@@ �A@��� ��� �@���Р+catch_break��� ����� ���@��@����$bool��� ����� ���@@��� ����� ���@@@����$unit��� ����� ���@@��� ����� ���@@@��� ����� ���@@@@������	�@@ ��	�@@ �A�������
  � Warning: this function clobbers the Signal.int (SIGINT) handler.  SIGINT is the
    signal that's sent to your program when you hit CTRL-C.

    Warning: catch_break uses deep ocaml runtime magic to raise Sys.Break inside of the
    main execution context.  Consider explicitly handling Signal.int instead.  If
    all you want to do is terminate on CTRL-C you don't have to do any special setup,
    that's the default behavior.

    [catch_break] governs whether interactive interrupt (ctrl-C) terminates the
    program or raises the [Break] exception.  Call [catch_break true] to enable
    raising [Break], and [catch_break false] to let the system terminate the
    program on user interrupt.
@��� ��� ���@@@@��� ��� ���@@��	�@@ ��	�@@ �A@��� ����� ���@��� ����� ���@���Р-ocaml_version��� �8<�� �8I@����&string��� �8L�� �8R@@��� �8L�� �8R@@@@������	�@@ ��	�@@ �A�������
  2 [ocaml_version] is the version of Objective Caml.  It is a string of the form
    ["major.minor[.patchlevel][+additional-info]"], where [major], [minor], and
    [patchlevel] are integers, and [additional-info] is an arbitrary string. The
    [[.patchlevel]] and [[+additional-info]] parts may be absent. @��	 �  �	 ��7@@@@��	 �  �	 ��7@@��	�@@ ��	�@@ �A@��	 �88�	 �8R@��	 �88�	 �8R@���Р.execution_mode��	! ����	" ���@��@����$unit��	+ ����	, ���@@��	. ����	/ ���@@@������(Bytecode��	8 ����	9 ���@A@��	; ����	< ���@@����&Native��	C ����	D ���@A@��	F ����	G ���@@@@@��	I ����	J ���@@@��	L ����	M ���@@@@���	��
=@@ ��
>@@ �A�������	b [execution_mode] tests whether the code being executed was compiled natively
    or to bytecode. @��	] �TT�	^ ���@@@@��	` �TT�	a ���@@��
N@@ ��
O@@ �A@��	f ����	g ���@��	i ����	j ���@���Р*c_int_size��	r ����	s ��@��@����$unit��	| ���	} ��@@��	 ���	� ��@@@����#int��	� ���	� ��@@��	� ���	� ��@@@��	� ���	� ��@@@�*c_int_size@���	E��
�@@ ��
�@@ �A�������	� [c_int_size] returns the number of bits in a C [int], as specified in header
    files. Note that this can be different from [word_size] and [Nativeint.num_bits]. For
    example, Linux x86-64 should have [word_size = 64], but [c_int_size () = 32]. @��	� ����	� ���@@@@��	� ����	� ���@@��
�@@ ��
�@@ �A���'noalloc��	� ��&�	� ��-@�@��	� ��#�	� ��.@@��	� ����	� ��.@��	� ����	� ��.@���Р.home_directory��	� ����	� ���@��@����$unit��	� ����	� ���@@��	� ����	� ���@@@����&string��	� ����	� ��@@��	� ����	� ��@@@��	� ����	� ��@@@@���	���
�@@ ��
�@@ �A�������	� Return the home directory, using the [HOME] environment variable if that is defined,
    and if not, using the effective user's information in the Unix password database. @��	� �00�	� ���@@@@��	� �00�	� ���@@��
�@@ ��
�@@ �A@��	� ����	� ��@��	� ����	� ��@�����
��
�@@ ��
�@@ �A�������2 {6 Optimization} @��
 ��
 �@@@@��
 ��
 �@@��
�@@ ��
�@@ �A��
 ��
 �@���Р/opaque_identity��
 ����
 ���@��@��!a��
% ����
& ���@@@��!a��
+ ����
, ���@@@��
. ����
/ ���@@@�'%opaque@���	��!@@ ��"@@ �A�������
  � For the purposes of optimization, [opaque_identity] behaves like an unknown (and thus
    possibly side-effecting) function.  At runtime, [opaque_identity] disappears
    altogether.  A typical use of this function is to prevent pure computations from being
    optimized away in benchmarking loops.  For example:

    {[
      for _round = 1 to 100_000 do
        ignore (Sys.opaque_identity (my_pure_computation ()))
      done
    ]}
@��
A �  �
B ���@@@@��
D �  �
E ���@@��2@@ ��3@@ �A@��
J ����
K �� @��
M ����
N �� @���Р-override_argv��
V �!�!��
W �!�"@��@����%array��
` �!�"�
a �!�"@�����&string��
i �!�"�
j �!�"@@��
l �!�"�
m �!�"@@@@��
o �!�"�
p �!�"@@@����$unit��
w �!�"�
x �!�"#@@��
z �!�"�
{ �!�"#@@@��
} �!�"�
~ �!�"#@@@@���
3��n@@ ��o@@ �A�������
  � [override_argv new_argv] makes subsequent calls to {!get_argv} return [new_argv].

    Prior to OCaml version 4.09, this function has two noteworthy behaviors:

    - it may raise if the length of [new_argv] is greater than the length of [argv] before
      the call;
    - it re-uses and mutates the previous [argv] value instead of using the new one; and
    - it even mutates its length, which can be observed by inspecting the array returned
      by an earlier call to {!get_argv}.
@��
� �  �
� �!�!�@@@@��
� �  �
� �!�!�@@��@@ ���@@ �A@��
� �!�!��
� �!�"#@��
� �!�!��
� �!�"#@�����
����@@ ���@@ �A�������"/*@��
� �"'"'�
� �"'".@@@@��
� �"'"'�
� �"'".@@���@@ ���@@ �A��
� �"'"'�
� �"'".@�����'Private��
� �"�"��
� �"�"�@�����Р*unix_quote��
� �"�"��
� �"�"�@��@����&string��
� �"�"��
� �"�"�@@��
� �"�"��
� �"�"�@@@����&string��
� �"�"��
� �"�"�@@��
� �"�"��
� �"�"�@@@��
� �"�"��
� �"�"�@@@@@��
� �"�"��
� �"�"�@��
� �"�"��
� �"�"�@@��
� �"�"��
� �"�#@@@��
� �"�"��
� �"�#@��
� �"�"��
� �"�#@@