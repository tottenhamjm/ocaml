Caml1999N026����   /         	-book/duniverse/core.v0.13.0/src/bigstring.mli����  ��  �  k�  c������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������	� String type based on [Bigarray], for use in I/O and C-bindings, extending
    {{!Core_kernel.Bigstring}[Core_kernel.Bigstring]}. @��	-book/duniverse/core.v0.13.0/src/bigstring.mliA@@�B N �@@@@��A@@�B N �@@���@@ ���@@ �A��
A@@�B N �@������&Import��D � ��D � �@@��D � ��D � �@@��D � ��D � �@������$Unix��$E � ��%E � �@A��'E � ��(E � �@@��*E � ��+E � �@�����������������+Core_kernel)Bigstring��@G � ��AG � �@��CG � ��DG � �@@��FG � ��GG � �@@��IG � ��JG � �@@��LG � ��MG � �@@��OG � ��PG � �@@��RG � ��SG � �@@��UG � ��VG � �@������'IOError��_M���`M��@�������#int��jM���kM��@@��mM���nM��@@@�����#exn��vM���wM��@@��yM���zM��@@@@@��|M���}M��@���)ocaml.doc��n@@ ��o@@ �A�������	� Type of I/O errors.

    In [IOError (n, exn)], [n] is the number of bytes successfully read/written before the
    error and [exn] is the exception that occurred (e.g., [Unix_error], [End_of_file]) @���I � ���LV�@@@@���I � ���LV�@@��@@ ���@@ �A@���@@ ���@@ �A@���M����M��@���������@@ ���@@ �A�������5 {2 Input functions} @���O����O��@@@@���O����O��@@���@@ ���@@ �A���O����O��@���Р$read���Q����Q��@���'min_len����#int���R���R�@@���R���R�@@���R���@@ ���@@ �A�������- default = 0 @���R�	��R�@@@@���R�	��R�@@���@@ ���@@ �A@��@����*file_descr���S!��S+@@���S!��S+@@@���#pos����#int���T,8��T,;@@��T,8�T,;@@�������@@ ���@@ �A�������- default = 0 @��T,<�T,N@@@@��T,<�T,N@@��@@ ��@@ �A@���#len����#int��$UO[�%UO^@@��'UO[�(UO^@@������@@ ��@@ �A�������? default = [length bstr - pos] @��8UO_�9UO�@@@@��;UO_�<UO�@@��)@@ ��*@@ �A@��@����!t��HV���IV��@@��KV���LV��@@@����#int��SW���TW��@@��VW���WW��@@@��YV���ZW��@@@��\UOT�]W��@@@��_T,1�`W��@@@��bS!�cW��@@@��eR���fW��@@@@�����V@@ ��W@@ �A�������
  � [read ?min_len fd ?pos ?len bstr] reads at least [min_len] (must be [>= 0]) and at
    most [len] (must be [>= min_len]) bytes from file descriptor [fd], and writes them to
    bigstring [bstr] starting at position [pos].  Returns the number of bytes actually
    read.

    [read] returns zero only if [len = 0].  If [len > 0] and there's nothing left to read,
    [read] raises to indicate EOF even if [min_len = 0].

    NOTE: Even if [len] is zero, there may still be errors when reading from the
    descriptor!

    Raises [Invalid_argument] if the designated ranges are out of bounds.  Raises
    [IOError] in the case of input errors, or on EOF if the minimum length could not be
    read. @��vX���weHT@@@@��yX���zeHT@@��g@@ ��h@@ �A@��Q����W��@���Q����W��@���Р+really_read���gVZ��gVe@��@����*file_descr���hfk��hfu@@���hfk��hfu@@@���#pos����#int���iv���iv�@@���iv���iv�@@���+���@@ ���@@ �A�������- default = 0 @���iv���iv�@@@@���iv���iv�@@���@@ ���@@ �A@���#len����#int���j����j��@@���j����j��@@���Q���@@ ���@@ �A�������? default = [length bstr - pos] @���j����j��@@@@���j����j��@@���@@ ���@@ �A@��@����!t���k����k��@@���k����k��@@@����$unit���l����l��@@���l����l��@@@���k��� l��@@@��j���l��@@@��iv{�l��@@@��hfk�	l��@@@@�������@@ ���@@ �A�������
   [really_read fd ?pos ?len bstr] reads [len] bytes from file descriptor [fd], and
    writes them to bigstring [bstr] starting at position [pos].

    Raises [Invalid_argument] if the designated range is out of bounds.
    Raises [IOError] in the case of input errors, or on EOF. @��m���q��@@@@��m���q��@@��
@@ ��@@ �A@��"gVV�#l��@��%gVV�&l��@���Р+really_recv��.s��/s�@��@����*file_descr��8t�9t@@��;t�<t@@@���#pos����#int��Gu*�Hu-@@��Ju*�Ku-@@���ΰ�;@@ ��<@@ �A�������- default = 0 @��[u.�\u@@@@@��^u.�_u@@@��L@@ ��M@@ �A@���#len����#int��mvAM�nvAP@@��pvAM�qvAP@@������a@@ ��b@@ �A�������? default = [length bstr - pos] @���vAQ��vAu@@@@���vAQ��vAu@@��r@@ ��s@@ �A@��@����!t���wv{��wv|@@���wv{��wv|@@@����$unit���x}���x}�@@���x}���x}�@@@���wv{��x}�@@@���vAF��x}�@@@���u#��x}�@@@���t��x}�@@@@���/���@@ ���@@ �A�������
  ~ [really_recv sock ?pos ?len bstr] receives [len] bytes from socket [sock], and writes
    them to bigstring [bstr] starting at position [pos].  If [len] is zero, the function
    returns immediately without performing the underlying system call.

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises [IOError]
    in the case of input errors, or on EOF. @���y����~�	
@@@@���y����~�	
@@���@@ ���@@ �A@���s����x}�@���s����x}�@���Р	!recvfrom_assume_fd_is_nonblocking��� @		�� @		1@��@����*file_descr��� A	2	7�� A	2	A@@��� A	2	7�� A	2	A@@@���#pos����#int��� B	B	N�� B	B	Q@@��� B	B	N�� B	B	Q@@���q���@@ ���@@ �A�������- default = 0 @��� B	B	R�� B	B	d@@@@�� B	B	R� B	B	d@@���@@ ���@@ �A@���#len����#int�� C	e	q� C	e	t@@�� C	e	q� C	e	t@@������@@ ��@@ �A�������? default = [length bstr - pos] @��$ C	e	u�% C	e	�@@@@��' C	e	u�( C	e	�@@��@@ ��@@ �A@��@����!t��4 D	�	��5 D	�	�@@��7 D	�	��8 D	�	�@@@�������#int��B E	�	��C E	�	�@@��E E	�	��F E	�	�@@@�����(sockaddr��N E	�	��O E	�	�@@��Q E	�	��R E	�	�@@@@��T E	�	��U E	�	�@@@��W D	�	��X E	�	�@@@��Z C	e	j�[ E	�	�@@@��] B	B	G�^ E	�	�@@@��` A	2	7�a E	�	�@@@@�����Q@@ ��R@@ �A�������
  � [recvfrom_assume_fd_is_nonblocking sock ?pos ?len bstr] reads up to [len] bytes into
    bigstring [bstr] starting at position [pos] from socket [sock] without yielding to
    other OCaml-threads.

    Returns the number of bytes actually read and the socket address of the client.

    Raises [Unix_error] in the case of input errors.  Raises [Invalid_argument] if the
    designated range is out of bounds. @��q F	�	��r M+T@@@@��t F	�	��u M+T@@��b@@ ��c@@ �A@��z @		�{ E	�	�@��} @		�~ E	�	�@���Р=read_assume_fd_is_nonblocking��� OVZ�� OVw@��@����*file_descr��� Px}�� Px�@@��� Px}�� Px�@@@���#pos����#int��� Q���� Q��@@��� Q���� Q��@@���&���@@ ���@@ �A�������- default = 0 @��� Q���� Q��@@@@��� Q���� Q��@@���@@ ���@@ �A@���#len����#int��� R���� R��@@��� R���� R��@@���L���@@ ���@@ �A�������? default = [length bstr - pos] @��� R���� R��@@@@��� R���� R��@@���@@ ���@@ �A@��@����!t��� S���� S��@@��� S���� S��@@@������.Syscall_result#Int!t��� T���� T� @@��� T���� T� @@@��� S���� T� @@@�� R��� T� @@@�� Q��� T� @@@�� Px}� T� @@@@�������@@ ���@@ �A�������
  < [read_assume_fd_is_nonblocking fd ?pos ?len bstr] reads up to [len] bytes into
    bigstring [bstr] starting at position [pos] from file descriptor [fd] without yielding
    to other OCaml-threads.  Returns the number of bytes actually read.

    Raises [Invalid_argument] if the designated range is out of bounds. @�� U� Y�B@@@@�� U� Y�B@@��	@@ ��
@@ �A@��! OVV�" T� @��$ OVV�% T� @���Р>pread_assume_fd_is_nonblocking��- [DH�. [Df@��@����*file_descr��7 \gl�8 \gv@@��: \gl�; \gv@@@���&offset����#int��F ]w��G ]w�@@��I ]w��J ]w�@@@���#pos����#int��U ^���V ^��@@��X ^���Y ^��@@���ܰ�I@@ ��J@@ �A�������- default = 0 @��i ^���j ^��@@@@��l ^���m ^��@@��Z@@ ��[@@ �A@���#len����#int��{ _���| _��@@��~ _��� _��@@�����o@@ ��p@@ �A�������? default = [length bstr - pos] @��� _���� _��@@@@��� _���� _��@@���@@ ���@@ �A@��@����!t��� `���� `��@@��� `���� `��@@@����#int��� a���� a��@@��� a���� a��@@@��� `���� a��@@@��� _���� a��@@@��� ^���� a��@@@��� ]w|�� a��@@@��� \gl�� a��@@@@���@���@@ ���@@ �A�������
   [pread_assume_fd_is_nonblocking fd ~offset ?pos ?len bstr] reads up to [len] bytes
    from file descriptor [fd] at offset [offset], and writes them to bigstring [bstr]
    starting at position [pos].  The [fd] must be capable of seeking, and the current file
    offset used for a regular [read()] is unchanged. Please see [man pread] for more
    information. Returns the number of bytes actually read.

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises
    [Unix_error] in the case of input errors. @��� b���� i�@@@@��� b���� i�@@���@@ ���@@ �A@��� [DD�� a��@��� [DD�� a��@���Р%input��� k�� k@���'min_len����#int��� l'�� l*@@��� l'�� l*@@���u���@@ ���@@ �A�������- default = 0 @�� l+� l=@@@@�� l+� l=@@���@@ ���@@ �A@��@�����*In_channel!t�� m>C� m>O@@�� m>C� m>O@@@���#pos����#int��# nP\�$ nP_@@��& nP\�' nP_@@������@@ ��@@ �A�������- default = 0 @��7 nP`�8 nPr@@@@��: nP`�; nPr@@��(@@ ��)@@ �A@���#len����#int��I os�J os�@@��L os�M os�@@���а�=@@ ��>@@ �A�������? default = [length bstr - pos] @��] os��^ os�@@@@��` os��a os�@@��N@@ ��O@@ �A@��@����!t��m p���n p��@@��p p���q p��@@@����#int��x q���y q��@@��{ q���| q��@@@��~ p��� q��@@@��� osx�� q��@@@��� nPU�� q��@@@��� m>C�� q��@@@��� l�� q��@@@@�����{@@ ��|@@ �A�������
  ^ [input ?min_len ic ?pos ?len bstr] tries to read [len] bytes (guarantees to read at
    least [min_len] bytes, which must be [>= 0] and [<= len]), if possible, before
    returning, from input channel [ic], and writes them to bigstring [bstr] starting at
    position [pos].  Returns the number of bytes actually read.

    NOTE: Even if [len] is zero, there may still be errors when reading from the
    descriptor, which will be done if the internal buffer is empty!

    NOTE: If at least [len] characters are available in the input channel buffer and if
    [len] is not zero, data will only be fetched from the channel buffer.  Otherwise data
    will be read until at least [min_len] characters are available.

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises [IOError]
    in the case of input errors, or on premature EOF. @��� r���� �@@@@��� r���� �@@���@@ ���@@ �A@��� k�� q��@��� k�� q��@���Р,really_input��� �!�� �-@��@�����*In_channel!t��� �.3�� �.?@@��� �.3�� �.?@@@���#pos����#int��� �@L�� �@O@@��� �@L�� �@O@@���R���@@ ���@@ �A�������- default = 0 @��� �@P�� �@b@@@@��� �@P�� �@b@@���@@ ���@@ �A@���#len����#int��� �co�� �cr@@��� �co�� �cr@@���x���@@ ���@@ �A�������? default = [length bstr - pos] @�� �cs� �c�@@@@�� �cs�	 �c�@@���@@ ���@@ �A@��@����!t�� ���� ���@@�� ���� ���@@@����$unit��  ����! ���@@��# ����$ ���@@@��& ����' ���@@@��) �ch�* ���@@@��, �@E�- ���@@@��/ �.3�0 ���@@@@������ @@ ��!@@ �A�������
  ) [really_input ic ?pos ?len bstr] reads exactly [len] bytes from input channel [ic],
    and writes them to bigstring [bstr] starting at position [pos].

    Raises [Invalid_argument] if the designated range is out of bounds.
    Raises [IOError] in the case of input errors, or on premature EOF.
@��@ ����A ���@@@@��C ����D ���@@��1@@ ��2@@ �A@��I ��J ���@��L ��M ���@�����`��?@@ ��@@@ �A�������6 {2 Output functions} @��_ ����` ���@@@@��b ����c ���@@��P@@ ��Q@@ �A��h ����i ���@���Р,really_write��q ����r ��@��@����*file_descr��{ ��| �@@��~ �� �@@@���#pos����#int��� �#�� �&@@��� �#�� �&@@�����~@@ ��@@ �A�������- default = 0 @��� �'�� �9@@@@��� �'�� �9@@���@@ ���@@ �A@���#len����#int��� �:F�� �:I@@��� �:F�� �:I@@���7���@@ ���@@ �A�������? default = [length bstr - pos] @��� �:J�� �:n@@@@��� �:J�� �:n@@���@@ ���@@ �A@��@����!t��� �ot�� �ou@@��� �ot�� �ou@@@����$unit��� �v{�� �v@@��� �v{�� �v@@@��� �ot�� �v@@@��� �:?�� �v@@@��� ��� �v@@@��� ��� �v@@@@���r���@@ ���@@ �A�������	� [really_write fd ?pos ?len bstr] writes [len] bytes in bigstring [bstr] starting at
    position [pos] to file descriptor [fd].

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises [IOError]
    in the case of output errors. @��� ����  �_�@@@@�� ���� �_�@@���@@ ���@@ �A@�� ����	 �v@�� ���� �v@���Р6really_send_no_sigpipe�� ���� ���@�����(Or_error!t�� �%+� �%5@���@����*file_descr��) ����* ���@@��, ����- ���@@@���#pos����#int��8 ����9 ���@@��; ����< ���@@������,@@ ��-@@ �A�������- default = 0 @��L ����M ���@@@@��O ����P ���@@��=@@ ��>@@ �A@���#len����#int��^ ����_ ���@@��a ����b ���@@�����R@@ ��S@@ �A�������? default = [length bstr - pos] @��r ����s ��@@@@��u ����v ��@@��c@@ ��d@@ �A@��@����!t��� ��� �@@��� ��� �@@@����$unit��� � �� �$@@��� � �� �$@@@��� ��� �$@@@��� ����� �$@@@��� ����� �$@@@��� ����� �$@@@@��� ����� �%5@@@@���#���@@ ���@@ �A�������
  � [really_send_no_sigpipe sock ?pos ?len bstr] sends [len] bytes in bigstring [bstr]
    starting at position [pos] to socket [sock] without blocking and ignoring [SIGPIPE].

    Raises [Invalid_argument] if the designated range is out of bounds.
    Raises [IOError] in the case of output errors.

    [really_send_no_sigpipe] is not implemented on some platforms, in which case it
    returns an [Error] value indicating that it is unimplemented. @��� �66�� ���@@@@��� �66�� ���@@���@@ ���@@ �A@��� ����� �%5@��� ����� �%5@���Р;send_nonblocking_no_sigpipe��� ���� ��@�����(Or_error!t��� ����� ���@���@����*file_descr��� �"�� �,@@��� �"�� �,@@@���#pos����#int��� �-<�� �-?@@��� �-<�� �-?@@���p���@@ ���@@ �A�������- default = 0 @��� �-@�� �-R@@@@��  �-@� �-R@@���@@ ���@@ �A@���#len����#int�� �Sb� �Se@@�� �Sb� �Se@@������	@@ ��	@@ �A�������? default = [length bstr - pos] @��# �Sf�$ �S�@@@@��& �Sf�' �S�@@��	@@ ��	@@ �A@��@����!t��3 ����4 ���@@��6 ����7 ���@@@������.Syscall_result#Int!t��B ����C ���@@��E ����F ���@@@��H ����I ���@@@��K �S[�L ���@@@��N �-5�O ���@@@��Q �"�R ���@@@@��T �!�U ���@@@@���ذ�	E@@ ��	F@@ �A�������	� [send_nonblocking_no_sigpipe sock ?pos ?len bstr] tries to send [len] bytes in
    bigstring [bstr] starting at position [pos] to socket [sock]. Returns [bytes_written].

    Raises [Invalid_argument] if the designated range is out of bounds. @��e ����f �r�@@@@��h ����i �r�@@��	V@@ ��	W@@ �A@��n ����o ���@��q ����r ���@���Р=sendto_nonblocking_no_sigpipe��z ����{ ���@�����(Or_error!t��� ����� ���@���@����*file_descr��� ����� ���@@��� ����� ���@@@���#pos����#int��� ����� ��@@��� ����� ��@@���%��	�@@ ��	�@@ �A�������- default = 0 @��� ���� ��@@@@��� ���� ��@@��	�@@ ��	�@@ �A@���#len����#int��� �%�� �(@@��� �%�� �(@@���K��	�@@ ��	�@@ �A�������? default = [length bstr - pos] @��� �)�� �M@@@@��� �)�� �M@@��	�@@ ��	�@@ �A@��@����!t��� �NV�� �NW@@��� �NV�� �NW@@@��@����(sockaddr��� �X`�� �Xh@@��� �X`�� �Xh@@@������.Syscall_result#Int!t��	 �iq�	 �i�@@��	 �iq�	 �i�@@@��	
 �X`�	 �i�@@@��	 �NV�	 �i�@@@��	 ��	 �i�@@@��	 ����	 �i�@@@��	 ����	 �i�@@@@��	 ����	 ���@@@@������

@@ ��
@@ �A�������
   [sendto_nonblocking_no_sigpipe sock ?pos ?len bstr sockaddr] tries to send [len] bytes
    in bigstring [bstr] starting at position [pos] to socket [sock] using address
    [addr]. Returns [bytes_written].

    Raises [Invalid_argument] if the designated range is out of bounds. @��	* ����	+ �j�@@@@��	- ����	. �j�@@��
@@ ��
@@ �A@��	3 ����	4 ���@��	6 ����	7 ���@���Р%write��	? ����	@ ���@��@����*file_descr��	I ����	J ���@@��	L ����	M ���@@@���#pos����#int��	X ����	Y ���@@��	[ ����	\ ���@@���߰�
L@@ ��
M@@ �A�������- default = 0 @��	l ����	m ���@@@@��	o ����	p ���@@��
]@@ ��
^@@ �A@���#len����#int��	~ ����	 ��@@��	� ����	� ��@@���	��
r@@ ��
s@@ �A�������? default = [length bstr - pos] @��	� ���	� ��'@@@@��	� ���	� ��'@@��
�@@ ��
�@@ �A@��@����!t��	� �(-�	� �(.@@��	� �(-�	� �(.@@@����#int��	� �/4�	� �/7@@��	� �/4�	� �/7@@@��	� �(-�	� �/7@@@��	� ����	� �/7@@@��	� ����	� �/7@@@��	� ����	� �/7@@@@���	@��
�@@ ��
�@@ �A�������
  ) [write fd ?pos ?len bstr] writes [len] bytes in bigstring [bstr] starting at position
    [pos] to file descriptor [fd].  Returns the number of bytes actually written.

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises
    [Unix_error] in the case of output errors. @��	� �88�	� �5f@@@@��	� �88�	� �5f@@��
�@@ ��
�@@ �A@��	� ����	� �/7@��	� ����	� �/7@���Р?pwrite_assume_fd_is_nonblocking��	� �hl�	� �h�@��@����*file_descr��	� ����	� ���@@��	� ����	� ���@@@���&offset����#int��	� ����	� ���@@��	� ����	� ���@@@���#pos����#int��

 ����
 ���@@��
 ����
 ���@@���	���
�@@ ��
�@@ �A�������- default = 0 @��
 ����
 ���@@@@��
! ����
" ���@@��@@ ��@@ �A@���#len����#int��
0 ����
1 ���@@��
3 ����
4 ���@@���	���$@@ ��%@@ �A�������? default = [length bstr - pos] @��
D ����
E �� @@@@��
G ����
H �� @@��5@@ ��6@@ �A@��@����!t��
T �  �
U �  @@��
W �  �
X �  @@@����#int��
_ �  �
` �  @@��
b �  �
c �  @@@��
e �  �
f �  @@@��
h ����
i �  @@@��
k ����
l �  @@@��
n ����
o �  @@@��
q ����
r �  @@@@���	���b@@ ��c@@ �A�������
  � [pwrite_assume_fd_is_nonblocking fd ~offset ?pos ?len bstr] writes up to [len] bytes
    of bigstring [bstr] starting at position [pos] to file descriptor [fd] at position
    [offset].  The [fd] must be capable of seeking, and the current file offset used for
    non-positional [read()]/[write()] calls is unchanged. Returns the number of bytes
    written.

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises
    [Unix_error] in the case of output errors. @��
� �  �
� �!�"@@@@��
� �  �
� �!�"@@��s@@ ��t@@ �A@��
� �hh�
� �  @��
� �hh�
� �  @���Р>write_assume_fd_is_nonblocking��
� �""
�
� �""(@��@����*file_descr��
� �")".�
� �")"8@@��
� �")".�
� �")"8@@@���#pos����#int��
� �"9"E�
� �"9"H@@��
� �"9"E�
� �"9"H@@���
7���@@ ���@@ �A�������- default = 0 @��
� �"9"I�
� �"9"[@@@@��
� �"9"I�
� �"9"[@@���@@ ���@@ �A@���#len����#int��
� �"\"h�
� �"\"k@@��
� �"\"h�
� �"\"k@@���
]���@@ ���@@ �A�������? default = [length bstr - pos] @��
� �"\"l�
� �"\"�@@@@��
� �"\"l�
� �"\"�@@���@@ ���@@ �A@��@����!t��
� �"�"��
� �"�"�@@��
� �"�"��
� �"�"�@@@����#int�� �"�"�� �"�"�@@�� �"�"��	 �"�"�@@@�� �"�"�� �"�"�@@@�� �"\"a� �"�"�@@@�� �"9">� �"�"�@@@�� �")".� �"�"�@@@@���
���@@ ��@@ �A�������
  m [write_assume_fd_is_nonblocking fd ?pos ?len bstr] writes [len] bytes in bigstring
    [bstr] starting at position [pos] to file descriptor [fd] without yielding to other
    OCaml-threads. Returns the number of bytes actually written.

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises
    [Unix_error] in the case of output errors. @��% �"�"��& �#�$@@@@��( �"�"��) �#�$@@��@@ ��@@ �A@��. �""�/ �"�"�@��1 �""�2 �"�"�@���Р&writev��: �$$�; �$$@��@����*file_descr��D �$ $%�E �$ $/@@��G �$ $%�H �$ $/@@@���%count����#int��S �$0$>�T �$0$A@@��V �$0$>�W �$0$A@@���
ڰ�G@@ ��H@@ �A�������	! default = [Array.length iovecs] @��g �$0$B�h �$0$h@@@@��j �$0$B�k �$0$h@@��X@@ ��Y@@ �A@��@����%array��w �$i$��x �$i$�@�������)Core_unix%IOVec!t��� �$i$p�� �$i$�@�����!t��� �$i$n�� �$i$o@@��� �$i$n�� �$i$o@@@@��� �$i$n�� �$i$�@@@@��� �$i$n�� �$i$�@@@����#int��� �$�$��� �$�$�@@��� �$�$��� �$�$�@@@��� �$i$n�� �$�$�@@@��� �$0$5�� �$�$�@@@��� �$ $%�� �$�$�@@@@���.���@@ ���@@ �A�������	� [writev fd ?count iovecs] writes [count] [iovecs] of bigstrings to file descriptor
    [fd]. Returns the number of bytes written.

    Raises [Invalid_argument] if [count] is out of range.  Raises [Unix_error] in the case
    of output errors. @��� �$�$��� �%s%�@@@@��� �$�$��� �%s%�@@���@@ ���@@ �A@��� �$$�� �$�$�@��� �$$�� �$�$�@���Р?writev_assume_fd_is_nonblocking��� �%�%��� �%�%�@��@����*file_descr��� �%�%��� �%�%�@@��� �%�%��� �%�%�@@@���%count����#int��� �%�%��� �%�%�@@��� �%�%��� �%�%�@@���p���@@ ���@@ �A�������	! default = [Array.length iovecs] @��� �%�%��� �%�%�@@@@��  �%�%�� �%�%�@@���@@ ���@@ �A@��@����%array�� �%�&� �%�&@�������)Core_unix%IOVec!t�� �%�&� �%�&@�����!t��# �%�%��$ �%�& @@��& �%�%��' �%�& @@@@��) �%�%��* �%�&@@@@��, �%�%��- �%�&@@@����#int��4 �&&�5 �&&!@@��7 �&&�8 �&&!@@@��: �%�%��; �&&!@@@��= �%�%��> �&&!@@@��@ �%�%��A �&&!@@@@���İ�1@@ ��2@@ �A�������
  Q [writev_assume_fd_is_nonblocking fd ?count iovecs] writes [count] [iovecs] of
    bigstrings to file descriptor [fd] without yielding to other OCaml-threads. Returns
    the number of bytes actually written.

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises
    [Unix_error] in the case of output errors. @��Q �&"&"�R'G'x@@@@��T �&"&"�U'G'x@@��B@@ ��C@@ �A@��Z �%�%��[ �&&!@��] �%�%��^ �&&!@���Р	!recvmmsg_assume_fd_is_nonblocking��f'z'~�g'z'�@�����(Or_error!t��p(R(X�q(R(b@���@����*file_descr��{'�'��|'�'�@@��~'�'��'�'�@@@���%count����#int���'�'���'�'�@@���'�'���'�'�@@�����~@@ ��@@ �A�������	! default = [Array.length iovecs] @���'�'���'�'�@@@@���'�'���'�'�@@���@@ ���@@ �A@���$srcs����%array���	'�(��	'�(
@�����(sockaddr���	'�'���	'�(@@���	'�'���	'�(@@@@���	'�'���	'�(
@@@��@����%array���
(('��
((,@�������)Core_unix%IOVec!t���
((��
((&@�����!t���
((��
((@@���
((��
((@@@@���
((��
((&@@@@���
((��
((,@@@���$lens����%array���(-(@��(-(E@�����#int���(-(<��(-(?@@�� (-(<�(-(?@@@@��(-(<�(-(E@@@����#int��(F(N�(F(Q@@��(F(N�(F(Q@@@��(-(5�(F(Q@@@��
((�(F(Q@@@��	'�'��(F(Q@@@��'�'��(F(Q@@@��'�'��(F(Q@@@@�� '�'��!(R(b@@@@@��#'z'z�$(R(b@��&'z'z�'(R(b@���Р	(unsafe_recvmmsg_assume_fd_is_nonblocking��/(d(h�0(d(�@�����(Or_error!t��9))�:))"@���@����*file_descr��D(�(��E(�(�@@��G(�(��H(�(�@@@��@����%array��Q(�(��R(�(�@�������)Core_unix%IOVec!t��^(�(��_(�(�@�����!t��g(�(��h(�(�@@��j(�(��k(�(�@@@@��m(�(��n(�(�@@@@��p(�(��q(�(�@@@��@����#int��z(�(��{(�(�@@��}(�(��~(�(�@@@��@����&option���(�(���(�(�@�����%array���(�(���(�(�@�����(sockaddr���(�(���(�(�@@���(�(���(�(�@@@@���(�(���(�(�@@@@���(�(���(�(�@@@��@����%array���(�(���(�)@�����#int���(�(���(�(�@@���(�(���(�(�@@@@���(�(���(�)@@@����#int���))��))@@���))��))@@@���(�(���))@@@���(�(���))@@@���(�(���))@@@���(�(���))@@@���(�(���))@@@@���(�(���))"@@@@@���(d(d��))"@���(d(d��))"@��������@@ ���@@ �A�������
  � [recvmmsg_assume_fd_is_nonblocking fd iovecs ~count ~lens] receives up to [count]
    messages into [iovecs] from file descriptor [fd] without yielding to other OCaml
    threads. If [~count] is supplied, it must be that [0 <= count <= Array.length
    iovecs]. If [~srcs] is supplied, saves the source addresses for corresponding received
    messages there.  If supplied, [Array.length srcs] must be [>= count]. Saves the
    lengths of the received messages in [lens]. It is required that [Array.length lens >=
    count].

    If an IOVec isn't long enough for its corresponding message, excess bytes may be
    discarded, depending on the type of socket the message is received from.  While the
    [recvmmsg] system call itself does return details of such truncation, etc., those
    details are not (yet) passed through this interface.

    See ["recvmmsg(2)"] re. the underlying system call.

    Returns the number of messages actually read, or a negative number to indicate
    [EWOULDBLOCK] or [EAGAIN]. This is a compromise to mitigate the exception overhead for
    what ends up being a very common result with our use of [recvmmsg].

    Raises [Invalid_argument] if the designated range is out of bounds.  Raises
    [Unix_error] in the case of output errors. @���)$)$��,-�.%@@@@���)$)$��,-�.%@@���@@ ���@@ �A���)$)$��,-�.%@���Р>sendmsg_nonblocking_no_sigpipe��..'.+�..'.I@�����(Or_error!t��3.�.��3.�.�@���@����*file_descr��/.J.O�/.J.Y@@��/.J.O�/.J.Y@@@���%count����#int��'0.Z.k�(0.Z.n@@��*0.Z.k�+0.Z.n@@������@@ ��@@ �A�������	! default = [Array.length iovecs] @��;0.Z.o�<0.Z.�@@@@��>0.Z.o�?0.Z.�@@��,@@ ��-@@ �A@��@����%array��K1.�.��L1.�.�@�������)Core_unix%IOVec!t��X1.�.��Y1.�.�@�����!t��a1.�.��b1.�.�@@��d1.�.��e1.�.�@@@@��g1.�.��h1.�.�@@@@��j1.�.��k1.�.�@@@����&option��r2.�.��s2.�.�@�����#int��{2.�.��|2.�.�@@��~2.�.��2.�.�@@@@���2.�.���2.�.�@@@���1.�.���2.�.�@@@���0.Z.b��2.�.�@@@���/.J.O��2.�.�@@@@���/.J.N��3.�.�@@@@�����~@@ ��@@ �A�������
  � [sendmsg_nonblocking_no_sigpipe sock ?count iovecs] sends [count] [iovecs] of
    bigstrings to socket [sock]. Returns [Some bytes_written], or [None] if the operation
    would have blocked.  This system call will not cause signal [SIGPIPE] if an attempt is
    made to write to a socket that was closed by the other side.

    Raises [Invalid_argument] if [count] is out of range.  Raises [Unix_error] in the case
    of output errors. @���4.�.���:0�0�@@@@���4.�.���:0�0�@@���@@ ���@@ �A@���..'.'��3.�.�@���..'.'��3.�.�@���Р&output���<0�0���<0�0�@���'min_len����#int���=0�0���=0�0�@@���=0�0���=0�0�@@���F���@@ ���@@ �A�������- default = 0 @���=0�0���=0�0�@@@@���=0�0���=0�0�@@���@@ ���@@ �A@��@�����+Out_channel!t���>0�0���>0�0�@@���>0�0���>0�0�@@@���#pos����#int���?0�0���?0�0�@@���?0�0���?0�0�@@���{���@@ ���@@ �A�������- default = 0 @��?0�0��	?0�1@@@@��?0�0��?0�1@@���@@ ���@@ �A@���#len����#int��@11�@11@@��@11�@11@@������@@ ��@@ �A�������? default = [length bstr - pos] @��.@11�/@116@@@@��1@11�2@116@@��@@ �� @@ �A@��@����!t��>A171<�?A171=@@��AA171<�BA171=@@@����#int��IB1>1C�JB1>1F@@��LB1>1C�MB1>1F@@@��OA171<�PB1>1F@@@��R@11�SB1>1F@@@��U?0�0��VB1>1F@@@��X>0�0��YB1>1F@@@��[=0�0��\B1>1F@@@@���߰�L@@ ��M@@ �A�������
  P [output ?min_len oc ?pos ?len bstr] tries to output [len] bytes (guarantees to write
    at least [min_len] bytes, which must be [>= 0]), if possible, before returning, from
    bigstring [bstr] starting at position [pos] to output channel [oc]. Returns the
    number of bytes actually written.

    NOTE: You may need to flush [oc] to make sure that the data is actually sent.

    NOTE: If [len] characters fit into the channel buffer completely, they will be
    buffered.  Otherwise writes will be attempted until at least [min_len] characters have
    been sent.

    Raises [Invalid_argument] if the designated range is out of bounds.

    Raises [IOError] in the case of output errors. The [IOError] argument counting the
    number of successful bytes includes those that have been transferred to the channel
    buffer before the error. @��lC1G1G�mR4}4�@@@@��oC1G1G�pR4}4�@@��]@@ ��^@@ �A@��u<0�0��vB1>1F@��x<0�0��yB1>1F@���Р-really_output���T4�4���T4�4�@��@�����+Out_channel!t���U4�4���U4�4�@@���U4�4���U4�4�@@@���#pos����#int���V4�4���V4�4�@@���V4�4���V4�4�@@���#���@@ ���@@ �A�������- default = 0 @���V4�4���V4�4�@@@@���V4�4���V4�4�@@���@@ ���@@ �A@���#len����#int���W4�4���W4�4�@@���W4�4���W4�4�@@���I���@@ ���@@ �A�������? default = [length bstr - pos] @���W4�4���W4�5@@@@���W4�4���W4�5@@���@@ ���@@ �A@��@����!t���X55 ��X55!@@���X55 ��X55!@@@����$unit���Y5"5'��Y5"5+@@���Y5"5'��Y5"5+@@@���X55 ��Y5"5+@@@���W4�4���Y5"5+@@@���V4�4���Y5"5+@@@�� U4�4��Y5"5+@@@@�������@@ ���@@ �A�������
  � [really_output oc ?pos ?len bstr] outputs exactly [len] bytes from bigstring [bstr]
    starting at position [pos] to output channel [oc].

    Raises [Invalid_argument] if the designated range is out of bounds.

    Raises [IOError] in the case of output errors.  The [IOError] argument counting the
    number of successful bytes includes those that have been transferred to the channel
    buffer before the error. @��Z5,5,�a6�6�@@@@��Z5,5,�a6�6�@@��@@ ��@@ �A@��T4�4��Y5"5+@��T4�4��Y5"5+@�����1��@@ ��@@ �A�������6 {2 Unsafe functions} @��0c6�6��1c6�6�@@@@��3c6�6��4c6�6�@@��!@@ ��"@@ �A��9c6�6��:c6�6�@���Р	$unsafe_read_assume_fd_is_nonblocking��Be6�6��Ce6�7 @��@����*file_descr��Lf7!7%�Mf7!7/@@��Of7!7%�Pf7!7/@@@���#pos����#int��[f7!79�\f7!7<@@��^f7!79�_f7!7<@@@���#len����#int��jf7!7F�kf7!7I@@��mf7!7F�nf7!7I@@@��@����!t��wf7!7M�xf7!7N@@��zf7!7M�{f7!7N@@@������.Syscall_result#Int!t���f7!7R��f7!7f@@���f7!7R��f7!7f@@@���f7!7M��f7!7f@@@���f7!7@��f7!7f@@@���f7!73��f7!7f@@@���f7!7%��f7!7f@@@�	,bigstring_read_assume_fd_is_nonblocking_stub@������@@ ���@@ �A�������	� [unsafe_read_assume_fd_is_nonblocking fd ~pos ~len bstr] is similar to
    {!Bigstring.read_assume_fd_is_nonblocking}, but does not perform any bounds checks.
    Will crash on bounds errors! @���h7�7���j8=8`@@@@���h7�7���j8=8`@@���@@ ���@@ �A@���e6�6���g7g7�@���e6�6���g7g7�@���Р,unsafe_write���l8b8k��l8b8w@��@����*file_descr���m8x8|��m8x8�@@���m8x8|��m8x8�@@@���#pos����#int���m8x8���m8x8�@@���m8x8���m8x8�@@@���#len����#int���m8x8���m8x8�@@���m8x8���m8x8�@@@��@����!t���m8x8���m8x8�@@���m8x8���m8x8�@@@����#int���m8x8���m8x8�@@�� m8x8��m8x8�@@@��m8x8��m8x8�@@@��m8x8��m8x8�@@@��	m8x8��
m8x8�@@@��m8x8|�m8x8�@@@�4bigstring_write_stub@�������@@ �� @@ �A�������	� [unsafe_write fd ~pos ~len bstr] is similar to {!Bigstring.write}, but does not
    perform any bounds checks.  Will crash on bounds errors! @��o8�8�� p99[@@@@��"o8�8��#p99[@@��@@ ��@@ �A@��(l8b8b�)n8�8�@��+l8b8b�,n8�8�@���Р	%unsafe_write_assume_fd_is_nonblocking��4r9]9f�5r9]9�@��@����*file_descr��>s9�9��?s9�9�@@��As9�9��Bs9�9�@@@���#pos����#int��Ms9�9��Ns9�9�@@��Ps9�9��Qs9�9�@@@���#len����#int��\s9�9��]s9�9�@@��_s9�9��`s9�9�@@@��@����!t��is9�9��js9�9�@@��ls9�9��ms9�9�@@@����#int��ts9�9��us9�9�@@��ws9�9��xs9�9�@@@��zs9�9��{s9�9�@@@��}s9�9��~s9�9�@@@���s9�9���s9�9�@@@���s9�9���s9�9�@@@�	-bigstring_write_assume_fd_is_nonblocking_stub@���	��v@@ ��w@@ �A�������	� [unsafe_write_assume_fd_is_nonblocking fd ~pos ~len bstr] is similar to
    {!Bigstring.write_assume_fd_is_nonblocking}, but does not perform any bounds checks.
    Will crash on bounds errors! @���u9�9���w:�:�@@@@���u9�9���w:�:�@@���@@ ���@@ �A@���r9]9]��t9�9�@���r9]9]��t9�9�@���Р+unsafe_read���y:�:���y:�:�@���'min_len����#int���z:�:���z:�:�@@���z:�:���z:�:�@@@��@����*file_descr���z:�:���z:�:�@@���z:�:���z:�:�@@@���#pos����#int���z:�:���z:�; @@���z:�:���z:�; @@@���#len����#int���z:�;
��z:�;@@���z:�;
��z:�;@@@��@����!t���z:�;��z:�;@@���z:�;��z:�;@@@����#int���z:�;��z:�;@@���z:�;��z:�;@@@�� z:�;�z:�;@@@��z:�;�z:�;@@@��z:�:��z:�;@@@��	z:�:��
z:�;@@@��z:�:��z:�;@@@�3bigstring_read_stub@�������@@ �� @@ �A�������	� [unsafe_read ~min_len fd ~pos ~len bstr] is similar to {!Bigstring.read}, but does not
    perform any bounds checks.  Will crash on bounds errors! @��|;4;4� };�;�@@@@��"|;4;4�#};�;�@@��@@ ��@@ �A@��(y:�:��){;;3@��+y:�:��,{;;3@���Р2unsafe_really_recv��4;�;��5;�;�@��@����*file_descr��>�;�;��?�;�;�@@��A�;�;��B�;�;�@@@���#pos����#int��M�;�<�N�;�<@@��P�;�<�Q�;�<@@@���#len����#int��\�;�<�]�;�<@@��_�;�<�`�;�<@@@��@����!t��i�;�<�j�;�<@@��l�;�<�m�;�<@@@����$unit��t�;�<�u�;�<!@@��w�;�<�x�;�<!@@@��z�;�<�{�;�<!@@@��}�;�<�~�;�<!@@@����;�;����;�<!@@@����;�;����;�<!@@@�:bigstring_really_recv_stub@���	��v@@ ��w@@ �A�������	� [unsafe_really_recv sock ~pos ~len bstr] is similar to {!Bigstring.really_recv}, but
    does not perform any bounds checks.  Will crash on bounds errors! @����<C<C���<�<�@@@@����<C<C���<�<�@@���@@ ���@@ �A@���;�;����<"<B@���;�;����<"<B@���Р3unsafe_really_write����<�<����<�=@��@����*file_descr����==���==@@����==���==@@@���#pos����#int����==���==@@����==���==@@@���#len����#int����==(���==+@@����==(���==+@@@��@����!t����==/���==0@@����==/���==0@@@����$unit����==4���==8@@����==4���==8@@@����==/���==8@@@����=="���==8@@@����==���==8@@@����==���==8@@@�;bigstring_really_write_stub@�������@@ ���@@ �A�������	� [unsafe_really_write fd ~pos ~len bstr] is similar to {!Bigstring.write}, but does not
    perform any bounds checks.  Will crash on bounds errors! @���=[=[��=�=�@@@@���=[=[��=�=�@@���@@ ���@@ �A@���<�<���=9=Z@���<�<���=9=Z@���Р=unsafe_really_send_no_sigpipe��"�>�>��#�>�>�@�����(Or_error!t��,�>�>��-�>�?@���@����*file_descr��7�>�>��8�>�>�@@��:�>�>��;�>�>�@@@���#pos����#int��F�>�>��G�>�>�@@��I�>�>��J�>�>�@@@���#len����#int��U�>�>��V�>�>�@@��X�>�>��Y�>�>�@@@��@����!t��b�>�>��c�>�>�@@��e�>�>��f�>�>�@@@����$unit��m�>�>��n�>�>�@@��p�>�>��q�>�>�@@@��s�>�>��t�>�>�@@@��v�>�>��w�>�>�@@@��y�>�>��z�>�>�@@@��|�>�>��}�>�>�@@@@���>�>����>�?@@@@�����p@@ ��q@@ �A�������	� [unsafe_really_send_no_sigpipe sock ~pos ~len bstr] is similar to {!Bigstring.send},
    but does not perform any bounds checks.  Will crash on bounds errors! @����=�=����>P>�@@@@����=�=����>P>�@@���@@ ���@@ �A@����>�>����>�?@����>�>����>�?@���Р	"unsafe_send_nonblocking_no_sigpipe����?�?����?�?�@�����(Or_error!t����@7@=���@7@G@���@����*file_descr����?�?����?�?�@@����?�?����?�?�@@@���#pos����#int����?�@���?�@@@����?�@���?�@@@@���#len����#int����?�@���?�@@@����?�@���?�@@@@��@����!t����?�@���?�@@@����?�@���?�@@@@������.Syscall_result#Int!t����?�@!���?�@5@@����?�@!���?�@5@@@����?�@���?�@5@@@����?�@���?�@5@@@�� �?�@��?�@5@@@���?�?���?�@5@@@@���?�?���@7@G@@@@�������@@ ���@@ �A�������	� [unsafe_send_nonblocking_no_sigpipe sock ~pos ~len bstr] is similar to
    {!Bigstring.send_nonblocking_no_sigpipe}, but does not perform any bounds checks.
    Will crash on bounds errors! @���??��?�?�@@@@���??��?�?�@@��@@ ��	@@ �A@�� �?�?��!�@7@G@��#�?�?��$�@7@G@���Р-unsafe_writev��,�@I@R�-�@I@_@��@����*file_descr��6�@`@d�7�@`@n@@��9�@`@d�:�@`@n@@@��@����%array��C�@`@��D�@`@�@�������)Core_unix%IOVec!t��P�@`@t�Q�@`@�@�����!t��Y�@`@r�Z�@`@s@@��\�@`@r�]�@`@s@@@@��_�@`@r�`�@`@�@@@@��b�@`@r�c�@`@�@@@��@����#int��l�@`@��m�@`@�@@��o�@`@��p�@`@�@@@����#int��w�@`@��x�@`@�@@��z�@`@��{�@`@�@@@��}�@`@��~�@`@�@@@����@`@r���@`@�@@@����@`@d���@`@�@@@�5bigstring_writev_stub@���	��v@@ ��w@@ �A�������	� [unsafe_writev fd iovecs count] is similar to {!Bigstring.writev}, but does not
    perform any bounds checks.  Will crash on bounds errors! @����@�@����A
AI@@@@����@�@����A
AI@@���@@ ���@@ �A@����@I@I���@�@�@����@I@I���@�@�@���Р	%unsafe_sendmsg_nonblocking_no_sigpipe����BB���BB;@�����(Or_error!t����B<B���B<B�@���@����*file_descr����B<BA���B<BK@@����B<BA���B<BK@@@��@����%array����B<Bc���B<Bh@�������)Core_unix%IOVec!t����B<BQ���B<Bb@�����!t����B<BO���B<BP@@����B<BO���B<BP@@@@����B<BO���B<Bb@@@@����B<BO���B<Bh@@@��@����#int����B<Bl���B<Bo@@����B<Bl���B<Bo@@@����&option���B<Bw��B<B}@�����#int��
�B<Bs��B<Bv@@���B<Bs��B<Bv@@@@���B<Bs��B<B}@@@���B<Bl��B<B}@@@���B<BO��B<B}@@@���B<BA��B<B}@@@@���B<B@��B<B�@@@@������@@ ��@@ �A�������	� [unsafe_sendmsg_nonblocking_no_sigpipe fd iovecs count] is similar to
    {!Bigstring.sendmsg_nonblocking_no_sigpipe}, but does not perform any bounds checks.
    Will crash on bounds errors! @��-�AKAK�.�A�B@@@@��0�AKAK�1�A�B@@��@@ ��@@ �A@��6�BB�7�B<B�@��9�BB�:�B<B�@���Р,unsafe_input��B�B�B��C�B�B�@���'min_len����#int��N�B�B��O�B�B�@@��Q�B�B��R�B�B�@@@��@�����*In_channel!t��]�B�B��^�B�B�@@��`�B�B��a�B�B�@@@���#pos����#int��l�B�B��m�B�B�@@��o�B�B��p�B�B�@@@���#len����#int��{�B�B��|�B�B�@@��~�B�B���B�B�@@@��@����!t����B�B����B�B�@@����B�B����B�B�@@@����#int����B�B����B�B�@@����B�B����B�B�@@@����B�B����B�B�@@@����B�B����B�B�@@@����B�B����B�B�@@@����B�B����B�B�@@@����B�B����B�B�@@@�4bigstring_input_stub@���+���@@ ���@@ �A�������	� [unsafe_input ~min_len ic ~pos ~len bstr] is similar to {!Bigstring.input}, but does
    not perform any bounds checks. Will crash on bounds errors! @����CC���C]C�@@@@����CC���C]C�@@���@@ ���@@ �A@����B�B����B�C@����B�B����B�C@���Р-unsafe_output����C�C����C�C�@���'min_len����#int����C�C����C�C�@@����C�C����C�C�@@@��@�����+Out_channel!t����C�C����C�C�@@����C�C����C�C�@@@���#pos����#int����C�C����C�C�@@����C�C����C�C�@@@���#len����#int���C�C���C�C�@@��	�C�C��
�C�C�@@@��@����!t���C�C���C�C�@@���C�C���C�C�@@@����#int���C�C���C�D @@��!�C�C��"�C�D @@@��$�C�C��%�C�D @@@��'�C�C��(�C�D @@@��*�C�C��+�C�D @@@��-�C�C��.�C�D @@@��0�C�C��1�C�D @@@�5bigstring_output_stub@������#@@ ��$@@ �A�������	� [unsafe_output ~min_len oc ~pos ~len bstr] is similar to {!Bigstring.output}, but does
    not perform any bounds checks.  Will crash on bounds errors! @��C�DD�D�DxD�@@@@��F�DD�G�DxD�@@��4@@ ��5@@ �A@��L�C�C��M�DD@��O�C�C��P�DD@�����c��B@@ ��C@@ �A�������4 {2 Memory mapping} @��b�D�D��c�D�D�@@@@��e�D�D��f�D�D�@@��S@@ ��T@@ �A��k�D�D��l�D�D�@���Р(map_file��t�D�D��u�D�D�@���&shared����$bool����D�D����D�D�@@����D�D����D�D�@@@��@�����$Unix*file_descr����D�D����D�E@@����D�D����D�E@@@��@����#int����D�E���D�E@@����D�E���D�E@@@����!t����D�E���D�E@@����D�E���D�E@@@����D�E���D�E@@@����D�D����D�E@@@����D�D����D�E@@@@���7���@@ ���@@ �A�������
  P [map_file shared fd n] memory-maps [n] characters of the data associated with
    descriptor [fd] to a bigstring.  Iff [shared] is [true], all changes to the bigstring
    will be reflected in the file.

    Users must keep in mind that operations on the resulting bigstring may result in disk
    operations which block the runtime.  This is true for pure OCaml operations (such as
    [t.{1} <- 1]), and for calls to [blit].  While some I/O operations may release the
    OCaml lock, users should not expect this to be done for all operations on a bigstring
    returned from [map_file].  @����EE���GHGi@@@@����EE���GHGi@@���@@ ���@@ �A@����D�D����D�E@����D�D����D�E@@