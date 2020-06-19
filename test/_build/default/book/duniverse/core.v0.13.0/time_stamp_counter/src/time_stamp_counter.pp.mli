Caml1999N026����   K         	Ibook/duniverse/core.v0.13.0/time_stamp_counter/src/time_stamp_counter.mli����  `g  �  ;O  7������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���1CONFIG_H_CONFIG_H����'Defined��	;book/duniverse/core.v0.13.0/time_stamp_counter/src/config.hBZb�BZs@�����"()��
BZb�BZs@@��BZb�BZs@@@��BZb�BZs@@@���3JSC_ARCH_BIG_ENDIAN����)Undefined��Ct|�Ct O@@��Ct|� Ct O@@@���2JSC_ARCH_SIXTYFOUR����+��*D P X�+D P j@�����)��2D P X�3D P j@@��5D P X�6D P j@@@��8D P X�9D P j@@@���+JSC_EVENTFD����(��CE k s�DE k ~@@��FE k s�GE k ~@@@���-JSC_FDATASYNC����R��QF  ��RF  �@�����P��YF  ��ZF  �@@��\F  ��]F  �@@@��_F  ��`F  �@@@���-JSC_LINUX_EXT����O��jG � ��kG � �@@��mG � ��nG � �@@@���,JSC_MKOSTEMP����y��xH � ��yH � �@�����w���H � ���H � �@@���H � ���H � �@@@���H � ���H � �@@@���0JSC_MSG_NOSIGNAL����v���I � ���I � �@@���I � ���I � �@@@���0JSC_POSIX_TIMERS��������J � ���J � �@���������J � ���J � �@@���J � ���J � �@@@���J � ���J � �@@@���.JSC_PTHREAD_NP��������K � ���K �@@���K � ���K �@@@���,JSC_RECVMMSG��������L	��L	@@���L	��L	@@@���-JSC_RLIMIT_AS����հ��M&��M3@�����Ӱ��M&��M3@@���M&��M3@@@���M&��M3@@@���/JSC_RLIMIT_NICE����Ұ��N4<��N4K@@���N4<��N4K@@@���0JSC_SO_NOSIGPIPE��������OLT��OLd@��������OLT�OLd@@��OLT�OLd@@@��	OLT�
OLd@@@���2JSC_THREAD_CPUTIME�������Pem�Pe@@��Pem�Pe@@@���4JSC_THREAD_ID_METHOD����#��"Q���#Q��@����!1@��*Q���+Q��@@@��-Q���.Q��@@@���+JSC_TIMERFD������8R���9R��@@��;R���<R��@@@���+JSC_WORDEXP����G��FS���GS��@�����E��NS���OS��@@��QS���RS��@@@��TS���US��@@@���-ocaml_version����`��oA@ ��pA@ �A�������!4@��zA@ ��{A@ �A@@����!9@���A@ ���A@ �A@@����!0@���A@ ���A@ �A@@@���A@ ���A@ �A@@���A@ ���A@ �A@@@���A@ ���A@ �A@@@4@@�����9@9@@@9@@9@@@@9@@@9@99�����*ocaml.text��?@@ ��@@@ �A�������
  
� High-performance timing.

    This module provides the fast function [now ()] which is our best effort
    high-performance cycle counter for a given platform.  For x86 systems this retrieves
    the CPU's internal time stamp counter using the RDTSC instruction.  For systems that
    do not have a RDTSC instruction, we fallback to using
    [clock_gettime(CLOCK_MONOTONIC)].

    Here is a benchmark of execution time in nanos and allocations in words:

    {v
      Name                         Time/Run   mWd/Run
     ---------------------------- ---------- ---------
      Time.now                      27.99ns     2.00w
      Time_ns.now                   25.21ns
      TSC.Calibrator.calibrate      68.61ns
      TSC.now                        6.87ns
      TSC.to_time                    4.30ns     2.00w
      TSC.to_time (TSC.now ())       8.75ns     2.00w
      TSC.to_time_ns                 4.70ns
      TSC.to_time_ns(TSC.now ())     9.56ns
      id                             2.86ns
      TSC.Span.of_ns                11.66ns
      TSC.Span.to_ns                 3.84ns
    v}

    Type [t] is an [Int63.t] and consequently has no allocation overhead (on 64-bit
    machines), unlike [Time.now ()] which returns a boxed float.

    Functions are also provided to estimate the relationship of CPU time-stamp-counter
    frequency to real time, thereby allowing one to convert from [t] to [Time.t].  There
    are some caveats to this that are worth noting:

    - The conversion to [Time.t] depends on an estimate of the time-stamp-counter
      frequency.  This frequency may be volatile on some systems, thereby reducing the
      utility of this conversion.  See the [Calibrator] module below for details.

    - The captured [t] can only be converted to a [Time.t] if one also has a
      recently calibrated [Calibrator.t] from the same machine.

    - Put another way, it would not make sense to send a sexp of [t] from one box to
      another and then convert it to a [Time.t], because [t] counts the number of cycles
      since reset. So the measure only makes sense in the context of a single machine.

    - Note that a cursory search for information about time stamp counter usage may give a
      false impression of its unreliability. Early processor implementations of TSC could
      be skewed by clock frequency changes (C-states) and by small differences between the
      startup time of each processor on a multi-processor machine. Modern hardware can
      usually be assumed to have an "invariant" tsc, and Linux has support to synchronize
      the initial counters at boot time when multiple processors are present.

    See also: {:http://en.wikipedia.org/wiki/Time_Stamp_Counter}
@��	Ibook/duniverse/core.v0.13.0/time_stamp_counter/src/time_stamp_counter.mliA@@�u
�
�@@@@��A@@�u
�
�@@��Q@@ ��R@@ �A��
A@@�u
�
�@������+Core_kernel��z
�
��z
�
�@@��z
�
��z
�
�@@��z
�
��z
�
�@������&Import��${
�
��%{
�
�@@��'{
�
��({
�
�@@��*{
�
��+{
�
�@���A�    �!t��4}
�
��5}
�
�@@@@@������%Int63!t��?}
�
��@}
�
�@@��B}
�
��C}
�
�@@@���(deriving��I}
�
��J}
�@�����������&bin_io��X}
��Y}
�@��[}
��\}
�@@@�����'compare��d}
��e}
�@��g}
��h}
�@@@�����$sexp��p}
��q}
�@��s}
��t}
�@@@@��v}
��w}
�@@@@��y}
��z}
�@@��|}
�
��}}
�@@��}
�
���}
�@@���}
�
���}
�@�����������-ocaml.warning���}
�
���}
�@�������#-32@���}
�
���}
�@@@@���}
�
���}
�@@���}
�
���}
�@���}
�
���}
�@������������(Bin_prot'Binable!S���}
�
���}
�@���}
�
���}
�@@����!t���}
�
���}
�@    �����}
�
���}
�
�@@@@A���������}
�
���}
�
�@@���}
�
���}
�@@@@���}
�
���}
�@@���}
�
���}
�@@���}
�
���}
�@@���}
�
���}
�@���Р'compare���}
�
���}
�
�@��@��������}
�
���}
�
�@@���}
�
���}
�
�@@@��@����ɰ��}
�
���}
�
�@@���}
�
�� }
�
�@@@����#int��}
�
��}
�
�@@��
}
�
��}
�
�@@@��}
�
��}
�
�@@@��}
�
��}
�
�@@@@@��}
�
��}
�@��}
�
��}
�@������������1Ppx_sexp_conv_lib(Sexpable!S��(}
�
��)}
�@��+}
�
��,}
�@@����q��2}
�
��3}
�@    ���7}
�
��8}
�
�@@@@A�������?}
�
��@}
�
�@@��B}
�
��C}
�@@@@��E}
�
��F}
�@@��H}
�
��I}
�@@��K}
�
��L}
�@@��N}
�
��O}
�@@��Q}
�
��R}
�@@��T}
�
��U}
�@���)ocaml.doc��[}
�
��\}
�@�������'@inline@��f}
�
��g}
�@@@@��i}
�
��j}
�@@��l}
�
��m}
�@@��o}
�
��p}
�@�����������+Comparisons!S��'��4@���'��4@@����!t���?��@@    ����?��@@@@@A�����!t���D��E@@���D��E@@@@���:��E@@���'��E@@�����E@@�����E@�����*Calibrator��� V���� V�@�������A�    �#tsc��� W�� W@@@@A@@��� W�� W@@��� W�� W@���A�    �!t��� X �� X!@@@@A@���(deriving��� X%�� X-@�����������&bin_io��� X.�� X4@��� X.�� X4@@@�����$sexp��� X6�� X:@��� X6�� X:@@@@��� X.�� X:@@@@��� X.�� X:@@��� X"�� X;@@��� X�  X;@@�� X� X;@�������������� X� X;@�������@�� X� X;@@@@�� X� X;@@��  X�! X;@��# X�$ X;@������������(Bin_prot'Binable!S��5 X�6 X;@��8 X�9 X;@@����~��? X�@ X;@    �w��D X �E X!@@@@A�������L X �M X!@@��O X�P X;@@@@��R X�S X;@@��U X�V X;@@��X X�Y X;@@��[ X�\ X;@������������1Ppx_sexp_conv_lib(Sexpable!S��m X�n X;@��p X�q X;@@�������w X�x X;@    ����| X �} X!@@@@A��������� X �� X!@@��� X�� X;@@@@��� X�� X;@@��� X�� X;@@��� X�� X;@@��� X�� X;@@��� X�� X;@@��� X�� X;@���E��� X�� X;@�������D@��� X�� X;@@@@��� X�� X;@@��� X�� X;@@��� X�� X;@���Р&create��� ]AG�� ]AM@��@����$unit��� ]AP�� ]AT@@��� ]AP�� ]AT@@@����!t��� ]AX�� ]AY@@��� ]AX�� ]AY@@@��� ]AP�� ]AY@@@@���)ocaml.doc��'@@ ��(@@ �A�������	� [create ()] creates an uninitialized calibrator instance.  Creating a calibrator
      takes about 3ms.  One needs a recently calibrated [Calibrator.t] and the TSC value
      from the same machine to meaningfully convert the TSC value to a [Time.t]. @��� Z=?�� \�@@@@@��� Z=?�� \�@@@��8@@ ��9@@ �A@��� ]AC�� ]AY@��� ]AC�� ]AY@���Р)calibrate��� a���� a��@��@����!t�� a��� a��@@��
 a��� a��@@@����$unit�� a��� a��@@�� a��� a��@@@�� a��� a��@@@@���B��h@@ ��i@@ �A�������	[ [calibrate t] updates [t] by measuring the current value of the TSC and
      [Time.now]. @��) _[]�* `��@@@@��, _[]�- `��@@��y@@ ��z@@ �A@��2 a���3 a��@��5 a���6 a��@���Р'cpu_mhz��> ex~�? ex�@�����(Or_error!t��H ex��I ex�@���@����!t��S ex��T ex�@@��V ex��W ex�@@@����%float��^ ex��_ ex�@@��a ex��b ex�@@@��d ex��e ex�@@@@��g ex��h ex�@@@@�������@@ ���@@ �A�������	� Returns the estimated MHz of the CPU's time-stamp-counter based on the TSC and
      [Time.now ()].  This function is undefined on 32-bit machines. @��x c���y d0w@@@@��{ c���| d0w@@���@@ ���@@ �A@��� exz�� ex�@��� exz�� ex�@���������@@ ���@@ �A�������"/*@��� g���� g��@@@@��� g���� g��@@���@@ ���@@ �A��� g���� g��@�����'Private��� lFO�� lFV@�����Р,create_using��� m]e�� m]q@���#tsc����#tsc��� m]x�� m]{@@��� m]x�� m]{@@@���$time����%float��� m]��� m]�@@��� m]��� m]�@@@���'samples����$list��� m]��� m]�@��������#tsc��� m]��� m]�@@��� m]��� m]�@@@�����%float��� m]��� m]�@@��� m]��� m]�@@@@��� m]��� m]�@@@@��� m]��  m]�@@@����!t�� m]�� m]�@@��
 m]�� m]�@@@�� m]�� m]�@@@�� m]� m]�@@@�� m]t� m]�@@@@@�� m]a� m]�@�� m]a� m]�@���Р/calibrate_using��" n���# n��@��@����!t��, n���- n��@@��/ n���0 n��@@@���#tsc����#tsc��; n���< n��@@��> n���? n��@@@���$time����%float��J n���K n��@@��M n���N n��@@@���/am_initializing����$bool��Y n���Z n��@@��\ n���] n��@@@����$unit��d n���e n�@@��g n���h n�@@@��j n���k n�@@@��m n���n n�@@@��p n���q n�@@@��s n���t n�@@@@@��v n���w n�@��y n���z n�@���Р*initialize��� o
�� o@��@����!t��� o�� o@@��� o�� o@@@��@����$list��� o*�� o.@��������#tsc��� o�� o @@��� o�� o @@@�����%float��� o#�� o(@@��� o#�� o(@@@@��� o�� o(@@@@��� o�� o.@@@����$unit��� o2�� o6@@��� o2�� o6@@@��� o�� o6@@@��� o�� o6@@@@@��� o�� o6@��� o�� o6@���Р/nanos_per_cycle��� p7?�� p7N@��@����!t��� p7Q�� p7R@@��� p7Q�� p7R@@@����%float��� p7V�� p7[@@��� p7V�� p7[@@@��� p7Q�� p7[@@@@@��� p7;�� p7[@��� p7;�� p7[@@��� lFY�� q\a@@@�� lFH� q\a@�� lFH� q\a@@�� V�
� rbe@@����#tsc�� sfp� sfs@    ��� sfp� sfs@@@@A�����!t�� sfw� sfx@@��  sfw�! sfx@@@@��# sfk�$ sfx@@��& V�
�' sfx@@���P��v@@ ��w@@ �A�������
  � A calibrator contains a snapshot of machine-specific information that is used to
    convert between TSC values and clock time.  This information needs to be calibrated
    periodically such that it stays updated w.r.t. changes in the CPU's time-stamp-counter
    frequency, which can vary depending on load, heat, etc.  (Also see the comment in the
    [.ml] file.)

    Calibration at the rate of 0.1, 1 or 2 secs produces errors (measured as the
    difference between [Time.now] and the reported time here) on the order of 1-2us.
    Given the precision of 52-bit float mantissa values, this is very close to the least
    error one can have on these values.  Calibration once per 10sec produces errors that
    are +/-4us. Calibration once per minute produces errors that are +/-15us and
    calibration once in 3mins produces errors +/-30us.  (It is worth remarking that the
    error has a positive bias of 1us -- i.e., the error dances around the 1us mark, rather
    than around 0. It is unclear where this bias is introduced, though it probably does
    not matter for most applications.)

    This module maintains an instance of [t] internal to the module.  The internal
    instance of [t] can be updated via calls to [calibrate ()], i.e., without specifying
    the [t] parameter.  In all the functions below that take an optional [Calibrator.t]
    argument, the internal instance is used when no calibrator is explicitly specified.
@��7 AGG�8 U��@@@@��: AGG�; U��@@���@@ ���@@ �A@��@ V���A sfx@��C V���D sfx@�����$Span��L v���M v��@�����A�    �!t��X w���Y w��@@@@@������%Int63!t��c w���d w��@@��f w���g w��@@@���(deriving��m w���n w��@�����������&bin_io��| w���} w��@�� w���� w��@@@�����$sexp��� w���� w��@��� w���� w��@@@@��� w���� w��@@@@��� w���� w��@@��� w���� w��@@��� w���� w��@@��� w���� w��@�������������� w���� w��@�������@��� w���� w��@@@@��� w���� w��@@��� w���� w��@��� w���� w��@������������(Bin_prot'Binable!S��� w���� w��@��� w���� w��@@������� w���� w��@    ����� w���� w��@@@@A��������� w���� w��@@��� w���� w��@@@@��� w���� w��@@��� w���� w��@@��� w���� w��@@��� w���� w��@������������1Ppx_sexp_conv_lib(Sexpable!S�� w��� w��@�� w���	 w��@@����N�� w��� w��@    ���� w��� w��@@@@A�����Ű� w��� w��@@�� w���  w��@@@@��" w���# w��@@��% w���& w��@@��( w���) w��@@��+ w���, w��@@��. w���/ w��@@��1 w���2 w��@���ݰ�7 w���8 w��@��������@��A w���B w��@@@@��D w���E w��@@��G w���H w��@@��J w���K w��@����������*Comparable��X y��Y y�@��[ y��\ y�@@����!t��c y��d y�@    ���h y��i y�@@@@A�����!t��q y��r y�@@��t y��u y�@@@@��w y��x y�@@��z y��{ y�@@��} y���~ y�@@��� y���� y�@����������'Intable��� z)�� z0@��� z)�� z0@@����!t��� z;�� z<@    ���� z;�� z<@@@@A�����!t��� z@�� zA@@��� z@�� zA@@@@��� z6�� zA@@��� z)�� zA@@��� z!�� zA@@��� z!�� zA@���Р!+��� |CI�� |CN@��@����!t��� |CQ�� |CR@@��� |CQ�� |CR@@@��@����!t��� |CV�� |CW@@��� |CV�� |CW@@@����!t��� |C[�� |C\@@��� |C[�� |C\@@@��� |CV�� |C\@@@��� |CQ�� |C\@@@@@��� |CE�� |C\@��� |CE�� |C\@���Р!-��� }]c�� }]h@��@����!t�� }]k� }]l@@�� }]k� }]l@@@��@����!t�� }]p� }]q@@�� }]p� }]q@@@����!t�� }]u� }]v@@�� }]u� }]v@@@��! }]p�" }]v@@@��$ }]k�% }]v@@@@@��' }]_�( }]v@��* }]_�+ }]v@���Р,to_time_span��3 �y�4 �y�@��@����!t��= �y��> �y�@@��@ �y��A �y�@@@���*calibrator�����*Calibrator!t��N �y��O �y�@@��Q �y��R �y�@@@������$Time$Span!t��] �y��^ �y�@@��` �y��a �y�@@@��c �y��d �y�@@@��f �y��g �y�@@@@@��i �y{�j �y�@��l �y{�m �y�@���Р%to_ns��u ����v ���@��@����!t�� ����� ���@@��� ����� ���@@@���*calibrator�����*Calibrator!t��� ����� ���@@��� ����� ���@@@�����%Int63!t��� ����� ���@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��� ����� ���@���Р%of_ns��� ����� ���@��@�����%Int63!t��� ����� ��@@��� ����� ��@@@���*calibrator�����*Calibrator!t��� ���� �� @@��� ���� �� @@@����!t��� ��$�� ��%@@��� ��$�� ��%@@@��� ��	�� ��%@@@��� ����� ��%@@@@@��� ����� ��%@��� ����� ��%@����� ��
>@@ ��
?@@ �A�������"/*@��� �')�  �'0@@@@�� �')� �'0@@��
O@@ ��
P@@ �A�� �')�	 �'0@�����'Private�� ���� ���@�����Р(of_int63�� ���� ���@��@�����%Int63!t��( ����) ���@@��+ ����, ���@@@����!t��3 ���4 ��@@��6 ���7 ��@@@��9 ����: ��@@@@@��< ����= ��@��? ����@ ��@���Р(to_int63��H ��I �@��@����!t��R ��S �@@��U ��V �@@@�����%Int63!t��_ ��` �"@@��b ��c �"@@@��e ��f �"@@@@@��h ��i �"@��k ��l �"@@��n ����o �#(@@@��q ����r �#(@��t ����u �#(@@��w v���x �),@@������
�@@ ��
�@@ �A�������	1 [Span] indicates some integer number of cycles. @��� uzz�� uz�@@@@��� uzz�� uz�@@��
�@@ ��
�@@ �A@��� v���� �),@��� v���� �),@���Р#now��� �LU�� �LX@��@����$unit��� �L[�� �L_@@��� �L[�� �L_@@@����!t��� �Lc�� �Ld@@��� �Lc�� �Ld@@@��� �L[�� �Ld@@@�'tsc_get@���'noalloc��� �Lt�� �L{@�@��� �Lq�� �L|@@��� �LL�� �L|@��� �LL�� �L|@���Р$diff��� ����� ���@��@����!t��� ����� ���@@��� ����� ���@@@��@����!t��� ����� ���@@��� ����� ���@@@�����$Span!t��� ����� ���@@��� ����� ���@@@��� ����� ���@@@��	 ����	 ���@@@@@��	 ����	 ���@��	 ����	 ���@���Р#add��	 ����	 ���@��@����!t��	 ����	 ���@@��	 ����	 ���@@@��@�����$Span!t��	) ����	* ���@@��	, ����	- ���@@@����!t��	4 ����	5 ���@@��	7 ����	8 ���@@@��	: ����	; ���@@@��	= ����	> ���@@@@@��	@ ����	A ���@��	C ����	D ���@���Р(to_int63��	L ����	M ���@��@����!t��	V ����	W �� @@��	Y ����	Z �� @@@�����%Int63!t��	c ���	d ��@@��	f ���	g ��@@@��	i ����	j ��@@@@@��	l ����	m ��@��	o ����	p ��@���Р$zero��	x ��	y �@����!t��	� ��	� �@@��	� ��	� �@@@@@��	� ��	� �@��	� ��	� �@���Р*calibrator��	� �im�	� �iw@�����$Lazy!t��	� �i��	� �i�@������*Calibrator!t��	� �iz�	� �i�@@��	� �iz�	� �i�@@@@��	� �iz�	� �i�@@@@���װ��@@ ���@@ �A�������
  I A default calibrator for the current process. Most programs can just use this
    calibrator; use others if collecting data from other processes / machines.

    The first time this lazy value is forced, it spends approximately 3ms calibrating.

    While the [Async] scheduler is running, this value is recalibrated regularly. @��	� ��	� �h@@@@��	� ��	� �h@@��@@ ��@@ �A@��	� �ii�	� �i�@��	� �ii�	� �i�@���Р'to_time��	� ����	� ���@��@����!t��	� ����	� ���@@��	� ����	� ���@@@���*calibrator�����*Calibrator!t��	� ��	�	� ��@@��	� ��	�	� ��@@@�����$Time!t��	� ���	� ��@@��	� ���	� ��@@@��
 ����
 ��@@@��
 ����
 ��@@@@���.��T@@ ��U@@ �A�������	U

   It is guaranteed that repeated calls will return nondecreasing [Time.t] values. @��
 ����
 ���@@@@��
 ����
 ���@@��e@@ ��f@@ �A@��
 ����
 ��@��
! ����
" ��@���Р*to_time_ns��
* �"&�
+ �"0@��@����!t��
4 �"3�
5 �"4@@��
7 �"3�
8 �"4@@@���*calibrator�����*Calibrator!t��
E �"C�
F �"O@@��
H �"C�
I �"O@@@�����'Time_ns!t��
R �"S�
S �"\@@��
U �"S�
V �"\@@@��
X �"8�
Y �"\@@@��
[ �"3�
\ �"\@@@@@��
^ �""�
_ �"\@��
a �""�
b �"\@�����
u���@@ ���@@ �A�������"/*@��
t �^^�
u �^e@@@@��
w �^^�
x �^e@@���@@ ���@@ �A��
} �^^�
~ �^e@�����'Private��
� ���
� ��@�����Р$ewma��
� ��
� �@���%alpha����%float��
� �&�
� �+@@��
� �&�
� �+@@@���#old����%float��
� �3�
� �8@@��
� �3�
� �8@@@���#add����%float��
� �@�
� �E@@��
� �@�
� �E@@@����%float��
� �I�
� �N@@��
� �I�
� �N@@@��
� �<�
� �N@@@��
� �/�
� �N@@@��
� � �
� �N@@@@@��
� ��
� �N@��
� ��
� �N@���Р(of_int63��
� �OU�
� �O]@��@�����%Int63!t��
� �O`�
� �Og@@��
� �O`�
� �Og@@@����!t��
� �Ok�
� �Ol@@��
� �Ok�
� �Ol@@@��
� �O`�
� �Ol@@@@@�� �OQ� �Ol@�� �OQ� �Ol@���Р	"max_percent_change_from_real_slope�� �ms� �m�@����%float�� �m�� �m�@@�� �m�� �m�@@@@@�� �mo� �m�@�� �mo� �m�@���Р4to_nanos_since_epoch��' ����( ���@��@����!t��1 ����2 ���@@��4 ����5 ���@@@���*calibrator�����*Calibrator!t��B ����C ���@@��E ����F ���@@@����!t��M ����N ���@@��P ����Q ���@@@��S ����T ���@@@��V ����W ���@@@@@��Y ����Z ���@��\ ����] ���@@��_ ���` ���@@@��b ����c ���@��e ����f ���@@