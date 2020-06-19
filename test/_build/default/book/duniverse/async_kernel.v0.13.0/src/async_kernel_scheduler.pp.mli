Caml1999N026����   D         
	Bbook/duniverse/async_kernel.v0.13.0/src/async_kernel_scheduler.mli����  TJ  �  4�  1E�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������
   The Async scheduler is responsible for running Async jobs.  It maintains the queue of
    jobs that need to run.  A "cycle" consists of running some (possibly all) jobs in the
    queue, along with some other bookkeeping, like advancing Async's clock to the current
    time. @��	Bbook/duniverse/async_kernel.v0.13.0/src/async_kernel_scheduler.mliA@@�D@@@@��A@@�D@@���@@ ���@@ �A��
A@@�D@������+Core_kernel��F"�F-@@��F�F-@@��F�F-@������&Import��$G.4�%G.:@@��'G..�(G.:@@��*G..�+G.:@���A�    �,with_options��4I<D�5I<P@����!a��<I<A�=I<C@@@B@@@A����'monitor�����'Monitor!t��KI<\�LI<e@@��NI<\�OI<e@@@���(priority�����(Priority!t��\I<s�]I<}@@��_I<s�`I<}@@@��!a��eI<��fI<�@@@��hI<i�iI<�@@@��kI<S�lI<�@@@@��nI<<�oI<�@@��qI<<�rI<�@���Р9current_execution_context��zK���{K��@��@����$unit���K����K��@@���K����K��@@@�����1Execution_context!t���K����K��@@���K����K��@@@���K����K��@@@@@���K����K��@���K����K��@���Р.within_context���P����P��@��@�����1Execution_context!t���P����P��@@���P����P��@@@��@��@����$unit���P����P��@@���P����P��@@@��!a���P����P��@@@���P����P��@@@�����&Result!t���P����P��@���!a���P����P��@@@�����$unit���P����P��@@���P����P��@@@@���P����P��@@@���P����P��@@@���P����P��@@@@���)ocaml.doc���@@ ���@@ �A�������	� [within_context context f] runs [f ()] right now with the specified execution
    context.  If [f] raises, then the exception is sent to the monitor of [context], and
    [Error ()] is returned. @��M���Om�@@@@��M���	Om�@@���@@ ���@@ �A@��P���P��@��P���P��@���Р'within'��V04�V0;@����,with_options��"V0i�#V0u@���@��@����$unit��/V0@�0V0D@@��2V0@�3V0D@@@�����(Deferred!t��<V0K�=V0U@���!a��CV0H�DV0J@@@@��FV0H�GV0U@@@��IV0@�JV0U@@@�����(Deferred!t��SV0]�TV0g@���!a��ZV0Z�[V0\@@@@��]V0Z�^V0g@@@��`V0?�aV0g@@@@��cV0>�dV0u@@@@���p��T@@ ��U@@ �A�������
  M [within' f ~monitor ~priority] runs [f ()] right now, with the specified
    block group, monitor, and priority set as specified.  They will be reset to their
    original values when [f] returns.  If [f] raises, then the result of [within'] will
    never become determined, but the exception will end up in the specified monitor. @��tR���uU�/@@@@��wR���xU�/@@��e@@ ��f@@ �A@��}V00�~V0u@���V00��V0u@���Р&within���Y����Y��@����,with_options���Y����Y� @���@��@����$unit���Y����Y��@@���Y����Y��@@@����$unit���Y����Y��@@���Y����Y��@@@���Y����Y��@@@����$unit���Y����Y��@@���Y����Y��@@@���Y����Y��@@@@���Y����Y� @@@@���Ͱ��@@ ���@@ �A�������	Q [within] is like [within'], but doesn't require the thunk to return a deferred. @���Xww��Xw�@@@@���Xww��Xw�@@���@@ ���@@ �A@���Y����Y� @���Y����Y� @���Р(within_v���\PT��\P\@����,with_options���\P{��\P�@���@��@����$unit���\Pa��\Pe@@���\Pa��\Pe@@@��!a��\Pi�\Pk@@@��\Pa�\Pk@@@����&option��\Ps�\Py@���!a��\Pp�\Pr@@@@��\Pp�\Py@@@��\P`�\Py@@@@��\P_� \P�@@@@���,��@@ ��@@ �A�������	H [within_v] is like [within], but allows a value to be returned by [f]. @��0[�1[O@@@@��3[�4[O@@��!@@ ��"@@ �A@��9\PP�:\P�@��<\PP�=\P�@���Р*with_local��Ec���Fc�@��@������(Univ_map#Key!t��Sc��Tc�@���!a��Zc��[c�@@@@��]c��^c�@@@��@����&option��gc��hc�#@���!a��nc��oc�@@@@��qc��rc�#@@@���!f��@����$unit��c�*��c�.@@���c�*��c�.@@@��!b���c�2��c�4@@@���c�*��c�4@@@��!b���c�9��c�;@@@���c�'��c�;@@@���c���c�;@@@���c���c�;@@@@�������@@ ���@@ �A�������
  e [with_local key value ~f], when run in the current execution context, [e], runs [f]
    right now in a new execution context, [e'], that is identical to [e] except that
    [find_local key = value].  As usual, [e'] will be in effect in asynchronous
    computations started by [f].  When [with_local] returns, the execution context is
    restored to [e]. @���^����b��@@@@���^����b��@@���@@ ���@@ �A@���c����c�;@���c����c�;@���Р*find_local���g����g��@��@������(Univ_map#Key!t���g����g��@���!a���g����g��@@@@���g����g��@@@����&option���g����g��@���!a���g����g��@@@@���g����g��@@@���g����g��@@@@�������@@ ���@@ �A�������	^ [find_local key] returns the value associated to [key] in the current execution
    context. @���e==��f��@@@@��e==�f��@@���@@ ���@@ �A@��g���g��@��
g���g��@���Р)schedule'��kZ^�kZg@����,with_options��kZ��kZ�@���@��@����$unit��(kZl�)kZp@@��+kZl�,kZp@@@�����(Deferred!t��5kZw�6kZ�@���!a��<kZt�=kZv@@@@��?kZt�@kZ�@@@��BkZl�CkZ�@@@�����(Deferred!t��LkZ��MkZ�@���!a��SkZ��TkZ�@@@@��VkZ��WkZ�@@@��YkZk�ZkZ�@@@@��\kZj�]kZ�@@@@���i��M@@ ��N@@ �A�������	� Just like [within'], but instead of running the thunk right now, adds
    it to the Async queue to be run with other Async jobs. @��mi���njY@@@@��pi���qjY@@��^@@ ��_@@ �A@��vkZZ�wkZ�@��ykZZ�zkZ�@���Р(schedule���n����n�	@����,with_options���n�	��n�	)@���@��@����$unit���n�	��n�	
@@���n�	��n�	
@@@����$unit���n�	��n�	@@���n�	��n�	@@@���n�	��n�	@@@����$unit���n�	��n�	@@���n�	��n�	@@@���n�	��n�	@@@@���n�	��n�	)@@@@���ư��@@ ���@@ �A�������	L Just like [schedule'], but doesn't require the thunk to return a deferred. @���m����m��@@@@���m����m��@@���@@ ���@@ �A@���n����n�	)@���n����n�	)@���Р+enqueue_job���r	�	���r	�	�@��@�����1Execution_context!t���r	�	���r	�	�@@���r	�	���r	�	�@@@��@��@��!a���r	�	���r	�	�@@@����$unit�� r	�	��r	�	�@@��r	�	��r	�	�@@@��r	�	��r	�	�@@@��@��!a��r	�	��r	�	�@@@����$unit��r	�	��r	�	�@@��r	�	��r	�	�@@@��r	�	��r	�	�@@@��r	�	�� r	�	�@@@��"r	�	��#r	�	�@@@@���/��@@ ��@@ �A�������	� [eneque_job execution_context.t f a] enqueues into the scheduler's job queue a job
    that will run [f a] in [execution_context]. @��3p	+	+�4q	�	�@@@@��6p	+	+�7q	�	�@@��$@@ ��%@@ �A@��<r	�	��=r	�	�@��?r	�	��@r	�	�@���Р7thread_safe_enqueue_job��Hv
{
�Iv
{
�@��@�����1Execution_context!t��Tv
{
��Uv
{
�@@��Wv
{
��Xv
{
�@@@��@��@��!a��av
{
��bv
{
�@@@����$unit��iv
{
��jv
{
�@@��lv
{
��mv
{
�@@@��ov
{
��pv
{
�@@@��@��!a��wv
{
��xv
{
�@@@����$unit��v
{
���v
{
�@@���v
{
���v
{
�@@@���v
{
���v
{
�@@@���v
{
���v
{
�@@@���v
{
���v
{
�@@@@������|@@ ��}@@ �A�������	{ [thread_safe_enqueue_job] is like [enqueue_job], except it is for use from a
    thread that doesn't hold the Async lock. @���t	�	���u
K
z@@@@���t	�	���u
K
z@@���@@ ���@@ �A@���v
{
{��v
{
�@���v
{
{��v
{
�@���Р:preserve_execution_context���{����{��@��@��@��!a���{����{��@@@����$unit���{����{��@@���{����{��@@@���{����{��@@@�����&Staged!t���{����{��@���@��!a���{����{��@@@����$unit���{����{��@@���{����{��@@@���{����{��@@@@���{����{��@@@���{����{��@@@@�������@@ ���@@ �A�������	� [preserve_execution_context t f] saves the current execution context and returns a
    function [g] such that [g a] runs [f a] in the saved execution context.  [g a] becomes
    determined when [f a] becomes determined. @��x
�
��z~�@@@@��x
�
��z~�@@���@@ ���@@ �A@��
{���{��@��{���{��@���Р;preserve_execution_context'��}���}�@��@��@��!a�� }��!}�@@@�����(Deferred!t��*}�#�+}�-@���!b��1}� �2}�"@@@@��4}� �5}�-@@@��7}��8}�-@@@�����&Staged!t��A}�H�B}�P@���@��!a��J}�3�K}�5@@@�����(Deferred!t��T}�<�U}�F@���!b��[}�9�\}�;@@@@��^}�9�_}�F@@@��a}�3�b}�F@@@@��d}�2�e}�P@@@��g}��h}�P@@@@@��j}���k}�P@��m}���n}�P@���Р+cycle_start��v A���w A��@��@����$unit��� A���� A��@@��� A���� A��@@@�����$Time!t��� A���� A��@@��� A���� A��@@@��� A���� A��@@@@�������@@ ���@@ �A�������	\ [cycle_start ()] returns the result of [Time.now ()] called at the beginning of
    cycle. @���RR�� @��@@@@���RR�� @��@@���@@ ���@@ �A@��� A���� A��@��� A���� A��@���Р.cycle_start_ns��� C���� C��@��@����$unit��� C���� C��@@��� C���� C��@@@�����'Time_ns!t��� C���� C��@@��� C���� C��@@@��� C���� C��@@@@@��� C���� C��@��� C���� C��@���Р+cycle_times��� H���� H�@��@����$unit��� H��� H�
@@��� H��� H�
@@@�����,Async_stream!t��� H��� H�(@�������$Time$Span!t��	 H��
 H�@@�� H�� H�@@@@�� H�� H�(@@@�� H�� H�(@@@@�����@@ ��@@ �A�������	� [cycle_times ()] returns a stream that is extended with an element at the start of
    each Async cycle, with the amount of time that the previous cycle took, as determined
    by calls to [Time.now] at the beginning and end of the cycle. @��# E���$ G��@@@@��& E���' G��@@��@@ ��@@ �A@��, H���- H�(@��/ H���0 H�(@���Р.cycle_times_ns��8 J*.�9 J*<@��@����$unit��B J*?�C J*C@@��E J*?�F J*C@@@�����,Async_stream!t��O J*V�P J*d@�������'Time_ns$Span!t��\ J*G�] J*U@@��_ J*G�` J*U@@@@��b J*G�c J*d@@@��e J*?�f J*d@@@@@��h J**�i J*d@��k J**�l J*d@���Р+long_cycles��t Odh�u Ods@���(at_least������'Time_ns$Span!t��� Od�� Od�@@��� Od�� Od�@@@�����,Async_stream!t��� Od��� Od�@�������'Time_ns$Span!t��� Od��� Od�@@��� Od��� Od�@@@@��� Od��� Od�@@@��� Odv�� Od�@@@@�������@@ ���@@ �A�������	� [long_cycles ~at_least] returns a stream of cycles whose duration is at least
    [at_least].  [long_cycles] is more efficient than [cycle_times] because it only
    allocates a stream entry when there is a long cycle, rather than on every cycle. @��� Lff�� Nc@@@@��� Lff�� Nc@@���@@ ���@@ �A@��� Odd�� Od�@��� Odd�� Od�@���Р+cycle_count��� R	�� R@��@����$unit��� R�� R@@��� R�� R@@@����#int��� R�� R"@@��� R�� R"@@@��� R�� R"@@@@�������@@ ���@@ �A�������	O [cycle_count ()] returns the total number of Async cycles that have happened. @��� Q���� Q�@@@@��� Q���� Q�@@���@@ ���@@ �A@�� R� R"@�� R� R"@���Р0total_cycle_time�� V��� V��@��@����$unit�� V��� V��@@�� V��� V��@@@������'Time_ns$Span!t��' V���( V��@@��* V���+ V��@@@��- V���. V��@@@@���:��@@ ��@@ �A�������	_ [total_cycle_time ()] returns the total (wall) time spent executing jobs in Async
    cycles. @��> T$$�? Uz�@@@@��A T$$�B Uz�@@��/@@ ��0@@ �A@��G V���H V��@��J V���K V��@���Р/event_precision��S Y�T Y@��@����$unit��] Y"�^ Y&@@��` Y"�a Y&@@@������$Time$Span!t��l Y*�m Y5@@��o Y*�p Y5@@@��r Y"�s Y5@@@@�����c@@ ��d@@ �A�������	N The [alarm_precision] of the timing-wheel used to implement Async's [Clock]. @��� X���� X�@@@@��� X���� X�@@��t@@ ��u@@ �A@��� Y�� Y5@��� Y�� Y5@���Р2event_precision_ns��� [7;�� [7M@��@����$unit��� [7P�� [7T@@��� [7P�� [7T@@@������'Time_ns$Span!t��� [7X�� [7f@@��� [7X�� [7f@@@��� [7P�� [7f@@@@@��� [77�� [7f@��� [77�� [7f@���Р:force_current_cycle_to_end��� `,0�� `,J@��@����$unit��� `,M�� `,Q@@��� `,M�� `,Q@@@����$unit��� `,U�� `,Y@@��� `,U�� `,Y@@@��� `,M�� `,Y@@@@������@@ ���@@ �A�������	� [force_current_cycle_to_end ()] causes no more normal priority jobs to run in the
    current cycle, and for the end-of-cycle jobs (i.e., writes) to run, and then for the
    cycle to end. @��� ]hh�� _+@@@@��� ]hh�� _+@@���@@ ���@@ �A@��� `,,�� `,Y@��� `,,�� `,Y@���Р	'set_max_num_jobs_per_priority_per_cycle�� eNR� eNy@��@����#int�� eN|� eN@@�� eN|� eN@@@����$unit�� eN�� eN�@@�� eN��  eN�@@@��" eN|�# eN�@@@@���/��	@@ ��	@@ �A�������	� [set_max_num_jobs_per_priority_per_cycle int] sets the maximum number of jobs that
    will be done at each priority within each Async cycle. The default is [500].
    [max_num_jobs_per_priority_per_cycle] retrieves the current value.  @��3 b[[�4 dM@@@@��6 b[[�7 dM@@��	$@@ ��	%@@ �A@��< eNN�= eN�@��? eNN�@ eN�@���Р	#max_num_jobs_per_priority_per_cycle��H g���I g��@��@����$unit��R g���S g��@@��U g���V g��@@@����#int��] g���^ g��@@��` g���a g��@@@��c g���d g��@@@@@��f g���g g��@��i g���j g��@���Р5set_record_backtraces��r o���s o��@��@����$bool��| o���} o��@@�� o���� o��@@@����$unit��� o���� o��@@��� o���� o��@@@��� o���� o��@@@@������	~@@ ��	@@ �A�������
  � [set_record_backtraces do_record] sets whether Async should keep in the execution
    context the history of stack backtraces (obtained via [Backtrace.get]) that led to the
    current job.  If an Async job has an unhandled exception, this backtrace history will
    be recorded in the exception.  In particular the history will appear in an unhandled
    exception that reaches the main monitor.  This can have a substantial performance
    impact, both in running time and space usage. @��� i���� nz�@@@@��� i���� nz�@@��	�@@ ��	�@@ �A@��� o���� o��@��� o���� o��@���Р%yield��� t���� t��@��@����$unit��� t���� t��@@��� t���� t��@@@�����(Deferred!t��� t���� t��@�����$unit��� t���� t��@@��� t���� t��@@@@��� t���� t��@@@��� t���� t��@@@@�����	�@@ ��	�@@ �A�������	� [yield ()] returns a deferred that becomes determined after the current cycle
    completes.  This can be useful to improve fairness by [yield]ing within a computation
    to give other jobs a chance to run. @��� q���� s��@@@@��� q���� s��@@��	�@@ ��	�@@ �A@��� t���� t��@��� t���� t��@���Р:yield_until_no_jobs_remain��	 z59�	 z5S@��@����$unit��	 z5V�	 z5Z@@��	 z5V�	 z5Z@@@�����(Deferred!t��	 z5c�	 z5m@�����$unit��	" z5^�	# z5b@@��	% z5^�	& z5b@@@@��	( z5^�	) z5m@@@��	+ z5V�	, z5m@@@@���8��
@@ ��
@@ �A�������
  Z [yield_until_no_jobs_remain ()] returns a deferred that becomes determined the next
    time Async's job queue is empty.  This is useful in tests when one needs to wait for
    the completion of all the jobs based on what's in the queue, when those jobs might
    create other jobs -- without depending on I/O or the passage of wall-clock time. @��	< v���	= y�4@@@@��	? v���	@ y�4@@��
-@@ ��
.@@ �A@��	E z55�	F z5m@��	H z55�	I z5m@���Р+yield_every��	Q ����	R ���@���!n����#int��	] ����	^ ���@@��	` ����	a ���@@@�����&Staged!t��	j ����	k ���@���@����$unit��	u ����	v ���@@��	x ����	y ���@@@�����(Deferred!t��	� ����	� ���@�����$unit��	� ����	� ���@@��	� ����	� ���@@@@��	� ����	� ���@@@��	� ����	� ���@@@@��	� ����	� ���@@@��	� ����	� ���@@@@������
�@@ ��
�@@ �A�������
  L [yield_every ~n] returns a function that will act as [yield] every [n] calls and as
    [return ()] the rest of the time.  This is useful for improving fairness in
    circumstances where you don't have good control of the batch size, but can insert a
    deferred into every iteration.

    [yield_every] raises if [n <= 0].

    @��	� |oo�	� ���@@@@��	� |oo�	� ���@@��
�@@ ��
�@@ �A@��	� ����	� ���@��	� ����	� ���@���Р,num_jobs_run��	� ����	� ���@��@����$unit��	� ����	� ���@@��	� ����	� ���@@@����#int��	� ����	� ���@@��	� ����	� ���@@@��	� ����	� ���@@@@�����
�@@ ��
�@@ �A�������	� [num_jobs_run ()] returns the number of jobs that have been run since starting.  The
    returned value includes the currently running job. @��	� �  �	� �Y�@@@@��	� �  �	� �Y�@@��
�@@ ��
�@@ �A@��	� ����	� ���@��	� ����	� ���@���Р0num_pending_jobs��
 ��
 �)@��@����$unit��
 �,�
 �0@@��
 �,�
 �0@@@����#int��
 �4�
 �7@@��
 �4�
 �7@@@��
 �,�
 �7@@@@���	)��@@ ��@@ �A�������	\ [num_pending_jobs] returns the number of jobs that are queued to run by the
    scheduler. @��
- ����
. �@@@@��
0 ����
1 �@@��@@ ��@@ �A@��
6 ��
7 �7@��
9 ��
: �7@�����&Expert��
B �9@�
C �9F@�����Р?run_cycles_until_no_jobs_remain��
M �MS�
N �Mr@��@����$unit��
W �Mu�
X �My@@��
Z �Mu�
[ �My@@@����$unit��
b �M}�
c �M�@@��
e �M}�
f �M�@@@��
h �Mu�
i �M�@@@@@��
k �MO�
l �M�@��
n �MO�
o �M�@���Р5set_on_start_of_cycle��
w ����
x ���@��@��@����$unit��
� ����
� ���@@��
� ����
� ���@@@����$unit��
� ����
� ���@@��
� ����
� ���@@@��
� ����
� ���@@@����$unit��
� ����
� ���@@��
� ����
� ���@@@��
� ����
� ���@@@@@��
� ����
� ���@��
� ����
� ���@���Р3set_on_end_of_cycle��
� ����
� ���@��@��@����$unit��
� ����
� ���@@��
� ����
� ���@@@����$unit��
� ����
� ���@@��
� ����
� ���@@@��
� ����
� ���@@@����$unit��
� ����
� ���@@��
� ����
� ���@@@��
� ����
� ���@@@@@��
� ����
� ���@��
� ����
� ���@@��
� �9I�
� ���@@@��
� �99�
� ���@��
� �99�
� ���@�����'Private��
� ����
� ���@����)Scheduler��
� �� �
� ��	@��
� �� �  ��	@@@�� ���� ��	@�� ���� ��	@@