Caml1999N026����   2         	0book/duniverse/async_unix.v0.13.0/src/writer.mli���� Sh  +  �D  �������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
  � [Writer] is Async's main API for output to a file descriptor.  It is the analog of
    [Core.Out_channel].

    Each writer has an internal buffer, to which [Writer.write*] adds data. Each writer
    uses an Async cooperative thread that makes [write()] system calls to move the data
    from the writer's buffer to an OS buffer via the file descriptor.

    There is no guarantee that the data sync on the other side of the writer can keep up
    with the rate at which you are writing. If it cannot, the OS buffer will fill up and
    the writer's cooperative thread will be unable to send any bytes. In that case, calls
    to [Writer.write*] will grow the writer's buffer without bound, as long as your
    program produces data. One solution to this problem is to call [Writer.flushed] and
    not continue until that becomes determined, which will only happen once the bytes in
    the writer's buffer have been successfully transferred to the OS buffer. Another
    solution is to check [Writer.bytes_to_write] and not produce any more data if that is
    beyond some bound.

    There are two kinds of errors that one can handle with writers. First, a writer can be
    [close]d, which will cause future [write]s (and other operations) to synchronously
    raise an exception. Second, the writer's cooperative thread can fail due to a
    [write()] system call failing. This will cause an exception to be sent to the writer's
    monitor, which will be a child of the monitor in effect when the writer is created.
    One can deal with such asynchronous exceptions in the usual way, by handling the
    stream returned by [Monitor.detach_and_get_error_stream (Writer.monitor writer)]. @��	0book/duniverse/async_unix.v0.13.0/src/writer.mliA@@�XK�@@@@��A@@�XK�@@���@@ ���@@ �A��
A@@�XK�@������$Core��Z���Z��@@��Z���Z��@@��Z���Z��@������&Import��$[���%[��@@��'[���([��@@��*[���+[��@�����"Id��3\���4\��@����)Unique_id��;\���<\��@��>\���?\��@@@��A\���B\��@��D\���E\��@�����+Line_ending��M^���N^��@�����A�    �!t��Y_���Z_��@@@��Р#Dos��a`���b`�@�@@��e`���f`�@@�Р$Unix��la�ma@�@@��pa�qa@@@A@���(deriving��wb�xb@��������'sexp_of���b��b"@���b��b"@@@@���b��b"@@���b��b#@@���_����b#@@���_����b#@�����������-ocaml.warning���_����b#@�������#-32@���_����b#@@@@���_����b#@@���_����b#@���_����b#@���Р)sexp_of_t���_����_��@��@����o���_����_��@@���_����_��@@@������1Ppx_sexp_conv_lib$Sexp!t���_����_��@@���_����_��@@@���_����_��@@@@@���_����b#@���_����b#@@���_����b#@@���_����b#@���)ocaml.doc���_����b#@�������'@inline@���_����b#@@@@���_����b#@@�� _���b#@@��_���b#@@��^���c$'@@@��	^���
c$'@��^���c$'@���A�    �!t��e).�e)/@@@@A@���(deriving��e)3�e);@��������'sexp_of��)e)<�*e)C@��,e)<�-e)C@@@@��/e)<�0e)C@@��2e)0�3e)D@@��5e))�6e)D@@��8e))�9e)D@��������������Fe))�Ge)D@��������@��Pe))�Qe)D@@@@��Se))�Te)D@@��Ve))�We)D@��Ye))�Ze)D@���Р)sexp_of_t��be).�ce)/@��@����V��ke).�le)/@@��ne).�oe)/@@@�����������we).�xe)/@@��ze).�{e)/@@@��}e).�~e)/@@@@@���e))��e)D@���e))��e)D@@���e))��e)D@@���e))��e)D@�������e))��e)D@��������@���e))��e)D@@@@���e))��e)D@@���e))��e)D@@���e))��e)D@�����������)Invariant!S���gFN��gFY@���gFN��gFY@@����!t���gFd��gFe@    ����gFd��gFe@@@@A�����!t���gFi��gFj@@���gFi��gFj@@@@���gF_��gFj@@���gFN��gFj@@���gFF��gFj@@���gFF��gFj@���Р(io_stats���j����j��@�����(Io_stats!t���j����j��@@���j����j��@@@@���)ocaml.doc���@@ ���@@ �A�������	( Overall IO statistics for all writers. @��ill�il�@@@@��ill�il�@@���@@ ���@@ �A@��j���j��@��j���j��@���Р&stdout�������@�����$Lazy!t��!���"��@�����!t��*���+��@@��-���.��@@@@��0���1��@@@@���@��!@@ ��"@@ �A�������
  � [stdout] and [stderr] are writers for file descriptors 1 and 2.  They are lazy because
    we don't want to create them in all programs that happen to link with Async.

    When either [stdout] or [stderr] is created, they both are created.  Furthermore, if
    they point to the same inode, then they will be the same writer to [Fd.stdout].  This
    can be confusing, because [fd (force stderr)] will be [Fd.stdout], not [Fd.stderr].
    And subsequent modifications of [Fd.stderr] will have no effect on [Writer.stderr].

    Unfortunately, the sharing is necessary because Async uses OS threads to do [write()]
    syscalls using the writer buffer.  When calling a program that redirects stdout and
    stderr to the same file, as in:

    {v
      foo.exe >/tmp/z.file 2>&1
    v}

    if [Writer.stdout] and [Writer.stderr] weren't the same writer, then they could have
    threads simultaneously writing to the same file, which could easily cause data
    loss. @��Al���B~x�@@@@��Dl���E~x�@@��2@@ ��3@@ �A@��J���K��@��M���N��@���Р&stderr��V A���W A��@�����$Lazy!t��` A���a A��@�����!t��i A���j A��@@��l A���m A��@@@@��o A���p A��@@@@@��r A���s A��@��u A���v A��@���A�    �0buffer_age_limit�� C���� C��@@@@A�������'At_most��� D���� D��@@�������$Time$Span!t��� D���� D��@@��� D���� D��@@@@��� D���� D��@@����)Unlimited��� E���� E��@A@��� E���� E��@@@@@��� D���� F��@@@���(deriving��� G���� G�@�����������&bin_io��� G��� G�@��� G��� G�@@@�����$sexp��� G��� G�@��� G��� G�@@@@��� G��� G�@@@@��� G��� G�@@��� G���� G�@@��� C���� G�@@��� C���� G�@�����������M��� C���� G�@�������L@��� C���� G�@@@@��� C���� G�@@��� C���� G�@��  C��� G�@���Р:bin_shape_buffer_age_limit��	 C���
 C��@������(Bin_prot%Shape!t�� C��� C��@@�� C��� C��@@@@@�� C��� C��@�� C��� C��@���Р9bin_size_buffer_age_limit��' C���( C��@������(Bin_prot$Size%sizer��3 C���4 C��@��������; C���< C��@@��> C���? C��@@@@��A C���B C��@@@@@��D C���E G�@��G C���H G�@���Р:bin_write_buffer_age_limit��P C���Q C��@������(Bin_prot%Write&writer��\ C���] C��@�������d C���e C��@@��g C���h C��@@@@��j C���k C��@@@@@��m C���n G�@��p C���q G�@���Р;bin_writer_buffer_age_limit��y C���z C��@������(Bin_prot*Type_class&writer��� C���� C��@�������� C���� C��@@��� C���� C��@@@@��� C���� C��@@@@@��� C���� G�@��� C���� G�@���Р9bin_read_buffer_age_limit��� C���� C��@������(Bin_prot$Read&reader��� C���� C��@�����8��� C���� C��@@��� C���� C��@@@@��� C���� C��@@@@@��� C���� G�@��� C���� G�@���Р=__bin_read_buffer_age_limit__��� C���� C��@������(Bin_prot$Read&reader��� C���� C��@���@����#int��� C���� G�@@��� C���� G�@@@����n��� C���� C��@@��� C���� C��@@@��� C���� G�@@@@��� C���� C��@@@@@��� C���� G�@��� C���� G�@���Р;bin_reader_buffer_age_limit�� C��� C��@������(Bin_prot*Type_class&reader�� C��� C��@�������� C��� C��@@�� C��� C��@@@@�� C��� C��@@@@@��! C���" G�@��$ C���% G�@���Р4bin_buffer_age_limit��- C���. C��@������(Bin_prot*Type_class!t��9 C���: C��@�����ð�A C���B C��@@��D C���E C��@@@@��G C���H C��@@@@@��J C���K G�@��M C���N G�@���Р8sexp_of_buffer_age_limit��V C���W C��@��@������_ C���` C��@@��b C���c C��@@@�����������k C���l C��@@��n C���o C��@@@��q C���r C��@@@@@��t C���u G�@��w C���x G�@���Р8buffer_age_limit_of_sexp��� C���� C��@��@������1Ppx_sexp_conv_lib$Sexp!t��� C���� C��@@��� C���� C��@@@������� C���� C��@@��� C���� C��@@@��� C���� C��@@@@@��� C���� G�@��� C���� G�@���Р<__buffer_age_limit_of_sexp__��� C���� C��@��@������-,+��� C���� C��@@��� C���� C��@@@����D��� C���� C��@@��� C���� C��@@@��� C���� C��@@@@@��� C���� G�@��� C���� G�@@��� C���� G�@@��� C���� G�@������ C���� G�@��������@��� C���� G�@@@@��� C���� G�@@��� C���� G�@@��� C���� G�@���Р&create��� i���� i��@���'buf_len����#int�� j��� j��@@�� j��� j��@@@���'syscall������)Per_cycle�� k��� k��@A@�� k��� k��@@����(Periodic�� k��� k��@@�������$Time$Span!t��+ k���, k�	@@��. k���/ k�	@@@@��1 k���2 k�	@@@@@��4 k���5 k�@@@���0buffer_age_limit����0buffer_age_limit��@ l#�A l3@@��C l#�D l3@@@���:raise_when_consumer_leaves����$bool��O m4U�P m4Y@@��R m4U�S m4Y@@���b��C@@ ��D@@ �A�������3 default is [true] @��c m4Z�d m4r@@@@��f m4Z�g m4r@@��T@@ ��U@@ �A@���+line_ending�����+Line_ending!t��w ns��x ns�@@��z ns��{ ns�@@������k@@ ��l@@ �A�������3 default is [Unix] @��� ns��� ns�@@@@��� ns��� ns�@@��|@@ ��}@@ �A@���+time_source������+Time_source"T1!t��� o���� o��@����������$read��� o���� o��@@��� o���� o��@@@��� o���� o��@@@A@��� o���� o��@@@@��� o���� o��@@���˰��@@ ���@@ �A�������	( default is [Time_source.wall_clock ()] @��� p���� p�@@@@��� p���� p�@@���@@ ���@@ �A@��@�����"Fd!t��� q	�� q	@@��� q	�� q	@@@����!t��� r�� r@@��� r�� r@@@��� q	�� r@@@��� o���� r@@@��� nsx�� r@@@��� m49�� r@@@��� l�� r@@@��� k���� r@@@�� j��� r@@@@������@@ ���@@ �A�������
  � [create ?buf_len ?syscall ?buffer_age_limit fd] creates a new writer.  The file
    descriptor [fd] should not be in use for writing by anything else.

    By default, a write system call occurs at the end of a cycle in which bytes were
    written.  One can supply [~syscall:(`Periodic span)] to get better performance.  This
    batches writes together, doing the write system call periodically according to the
    supplied span.

    A writer can asynchronously fail if the underlying write syscall returns an error,
    e.g., [EBADF], [EPIPE], [ECONNRESET], ....

    [buffer_age_limit] specifies how backed up you can get before raising an exception.
    The default is [`Unlimited] for files, and 2 minutes for other kinds of file
    descriptors.  You can supply [`Unlimited] to turn off buffer-age checks.

    [raise_when_consumer_leaves] specifies whether the writer should raise an exception
    when the consumer receiving bytes from the writer leaves, i.e., in Unix, the write
    syscall returns [EPIPE] or [ECONNRESET].  If [not raise_when_consumer_leaves], then
    the writer will silently drop all writes after the consumer leaves, and the writer
    will eventually fail with a writer-buffer-older-than error if the application remains
    open long enough.

    [line_ending] determines how [newline] and [write_line] terminate lines by default.
    If [line_ending = Unix] then end of line is ["\n"]; if [line_ending = Dos] then end of
    line is ["\r\n"].  Note that [line_ending = Dos] is not equivalent to opening the file
    in text mode because any "\n" characters being printed by other means (e.g., [write
    "\n"]) are still written verbatim (in Unix style).

    [time_source] is useful in tests to trigger [buffer_age_limit]-related conditions, or
    simply to have the result of (for example) [flushed_time_ns] agree with your test's
    synthetic time.  It is also used to schedule the [`Periodic] syscalls. @�� J� hi�@@@@�� J� hi�@@��@@ ��@@ �A@�� i��� r@�� i��� r@���Р:raise_when_consumer_leaves��' t�( t9@��@����!t��1 t<�2 t=@@��4 t<�5 t=@@@����$bool��< tA�= tE@@��? tA�@ tE@@@��B t<�C tE@@@@@��E t�F tE@��H t�I tE@���Р>set_raise_when_consumer_leaves��Q y�R y<@��@����!t��[ y?�\ y@@@��^ y?�_ y@@@@��@����$bool��h yD�i yH@@��k yD�l yH@@@����$unit��s yL�t yP@@��v yL�w yP@@@��y yD�z yP@@@��| y?�} yP@@@@������m@@ ��n@@ �A�������	� [set_raise_when_consumer_leaves t bool] sets the [raise_when_consumer_leaves] flag of
    [t], which determies how [t] responds to a write system call raising [EPIPE] and
    [ECONNRESET] (see [create]). @��� vGG�� x�@@@@��� vGG�� x�@@��~@@ ��@@ �A@��� y�� yP@��� y�� yP@���Р4set_buffer_age_limit��� ~QU�� ~Qi@��@����!t��� ~Ql�� ~Qm@@��� ~Ql�� ~Qm@@@��@����0buffer_age_limit��� ~Qq�� ~Q�@@��� ~Qq�� ~Q�@@@����$unit��� ~Q��� ~Q�@@��� ~Q��� ~Q�@@@��� ~Qq�� ~Q�@@@��� ~Ql�� ~Q�@@@@���ݰ��@@ ���@@ �A�������	� [set_buffer_age_limit t buffer_age_limit] replaces the existing buffer age limit with
    the new one.  This is useful for stdout and stderr, which are lazily created in a
    context that does not allow applications to specify [buffer_age_limit]. @��� {RR�� }P@@@@��� {RR�� }P@@���@@ ���@@ �A@��� ~QQ�� ~Q�@��� ~QQ�� ~Q�@���Р-consumer_left��� �04�� �0A@��@����!t��� �0D�� �0E@@��  �0D� �0E@@@�����(Deferred!t��
 �0N� �0X@�����$unit�� �0I� �0M@@�� �0I� �0M@@@@�� �0I� �0X@@@�� �0D� �0X@@@@���,��@@ ��@@ �A�������	� [consumer_left t] returns a deferred that becomes determined when [t] attempts to
    write to a pipe that broke because the consumer on the other side left. @��- ����. ��/@@@@��0 ����1 ��/@@��@@ ��@@ �A@��6 �00�7 �0X@��9 �00�: �0X@���Р.of_out_channel��B �Z^�C �Zl@��@�����+Out_channel!t��N �Zo�O �Z|@@��Q �Zo�R �Z|@@@��@������"Fd$Kind!t��_ �Z��` �Z�@@��b �Z��c �Z�@@@����!t��j �Z��k �Z�@@��m �Z��n �Z�@@@��p �Z��q �Z�@@@��s �Zo�t �Z�@@@@@��v �ZZ�w �Z�@��y �ZZ�z �Z�@���Р)open_file��� ��� �#@���&append����$bool��� �$1�� �$5@@��� �$1�� �$5@@�������@@ ���@@ �A�������	. default is [false], meaning truncate instead @��� �$6�� �$i@@@@��� �$6�� �$i@@���@@ ���@@ �A@���'buf_len����#int��� �jx�� �j{@@��� �jx�� �j{@@@���'syscall������)Per_cycle��� �|��� �|�@A@��� �|��� �|�@@����(Periodic��� �|��� �|�@@�������$Time$Span!t��� �|��� �|�@@��� �|��� �|�@@@@��� �|��� �|�@@@@@��� �|��� �|�@@@���$perm����#int��� ����� ���@@��� ����� ���@@������@@ ���@@ �A�������4 default is [0o666] @�� ���� ���@@@@��	 ����
 ���@@���@@ ���@@ �A@���+line_ending�����+Line_ending!t�� ���� ���@@�� ���� ���@@���-��	@@ ��	@@ �A�������3 default is [Unix] @��. ����/ ��@@@@��1 ����2 ��@@��	@@ ��	 @@ �A@���+time_source������+Time_source"T1!t��D �2�E �B@����������$read��R �+�S �/@@��U �+�V �/@@@��X �+�Y �/@@@A@��[ �(�\ �1@@@@��^ �(�_ �B@@���n��	O@@ ��	P@@ �A�������	( default is [Time_source.wall_clock ()] @��o �CE�p �Cr@@@@��r �CE�s �Cr@@��	`@@ ��	a@@ �A@��@����&string�� �sx�� �s~@@��� �sx�� �s~@@@�����(Deferred!t��� ���� ��@�����!t��� ���� ��@@��� ���� ��@@@@��� ���� ��@@@��� �sx�� ��@@@��� ��� ��@@@��� ����� ��@@@��� ����� ��@@@��� �|��� ��@@@��� �jo�� ��@@@��� �$)�� ��@@@@������	�@@ ��	�@@ �A�������	� [open_file file] opens [file] for writing and returns a writer for it.  It uses
    [Unix_syscalls.openfile] to open the file. @��� ����� ��@@@@��� ����� ��@@��	�@@ ��	�@@ �A@��� ��� ��@��� ��� ��@���Р)with_file��� �Z^�� �Zg@���$perm����#int��� �hs�� �hv@@��� �hs�� �hv@@������	�@@ ��	�@@ �A�������4 default is [0o666] @��� �hw�� �h�@@@@��� �hw�� �h�@@��	�@@ ��	�@@ �A@���&append����$bool��	 ����		 ���@@��	 ����	 ���@@�����	�@@ ��	�@@ �A�������	. default is [false], meaning truncate instead @��	 ����	 ���@@@@��	 ����	  ���@@��
@@ ��
@@ �A@���)exclusive����$bool��	. ����	/ ���@@��	1 ����	2 ���@@���A��
"@@ ��
#@@ �A�������4 default is [false] @��	B ����	C ��@@@@��	E ����	F ��@@��
3@@ ��
4@@ �A@���+line_ending�����+Line_ending!t��	V ��	W �%@@��	Y ��	Z �%@@���i��
J@@ ��
K@@ �A�������3 default is [Unix] @��	j �&�	k �>@@@@��	m �&�	n �>@@��
[@@ ��
\@@ �A@���+time_source������+Time_source"T1!t��	� �?[�	� �?k@����������$read��	� �?T�	� �?X@@��	� �?T�	� �?X@@@��	� �?T�	� �?X@@@A@��	� �?Q�	� �?Z@@@@��	� �?Q�	� �?k@@������
�@@ ��
�@@ �A�������	( default is [Time_source.wall_clock ()] @��	� �ln�	� �l�@@@@��	� �ln�	� �l�@@��
�@@ ��
�@@ �A@��@����&string��	� ����	� ���@@��	� ����	� ���@@@���!f��@����!t��	� ����	� ���@@��	� ����	� ���@@@�����(Deferred!t��	� ����	� ���@���!a��	� ����	� ���@@@@��	� ����	� ���@@@��	� ����	� ���@@@�����(Deferred!t��	� ����	� ���@���!a��	� ����	� ���@@@@��	� ����	� ���@@@��	� ����	� ���@@@��
  ����
 ���@@@��
 �?D�
 ���@@@��
 ��
 ���@@@��
	 ����

 ���@@@��
 ����
 ���@@@��
 �hm�
 ���@@@@����� @@ ��@@ �A�������
  � [with_file ~file f] opens [file] for writing, creates a writer [t], and runs [f t] to
    obtain a deferred [d].  When [d] becomes determined, the writer is closed.  When the
    close completes, the result of [with_file] becomes determined with the value of [d].

    There is no need to call [Writer.flushed] to ensure that [with_file] waits for the
    writer to be flushed before closing it.  [Writer.close] will already wait for the
    flush. @��
  ����
! �LY@@@@��
# ����
$ �LY@@��@@ ��@@ �A@��
) �ZZ�
* ���@��
, �ZZ�
- ���@���Р"id��
5 �*.�
6 �*0@��@����!t��
? �*3�
@ �*4@@��
B �*3�
C �*4@@@�����"Id!t��
L �*8�
M �*<@@��
O �*8�
P �*<@@@��
R �*3�
S �*<@@@@���b��C@@ ��D@@ �A�������	L [id] returns an id for this writer that is unique among all other writers. @��
c ����
d ��)@@@@��
f ����
g ��)@@��T@@ ��U@@ �A@��
l �**�
m �*<@��
o �**�
p �*<@���Р"fd��
x �y}�
y �y@��@����!t��
� �y��
� �y�@@��
� �y��
� �y�@@@�����"Fd!t��
� �y��
� �y�@@��
� �y��
� �y�@@@��
� �y��
� �y�@@@@�������@@ ���@@ �A�������	5 [fd] returns the [Fd.t] used to create this writer. @��
� �>>�
� �>x@@@@��
� �>>�
� �>x@@���@@ ���@@ �A@��
� �yy�
� �y�@��
� �yy�
� �y�@���Р&set_fd��
� ����
� ���@��@����!t��
� ����
� ���@@��
� ����
� ���@@@��@�����"Fd!t��
� ����
� ���@@��
� ����
� ���@@@�����(Deferred!t��
� ����
� ���@�����$unit��
� ����
� ���@@��
� ����
� ���@@@@��
� ����
� ���@@@��
� ����
� ���@@@��
� ����
� ���@@@@���	���@@ ���@@ �A�������	� [set_fd t fd] sets the [fd] used by [t] for its underlying system calls.  It first
    waits until everything being sent to the current [fd] is flushed.  Of course, one must
    understand how the writer works and what one is doing to use this. @�� ���� �?�@@@@��
 ���� �?�@@���@@ ���@@ �A@�� ���� ���@�� ���� ���@���Р)write_gen�� �&q&u� �&q&~@���#pos����#int��( �&&��) �&&�@@��+ �&&��, �&&�@@@���#len����#int��7 �&�&��8 �&�&�@@��: �&�&��; �&�&�@@@��@����!t��D �&�&��E �&�&�@@��G �&�&��H �&�&�@@@��@��!a��O �&�&��P �&�&�@@@���1blit_to_bigstring�����$Blit$blit��] �&�&��^ �&�&�@���!a��d �&�&��e �&�&�@@@������)Bigstring!t��o �&�&��p �&�&�@@��r �&�&��s �&�&�@@@@��u �&�&��v �&�&�@@@���&length��@��!a��� �&�&��� �&�&�@@@����#int��� �&�&��� �&�&�@@��� �&�&��� �&�&�@@@��� �&�&��� �&�&�@@@����$unit��� �&�&��� �&�&�@@��� �&�&��� �&�&�@@@��� �&�&��� �&�&�@@@��� �&�&��� �&�&�@@@��� �&�&��� �&�&�@@@��� �&�&��� �&�&�@@@��� �&�&��� �&�&�@@@��� �&&��� �&�&�@@@@���	����@@ ���@@ �A�������
  � [write_gen t a] writes [a] to writer [t], with [length] specifying the number of bytes
    needed and [blit_to_bigstring] blitting [a] directly into the [t]'s buffer.  If one
    has a type that has [length] and [blit_to_bigstring] functions, like:

    {[
      module A : sig
        type t
        val length : t -> int
        val blit_to_bigstring : (t, Bigstring.t) Blit.blit
      end ]}

    then one can use [write_gen] to implement a custom analog of [Writer.write], like:

    {[
      module Write_a : sig
        val write : ?pos:int -> ?len:int -> A.t -> Writer.t -> unit
      end = struct
        let write ?pos ?len a writer =
          Writer.write_gen
            ~length:A.length
            ~blit_to_bigstring:A.blit_to_bigstring
            ?pos ?len writer a
      end ]}

    In some cases it may be difficult to write only part of a value:

    {[
      module B : sig
        type t
        val length : t -> int
        val blit_to_bigstring : t -> Bigstring.t -> pos:int -> unit
      end ]}

    In these cases, use [write_gen_whole] instead.  It never requires writing only part of
    a value, although it is potentially less space-efficient.  It may waste portions of
    previously-allocated write buffers if they are too small.

    {[
      module Write_b : sig
        val write : B.t -> Writer.t -> unit
      end = struct
        let write b writer =
          Writer.write_gen_whole
            ~length:B.length
            ~blit_to_bigstring:B.blit_to_bigstring
            writer b
      end ]}

    Note: [write_gen] and [write_gen_whole] give you access to the writer's internal
    buffer.  You should not capture it; doing so might lead to errors of the segfault
    kind. @��� ����� �&d&p@@@@��� ����� �&d&p@@���@@ ���@@ �A@��� �&q&q�� �&�&�@��� �&q&q�� �&�&�@���Р/write_gen_whole��� �' '�� �' '@��@����!t��� �''�� �''@@��� �''�� �''@@@��@��!a��� �'' �� �''"@@@���1blit_to_bigstring��@��!a��� �'#';�� �'#'=@@@��@�����)Bigstring!t��� �'#'A�  �'#'L@@�� �'#'A� �'#'L@@@���#pos����#int�� �'#'T� �'#'W@@�� �'#'T� �'#'W@@@����$unit�� �'#'[� �'#'_@@�� �'#'[� �'#'_@@@�� �'#'P�  �'#'_@@@��" �'#'A�# �'#'_@@@��% �'#';�& �'#'_@@@���&length��@��!a��1 �'a'n�2 �'a'p@@@����#int��9 �'a't�: �'a'w@@��< �'a't�= �'a'w@@@��? �'a'n�@ �'a'w@@@����$unit��G �'y'~�H �'y'�@@��J �'y'~�K �'y'�@@@��M �'a'f�N �'y'�@@@��P �'#'(�Q �'y'�@@@��S �'' �T �'y'�@@@��V �''�W �'y'�@@@@@��Y �' ' �Z �'y'�@��\ �' ' �] �'y'�@���Р,write_direct��e �**�f �**"@��@����!t��o �**%�p �**&@@��r �**%�s �**&@@@���!f��@�����)Bigstring!t��� �**-�� �**8@@��� �**-�� �**8@@@���#pos����#int��� �**@�� �**C@@��� �**@�� �**C@@@���#len����#int��� �**K�� �**N@@��� �**K�� �**N@@@�����!a��� �**R�� �**T@@@�����#int��� �**W�� �**Z@@��� �**W�� �**Z@@@@��� �**R�� �**Z@@@��� �**G�� �**Z@@@��� �**<�� �**Z@@@��� �**-�� �**Z@@@����&option��� �**b�� �**h@���!a��� �**_�� �**a@@@@��� �**_�� �**h@@@��� �***�� �**h@@@��� �**%�� �**h@@@@���
���@@ ���@@ �A�������
  � [write_direct t ~f] gives [t]'s internal buffer to [f].  [pos] and [len] define the
    portion of the buffer that can be filled.  [f] must return a pair [(x, written)] where
    [written] is the number of bytes written to the buffer at [pos].  [write_direct]
    raises if [written < 0 || written > len].  [write_direct] returns [Some x], or [None]
    if the writer is stopped.  By using [write_direct] only, one can ensure that the
    writer's internal buffer never grows.  Look at the [write_direct] expect tests for an
    example of how this can be used to construct a [write_string] like function that never
    grows the internal buffer. @��� �'�'��� �)�*@@@@��� �'�'��� �)�*@@���@@ ���@@ �A@��� �**�� �**h@��� �**�� �**h@���Р+write_bytes�� +R+V� +R+a@���#pos����#int�� +R+i� +R+l@@�� +R+i� +R+l@@@���#len����#int�� +R+u� +R+x@@��  +R+u�! +R+x@@@��@����!t��* +R+|�+ +R+}@@��- +R+|�. +R+}@@@��@�����%Bytes!t��9 +R+��: +R+�@@��< +R+��= +R+�@@@����$unit��D +R+��E +R+�@@��G +R+��H +R+�@@@��J +R+��K +R+�@@@��M +R+|�N +R+�@@@��P +R+p�Q +R+�@@@��S +R+d�T +R+�@@@@���c��D@@ ��E@@ �A�������	� [write ?pos ?len t s] adds a job to the writer's queue of pending writes.  The
    contents of the string are copied to an internal buffer before [write] returns, so
    clients can do whatever they want with [s] after that. @��d �*j*j�e �++Q@@@@��g �*j*j�h �++Q@@��U@@ ��V@@ �A@��m +R+R�n +R+�@��p +R+R�q +R+�@���Р%write��y+�+��z+�+�@���#pos����#int���+�+���+�+�@@���+�+���+�+�@@@���#len����#int���+�+���+�+�@@���+�+���+�+�@@@��@����!t���+�+���+�+�@@���+�+���+�+�@@@��@����&string���+�+���+�+�@@���+�+���+�+�@@@����$unit���+�+���+�+�@@���+�+���+�+�@@@���+�+���+�+�@@@���+�+���+�+�@@@���+�+���+�+�@@@���+�+���+�+�@@@@@���+�+���+�+�@���+�+���+�+�@���Р/write_bigstring���+�+���+�+�@���#pos����#int���+�+���+�+�@@���+�+���+�+�@@@���#len����#int���+�+���+�+�@@���+�+���+�+�@@@��@����!t���+�+�� +�+�@@��+�+��+�+�@@@��@�����)Bigstring!t��+�+��+�,@@��+�+��+�,@@@����$unit��+�,�+�,@@��+�,�+�,@@@��+�+�� +�,@@@��"+�+��#+�,@@@��%+�+��&+�,@@@��(+�+��)+�,@@@@@��++�+��,+�,@��.+�+��/+�,@���Р+write_iobuf��7,,�8,, @���#pos����#int��C,,(�D,,+@@��F,,(�G,,+@@@���#len����#int��R,,4�S,,7@@��U,,4�V,,7@@@��@����!t��_,,;�`,,<@@��b,,;�c,,<@@@��@�����%Iobuf!t��n,,O�o,,V@����������$read��|,,D�},,H@@��,,D��,,H@@@���,,D��,,H@@@A@���,,A��,,J@@@��@���,,L��,,M@@@@���,,@��,,V@@@����$unit���,,Z��,,^@@���,,Z��,,^@@@���,,@��,,^@@@���,,;��,,^@@@���,,/��,,^@@@���,,#��,,^@@@@@���,,��,,^@���,,��,,^@���Р/write_substring���,_,c��,_,r@��@����!t���,_,u��,_,v@@���,_,u��,_,v@@@��@�����)Substring!t���,_,z��,_,�@@���,_,z��,_,�@@@����$unit���,_,���,_,�@@���,_,���,_,�@@@���,_,z��,_,�@@@���,_,u��,_,�@@@@@���,_,_��,_,�@���,_,_��,_,�@���Р2write_bigsubstring���,�,���,�,�@��@����!t���,�,���,�,�@@���,�,���,�,�@@@��@�����,Bigsubstring!t��,�,��	,�,�@@��,�,��,�,�@@@����$unit��,�,��,�,�@@��,�,��,�,�@@@��,�,��,�,�@@@��,�,��,�,�@@@@@��,�,�� ,�,�@��",�,��#,�,�@���Р&writef��+,�,��,,�,�@��@����!t��5,�,��6,�,�@@��8,�,��9,�,�@@@��@����'format4��B,�,��C,�,�@���!a��I,�,��J,�,�@@@�����$unit��R,�,��S,�,�@@��U,�,��V,�,�@@@�����&string��^,�,��_,�,�@@��a,�,��b,�,�@@@�����$unit��j,�,��k,�,�@@��m,�,��n,�,�@@@@��p,�,��q,�,�@@@��!a��v,�,��w,�,�@@@��y,�,��z,�,�@@@��|,�,��},�,�@@@@@��,�,���,�,�@���,�,���,�,�@���Р,to_formatter���-�-���-�.@��@����!t���-�.	��-�.
@@���-�.	��-�.
@@@�����&Format)formatter���-�.��-�.@@���-�.��-�.@@@���-�.	��-�.@@@@�������@@ ���@@ �A�������	� [to_formatter] returns an OCaml-formatter that one can print to using
    {!Format.fprintf}.  Note that flushing the formatter will only submit all buffered
    data to the writer, but does {e not} guarantee flushing to the operating system. @���	,�,���-�-�@@@@���	,�,���-�-�@@���@@ ���@@ �A@���-�-���-�.@���-�-���-�.@���Р*write_char���.N.R��.N.\@��@����!t���.N._��.N.`@@���.N._��.N.`@@@��@����$char���.N.d��.N.h@@���.N.d��.N.h@@@����$unit���.N.l��.N.p@@���.N.l��.N.p@@@���.N.d��.N.p@@@���.N._��.N.p@@@@���	���@@ ���@@ �A�������	( [write_char t c] writes the character. @��
. . �. .M@@@@��. . �. .M@@���@@ ���@@ �A@��.N.N�.N.p@��.N.N�.N.p@���Р'newline��.�.�� .�.�@���+line_ending�����+Line_ending!t��-.�.��..�/@@��0.�.��1.�/@@@��@����!t��:.�/	�;.�/
@@��=.�/	�>.�/
@@@����$unit��E.�/�F.�/@@��H.�/�I.�/@@@��K.�/	�L.�/@@@��N.�.��O.�/@@@@���^��?@@ ��@@@ �A�������	e [newline t] writes the end-of-line terminator.  [line_ending] can override [t]'s
    [line_ending]. @��_.r.r�`.�.�@@@@��b.r.r�c.�.�@@��P@@ ��Q@@ �A@��h.�.��i.�/@��k.�.��l.�/@���Р*write_line��t/a/e�u/a/o@���+line_ending�����+Line_ending!t���/a/��/a/�@@���/a/��/a/�@@@��@����!t���/a/���/a/�@@���/a/���/a/�@@@��@����&string���/a/���/a/�@@���/a/���/a/�@@@����$unit���/a/���/a/�@@���/a/���/a/�@@@���/a/���/a/�@@@���/a/���/a/�@@@���/a/r��/a/�@@@@���ð��@@ ���@@ �A�������	G [write_line t s ?line_ending] is [write t s; newline t ?line_ending]. @���//��//`@@@@���//��//`@@���@@ ���@@ �A@���/a/a��/a/�@���/a/a��/a/�@���Р*write_byte���0+0/��0+09@��@����!t���0+0<��0+0=@@���0+0<��0+0=@@@��@����#int���0+0A��0+0D@@���0+0A��0+0D@@@����$unit���0+0H��0+0L@@���0+0H��0+0L@@@��0+0A�0+0L@@@��0+0<�0+0L@@@@������@@ ���@@ �A�������	� [write_byte t i] writes one 8-bit integer (as the single character with that code).
    The given integer is taken modulo 256. @��/�/��/�0*@@@@��/�/��/�0*@@��@@ ��@@ �A@��0+0+�0+0L@��!0+0+�"0+0L@�����.Terminate_with��*0N0U�+0N0c@�����A�    �!t��60j0q�70j0r@@@��Р'Newline��>0u0{�?0u0�@�@@��B0u0y�C0u0�@@�Р/Space_if_needed��I0�0��J0�0�@�@@��M0�0��N0�0�@@@A@���(deriving��T 0�0��U 0�0�@��������'sexp_of��` 0�0��a 0�0�@��c 0�0��d 0�0�@@@@��f 0�0��g 0�0�@@��i 0�0��j 0�0�@@��l0j0l�m 0�0�@@��o0j0l�p 0�0�@�����������ݰ�}0j0l�~ 0�0�@��������@���0j0l�� 0�0�@@@@���0j0l�� 0�0�@@���0j0l�� 0�0�@���0j0l�� 0�0�@���Р)sexp_of_t���0j0q��0j0r@��@����m���0j0q��0j0r@@���0j0q��0j0r@@@��������ٰ��0j0q��0j0r@@���0j0q��0j0r@@@���0j0q��0j0r@@@@@���0j0l�� 0�0�@���0j0l�� 0�0�@@���0j0l�� 0�0�@@���0j0l�� 0�0�@���ذ��0j0l�� 0�0�@��������@���0j0l�� 0�0�@@@@���0j0l�� 0�0�@@���0j0l�� 0�0�@@���0j0l�� 0�0�@@���0N0f��!0�0�@@@���0N0N��!0�0�@���0N0N��!0�0�@���Р*write_sexp���*2�2���*2�2�@���#hum����$bool���+2�3��+2�3@@���+2�3��+2�3@@���
���@@ ���@@ �A�������4 default is [false] @��+2�3�+2�3&@@@@��+2�3�+2�3&@@���@@ ���@@ �A@���.terminate_with�����.Terminate_with!t��,3'3<� ,3'3L@@��",3'3<�#,3'3L@@���2��@@ ��@@ �A�������> default is [Space_if_needed] @��3,3'3M�4,3'3p@@@@��6,3'3M�7,3'3p@@��$@@ ��%@@ �A@��@����!t��C-3q3v�D-3q3w@@��F-3q3v�G-3q3w@@@��@�����$Sexp!t��R.3x3}�S.3x3�@@��U.3x3}�V.3x3�@@@����$unit��]/3�3��^/3�3�@@��`/3�3��a/3�3�@@@��c.3x3}�d/3�3�@@@��f-3q3v�g/3�3�@@@��i,3'3,�j/3�3�@@@��l+2�3�m/3�3�@@@@���|��]@@ ��^@@ �A�������
  4 [write_sexp t sexp] writes to [t] the string representation of [sexp], possibly
    followed by a terminating character as per [Terminate_with].  With
    [~terminate_with:Newline], the terminating character is a newline.  With
    [~terminate_with:Space_if_needed], if a space is needed to ensure that the sexp reader
    knows that it has reached the end of the sexp, then the terminating character will be
    a space; otherwise, no terminating character is added.  A terminating space is needed
    if the string representation doesn't end in [')'] or ['"']. @��}#0�0��~)2�2�@@@@���#0�0���)2�2�@@��n@@ ��o@@ �A@���*2�2���/3�3�@���*2�2���/3�3�@���Р.write_bin_prot���44�4���44�4�@��@����!t���44�4���44�4�@@���44�4���44�4�@@@��@������(Bin_prot*Type_class&writer���44�4���44�4�@���!a���44�4���44�4�@@@@���44�4���44�4�@@@��@��!a���44�4���44�4�@@@����$unit���44�4���44�4�@@���44�4���44�4�@@@���44�4���44�4�@@@���44�4���44�4�@@@���44�4���44�4�@@@@������@@ ���@@ �A�������
   [write_bin_prot] writes out a value using its bin_prot sizer/writer pair.  The format
    is the "size-prefixed binary protocol", in which the length of the data is written
    before the data itself.  This is the format that [Reader.read_bin_prot] reads. @���13�3���34@4�@@@@���13�3���34@4�@@���@@ ���@@ �A@���44�4���44�4�@���44�4���44�4�@���Р=write_bin_prot_no_size_header���:5�5���:5�6@��@����!t��;66�;66@@��;66�;66@@@���$size����#int��<66&�<66)@@��<66&�<66)@@@��@������(Bin_prot%Write&writer��#=6*62�$=6*6G@���!a��*=6*6/�+=6*61@@@@��-=6*6/�.=6*6G@@@��@��!a��5>6H6M�6>6H6O@@@����$unit��=?6P6U�>?6P6Y@@��@?6P6U�A?6P6Y@@@��C>6H6M�D?6P6Y@@@��F=6*6/�G?6P6Y@@@��I<66!�J?6P6Y@@@��L;66�M?6P6Y@@@@���\��=@@ ��>@@ �A�������
   Writes out a value using its bin_prot writer.  Unlike [write_bin_prot], this doesn't
    prefix the output with the size of the bin_prot blob.  [size] is the expected size.
    This function will raise if the bin_prot writer writes an amount other than [size]
    bytes. @��]64�4��^95�5�@@@@��`64�4��a95�5�@@��N@@ ��O@@ �A@��f:5�5��g?6P6Y@��i:5�5��j?6P6Y@�����}��\@@ ��]@@ �A�������
  ` Unlike the [write_] functions, all functions starting with [schedule_] require
    flushing or closing of the writer after returning before it is safe to modify the
    bigstrings which were directly or indirectly passed to these functions.  The reason is
    that these bigstrings will be read from directly when writing; their contents is not
    copied to internal buffers.

    This is important if users need to send the same large data string to a huge number of
    clients simultaneously (e.g., on a cluster), because these functions then avoid
    needlessly exhausting memory by sharing the data. @��|A6[6[�}I8�8�@@@@��A6[6[��I8�8�@@��m@@ ��n@@ �A���A6[6[��I8�8�@���Р2schedule_bigstring���N9�9���N9�9�@��@����!t���N9�9���N9�9�@@���N9�9���N9�9�@@@���#pos����#int���N9�9���N9�9�@@���N9�9���N9�9�@@@���#len����#int���N9�9���N9�9�@@���N9�9���N9�9�@@@��@�����)Bigstring!t���N9�9���N9�9�@@���N9�9���N9�9�@@@����$unit���N9�9���N9�9�@@���N9�9���N9�9�@@@���N9�9���N9�9�@@@���N9�9���N9�9�@@@���N9�9���N9�9�@@@���N9�9���N9�9�@@@@������@@ ���@@ �A�������	� [schedule_bigstring t bstr] schedules a write of bigstring [bstr].  It is not safe to
    change the bigstring until the writer has been successfully flushed or closed after
    this operation. @���K8�8���M9t9�@@@@���K8�8���M9t9�@@���@@ ���@@ �A@���N9�9���N9�9�@���N9�9���N9�9�@���Р5schedule_bigsubstring��P9�9��P9�9�@��@����!t��P9�9��P9�9�@@��P9�9��P9�9�@@@��@�����,Bigsubstring!t��P9�9��P9�:@@��!P9�9��"P9�:@@@����$unit��)P9�:	�*P9�:@@��,P9�:	�-P9�:@@@��/P9�9��0P9�:@@@��2P9�9��3P9�:@@@@@��5P9�9��6P9�:@��8P9�9��9P9�:@���Р3schedule_iobuf_peek��AU:�:��BU:�:�@��@����!t��KU:�:��LU:�:�@@��NU:�:��OU:�:�@@@���#pos����#int��ZU:�:��[U:�:�@@��]U:�:��^U:�:�@@@���#len����#int��iU:�;�jU:�;
@@��lU:�;�mU:�;
@@@��@�����%Iobuf!t��xU:�;�yU:�;$@����������$read���U:�;��U:�;@@���U:�;��U:�;@@@���U:�;��U:�;@@@A@���U:�;��U:�;@@@��@���U:�;��U:�;@@@@���U:�;��U:�;$@@@����$unit���U:�;(��U:�;,@@���U:�;(��U:�;,@@@���U:�;��U:�;,@@@���U:�;��U:�;,@@@���U:�:���U:�;,@@@���U:�:���U:�;,@@@@�������@@ ���@@ �A�������	� [schedule_iobuf_peek] is like [schedule_bigstring], but for an iobuf.  It is not safe
    to change the iobuf until the writer has been successfully flushed or closed after
    this operation. @���R::��T:�:�@@@@���R::��T:�:�@@���@@ ���@@ �A@���U:�:���U:�;,@���U:�:���U:�;,@���Р6schedule_iobuf_consume���Z<-<1��Z<-<G@��@����!t���[<H<M��[<H<N@@���[<H<M��[<H<N@@@���#len����#int���\<O<Y��\<O<\@@���\<O<Y��\<O<\@@@��@�����%Iobuf!t���]<]<z��]<]<�@����������$read��
]<]<f�]<]<j@@��]<]<f�]<]<j@@@��]<]<f�]<]<j@@@A@��]<]<c�]<]<l@@@������%Iobuf$seek��]<]<n�]<]<x@@��!]<]<n�"]<]<x@@@@��$]<]<b�%]<]<�@@@�����(Deferred!t��.^<�<��/^<�<�@�����$unit��7^<�<��8^<�<�@@��:^<�<��;^<�<�@@@@��=^<�<��>^<�<�@@@��@]<]<b�A^<�<�@@@��C\<O<T�D^<�<�@@@��F[<H<M�G^<�<�@@@@���V��7@@ ��8@@ �A�������	� [schedule_iobuf_consume] is like [schedule_iobuf_peek], and additionally advances the
    iobuf beyond the portion that has been written.  Until the result is determined, it is
    not safe to assume whether the iobuf has been advanced yet or not. @��WW;.;.�XY;�<,@@@@��ZW;.;.�[Y;�<,@@��H@@ ��I@@ �A@��`Z<-<-�a^<�<�@��cZ<-<-�d^<�<�@�����/Destroy_or_keep��l`<�<��m`<�<�@�����A�    �!t��xa<�<��ya<�<�@@@��Р'Destroy���b<�<���b<�<�@�@@���b<�<���b<�<�@@�Р$Keep���c<�<���c<�<�@�@@���c<�<���c<�<�@@@A@���(deriving���d<�<���d<�<�@��������'sexp_of���d<�<���d<�<�@���d<�<���d<�<�@@@@���d<�<���d<�<�@@���d<�<���d<�<�@@���a<�<���d<�<�@@���a<�<���d<�<�@��������������a<�<���d<�<�@�������@���a<�<���d<�<�@@@@���a<�<���d<�<�@@���a<�<���d<�<�@���a<�<���d<�<�@���Р)sexp_of_t���a<�<���a<�<�@��@����m���a<�<���a<�<�@@���a<�<���a<�<�@@@���������a<�<���a<�<�@@���a<�<���a<�<�@@@���a<�<���a<�<�@@@@@���a<�<���d<�<�@���a<�<���d<�<�@@���a<�<�� d<�<�@@��a<�<��d<�<�@�����a<�<��	d<�<�@�������@��a<�<��d<�<�@@@@��a<�<��d<�<�@@��a<�<��d<�<�@@��a<�<��d<�<�@@��`<�<��e<�<�@@@��!`<�<��"e<�<�@��$`<�<��%e<�<�@���Р.schedule_iovec��-j=�=��.j=�=�@���/destroy_or_keep�����/Destroy_or_keep!t��;k=�>�<k=�>@@��>k=�>�?k=�>@@���N��/@@ ��0@@ �A�������3 default is [Keep] @��Ok=�>�Pk=�>+@@@@��Rk=�>�Sk=�>+@@��@@@ ��A@@ �A@��@����!t��_l>,>1�`l>,>2@@��bl>,>1�cl>,>2@@@��@������$Unix%IOVec!t��pm>3>D�qm>3>P@������)Bigstring!t��{m>3>8�|m>3>C@@��~m>3>8�m>3>C@@@@���m>3>8��m>3>P@@@����$unit���n>Q>V��n>Q>Z@@���n>Q>V��n>Q>Z@@@���m>3>8��n>Q>Z@@@���l>,>1��n>Q>Z@@@���k=�=���n>Q>Z@@@@�������@@ ���@@ �A�������	� [schedule_iovec t iovec] schedules a write of I/O-vector [iovec].  It is not safe to
    change the bigstrings underlying the I/O-vector until the writer has been successfully
    flushed or closed after this operation. @���g<�<���i=�=�@@@@���g<�<���i=�=�@@���@@ ���@@ �A@���j=�=���n>Q>Z@���j=�=���n>Q>Z@���Р/schedule_iovecs���u?�?���u?�?�@��@����!t���u?�?���u?�?�@@���u?�?���u?�?�@@@��@�����%Queue!t���u?�?���u?�@@�������$Unix%IOVec!t���u?�?���u?�?�@������)Bigstring!t���u?�?���u?�?�@@���u?�?���u?�?�@@@@���u?�?���u?�?�@@@@���u?�?���u?�@@@@����$unit���u?�@
��u?�@@@�� u?�@
�u?�@@@@��u?�?��u?�@@@@��u?�?��u?�@@@@@������@@ ���@@ �A�������
  i [schedule_iovecs t iovecs] like {!schedule_iovec}, but takes a whole queue [iovecs] of
    I/O-vectors as argument.  The queue is guaranteed to be empty when this function
    returns and can be modified.  It is not safe to change the bigstrings underlying the
    I/O-vectors until the writer has been successfully flushed or closed after this
    operation. @��p>\>\�t?�?�@@@@��p>\>\�t?�?�@@��@@ ��	@@ �A@�� u?�?��!u?�@@��#u?�?��$u?�@@���Р'flushed��,|A)A-�-|A)A4@��@����!t��6|A)A7�7|A)A8@@��9|A)A7�:|A)A8@@@�����(Deferred!t��C|A)AA�D|A)AK@�����$unit��L|A)A<�M|A)A@@@��O|A)A<�P|A)A@@@@@��R|A)A<�S|A)AK@@@��U|A)A7�V|A)AK@@@@���e��F@@ ��G@@ �A�������
   [flushed t] returns a deferred that will become determined when all prior writes
    complete (i.e. the [write()] system call returns).  If a prior write fails, then the
    deferred will never become determined.

    It is OK to call [flushed t] after [t] has been closed. @��fw@@�g{@�A(@@@@��iw@@�j{@�A(@@��W@@ ��X@@ �A@��o|A)A)�p|A)AK@��r|A)A)�s|A)AK@���Р,flushed_time��{~AMAQ�|~AMA]@��@����!t���~AMA`��~AMAa@@���~AMA`��~AMAa@@@�����(Deferred!t���~AMAl��~AMAv@������$Time!t���~AMAe��~AMAk@@���~AMAe��~AMAk@@@@���~AMAe��~AMAv@@@���~AMA`��~AMAv@@@@@���~AMAM��~AMAv@���~AMAM��~AMAv@���Р/flushed_time_ns���AwA{��AwA�@��@����!t���AwA���AwA�@@���AwA���AwA�@@@�����(Deferred!t���AwA���AwA�@������'Time_ns!t���AwA���AwA�@@���AwA���AwA�@@@@���AwA���AwA�@@@���AwA���AwA�@@@@@���AwAw��AwA�@���AwAw��AwA�@���Р%fsync����A�A����A�A�@��@����!t����A�A����A�A�@@����A�A����A�A�@@@�����(Deferred!t���A�A���A�A�@�����$unit���A�A���A�A�@@���A�A���A�A�@@@@���A�A���A�A�@@@���A�A���A�A�@@@@@���A�A���A�A�@���A�A���A�A�@���Р)fdatasync��'�A�A��(�A�A�@��@����!t��1�A�A��2�A�A�@@��4�A�A��5�A�A�@@@�����(Deferred!t��>�A�A��?�A�A�@�����$unit��G�A�A��H�A�A�@@��J�A�A��K�A�A�@@@@��M�A�A��N�A�A�@@@��P�A�A��Q�A�A�@@@@@��S�A�A��T�A�A�@��V�A�A��W�A�A�@���Р$send��_�BEBI�`�BEBM@��@����!t��i�BEBP�j�BEBQ@@��l�BEBP�m�BEBQ@@@��@����&string��v�BEBU�w�BEB[@@��y�BEBU�z�BEB[@@@����$unit����BEB_���BEBc@@����BEB_���BEBc@@@����BEBU���BEBc@@@����BEBP���BEBc@@@@������{@@ ��|@@ �A�������	Q [send] writes a string to the writer that can be read back using [Reader.recv]. @����A�A����A�BD@@@@����A�A����A�BD@@���@@ ���@@ �A@����BEBE���BEBc@����BEBE���BEBc@���Р'monitor����B�B����B�B�@��@����!t����B�B����B�B�@@����B�B����B�B�@@@�����'Monitor!t����B�B����B�B�@@����B�B����B�B�@@@����B�B����B�B�@@@@���ݰ��@@ ���@@ �A�������	+ [monitor t] returns the writer's monitor. @����BeBe���BeB�@@@@����BeBe���BeB�@@���@@ ���@@ �A@����B�B����B�B�@����B�B����B�B�@���Р%close����I�I����I�J@���+force_close�����(Deferred!t���I�J��I�J#@�����$unit��
�I�J��I�J@@���I�J��I�J@@@@���I�J��I�J#@@@��@����!t���I�J'��I�J(@@���I�J'��I�J(@@@�����(Deferred!t��'�I�J1�(�I�J;@�����$unit��0�I�J,�1�I�J0@@��3�I�J,�4�I�J0@@@@��6�I�J,�7�I�J;@@@��9�I�J'�:�I�J;@@@��<�I�J�=�I�J;@@@@���L��-@@ ��.@@ �A�������
  A [close ?force_close t] waits for the writer to be flushed, and then calls [Unix.close]
    on the underlying file descriptor.  [force_close] causes the [Unix.close] to happen
    even if the flush hangs.  By default [force_close] is [Deferred.never ()] for files
    and [after (sec 5)] for other types of file descriptors (e.g., sockets).  If the close
    is forced, data in the writer's buffer may not be written to the file descriptor.  You
    can check this by calling [bytes_to_write] after [close] finishes.

    WARNING: [force_close] will not reliably stop any write that is in progress.
    If there are any in-flight system calls, it will wait for them to finish, which
    includes [writev], which can legitimately block forever.

    [close] will raise an exception if the [Unix.close] on the underlying file descriptor
    fails.

    You must call [close] on a writer in order to close the underlying file descriptor.
    Not doing so will cause a file descriptor leak.  It also will cause a space leak,
    because until the writer is closed, it is held on to in order to flush the writer on
    shutdown.

    It is an error to call other operations on [t] after [close t] has been called, except
    that calls of [close] subsequent to the original call to [close] will return the same
    deferred as the original call.

    [close_started  t] becomes determined as soon as [close] is called.

    [close_finished t] becomes determined after [t]'s underlying file descriptor has been
    closed, i.e., it is the same as the result of [close].  [close_finished] differs from
    [close] in that it does not have the side effect of initiating a close.

    [is_closed t] returns [true] iff [close t] has been called.

    [is_open t] is [not (is_closed t)]

    [with_close t ~f] runs [f ()], and closes [t] after [f] finishes or raises. @��M�B�B��N�I�I�@@@@��P�B�B��Q�I�I�@@��>@@ ��?@@ �A@��V�I�I��W�I�J;@��Y�I�I��Z�I�J;@���Р-close_started��b�J=JA�c�J=JN@��@����!t��l�J=JQ�m�J=JR@@��o�J=JQ�p�J=JR@@@�����(Deferred!t��y�J=J[�z�J=Je@�����$unit����J=JV���J=JZ@@����J=JV���J=JZ@@@@����J=JV���J=Je@@@����J=JQ���J=Je@@@@@����J=J=���J=Je@����J=J=���J=Je@���Р.close_finished����JfJj���JfJx@��@����!t����JfJ{���JfJ|@@����JfJ{���JfJ|@@@�����(Deferred!t����JfJ����JfJ�@�����$unit����JfJ����JfJ�@@����JfJ����JfJ�@@@@����JfJ����JfJ�@@@����JfJ{���JfJ�@@@@@����JfJf���JfJ�@����JfJf���JfJ�@���Р)is_closed����J�J����J�J�@��@����!t����J�J����J�J�@@����J�J����J�J�@@@����$bool����J�J����J�J�@@����J�J����J�J�@@@����J�J����J�J�@@@@@����J�J����J�J�@����J�J����J�J�@���Р'is_open����J�J����J�J�@��@����!t���J�J���J�J�@@��	�J�J��
�J�J�@@@����$bool���J�J���J�J�@@���J�J���J�J�@@@���J�J���J�J�@@@@@���J�J���J�J�@���J�J���J�J�@���Р*with_close��&�J�J��'�J�J�@��@����!t��0�J�J��1�J�J�@@��3�J�J��4�J�J�@@@���!f��@����$unit��A�J�J��B�J�J�@@��D�J�J��E�J�J�@@@�����(Deferred!t��N�J�J��O�J�J�@���!a��U�J�J��V�J�J�@@@@��X�J�J��Y�J�J�@@@��[�J�J��\�J�J�@@@�����(Deferred!t��e�J�J��f�J�K@���!a��l�J�J��m�J�J�@@@@��o�J�J��p�J�K@@@��r�J�J��s�J�K@@@��u�J�J��v�J�K@@@@@��x�J�J��y�J�K@��{�J�J��|�J�K@���Р)can_write����K�K����K�L@��@����!t����K�L���K�L@@����K�L���K�L@@@����$bool����K�L���K�L@@����K�L���K�L@@@����K�L���K�L@@@@�������@@ ���@@ �A�������	� [can_write t] returns [true] if calls to [write*] functions on [t] are allowed.  If
    [is_open t] then [can_write t].  But one can have [is_closed t] and [can_write t],
    during the time after [close t] before closing has finished. @����KK���K�K�@@@@����KK���K�K�@@���@@ ���@@ �A@����K�K����K�L@����K�K����K�L@���Р6is_stopped_permanently����M#M'���M#M=@��@����!t����M#M@���M#MA@@����M#M@���M#MA@@@����$bool����M#ME���M#MI@@����M#ME���M#MI@@@����M#M@���M#MI@@@@������@@ ���@@ �A�������
   Errors raised within the writer can stop the background job that flushes out the
    writer's buffers. [is_stopped_permanently] returns [true] when the background job has
    stopped. [stopped_permanently] becomes determined when the background job has
    stopped. @����LL���MM"@@@@����LL���MM"@@���@@ ���@@ �A@����M#M#���M#MI@����M#M#���M#MI@���Р3stopped_permanently���MKMO��MKMb@��@����!t���MKMe��MKMf@@���MKMe��MKMf@@@�����(Deferred!t���MKMo��MKMy@�����$unit��&�MKMj�'�MKMn@@��)�MKMj�*�MKMn@@@@��,�MKMj�-�MKMy@@@��/�MKMe�0�MKMy@@@@@��2�MKMK�3�MKMy@��5�MKMK�6�MKMy@���Р5with_flushed_at_close��>�O�O��?�O�O�@��@����!t��H�O�O��I�O�O�@@��K�O�O��L�O�O�@@@���'flushed��@����$unit��Y�O�O��Z�O�O�@@��\�O�O��]�O�O�@@@�����(Deferred!t��f�O�O��g�O�O�@�����$unit��o�O�O��p�O�O�@@��r�O�O��s�O�O�@@@@��u�O�O��v�O�O�@@@��x�O�O��y�O�O�@@@���!f��@����$unit����O�O����O�O�@@����O�O����O�O�@@@�����(Deferred!t����O�O����O�O�@���!a����O�O����O�O�@@@@����O�O����O�O�@@@����O�O����O�O�@@@�����(Deferred!t����O�P���O�P@���!a����O�O����O�P @@@@����O�O����O�P@@@����O�O����O�P@@@����O�O����O�P@@@����O�O����O�P@@@@���Ͱ��@@ ���@@ �A�������
   In addition to flushing its internal buffer prior to closing, a writer keeps track of
    producers that are feeding it data, so that when [Writer.close] is called, it does the
    following:

    + requests that the writer's producers flush their data to it
    + flushes the writer's internal buffer
    + calls [Unix.close] on the writer's underlying file descriptor

    [with_flushed_at_close t ~flushed ~f] calls [f] and adds [flushed] to the set of
    producers that should be flushed-at-close, for the duration of [f]. @����M{M{���OGO�@@@@����M{M{���OGO�@@���@@ ���@@ �A@����O�O����O�P@����O�O����O�P@���Р.bytes_to_write����P~P����P~P�@��@����!t����P~P����P~P�@@����P~P����P~P�@@@����#int����P~P����P~P�@@����P~P����P~P�@@@����P~P����P~P�@@@@������@@ ���@@ �A�������	k [bytes_to_write t] returns how many bytes have been requested to write but have not
    yet been written. @���PP��PeP}@@@@���PP��PeP}@@�� @@ ��@@ �A@���P~P~��P~P�@���P~P~��P~P�@���Р-bytes_written��$�P�P��%�P�P�@��@����!t��.�P�P��/�P�P�@@��1�P�P��2�P�P�@@@�����%Int63!t��;�P�P��<�P�Q @@��>�P�P��?�P�Q @@@��A�P�P��B�P�Q @@@@���Q��2@@ ��3@@ �A�������	= [bytes_written t] returns how many bytes have been written. @��R�P�P��S�P�P�@@@@��U�P�P��V�P�P�@@��C@@ ��D@@ �A@��[�P�P��\�P�Q @��^�P�P��_�P�Q @���Р.bytes_received��g�Q�Q��h�Q�Q�@��@����!t��q�Q�Q��r�Q�Q�@@��t�Q�Q��u�Q�Q�@@@�����%Int63!t��~�Q�Q���Q�Q�@@����Q�Q����Q�Q�@@@����Q�Q����Q�Q�@@@@������u@@ ��v@@ �A�������	� [bytes_received t] returns how many bytes have been received by the writer.  As long
    as the writer is running, [bytes_received = bytes_written + bytes_to_write]. @����QQ���Q[Q�@@@@����QQ���Q[Q�@@���@@ ���@@ �A@����Q�Q����Q�Q�@����Q�Q����Q�Q�@���������@@ ���@@ �A�������
  � [with_file_atomic ?temp_file ?perm ?fsync file ~f] creates a writer to a temp file,
    feeds that writer to [f], and when the result of [f] becomes determined, atomically
    moves (using [Unix.rename]) the temp file to [file].  If [file] currently exists, it
    will be replaced, even if it is read-only.  The temp file will be [file] (or
    [temp_file] if supplied) suffixed by a unique random sequence of six characters.  The
    temp file may need to be removed in case of a crash so it may be prudent to choose a
    temp file that can be easily found by cleanup tools.

    If [fsync] is [true], the temp file will be flushed to disk before it takes the place
    of the target file, thus guaranteeing that the target file will always be in a sound
    state, even after a machine crash.  Since synchronization is extremely slow, this is
    not the default.  Think carefully about the event of machine crashes and whether you
    may need this option!

    We intend for [with_file_atomic] to preserve the behavior of the [open] system call,
    so if [file] does not exist, we will apply the umask to [perm].  If [file] does exist,
    [perm] will default to the file's current permissions rather than 0o666.

    [save] is a special case of [with_file_atomic] that atomically writes the given
    string to the specified file.

    [save_sexp] is a special case of [with_file_atomic] that atomically writes the
    given sexp to the specified file. @����Q�Q����WeW�@@@@����Q�Q����WeW�@@���@@ ���@@ �A����Q�Q����WeW�@���Р0with_file_atomic����W�W����W�W�@���)temp_file����&string����W�W����W�W�@@����W�W����W�W�@@@���$perm�����$Unix)file_perm����W�W����W�W�@@����W�W����W�W�@@@���%fsync����$bool����W�W����W�W�@@����W�W����W�W�@@������@@ ���@@ �A�������4 default is [false] @���W�W���W�W�@@@@��	�W�W��
�W�W�@@���@@ ���@@ �A@���+time_source������+Time_source"T1!t���X X��X X,@����������$read��*�X X�+�X X@@��-�X X�.�X X@@@��0�X X�1�X X@@@A@��3�X X�4�X X@@@@��6�X X�7�X X,@@���F��'@@ ��(@@ �A�������	( default is [Time_source.wall_clock ()] @��G�X-X/�H�X-X\@@@@��J�X-X/�K�X-X\@@��8@@ ��9@@ �A@��@����&string��W�X]Xb�X�X]Xh@@��Z�X]Xb�[�X]Xh@@@���!f��@����!t��h�XiXq�i�XiXr@@��k�XiXq�l�XiXr@@@�����(Deferred!t��u�XiXy�v�XiX�@���!a��|�XiXv�}�XiXx@@@@���XiXv���XiX�@@@����XiXq���XiX�@@@�����(Deferred!t����X�X����X�X�@���!a����X�X����X�X�@@@@����X�X����X�X�@@@����XiXn���X�X�@@@����X]Xb���X�X�@@@����X X���X�X�@@@����W�W����X�X�@@@����W�W����X�X�@@@����W�W����X�X�@@@@@����W�W����X�X�@����W�W����X�X�@���Р$save����X�X����X�X�@���)temp_file����&string����X�X����X�X�@@����X�X����X�X�@@@���$perm�����$Unix)file_perm����X�X����X�X�@@����X�X����X�X�@@@���%fsync����$bool��� X�X��� X�X�@@��� X�X��� X�X�@@�������@@ ���@@ �A�������4 default is [false] @��� X�X��� X�X�@@@@��� X�X��� X�X�@@���@@ ���@@ �A@��@����&string��X�Y�X�Y	@@��
X�Y�X�Y	@@@���(contents����&string��Y
Y�Y
Y@@��Y
Y�Y
Y@@@�����(Deferred!t��#YY)�$YY3@�����$unit��,YY$�-YY(@@��/YY$�0YY(@@@@��2YY$�3YY3@@@��5Y
Y�6YY3@@@��8X�Y�9YY3@@@��; X�X��<YY3@@@��>�X�X��?YY3@@@��A�X�X��BYY3@@@@@��D�X�X��EYY3@��G�X�X��HYY3@���Р*save_lines��PY�Y��QY�Y�@���)temp_file����&string��\Y�Y��]Y�Y�@@��_Y�Y��`Y�Y�@@@���$perm�����$Unix)file_perm��m	Y�Y��n	Y�Y�@@��p	Y�Y��q	Y�Y�@@@���%fsync����$bool��|
Y�Y��}
Y�Y�@@��
Y�Y���
Y�Y�@@������p@@ ��q@@ �A�������4 default is [false] @���
Y�Y���
Y�Z@@@@���
Y�Y���
Y�Z@@���@@ ���@@ �A@��@����&string���ZZ��ZZ@@���ZZ��ZZ@@@��@����$list���ZZ(��ZZ,@�����&string���ZZ!��ZZ'@@���ZZ!��ZZ'@@@@���ZZ!��ZZ,@@@�����(Deferred!t���Z-Z7��Z-ZA@�����$unit���Z-Z2��Z-Z6@@���Z-Z2��Z-Z6@@@@���Z-Z2��Z-ZA@@@���ZZ!��Z-ZA@@@���ZZ��Z-ZA@@@���
Y�Y���Z-ZA@@@���	Y�Y���Z-ZA@@@���Y�Y���Z-ZA@@@@�������@@ ���@@ �A�������	j [save_lines file lines] writes all lines in [lines] to [file], with each line followed
    by a newline. @���Y5Y5��Y�Y�@@@@���Y5Y5��Y�Y�@@���@@ ���@@ �A@���Y�Y���Z-ZA@��Y�Y��Z-ZA@���Р)save_sexp��
[O[S�[O[\@���)temp_file����&string��[][m�[][s@@��[][m�[][s@@@���$perm�����$Unix)file_perm��'[t[�([t[�@@��*[t[�+[t[�@@@���%fsync����$bool��6[�[��7[�[�@@��9[�[��:[�[�@@���I�� *@@ �� +@@ �A�������4 default is [false] @��J[�[��K[�[�@@@@��M[�[��N[�[�@@�� ;@@ �� <@@ �A@���#hum����$bool��\[�[��][�[�@@��_[�[��`[�[�@@���o�� P@@ �� Q@@ �A�������3 default is [true] @��p[�[��q[�[�@@@@��s[�[��t[�[�@@�� a@@ �� b@@ �A@��@����&string���[�[���[�[�@@���[�[���[�[�@@@��@�����$Sexp!t���[�[���[�[�@@���[�[���[�[�@@@�����(Deferred!t���[�\��[�\@�����$unit���[�[���[�\@@���[�[���[�\@@@@���[�[���[�\@@@���[�[���[�\@@@���[�[���[�\@@@���[�[���[�\@@@���[�[���[�\@@@���[t[y��[�\@@@���[][b��[�\@@@@���Ͱ� �@@ �� �@@ �A�������
   [save_sexp t sexp] writes [sexp] to [t], followed by a newline.  To read a file
    produced using [save_sexp], one would typically use [Reader.load_sexp], which deals
    with the additional whitespace and works nicely with converting the sexp to a
    value. @���ZCZC��[A[N@@@@���ZCZC��[A[N@@�� �@@ �� �@@ �A@���[O[O��[�\@���[O[O��[�\@���Р*save_sexps���\�\���\�\�@���)temp_file����&string��� \�\��� \�\�@@��� \�\��� \�\�@@@���$perm�����$Unix)file_perm��  !\�\�� !\�]@@�� !\�\�� !\�]@@@���%fsync����$bool�� "]]� "]]@@�� "]]� "]]@@���"��!@@ ��!@@ �A�������4 default is [false] @�� #"]]� $"]]6@@@@�� &"]]� '"]]6@@��!@@ ��!@@ �A@���#hum����$bool�� 5#]7]A� 6#]7]E@@�� 8#]7]A� 9#]7]E@@���H��!)@@ ��!*@@ �A�������3 default is [true] @�� I#]7]F� J#]7]^@@@@�� L#]7]F� M#]7]^@@��!:@@ ��!;@@ �A@��@����&string�� Y$]_]d� Z$]_]j@@�� \$]_]d� ]$]_]j@@@��@����$list�� f%]k]w� g%]k]{@������$Sexp!t�� q%]k]p� r%]k]v@@�� t%]k]p� u%]k]v@@@@�� w%]k]p� x%]k]{@@@�����(Deferred!t�� �&]|]�� �&]|]�@�����$unit�� �&]|]�� �&]|]�@@�� �&]|]�� �&]|]�@@@@�� �&]|]�� �&]|]�@@@�� �%]k]p� �&]|]�@@@�� �$]_]d� �&]|]�@@@�� �#]7]<� �&]|]�@@@�� �"]]� �&]|]�@@@�� �!\�\�� �&]|]�@@@�� � \�\�� �&]|]�@@@@������!�@@ ��!�@@ �A�������	� [save_sexps] works similarly to [save_sexp], but saves a sequence of sexps instead,
    separated by newlines.  There is a corresponding [Reader.load_sexps] for reading back
    in. @�� �\\� �\�\�@@@@�� �\\� �\�\�@@��!�@@ ��!�@@ �A@�� �\�\�� �&]|]�@�� �\�\�� �&]|]�@���Р-save_bin_prot�� �+^~^�� �+^~^�@���)temp_file����&string�� �,^�^�� �,^�^�@@�� �,^�^�� �,^�^�@@@���$perm�����$Unix)file_perm�� �-^�^�� �-^�^�@@�� �-^�^�� �-^�^�@@@���%fsync����$bool�� �.^�^�� �.^�^�@@�� �.^�^�� �.^�^�@@�����!�@@ ��!�@@ �A�������4 default is [false] @��!.^�^��!	.^�^�@@@@��!.^�^��!.^�^�@@��!�@@ ��!�@@ �A@��@����&string��!/^�^��!/^�^�@@��!/^�^��!/^�^�@@@��@������(Bin_prot*Type_class&writer��!)0^�_ �!*0^�_@���!a��!00^�^��!10^�^�@@@@��!30^�^��!40^�_@@@��@��!a��!;1__ �!<1__"@@@�����(Deferred!t��!E2_#_-�!F2_#_7@�����$unit��!N2_#_(�!O2_#_,@@��!Q2_#_(�!R2_#_,@@@@��!T2_#_(�!U2_#_7@@@��!W1__ �!X2_#_7@@@��!Z0^�^��![2_#_7@@@��!]/^�^��!^2_#_7@@@��!`.^�^��!a2_#_7@@@��!c-^�^��!d2_#_7@@@��!f,^�^��!g2_#_7@@@@���v��"W@@ ��"X@@ �A�������	� [save_bin_prot t bin_writer 'a] writes ['a] to [t] using its bin_writer, in the
    size-prefixed format, like [write_bin_prot].  To read a file produced using
    [save_bin_prot], one would typically use [Reader.load_bin_prot]. @��!w(]�]��!x*^6^}@@@@��!z(]�]��!{*^6^}@@��"h@@ ��"i@@ �A@��!�+^~^~�!�2_#_7@��!�+^~^~�!�2_#_7@���Р)transfer'��!�Gb�b��!�Gb�b�@���$stop�����(Deferred!t��!�Hb�c�!�Hb�c@�����$unit��!�Hb�c
�!�Hb�c@@��!�Hb�c
�!�Hb�c@@@@��!�Hb�c
�!�Hb�c@@@���7max_num_values_per_read����#int��!�Icc8�!�Icc;@@��!�Icc8�!�Icc;@@@��@����!t��!�Jc<cA�!�Jc<cB@@��!�Jc<cA�!�Jc<cB@@@��@������$Pipe&Reader!t��!�KcCcK�!�KcCcX@���!a��!�KcCcH�!�KcCcJ@@@@��!�KcCcH�!�KcCcX@@@��@��@�����%Queue!t��!�LcYcb�!�LcYci@���!a��!�LcYc_�!�LcYca@@@@��!�LcYc_�!�LcYci@@@�����(Deferred!t��!�LcYcr�" LcYc|@�����$unit��"LcYcm�"	LcYcq@@��"LcYcm�"LcYcq@@@@��"LcYcm�"LcYc|@@@��"LcYc_�"LcYc|@@@�����(Deferred!t��"Mc~c��"Mc~c�@�����$unit��"$Mc~c��"%Mc~c�@@��"'Mc~c��"(Mc~c�@@@@��"*Mc~c��"+Mc~c�@@@��"-LcYc^�".Mc~c�@@@��"0KcCcH�"1Mc~c�@@@��"3Jc<cA�"4Mc~c�@@@��"6Icc�"7Mc~c�@@@��"9Hb�c�":Mc~c�@@@@��� I��#*@@ ��#+@@ �A�������
  � [transfer' t pipe_r f] repeatedly reads values from [pipe_r] and feeds them to [f],
    which should in turn write them to [t].  It provides pushback to [pipe_r] by not
    reading when [t] cannot keep up with the data being pushed in.

    By default, each read from [pipe_r] reads all the values in [pipe_r].  One can supply
    [max_num_values_per_read] to limit the number of values per read.

    The [transfer'] stops and the result becomes determined when [stop] becomes
    determined, when [pipe_r] reaches its EOF, when [t] is closed, or when [t]'s consumer
    leaves.  In the latter two cases, [transfer'] closes [pipe_r].

    [transfer'] causes [Pipe.flushed] on [pipe_r]'s writer to ensure that the bytes have
    been flushed to [t] before returning.  It also waits on [Pipe.upstream_flushed] at
    shutdown.

    [transfer t pipe_r f] is equivalent to:

    {[
      transfer' t pipe_r (fun q -> Queue.iter q ~f; return ()) ]} @��"J4_9_9�"KFb�b�@@@@��"M4_9_9�"NFb�b�@@��#;@@ ��#<@@ �A@��"SGb�b��"TMc~c�@��"VGb�b��"WMc~c�@���Р(transfer��"_Oc�c��"`Oc�c�@���$stop�����(Deferred!t��"mPc�c��"nPc�c�@�����$unit��"vPc�c��"wPc�c�@@��"yPc�c��"zPc�c�@@@@��"|Pc�c��"}Pc�c�@@@���7max_num_values_per_read����#int��"�Qc�c��"�Qc�c�@@��"�Qc�c��"�Qc�c�@@@��@����!t��"�Rc�c��"�Rc�c�@@��"�Rc�c��"�Rc�c�@@@��@������$Pipe&Reader!t��"�Sc�c��"�Sc�c�@���!a��"�Sc�c��"�Sc�c�@@@@��"�Sc�c��"�Sc�c�@@@��@��@��!a��"�Tc�d�"�Tc�d@@@����$unit��"�Tc�d�"�Tc�d@@��"�Tc�d�"�Tc�d@@@��"�Tc�d�"�Tc�d@@@�����(Deferred!t��"�Udd�"�Udd!@�����$unit��"�Udd�"�Udd@@��"�Udd�"�Udd@@@@��"�Udd�"�Udd!@@@��"�Tc�d �"�Udd!@@@��"�Sc�c��"�Udd!@@@��"�Rc�c��"�Udd!@@@��"�Qc�c��"�Udd!@@@��"�Pc�c��"�Udd!@@@@@��"�Oc�c��"�Udd!@��"�Oc�c��"�Udd!@���Р$pipe��"�Yd�d��# Yd�d�@��@����!t��#	Yd�d��#
Yd�d�@@��#Yd�d��#Yd�d�@@@������$Pipe&Writer!t��#Yd�d��#Yd�d�@�����&string��#!Yd�d��#"Yd�d�@@��#$Yd�d��#%Yd�d�@@@@��#'Yd�d��#(Yd�d�@@@��#*Yd�d��#+Yd�d�@@@@���!:��$@@ ��$@@ �A�������	� [pipe t] returns the writing end of a pipe attached to [t] that pushes back when [t]
    cannot keep up with the data being pushed in.  Closing the pipe does not close [t]. @��#;Wd#d#�#<Xd|d�@@@@��#>Wd#d#�#?Xd|d�@@��$,@@ ��$-@@ �A@��#DYd�d��#EYd�d�@��#GYd�d��#HYd�d�@���Р'of_pipe��#P`fFfJ�#Q`fFfQ@���+time_source������+Time_source"T1!t��#`afRfn�#aafRf~@����������$read��#nafRfg�#oafRfk@@��#qafRfg�#rafRfk@@@��#tafRfg�#uafRfk@@@A@��#wafRfd�#xafRfm@@@@��#zafRfd�#{afRf~@@���!���$k@@ ��$l@@ �A�������	( default is [Time_source.wall_clock ()] @��#�afRf�#�afRf�@@@@��#�afRf�#�afRf�@@��$|@@ ��$}@@ �A@��@�����$Info!t��#�bf�f��#�bf�f�@@��#�bf�f��#�bf�f�@@@��@������$Pipe&Writer!t��#�cf�f��#�cf�f�@�����&string��#�cf�f��#�cf�f�@@��#�cf�f��#�cf�f�@@@@��#�cf�f��#�cf�f�@@@�����(Deferred!t��#�df�g�#�df�g@��������!t��#�df�f��#�df�f�@@��#�df�f��#�df�f�@@@�������=Closed_and_flushed_downstream��#�df�f��#�df�f�@@������(Deferred!t��#�df�g�#�df�g@�����$unit��#�df�g�#�df�g@@��#�df�g�#�df�g@@@@��#�df�g�#�df�g@@@@��#�df�f��#�df�g@@@@@��$df�f��$df�g@@@@��$df�f��$df�g@@@@��$df�f��$df�g@@@��$
cf�f��$df�g@@@��$bf�f��$df�g@@@��$afRfW�$df�g@@@@���" ��%@@ ��%@@ �A�������
  C [of_pipe info pipe_w] returns a writer [t] such that data written to [t] will appear
    on [pipe_w].  If either [t] or [pipe_w] are closed, the other is closed as well.

    [of_pipe] is implemented by attaching [t] to the write-end of a Unix pipe, and
    shuttling bytes from the read-end of the Unix pipe to [pipe_w]. @��$![d�d��$"_e�fE@@@@��$$[d�d��$%_e�fE@@��%@@ ��%@@ �A@��$*`fFfF�$+df�g@��$-`fFfF�$.df�g@���Р9behave_nicely_in_pipeline��$6jh7h;�$7jh7hT@���'writers����$list��$BkhUhe�$CkhUhi@�����!t��$KkhUhc�$LkhUhd@@��$NkhUhc�$OkhUhd@@@@��$QkhUhc�$RkhUhi@@���"a��%B@@ ��%C@@ �A�������> defaults to [stdout; stderr] @��$bkhUhj�$ckhUh�@@@@��$ekhUhj�$fkhUh�@@��%S@@ ��%T@@ �A@��@����$unit��$rlh�h��$slh�h�@@��$ulh�h��$vlh�h�@@@����$unit��$}mh�h��$~mh�h�@@��$�mh�h��$�mh�h�@@@��$�lh�h��$�mh�h�@@@��$�khUhZ�$�mh�h�@@@@���"���%w@@ ��%x@@ �A�������
   [behave_nicely_in_pipeline ~writers ()] causes the program to silently exit with
    status 0 if any of the consumers of [writers] go away.  It also sets the buffer age to
    unlimited, in case there is a human (e.g., using [less]) on the other side of the
    pipeline. @��$�fg g �$�ih&h6@@@@��$�fg g �$�ih&h6@@��%�@@ ��%�@@ �A@��$�jh7h7�$�mh�h�@��$�jh7h7�$�mh�h�@���Р;set_synchronous_out_channel��$�vj�j��$�vj�j�@��@����!t��$�vj�j��$�vj�j�@@��$�vj�j��$�vj�j�@@@��@�����+Out_channel!t��$�vj�j��$�vj�j�@@��$�vj�j��$�vj�j�@@@�����(Deferred!t��$�vj�j��$�vj�j�@�����$unit��$�vj�j��$�vj�j�@@��$�vj�j��$�vj�j�@@@@��$�vj�j��$�vj�j�@@@��$�vj�j��$�vj�j�@@@��$�vj�j��$�vj�j�@@@@���"���%�@@ ��%�@@ �A�������
  � [set_synchronous_out_channel t out_channel] waits until [byte_to_write t = 0], and
    then mutates [t] so that all future writes to [t] synchronously call
    [Out_channel.output*] functions to send data to the OS immediately.

    [set_synchronous_out_channel] is used by expect tests to ensure that the interleaving
    between calls to [Core.printf] (and similar IO functions) and [Async.printf] generates
    output with the same interleaving.  [set_synchronous_out_channel] is idempotent. @��$�oh�h��$�ujAj�@@@@��$�oh�h��$�ujAj�@@��%�@@ ��%�@@ �A@��%vj�j��%vj�j�@��%vj�j��%vj�j�@���Р	%using_synchronous_backing_out_channel��%{k�k��%{k�k�@��@����!t��%{k�k��%{k�k�@@��%{k�k��%{k�k�@@@����$bool��%"{k�k��%#{k�k�@@��%%{k�k��%&{k�k�@@@��%({k�k��%){k�k�@@@@���#8��&@@ ��&@@ �A�������	� [using_synchronous_backing_out_channel t = true] if writes to [t] are being done
    synchronously, e.g., due to [set_synchronous_out_channel],
    [set_synchronous_backing_out_channel], [use_synchronous_stdout_and_stderr]. @��%9xj�j��%:zkvk�@@@@��%<xj�j��%=zkvk�@@��&*@@ ��&+@@ �A@��%B{k�k��%C{k�k�@��%E{k�k��%F{k�k�@���Р=clear_synchronous_out_channel��%N�l�l��%O�l�l�@��@����!t��%X�l�l��%Y�l�l�@@��%[�l�l��%\�l�l�@@@����$unit��%c�l�l��%d�l�l�@@��%f�l�l��%g�l�l�@@@��%i�l�l��%j�l�l�@@@@���#y��&Z@@ ��&[@@ �A�������	� [clear_synchronous_out_channel t] restores [t] to its normal state, with the
    background writer asynchronously feeding data to the OS.
    [clear_synchronous_out_channel] is idempotent. @��%z}l l �%{l�l�@@@@��%}}l l �%~l�l�@@��&k@@ ��&l@@ �A@��%��l�l��%��l�l�@��%��l�l��%��l�l�@���Р<with_synchronous_out_channel��%��l�l��%��l�m@��@����!t��%��mm�%��mm@@��%��mm�%��mm@@@��@�����+Out_channel!t��%��mm �%��mm-@@��%��mm �%��mm-@@@���!f��@����$unit��%��m.m6�%��m.m:@@��%��m.m6�%��m.m:@@@�����(Deferred!t��%��m.mA�%��m.mK@���!a��%��m.m>�%��m.m@@@@@��%��m.m>�%��m.mK@@@��%��m.m6�%��m.mK@@@�����(Deferred!t��%��mMmU�%��mMm_@���!a��%��mMmR�%��mMmT@@@@��%��mMmR�%��mMm_@@@��%��m.m3�%��mMm_@@@��%��mm �%��mMm_@@@��%��mm�%��mMm_@@@@@��%��l�l��%��mMm_@��%��l�l��%��mMm_@���Р	!use_synchronous_stdout_and_stderr��%��p9p=�& �p9p^@��@����$unit��&	�p9pa�&
�p9pe@@��&�p9pa�&�p9pe@@@�����(Deferred!t��&�p9pn�&�p9px@�����$unit��&�p9pi�& �p9pm@@��&"�p9pi�&#�p9pm@@@@��&%�p9pi�&&�p9px@@@��&(�p9pa�&)�p9px@@@@���$8��'@@ ��'@@ �A�������
  � [use_synchronous_stdout_and_stderr ()] causes all subsequent writes to
    stdout and stderr to occur synchronously (after any pending writes have
    flushed).

    This ensures [printf]-family writes happen immediately, which avoids two
    common sources of confusion:

    {ul
    {li unexpected interleaving of [Core.printf] and [Async.printf] calls; and}
    {li [Async.printf] calls that don't get flushed before an application exits}}

    The disadvantages are:

    {ul
    {li this makes writes blocking, which can delay unrelated asynchronous jobs until
    the consumer stops pushing back; and}
    {li the errors raised by write are different and it won't respect
    {!behave_nicely_in_pipeline} anymore}} @��&9�mama�&:�pp8@@@@��&<�mama�&=�pp8@@��'*@@ ��'+@@ �A@��&B�p9p9�&C�p9px@��&E�p9p9�&F�p9px@�����3Backing_out_channel��&N�p�p��&O�p�q@�����A�    �!t��&Z�qq�&[�qq@@@@A@���(deriving��&a�qq"�&b�qq*@��������'sexp_of��&m�qq+�&n�qq2@��&p�qq+�&q�qq2@@@@��&s�qq+�&t�qq2@@��&v�qq�&w�qq3@@��&y�qq�&z�qq3@@��&|�qq�&}�qq3@�����������%��&��qq�&��qq3@�������%�@��&��qq�&��qq3@@@@��&��qq�&��qq3@@��&��qq�&��qq3@��&��qq�&��qq3@���Р)sexp_of_t��&��qq�&��qq@��@����V��&��qq�&��qq@@��&��qq�&��qq@@@������%�%�%��&��qq�&��qq@@��&��qq�&��qq@@@��&��qq�&��qq@@@@@��&��qq�&��qq3@��&��qq�&��qq3@@��&��qq�&��qq3@@��&��qq�&��qq3@���%��&��qq�&��qq3@�������%�@��&��qq�&��qq3@@@@��&��qq�&��qq3@@��&��qq�&��qq3@@��&��qq�&��qq3@���Р&create��&��q5q;�&��q5qA@���+output_char��@����$char��&��qBqV�&��qBqZ@@��' �qBqV�'�qBqZ@@@����$unit��'�qBq^�'	�qBqb@@��'�qBq^�'�qBqb@@@��'�qBqV�'�qBqb@@@���,output_chars��@����)bigstring��'�qdqy�'�qdq�@@��'�qdqy�' �qdq�@@@���#len����#int��'+�qdq��',�qdq�@@��'.�qdq��'/�qdq�@@@����$unit��'6�qdq��'7�qdq�@@��'9�qdq��':�qdq�@@@��'<�qdq��'=�qdq�@@@��'?�qdqy�'@�qdq�@@@���%flush��@����$unit��'M�q�q��'N�q�q�@@��'P�q�q��'Q�q�q�@@@����$unit��'X�q�q��'Y�q�q�@@��'[�q�q��'\�q�q�@@@��'^�q�q��'_�q�q�@@@���$sexp��@����$unit��'l�q�q��'m�q�q�@@��'o�q�q��'p�q�q�@@@�����$Sexp!t��'y�q�q��'z�q�q�@@��'|�q�q��'}�q�q�@@@��'�q�q��'��q�q�@@@����!t��'��q�q��'��q�q�@@��'��q�q��'��q�q�@@@��'��q�q��'��q�q�@@@��'��q�q��'��q�q�@@@��'��qdqk�'��q�q�@@@��'��qBqI�'��q�q�@@@@@��'��q5q7�'��q�q�@��'��q5q7�'��q�q�@���Р.of_out_channel��'��q�q��'��q�q�@��@�����+Out_channel!t��'��q�q��'��q�q�@@��'��q�q��'��q�q�@@@����!t��'��q�r�'��q�r@@��'��q�r�'��q�r@@@��'��q�q��'��q�r@@@@@��'��q�q��'��q�r@��'��q�q��'��q�r@���Р.of_output_char��'��rr
�'��rr@��@��@����$char��'��rr�'��rr @@��'��rr�'��rr @@@����$unit��'��rr$�'��rr(@@��'��rr$�'��rr(@@@��'��rr�'��rr(@@@����!t��'��rr-�'��rr.@@��'��rr-�'��rr.@@@��'��rr�'��rr.@@@@@��'��rr�( �rr.@��(�rr�(�rr.@@��(�p�q�(�r/r2@@���&��(�@@ ��(�@@ �A�������	u [Backing_out_channel] generalizes [Out_channel] to a narrow interface that can be used
    to collect strings, etc. @��(�pzpz�(�p�p�@@@@��(�pzpz�(�p�p�@@��)@@ ��)@@ �A@��(�p�p��( �r/r2@��("�p�p��(#�r/r2@���Р	#set_synchronous_backing_out_channel��(+�r4r8�(,�r4r[@��@����!t��(5�r4r^�(6�r4r_@@��(8�r4r^�(9�r4r_@@@��@�����3Backing_out_channel!t��(D�r4rc�(E�r4rx@@��(G�r4rc�(H�r4rx@@@�����(Deferred!t��(Q�r4r��(R�r4r�@�����$unit��(Z�r4r|�([�r4r�@@��(]�r4r|�(^�r4r�@@@@��(`�r4r|�(a�r4r�@@@��(c�r4rc�(d�r4r�@@@��(f�r4r^�(g�r4r�@@@@@��(i�r4r4�(j�r4r�@��(l�r4r4�(m�r4r�@���Р	$with_synchronous_backing_out_channel��(u�r�r��(v�r�r�@��@����!t��(�r�r��(��r�r�@@��(��r�r��(��r�r�@@@��@�����3Backing_out_channel!t��(��r�r��(��r�r�@@��(��r�r��(��r�r�@@@���!f��@����$unit��(��r�r��(��r�r�@@��(��r�r��(��r�r�@@@�����(Deferred!t��(��r�r��(��r�r�@���!a��(��r�r��(��r�r�@@@@��(��r�r��(��r�r�@@@��(��r�r��(��r�r�@@@�����(Deferred!t��(��r�r��(��r�s	@���!a��(��r�r��(��r�r�@@@@��(��r�r��(��r�s	@@@��(��r�r��(��r�s	@@@��(��r�r��(��r�s	@@@��(��r�r��(��r�s	@@@@@��(��r�r��(��r�s	@��(��r�r��(��r�s	@�����(��)�@@ ��)�@@ �A�������"/*@��(��ss�(��ss@@@@��(��ss�(��ss@@��)�@@ ��)�@@ �A��(��ss�(��ss@�����'Private��)�ss�)�ss"@�����Р2set_bytes_received��)�s)s/�)�s)sA@��@����!t��)�s)sD�)�s)sE@@��)�s)sD�)�s)sE@@@��@�����%Int63!t��)%�s)sI�)&�s)sP@@��)(�s)sI�))�s)sP@@@����$unit��)0�s)sT�)1�s)sX@@��)3�s)sT�)4�s)sX@@@��)6�s)sI�)7�s)sX@@@��)9�s)sD�):�s)sX@@@@@��)<�s)s+�)=�s)sX@��)?�s)s+�)@�s)sX@���Р1set_bytes_written��)H�sYs_�)I�sYsp@��@����!t��)R�sYss�)S�sYst@@��)U�sYss�)V�sYst@@@��@�����%Int63!t��)a�sYsx�)b�sYs@@��)d�sYsx�)e�sYs@@@����$unit��)l�sYs��)m�sYs�@@��)o�sYs��)p�sYs�@@@��)r�sYsx�)s�sYs�@@@��)u�sYss�)v�sYs�@@@@@��)x�sYs[�)y�sYs�@��){�sYs[�)|�sYs�@�����0Check_buffer_age��)��s�s��)��s�s�@�������6Internal_for_unit_test��)��s�s��)��s�s�@�����Р)check_now��)��s�s��)��s�s�@���0check_invariants����$bool��)��s�s��)��s�s�@@��)��s�s��)��s�s�@@@���+time_source�����+Time_source!t��)��s�t�)��s�t@@��)��s�t�)��s�t@@@����$unit��)��s�t�)��s�t!@@��)��s�t�)��s�t!@@@��)��s�t �)��s�t!@@@��)��s�s��)��s�t!@@@@@��)��s�s��)��s�t!@��)��s�s��)��s�t!@���Р5num_active_checks_for��)��t"t,�)��t"tA@��@�����+Time_source!t��)��t"tD�)��t"tQ@@��)��t"tD�)��t"tQ@@@����&option��)��t"tY�)��t"t_@�����#int��)��t"tU�)��t"tX@@��)��t"tU�)��t"tX@@@@��* �t"tU�*�t"t_@@@��*�t"tD�*�t"t_@@@@@��*�t"t(�*�t"t_@��*	�t"t(�*
�t"t_@@��*�s�s��*�t`tg@@@��*�s�s��*�t`tg@��*�s�s��*�t`tg@@��*�s�s��*�thtm@@@��*�s�s��*�thtm@��*�s�s��*�thtm@@��*�ss%�*�tntq@@@��*!�ss�*"�tntq@��*$�ss�*%�tntq@@