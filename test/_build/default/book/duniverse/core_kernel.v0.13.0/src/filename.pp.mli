Caml1999N026����   5         	3book/duniverse/core_kernel.v0.13.0/src/filename.mli����  >�  	_  (�  &l�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ�����&Import��	3book/duniverse/core_kernel.v0.13.0/src/filename.mliA@F�A@L@@��A@@�A@L@@��A@@�A@L@���A�    �!t��CNS�CNT@@@@A�����&string��CNW�CN]@@��CNW�CN]@@@���(deriving��$CNa�%CNi@�����������&bin_io��3CNj�4CNp@��6CNj�7CNp@@@�����'compare��?CNr�@CNy@��BCNr�CCNy@@@�����$hash��KCN{�LCN@��NCN{�OCN@@@�����$sexp��WCN A�XCN E@��ZCN A�[CN E@@@@��]CNj�^CN E@@@@��`CNj�aCN E@@��cCN^�dCN F@@��fCNN�gCN F@@��iCNN�jCN F@�����������-ocaml.warning��xCNN�yCN F@�������#-32@���CNN��CN F@@@@���CNN��CN F@@���CNN��CN F@���CNN��CN F@������������(Bin_prot'Binable!S���CNN��CN F@���CNN��CN F@@����!t���CNN��CN F@    �����CNS��CNT@@@@A���������CNS��CNT@@���CNN��CN F@@@@���CNN��CN F@@���CNN��CN F@@���CNN��CN F@@���CNN��CN F@���Р'compare���CNS��CNT@��@����ǰ��CNS��CNT@@���CNS��CNT@@@��@����Ӱ��CNS��CNT@@���CNS��CNT@@@����#int���CNS��CNT@@���CNS��CNT@@@���CNS��CNT@@@���CNS��CNT@@@@@���CNN��CN F@���CNN��CN F@���Р+hash_fold_t��CNS�CNT@��@�������,Ppx_hash_lib#Std$Hash%state��CNS�CNT@@��CNS�CNT@@@��@������"CNS�#CNT@@��%CNS�&CNT@@@���������/CNS�0CNT@@��2CNS�3CNT@@@��5CNS�6CNT@@@��8CNS�9CNT@@@@@��;CNN�<CN F@��>CNN�?CN F@���Р$hash��GCNS�HCNT@��@����@��PCNS�QCNT@@��SCNS�TCNT@@@�������,Ppx_hash_lib#Std$Hash*hash_value��aCNS�bCNT@@��dCNS�eCNT@@@��gCNS�hCNT@@@@@��jCNN�kCN F@��mCNN�nCN F@������������1Ppx_sexp_conv_lib(Sexpable!S��CNN��CN F@���CNN��CN F@@�������CNN��CN F@    �~���CNS��CNT@@@@A���������CNS��CNT@@���CNN��CN F@@@@���CNN��CN F@@���CNN��CN F@@���CNN��CN F@@���CNN��CN F@@���CNN��CN F@@���CNN��CN F@���)ocaml.doc���CNN��CN F@�������'@inline@���CNN��CN F@@@@���CNN��CN F@@���CNN��CN F@@���CNN��CN F@�������������*Comparable!S���F P R��F P ^@���F P R��F P ^@@����!t���F P i��F P j@    ����F P i��F P j@@@@A�����!t���F P n��F P o@@���F P n��F P o@@@@���F P d��F P o@@���F P R��F P o@@����2comparator_witness��F P z�F P �@    ���F P z�F P �@@@@A������&String2comparator_witness��F P ��F P �@@��F P ��F P �@@@@��F P u�F P �@@��F P R�F P �@@��E H H�F P �@@��!E H H�"F P �@�����������(Hashable!S��1H � ��2H � �@��4H � ��5H � �@@����!t��<H � ��=H � �@    ���AH � ��BH � �@@@@A�����!t��JH � ��KH � �@@��MH � ��NH � �@@@@��PH � ��QH � �@@��SH � ��TH � �@@��VH � ��WH � �@@��YH � ��ZH � �@���Р$root��bK � ��cK � �@����&string��jK � ��kK � �@@��mK � ��nK � �@@@@���)ocaml.doc��U@@ ��V@@ �A�������7  The path of the root.@��J � ���J � �@@@@���J � ���J � �@@��f@@ ��g@@ �A@���K � ���K � �@���K � ���K � �@�����*ocaml.text��u@@ ��v@@ �A�������9 {2 Pathname resolution} @���M � ���M �@@@@���M � ���M �@@���@@ ���@@ �A���M � ���M �@���Р;is_posix_pathname_component���V)-��V)H@��@����&string���V)K��V)Q@@���V)K��V)Q@@@����$bool���V)U��V)Y@@���V)U��V)Y@@@���V)K��V)Y@@@@���_���@@ ���@@ �A�������
   [is_posix_pathname_component f]
    @return true if [f] is a valid path component on a POSIX compliant OS

    Note that this checks a path component, and not a full path.

    http://www.opengroup.org/onlinepubs/000095399/basedefs/xbd_chap03.html#tag_03_169
@���O��U&(@@@@���O��U&(@@���@@ ���@@ �A@���V))��V)Y@���V))��V)Y@���Р-temp_dir_name���_\`��_\m@����&string���_\p��_\v@@���_\p��_\v@@@@�������@@ ���@@ �A�������	� The name of the temporary directory:

    Under Unix, the value of the [TMPDIR] environment variable, or "/tmp" if the variable
    is not set.

    Under Windows, the value of the [TEMP] environment variable, or "."  if the variable
    is not set. @��X[[�^I[@@@@��X[[�^I[@@���@@ ���@@ �A@��_\\�_\v@��_\\�_\v@���Р0current_dir_name��#b���$b��@����&string��+b���,b��@@��.b���/b��@@@@������@@ ��@@ �A�������	E The conventional name for the current directory (e.g. [.] in Unix). @��?axx�@ax�@@@@��Baxx�Cax�@@��&@@ ��'@@ �A@��Hb���Ib��@��Kb���Lb��@���Р/parent_dir_name��Tf@D�Uf@S@����&string��\f@V�]f@\@@��_f@V�`f@\@@@@�����F@@ ��G@@ �A�������	X The conventional name for the parent of the current directory
    (e.g. [..] in Unix). @��pd���qe$?@@@@��sd���te$?@@��W@@ ��X@@ �A@��yf@@�zf@\@��|f@@�}f@\@���Р'dir_sep���i����i��@����&string���i����i��@@���i����i��@@@@���#��w@@ ��x@@ �A�������	- The directory separator (e.g. [/] in Unix). @���h^^��h^�@@@@���h^^��h^�@@���@@ ���@@ �A@���i����i��@���i����i��@���Р&concat���u����u��@��@����&string���u����u�@@���u����u�@@@��@����&string���u�	��u�@@���u�	��u�@@@����&string���u���u�@@���u���u�@@@���u�	��u�@@@���u����u�@@@@���t���@@ ���@@ �A�������
  E [concat p1 p2] returns a path equivalent to [p1 ^ "/" ^ p2].
    In the resulting path p1 (resp. p2) has all its trailing (resp. leading)
    "." and "/" removed. eg:
    concat "a/." ".//b" => "a/b"
    concat "." "b" => "./b"
    concat "a" "." => "a/."
    concat "a" "/b" => "a/b"

    @throws Failure if [p1] is empty.
@���k����t��@@@@���k����t��@@���@@ ���@@ �A@���u����u�@���u����u�@���Р+is_relative��z���z��@��@����&string��z���z��@@��z���z��@@@����$bool��z���z��@@��z��� z��@@@��"z���#z��@@@@������	@@ ��
@@ �A�������	� Return [true] if the file name is relative to the current
    directory, [false] if it is absolute (i.e. in Unix, starts
    with [/]). @��3w�4y��@@@@��6w�7y��@@��@@ ��@@ �A@��<z���=z��@��?z���@z��@���Р+is_absolute��H|���I|��@��@����&string��R|���S|��@@��U|���V|��@@@����$bool��]|���^|��@@��`|���a|��@@@��c|���d|��@@@@@��f|���g|��@��i|���j|��@���Р+is_implicit��r B���s B��@��@����&string��| B���} B�@@�� B���� B�@@@����$bool��� B��� B�@@��� B��� B�@@@��� B���� B�@@@@��� ��t@@ ��u@@ �A�������	� Return [true] if the file name is relative and does not start
    with an explicit reference to the current directory ([./] or
    [../] in Unix), [false] if it starts with an explicit reference
    to the root directory or the current directory. @���~���� A��@@@@���~���� A��@@���@@ ���@@ �A@��� B���� B�@��� B���� B�@���Р,check_suffix��� Fuy�� Fu�@��@����&string��� Fu��� Fu�@@��� Fu��� Fu�@@@��@����&string��� Fu��� Fu�@@��� Fu��� Fu�@@@����$bool��� Fu��� Fu�@@��� Fu��� Fu�@@@��� Fu��� Fu�@@@��� Fu��� Fu�@@@@���q���@@ ���@@ �A�������	a [check_suffix name suff] returns [true] if the filename [name]
    ends with the suffix [suff]. @��� D�� EQt@@@@��� D�� EQt@@���@@ ���@@ �A@��� Fuu�� Fu�@��� Fuu�� Fu�@���Р+chop_suffix�� K	F	J� K	F	U@��@����&string�� K	F	X� K	F	^@@�� K	F	X� K	F	^@@@��@����&string�� K	F	b� K	F	h@@�� K	F	b� K	F	h@@@����&string��& K	F	l�' K	F	r@@��) K	F	l�* K	F	r@@@��, K	F	b�- K	F	r@@@��/ K	F	X�0 K	F	r@@@@���°�@@ ��@@ �A�������	� [chop_suffix name suff] removes the suffix [suff] from
    the filename [name]. The behavior is undefined if [name] does not
    end with the suffix [suff]. @��@ H���A J	#	E@@@@��C H���D J	#	E@@��'@@ ��(@@ �A@��I K	F	F�J K	F	r@��L K	F	F�M K	F	r@���Р.chop_extension��U S
�
��V S
�
�@��@����&string��_ S
�
��` S
�
�@@��b S
�
��c S
�
�@@@����&string��j S
�
��k S
�
�@@��m S
�
��n S
�
�@@@��p S
�
��q S
�
�@@@@�����W@@ ��X@@ �A�������
   Return the given file name without its extension. The extension
    is the shortest suffix starting with a period and not including
    a directory separator, [.xyz] for instance.

    Raise [Invalid_argument] if the given name does not contain
    an extension. @��� M	t	t�� R
m
�@@@@��� M	t	t�� R
m
�@@��h@@ ��i@@ �A@��� S
�
��� S
�
�@��� S
�
��� S
�
�@���Р/split_extension��� \� �� \�@��@����&string��� \��� \�@@��� \��� \�@@@�������&string��� \��� \�"@@��� \��� \�"@@@�����&option��� \�,�� \�2@�����&string��� \�%�� \�+@@��� \�%�� \�+@@@@��� \�%�� \�2@@@@��� \��� \�2@@@��� \��� \�2@@@@���b���@@ ���@@ �A�������
  M [split_extension fn] return the portion of the filename before the
    extension and the (optional) extension.
    Example:
    split_extension "/foo/my_file" = ("/foo/my_file", None)
    split_extension "/foo/my_file.txt" = ("/foo/my_file", Some "txt")
    split_extension "/home/c.falls/my_file" = ("/home/c.falls/my_file", None)
@��� U
�
��� [��@@@@��� U
�
��� [��@@���@@ ���@@ �A@��� \���� \�2@��� \���� \�2@���Р(basename��� imq�� imy@��@����&string��� im|�  im�@@�� im|� im�@@@����&string��
 im�� im�@@�� im�� im�@@@�� im|� im�@@@@�������@@ ���@@ �A�������
  3 Respects the posix semantic.

    Split a file name into directory name / base file name.
    [concat (dirname name) (basename name)] returns a file name
    which is equivalent to [name]. Moreover, after setting the
    current directory to [dirname name] (with {!Sys.chdir}),
    references to [basename name] (which is a relative file name)
    designate the same file as [name] before the call to {!Sys.chdir}.

    The result is not specified if the argument is not a valid file name
    (for example, under Unix if there is a NUL character in the string). @��! ^44�" h!l@@@@��$ ^44�% h!l@@��@@ ��	@@ �A@��* imm�+ im�@��- imm�. im�@���Р'dirname��6 l���7 l��@��@����&string��@ l���A l��@@��C l���D l��@@@����&string��K l���L l��@@��N l���O l��@@@��Q l���R l��@@@@�����8@@ ��9@@ �A�������; See {!Filename.basename}. @��b k���c k��@@@@��e k���f k��@@��I@@ ��J@@ �A@��k l���l l��@��n l���o l��@���Р%split��w o�x o@��@����&string��� o!�� o'@@��� o!�� o'@@@�������&string��� o+�� o1@@��� o+�� o1@@@�����&string��� o4�� o:@@��� o4�� o:@@@@��� o+�� o:@@@��� o!�� o:@@@@���7���@@ ���@@ �A�������	@ [split filename] returns (dirname filename, basename filename) @��� n���� n�@@@@��� n���� n�@@���@@ ���@@ �A@��� o�� o:@��� o�� o:@���Р%parts��� t$(�� t$-@��@����&string��� t$0�� t$6@@��� t$0�� t$6@@@����$list��� t$A�� t$E@�����&string��� t$:�� t$@@@��� t$:�� t$@@@@@��� t$:�� t$E@@@��� t$0�� t$E@@@@�������@@ ���@@ �A�������	� [parts filename] returns a list of path components in order.  For instance:
    /tmp/foo/bar/baz -> ["/"; "tmp"; "foo"; "bar"; "baz"]. The first component is always
    either "." for relative paths or "/" for absolute ones. @�� q<<� s�#@@@@�� q<<� s�#@@���@@ ���@@ �A@�� t$$� t$E@�� t$$� t$E@���Р(of_parts�� {dh� {dp@��@����$list��! {dz�" {d~@�����&string��* {ds�+ {dy@@��- {ds�. {dy@@@@��0 {ds�1 {d~@@@����&string��8 {d��9 {d�@@��; {d��< {d�@@@��> {ds�? {d�@@@@���Ѱ�%@@ ��&@@ �A�������
   [of_parts parts] joins a list of path components into a path. It does roughly the
    opposite of [parts], but they fail to be precisely mutually inverse because of
    ambiguities like multiple consecutive slashes and . components.

    Raises an error if given an empty list. @��O vGG�P z5c@@@@��R vGG�S z5c@@��6@@ ��7@@ �A@��X {dd�Y {d�@��[ {dd�\ {d�@���Р%quote��d ��e �
@��@����&string��n ��o �@@��q ��r �@@@����&string��y ��z �@@��| ��} �@@@�� ��� �@@@@�����f@@ ��g@@ �A�������
  q Return a quoted version of a file name, suitable for use as one argument in a command
    line, escaping all meta-characters.
    Warning: under Windows, the output is only suitable for use with programs that follow
    the standard Windows quoting conventions.

    See [Sys.quote] for an alternative implementation that is more human readable but less
    portable.
@��� }���� �� @@@@��� }���� �� @@��w@@ ��x@@ �A@��� ��� �@��� ��� �@�����&Stable��� � '�� � -@�������"V1��� �4=�� �4?@�����@�    �!t��� �FV�� �FW@@@@A�����!t��� �FZ�� �F[@@��� �FZ�� �F[@@@@��� �FJ�� �F[@@��� �FJ�� �F[@�������������1Stable_comparable"V1��� �io�� �i�@��� �io�� �i�@@����!t��� ����� ���@    ���� ����� ���@@@@A�����!t��� ����� ���@@��� ����� ���@@@@��� ����  ���@@�� �io� ���@@����2comparator_witness��
 ���� ���@    ��� ���� ���@@@@A�����2comparator_witness�� ���� ���@@�� ���� ���@@@@�� ���� ���@@��! �io�" ���@@��$ �]a�% ���@@��' �]a�( ���@�������������(Hashable&Stable"V1!S��; ����< ���@��> ����? ���@@����#key��F ����G ��@    ���K ����L ��@@@@A�����!t��T ���U ��@@��W ���X ��@@@@��Z ����[ ��@@��] ����^ ��@@��` ����a ��@@��c ����d ��@@��f �4B�g �@@@��i �46�j �@��l �46�m �@@��o � 0�p �@@@��r �  �s �@��u �  �v �@@