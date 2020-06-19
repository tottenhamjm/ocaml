Caml1999M026����   )         	'book/duniverse/core.v0.13.0/src/core.ml����   !  k  D  "�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ��@������"()��	'book/duniverse/core.v0.13.0/src/core.mlA@@�A@@@@��A@@�A@@@@@���������-Ppx_bench_lib5Benchmark_accumulator/Current_libname#set��A@@�A@@@��A@@�A@@@@@��@���$core@�� A@@�!A@@@@@@��#A@@�$A@@@@@@��&A@@�'A@@@@��)A@@�*A@@@���@������"()��6A@@�7A@@@@��9A@@�:A@@@@@��������5Expect_test_collector,Current_file#set��GA@@�HA@@@��JA@@�KA@@@@@���1absolute_filename���R@��TA@@�UA@@@@@@��WA@@�XA@@@@@@��ZA@@�[A@@@@��]A@@�^A@@@���@������4��iA@@�jA@@@@��lA@@�mA@@@@@��������3Ppx_inline_test_lib'Runtime5set_lib_and_partition��zA@@�{A@@@��}A@@�~A@@@@@��@���f@���A@@��A@@@@@��@��� @���A@@��A@@@@@@���A@@��A@@@@@@���A@@��A@@@@���A@@��A@@@�����*ocaml.text���@@ ���@@ �A�������
  K [Core] is an extension of {{!Core_kernel}[Core_kernel]} with Unix APIs. The unmodified
    libraries can be found there.

    In particular, [Core] has comprehensive implementation of times ([Time] and
    [Time_ns]), where some details are platform-specific.

    Some modules are mere extensions of those existing in [Core_kernel], like [Bigstring],
    [Caml], [Time], and [Md5], where what's added is handlers for reading from or writing
    to Unix sockets and file descriptors, or support for floating-point numbers. Other
    modules are entirely new, like:

    - [Command], a richly featured tool for creating command-line programs.
    - [Iobuf], which lets you use contiguous ranges of bytes for I/O purposes.
    - [Linux_ext], providing a wrapper around Linux-specific system calls.
    - [Signal], for handling Unix signals like SIGHUP and SIGKILL.

    A few modules in Core don't have any platform-specific functionality but haven't yet
    been ported to Core_kernel for technical reasons (like a dependency on [Time], which
    until recently was only in Core):

    - [Interval]
@���A@@��VNP@@@@���A@@��VNP@@���@@ ���@@ �A���A@@��VNP@��������@@ ���@@ �A�������"/*@���WQQ��WQX@@@@���WQQ��WQX@@���@@ ���@@ �A���WQQ��WQX@����������+Core_kernel3Core_kernel_private*Std_kernel���YZb��YZ�@���YZb��YZ�@@���YZZ��YZ�@@���YZZ��YZ�@�����R���@@ ���@@ �A�������"/*@���Z����Z��@@@@���Z��� Z��@@���@@ ���@@ �A��Z���Z��@�����)Bigstring��\���\��@����)Bigstring��\���\��@��\���\��@@@��\���\��@��\��� \��@�����$Caml��(]���)]��@����$Caml��0]���1]��@��3]���4]��@@@��6]���7]��@��9]���:]��@�����'Command��B^���C^��@����'Command��J^��K^�@��M^��N^�@@@��P^���Q^�@��S^���T^�@�����+Core_stable��\_�]_@����&Stable��d_-�e_3@��g_-�h_3@@@��j_�k_3@��m_�n_3@�����$Date��v`4;�w`4?@����)Core_date��~`4T�`4]@���`4T��`4]@@@���`44��`4]@���`44��`4]@�����(Filename���a^e��a^m@����-Core_filename���a^~��a^�@���a^~��a^�@@@���a^^��a^�@���a^^��a^�@�����(Interval���b����b��@����(Interval���b����b��@���b����b��@@@���b����b��@���b����b��@�����-Interval_intf���c����c��@����-Interval_intf���c����c��@���c����c��@@@���c����c��@���c����c��@�����%Iobuf���d����d��@����%Iobuf���d���d�@���d���d�@@@���d����d�@���d����d�@�����+Iobuf_debug���e	��e	@����+Iobuf_debug�� e	)�e	4@��e	)�e	4@@@��e		�e	4@��	e		�
e	4@�����*Iobuf_intf��f5<�f5F@����*Iobuf_intf��f5U�f5_@��f5U�f5_@@@�� f55�!f5_@��#f55�$f5_@�����)Linux_ext��,g`g�-g`p@����)Linux_ext��4g`��5g`�@��7g`��8g`�@@@��:g``�;g`�@��=g``�>g`�@�����&Digest��Fh���Gh��@����#Md5��Nh���Oh��@��Qh���Rh��@@���0ocaml.deprecated��Xh���Yh��@�������	 [since 2017-05] Use Md5 instead.@��ch���dh��@@@@��fh���gh��@@��ih���jh��@@��lh���mh��@��oh���ph��@�����%Mutex��xl���yl��@��@��}l���~l��@@���*deprecated���l����l��@�������	*[since 2019-02] Use [Error_checking_mutex]@���l����l�@@@@���l����l�@@���l����l�@@���l����l�@���l����l�@�����&Signal���m#��m)@����&Signal���m<��mB@���m<��mB@@@���m��mB@���m��mB@�����#Sys���nCJ��nCM@����(Core_sys���nCc��nCk@���nCc��nCk@@@���nCC��nCk@���nCC��nCk@�����&Thread���ols��oly@����+Core_thread���ol���ol�@���ol���ol�@@@���oll��ol�@���oll��ol�@�����$Time���p����p��@����/Core_time_float���p����p��@���p����p��@@@�� p���p��@��p���p��@�����+Time_common��q���q��@����+Time_common��q���q��@��q���q��@@@��q���q��@��q���q��@�����'Time_ns��&r���'r�	@����,Core_time_ns��.r�	�/r�	 @��1r�	�2r�	 @@@��4r���5r�	 @��7r���8r�	 @�����$Unix��@s	!	(�As	!	,@����)Core_unix��Hs	!	A�Is	!	J@��Ks	!	A�Ls	!	J@@@��Ns	!	!�Os	!	J@��Qs	!	!�Rs	!	J@�����,Version_util��Zt	K	R�[t	K	^@����,Version_util��bt	K	k�ct	K	w@��et	K	k�ft	K	w@@@��ht	K	K�it	K	w@��kt	K	K�lt	K	w@���@�����#sec��ww	�	��xw	�	�@��zw	�	��{w	�	�@@@������$Time$Span&of_sec���w	�	���w	�	�@���w	�	���w	�	�@@@@���w	�	���w	�	�@@���w	�	���w	�	�@���@�����"^/���x	�	���x	�	�@���x	�	���x	�	�@@@�����-Core_filename&concat���x	�	���x	�	�@���x	�	���x	�	�@@@@���x	�	���x	�	�@@���x	�	���x	�	�@�����,Core_private���z	�	���z	�
@�������)Core_zone���{

��{

@����)Core_zone���{

!��{

*@���{

!��{

*@@@���{

��{

*@���{

��{

*@@���z	�
��|
+
.@@@���z	�	���|
+
.@���z	�	���|
+
.@���@����������|
+
.��|
+
.@@���|
+
.��|
+
.@@@��������3Ppx_inline_test_lib'Runtime)unset_lib���|
+
.��|
+
.@���|
+
.� |
+
.@@@��@����@��|
+
.�|
+
.@@@@��
|
+
.�|
+
.@@@@��|
+
.�|
+
.@@��|
+
.�|
+
.@���@��������|
+
.�|
+
.@@��|
+
.� |
+
.@@@��������5Expect_test_collector,Current_file%unset��-|
+
.�.|
+
.@��0|
+
.�1|
+
.@@@��@����"()��:|
+
.�;|
+
.@@��=|
+
.�>|
+
.@@@@��@|
+
.�A|
+
.@@@@��C|
+
.�D|
+
.@@��F|
+
.�G|
+
.@���@������S��R|
+
.�S|
+
.@@��U|
+
.�V|
+
.@@@���������-Ppx_bench_lib5Benchmark_accumulator/Current_libname%unset��e|
+
.�f|
+
.@��h|
+
.�i|
+
.@@@��@����"()��r|
+
.�s|
+
.@@��u|
+
.�v|
+
.@@@@��x|
+
.�y|
+
.@@@@��{|
+
.�||
+
.@@��~|
+
.�|
+
.@@