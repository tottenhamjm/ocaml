Caml1999N026����   1         	/book/duniverse/core.v0.13.0/src/core_thread.mli����  >  
  $�  !������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ����*ocaml.text���@@ ���@@ �A�������6 Lightweight threads. @��	/book/duniverse/core.v0.13.0/src/core_thread.mliA@@�A@[@@@@��A@@�A@[@@���@@ ���@@ �A��
A@@�A@[@������&Import��C]c�C]i@@��C]]�C]i@@��C]]�C]i@���A�    �!t��$F N S�%F N T@@@@A@���)ocaml.doc��@@ ��@@ �A�������= The type of thread handles. @��6Ekk�7Ek M@@@@��9Ekk�:Ek M@@��'@@ ��(@@ �A���(deriving��CF N X�DF N `@��������'sexp_of��OF N a�PF N h@��RF N a�SF N h@@@@��UF N a�VF N h@@��XF N U�YF N i@@��[F N N�\F N i@@��^F N N�_F N i@�����������-ocaml.warning��mF N N�nF N i@�������#-32@��xF N N�yF N i@@@@��{F N N�|F N i@@��~F N N�F N i@���F N N��F N i@���Р)sexp_of_t���F N S��F N T@��@����p���F N S��F N T@@���F N S��F N T@@@������1Ppx_sexp_conv_lib$Sexp!t���F N S��F N T@@���F N S��F N T@@@���F N S��F N T@@@@@���F N N��F N i@���F N N��F N i@@���F N N��F N i@@���F N N��F N i@���)ocaml.doc���F N N��F N i@�������'@inline@���F N N��F N i@@@@���F N N��F N i@@���F N N��F N i@@���F N N��F N i@��������@@ ���@@ �A�������	% {6 Thread creation and termination} @���H k k��H k �@@@@���H k k��H k �@@���@@ ���@@ �A���H k k��H k �@���Р&create���J � ���J � �@��@��@��!a���J � ���J � �@@@��!b��J � ��J � �@@@��J � ��J � �@@@��@��!a��J � ��J � �@@@����!t��J � ��J � �@@��J � ��J � �@@@��J � ��J � �@@@�� J � ��!J � �@@@@������@@ ��@@ �A�������
  x [Thread.create funct arg] creates a new thread of control, in which the
    function application [funct arg] is executed concurrently with the other
    threads of the program. The application of [Thread.create] returns the
    handle of the newly created thread. The new thread terminates when the
    application [funct arg] returns, either normally or by raising an uncaught
    exception. In the latter case, the exception is printed on standard error,
    but not propagated back to the parent thread. Similarly, the result of the
    application [funct arg] is discarded and not directly accessible to the
    parent thread. @��1K � ��2S"7@@@@��4K � ��5S"7@@��"@@ ��#@@ �A@��:J � ��;J � �@��=J � ��>J � �@���Р$self��FU9=�GU9A@��@����$unit��PU9D�QU9H@@��SU9D�TU9H@@@����!t��[U9L�\U9M@@��^U9L�_U9M@@@��aU9D�bU9M@@@@���=��R@@ ��S@@ �A�������	( Return the thread currently executing. @��rVNN�sVN{@@@@��uVNN�vVN{@@��c@@ ��d@@ �A@��{U99�|U9M@��~U99�U9M@���Р"id���X}���X}�@��@����!t���X}���X}�@@���X}���X}�@@@����#int���X}���X}�@@���X}���X}�@@@���X}���X}�@@@@���~���@@ ���@@ �A�������	� Return the identifier of the given thread. A thread identifier
    is an integer that identifies uniquely the thread.
    It can be used to build data structures indexed by threads. @���Y����[	K@@@@���Y����[	K@@���@@ ���@@ �A@���X}}��X}�@���X}}��X}�@���Р$exit���]MQ��]MU@��@����$unit���]MX��]M\@@���]MX��]M\@@@����$unit���]M`��]Md@@���]M`��]Md@@@���]MX��]Md@@@@�������@@ ���@@ �A�������	7 Terminate prematurely the currently executing thread. @���^ee��^e�@@@@���^ee��^e�@@���@@ ���@@ �A@���]MM��]Md@�� ]MM�]Md@��������@@ ���@@ �A�������
  : This has been deliberately removed from the interface because it is an inherently
    unsafe operation and is never required.

    {[
      (** Terminate prematurely the thread whose handle is given.
          This functionality is available only with bytecode-level threads. *)
      val kill : t -> unit
    ]}
@��`���h��@@@@��`���h��@@��@@ ��@@ �A��`���h��@�����0��@@ ��@@ �A�������8 {6 Suspending threads} @��/j���0j�@@@@��2j���3j�@@�� @@ ��!@@ �A��8j���9j�@���Р%delay��Al�Bl@��@����%float��Kl�Ll@@��Nl�Ol@@@����$unit��Vl�Wl@@��Yl�Zl@@@��\l�]l@@@@���8��M@@ ��N@@ �A�������	� [delay d] suspends the execution of the calling thread for
    [d] seconds. The other program threads continue to run during
    this time. @��mm�no��@@@@��pm�qo��@@��^@@ ��_@@ �A@��vl�wl@��yl�zl@���Р$join���q����q��@��@����!t���q����q��@@���q����q��@@@����$unit���q����q��@@���q����q��@@@���q����q��@@@@���y���@@ ���@@ �A�������	b [join th] suspends the execution of the calling thread
    until the thread [th] has terminated. @���r����s-@@@@���r����s-@@���@@ ���@@ �A@���q����q��@���q����q��@���Р)wait_read���u/3��u/<@��@�����$Unix*file_descr���u/?��u/N@@���u/?��u/N@@@����$unit���u/R��u/V@@���u/R��u/V@@@���u/?��u/V@@@@�������@@ ���@@ �A�������: See {!Thread.wait_write}.@���vWW��vWv@@@@���vWW��vWv@@���@@ ���@@ �A@���u//��u/V@���u//��u/V@���Р*wait_write��xx|�xx�@��@�����$Unix*file_descr��xx��xx�@@��xx��xx�@@@����$unit��xx��xx�@@�� xx��!xx�@@@��#xx��$xx�@@@@������@@ ��@@ �A�������	� Suspend the execution of the calling thread until at least
    one character is available for reading ({!Thread.wait_read}) or
    one character can be written without blocking ([wait_write])
    on the given Unix file descriptor. @��4y���5|e�@@@@��7y���8|e�@@��%@@ ��&@@ �A@��=xxx�>xx�@��@xxx�Axx�@���Р/wait_timed_read��I~���J~��@��@�����$Unix*file_descr��U~���V~��@@��X~���Y~��@@@��@����%float��b~���c~��@@��e~���f~��@@@����$bool��m~���n~��@@��p~���q~��@@@��s~���t~��@@@��v~���w~��@@@@���R��g@@ ��h@@ �A�������	  See {!Thread.wait_timed_write}.@���������@@@@���������@@��x@@ ��y@@ �A@���~����~��@���~����~��@���Р0wait_timed_write��� A���� A�	@��@�����$Unix*file_descr��� A�	�� A�	@@��� A�	�� A�	@@@��@����%float��� A�	�� A�	@@��� A�	�� A�	@@@����$bool��� A�	!�� A�	%@@��� A�	!�� A�	%@@@��� A�	�� A�	%@@@��� A�	�� A�	%@@@@�������@@ ���@@ �A�������	� Same as {!Thread.wait_read} and {!Thread.wait_write}, but wait for at most
    the amount of time given as second argument (in seconds).
    Return [true] if the file descriptor is ready for input/output
    and [false] if the timeout expired. @��� B	&	&�� E	�
 @@@@��� B	&	&�� E	�
 @@���@@ ���@@ �A@��� A���� A�	%@��� A���� A�	%@���Р%yield��� G
"
&�� G
"
+@��@����$unit��� G
"
.�� G
"
2@@��� G
"
.�� G
"
2@@@����$unit�� G
"
6� G
"
:@@�� G
"
6� G
"
:@@@��
 G
"
.� G
"
:@@@@������@@ ���@@ �A�������	� Re-schedule the calling thread without suspending it.
    This function can be used to give scheduling hints,
    telling the scheduler that now is a good time to
    switch to other threads. @�� H
;
;� K
�@@@@�� H
;
;� K
�@@��@@ ��@@ �A@��$ G
"
"�% G
"
:@��' G
"
"�( G
"
:@�����;��@@ ��@@ �A�������; {6 Management of signals} @��: M�; M#@@@@��= M�> M#@@��+@@ ��,@@ �A��C M�D M#@�����W��6@@ ��7@@ �A�������
  � Signal handling follows the POSIX thread model: signals generated
    by a thread are delivered to that thread; signals generated externally
    are delivered to one of the threads that does not block it.
    Each thread possesses a set of blocked signals, which can be modified
    using {!Thread.sigmask}.  This set is inherited at thread creation time.
    Per-thread signal masks are supported only by the system thread library
    under Unix, but not under Win32, nor by the VM thread library. @��V O%%�W U�@@@@��Y O%%�Z U�@@��G@@ ��H@@ �A��_ O%%�` U�@���Р'sigmask��h W $�i W +@��@�����&Signal3sigprocmask_command��t W .�u W H@@��w W .�x W H@@@��@����$list��� W U�� W Y@������&Signal!t��� W L�� W T@@��� W L�� W T@@@@��� W L�� W Y@@@����$list��� W f�� W j@������&Signal!t��� W ]�� W e@@��� W ]�� W e@@@@��� W ]�� W j@@@��� W L�� W j@@@��� W .�� W j@@@@�������@@ ���@@ �A�������
  � [sigmask cmd sigs] changes the set of blocked signals for the
    calling thread.
    If [cmd] is [`Set], blocked signals are set to those in
    the list [sigs].
    If [cmd] is [`Block], the signals in [sigs] are added to
    the set of blocked signals.
    If [cmd] is [`Unblock], the signals in [sigs] are removed
    from the set of blocked signals.
    [sigmask] returns the set of previously blocked signals for the thread. @��� Xkk�� `� @@@@��� Xkk�� `� @@���@@ ���@@ �A@��� W  �� W j@��� W  �� W j@���Р+wait_signal��� b"&�� b"1@��@����$list��� b"=�� b"A@������&Signal!t��� b"4�� b"<@@��� b"4�� b"<@@@@��� b"4�� b"A@@@����#int��� b"E�� b"H@@��� b"E�� b"H@@@��  b"4� b"H@@@@���ܰ��@@ ���@@ �A�������
  i [wait_signal sigs] suspends the execution of the calling thread
    until the process receives one of the signals specified in the
    list [sigs].  It then returns the number of the signal received.
    Signal handlers attached to the signals in [sigs] will not
    be invoked.  The signals [sigs] are expected to be blocked before
    calling [wait_signal]. @�� cII� h��@@@@�� cII� h��@@��@@ ��@@ �A@�� b""� b"H@�� b""� b"H@�����1��@@ ��@@ �A�������8 Jane Street extensions @��0 k���1 k��@@@@��3 k���4 k��@@��!@@ ��"@@ �A��9 k���: k��@���Р9threads_have_been_created��B oGK�C oGd@��@����$unit��L oGg�M oGk@@��O oGg�P oGk@@@����$bool��W oGo�X oGs@@��Z oGo�[ oGs@@@��] oGg�^ oGs@@@@���9��N@@ ��O@@ �A�������	h [true] iff Thread.create has ever been called, even if there is
    currently only one running thread. @��n m���o nF@@@@��q m���r nF@@��_@@ ��`@@ �A@��w oGG�x oGs@��z oGG�{ oGs@���Р+num_threads��� tFJ�� tFU@��@����$unit��� tFX�� tF\@@��� tFX�� tF\@@@����&option��� tFd�� tFj@�����#int��� tF`�� tFc@@��� tF`�� tFc@@@@��� tF`�� tFj@@@��� tFX�� tFj@@@@�������@@ ���@@ �A�������	� [num_threads ()] attempts to return the number of currently running
    threads by parsing /proc.  Since this is an operation frought with
    potential failure, we return an option in cases of failure @��� quu�� sE@@@@��� quu�� sE@@���@@ ���@@ �A@��� tFF�� tFj@��� tFF�� tFj@���Р-block_forever��� w���� w��@��@����$unit��� w���� w��@@��� w���� w��@@@��!a��� w���� w��@@@��� w���� w��@@@@���°��@@ ���@@ �A�������	; [block_forever ()] will block the calling thread forever. @��� vll�� vl�@@@@��� vll�� vl�@@���@@ ���@@ �A@��  w��� w��@�� w��� w��@��������@@ ���@@ �A�������
  � {2 Non-portable pthread extensions}

    The following operations may not be supported on all platforms. Before you
    can use them, you must first check that they do not contain error values.
    For example, if you wanted to use [setaffinity_self_exn] then you would
    first do:

    {[
      let setaffinity_self_exn =
        match Thread.setaffinity_self_exn with
        | Ok f -> f
        | Error err -> (* raise or provide a default implementation. *)
    ]}

    If your application requires that one of these operations be present then,
    you could just do this instead:

    {[
      let setaffinity_self_exn = Or_error.ok_exn Thread.setaffinity_self_exn
    ]}
@�� y��� �xz@@@@�� y��� �xz@@��@@ ��@@ �A�� y���  �xz@���Р4setaffinity_self_exn��( ����) ���@�����(Or_error!t��2 ����3 ���@���@������#Int#Set!t��A ����B ���@@��D ����E ���@@@����$unit��L ����M ���@@��O ����P ���@@@��R ����S ���@@@@��U ����V ���@@@@���1��F@@ ��G@@ �A�������
   Sets the core affinity of the currently-running thread to the set
    specified.

    This function is implemented using [pthread_setaffinity_np(3)], when
    available. See the man page for situations when this function may return an
    error, and therefore raise. @��f �||�g �k�@@@@��i �||�j �k�@@��W@@ ��X@@ �A@��o ����p ���@��r ����s ���@���Р4getaffinity_self_exn��{ ����| ���@�����(Or_error!t��� ����� �� @���@����$unit��� ����� ���@@��� ����� ���@@@������#Int#Set!t��� ����� ���@@��� ����� ���@@@��� ����� ���@@@@��� ����� �� @@@@�������@@ ���@@ �A�������	� Gets the core affinity of the currently-running thread.

    This function is implemented using [pthread_getaffinity_np(3)], when
    available. See the man page for situations when this function may return an
    error, and therefore raise. @��� ����� ���@@@@��� ����� ���@@���@@ ���@@ �A@��� ����� �� @��� ����� �� @�����+For_testing��� �	�� �@�����Р3create_should_raise��� � �� � @����#ref��� � !�� � $@�����$bool��� � �� �  @@��� � �� �  @@@@��� � �� � $@@@@���̰��@@ ���@@ �A�������	� If [!create_should_raise = true], then [create] raises rather than creating a
      thread.  This is useful for testing how code behaves upon thread-creation
      failure, which can happen, e.g., due to lack of memory. @�� �� ���@@@@�� �� ���@@���@@ ���@@ �A@��
 � � � $@�� � � � $@@�� �� �%(@@@�� �� �%(@�� �� �%(@@