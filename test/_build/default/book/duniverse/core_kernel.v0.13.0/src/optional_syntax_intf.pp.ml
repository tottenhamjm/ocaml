Caml1999M026����   @         		>book/duniverse/core_kernel.v0.13.0/src/optional_syntax_intf.ml����  �  �    Ϡ����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������/ppx_optcomp.env@�@@�������#env��&_none_A@ ��A@ �A��A@ ��A@ �A@@���-ocaml_version����'Defined��A@ ��A@ �A�������!4@��A@ ��A@ �A@@����!9@��#A@ ��$A@ �A@@����!0@��+A@ ��,A@ �A@@@��.A@ ��/A@ �A@@��1A@ ��2A@ �A@@@��4A@ ��5A@ �A@@@�@@�������@�@@@�@@�@@@@�@@@�@�ڠ��@������"()��	>book/duniverse/core_kernel.v0.13.0/src/optional_syntax_intf.mlA@@�A@@@@��A@@�A@@@@@���������-Ppx_bench_lib5Benchmark_accumulator/Current_libname#set��A@@�A@@@��A@@�A@@@@@��@���+core_kernel@�� A@@�!A@@@@@@��#A@@�$A@@@@@@��&A@@�'A@@@@��)A@@�*A@@@���@������"()��6A@@�7A@@@@��9A@@�:A@@@@@��������5Expect_test_collector,Current_file#set��GA@@�HA@@@��JA@@�KA@@@@@���1absolute_filename���R@��TA@@�UA@@@@@@��WA@@�XA@@@@@@��ZA@@�[A@@@@��]A@@�^A@@@���@������4��iA@@�jA@@@@��lA@@�mA@@@@@��������3Ppx_inline_test_lib'Runtime5set_lib_and_partition��zA@@�{A@@@��}A@@�~A@@@@@��@���f@���A@@��A@@@@@��@��� @���A@@��A@@@@@@���A@@��A@@@@@@���A@@��A@@@@���A@@��A@@@��������&Import���A@F��A@L@���A@F��A@L@@@���A@@��A@L@@���A@@��A@L@�����!S���CNZ��CN[@������A�    �!t���Dbi��Dbj@@@@A@@���Dbd��Dbj@@���Dbd��Dbj@���A�    �%value���Ekr��Ekw@@@@A@@���Ekm��Ekw@@���Ekm��Ekw@�����/Optional_syntax���Gy B��Gy Q@�����Р'is_none���H X `��H X g@��@����!t���H X j��H X k@@���H X j��H X k@@@����$bool��H X o�H X s@@��H X o�H X s@@@��H X j�H X s@@@@@��
H X \�H X s@��H X \�H X s@���Р,unsafe_value��I t |�I t �@��@����!t�� I t ��!I t �@@��#I t ��$I t �@@@����%value��+I t ��,I t �@@��.I t ��/I t �@@@��1I t ��2I t �@@@@@��4I t x�5I t �@��7I t x�8I t �@@��:Gy T�;J � �@@@��=Gy{�>J � �@��@Gy{�AJ � �@@��CCN^�DK � �@@@��FCNN�GK � �@��ICNN�JK � �@�����"S1��RM � ��SM � �@������A�    �!t��_N � ��`N � �@����!a��gN � ��hN � �@@@B@@@A@@��jN � ��kN � �@@��mN � ��nN � �@���A�    �%value��wO � ��xO � �@����!a��O � ���O � �@@@B@@@A@@���O � ���O � �@@���O � ���O � �@�����/Optional_syntax���Q � ���Q � �@�����Р'is_none���R � ���R �@��@����!t���R ���R �@��@���R ���R �@@@@���R ���R �@@@����$bool���R ���R �@@���R ���R �@@@���R ���R �@@@@@���R � ���R �@���R � ���R �@���Р,unsafe_value���S��S$@��@����!t���S*��S+@���!a���S'��S)@@@@���S'��S+@@@����%value���S2��S7@���!a���S/��S1@@@@���S/��S7@@@���S'��S7@@@@@���S��S7@���S��S7@@���Q � ���T8=@@@���Q � ���T8=@�� Q � ��T8=@@��M � ��U>A@@@��M � ��U>A@��	M � ��
U>A@�����"S2��WCO�WCQ@������A�    �!t��XXh� XXi@����!a��'XX`�(XXb@@@B����!b��/XXd�0XXf@@@B@@@A@@��2XXZ�3XXi@@��5XXZ�6XXi@���A�    �%value��?Yjz�@Yj@����!a��GYjr�HYjt@@@B����!b��OYjv�PYjx@@@B@@@A@@��RYjl�SYj@@��UYjl�VYj@�����/Optional_syntax��^[���_[��@�����Р'is_none��i\���j\��@��@����!t��s\���t\��@��@��x\���y\��@@@@��{\���|\��@@@����$bool���\����\��@@���\����\��@@@���\����\��@@@@@���\����\��@���\����\��@���Р,unsafe_value���]����]��@��@����!t���]����]��@���!a���]����]��@@@���!b���]����]��@@@@���]����]��@@@����%value���]����]��@���!a���]����]��@@@���!b���]����]��@@@@���]����]��@@@���]����]��@@@@@���]����]��@���]����]��@@���[����^��@@@���[����^��@���[����^��@@���WCT��_��@@@���WCC��_��@���WCC��_��@�����/Optional_syntax���a�	��a�@��������*ocaml.text���@@ ���@@ �A�������
  � Idiomatic usage is to have a module [M] like:

      {[
        module M : sig
          type t

          module Optional_syntax : Optional_syntax.S
            with type t := t
            with type value := ...
        end = struct
          ...

          module Optional_syntax = struct
            module Optional_syntax = struct
              let is_none = is_none
              let unsafe_value = unsafe_value
            end
          end
        end
      ]}

      Then, uses look like:

      {[
        let open M.Optional_syntax in
        match%optional m with
        | None   -> ?
        | Some v -> ?
      ]}

      The reason for the double [module Optional_syntax] is so that [open M.Optional_syntax]
      puts in scope only [module Optional_syntax]; [match%optional] then expands to
      references to [Optional_syntax.is_none] and [Optional_syntax.unsafe_value].

      [unsafe_value] does not have to be memory-safe if not guarded by [is_none].

      Implementations of [is_none] and [unsafe_value] must not have any side effects.
      More precisely, if you mutate any value currently being match'ed on (not necessarily
      your own argument) you risk a segfault as well.

      This is because [match%optional] does not make any guarantee about [is_none] call
      being immediately followed by the corresponding [unsafe_value] call. In fact it
      makes several [is_none] calls followed by several [unsafe_value] calls, so in
      the presence of side-effects by the time it makes an [unsafe_value] call the result
      of the corresponding [is_none] can go stale.

      For more details on the syntax extension, see [ppx/ppx_optional/README.md].
  @��b!� Q��@@@@��
b!� Q��@@���@@ ���@@ �A��b!� Q��@�����!S�� S��� S��@�����!S��" S���# S��@��% S���& S��@@@��( S���) S��@��+ S���, S��@�����"S1��4 T���5 T��@�����"S1��= T���> T��@��@ T���A T��@@@��C T���D T��@��F T���G T��@�����"S2��O U���P U��@�����"S2��X U���Y U�	@��[ U���\ U�	@@@��^ U���_ U�	@��a U���b U�	@@��da��e V		@@@��ga���h V		@��ja���k V		@���@������A��v V		�w V		@@��y V		�z V		@@@��������3Ppx_inline_test_lib'Runtime)unset_lib��� V		�� V		@��� V		�� V		@@@��@���s@��� V		�� V		@@@@��� V		�� V		@@@@��� V		�� V		@@��� V		�� V		@���@������r��� V		�� V		@@��� V		�� V		@@@��������5Expect_test_collector,Current_file%unset��� V		�� V		@��� V		�� V		@@@��@����"()��� V		�� V		@@��� V		�� V		@@@@��� V		�� V		@@@@��� V		�� V		@@��� V		�� V		@���@������ް�� V		�� V		@@��� V		�� V		@@@���������-Ppx_bench_lib5Benchmark_accumulator/Current_libname%unset��� V		�� V		@��� V		�� V		@@@��@����"()��� V		�� V		@@��  V		� V		@@@@�� V		� V		@@@@�� V		� V		@@��	 V		�
 V		@@