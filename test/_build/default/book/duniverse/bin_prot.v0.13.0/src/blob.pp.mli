Caml1999N026����   .         	,book/duniverse/bin_prot.v0.13.0/src/blob.mli����  )Z  �  �  f�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@�������*ocaml.text���@@ ���@@ �A�������
  � ['a Blob.t] is type-equivalent to ['a], but has different bin-prot serializers that
    prefix the representation with the size of ['a].

    To understand where this is useful, imagine we have an event type where many
    applications look at some parts of an event, but not all applications need to deal
    with all parts of an event. We might define:

    {[
      type 'a event =
        { time : Time.t
        ; source : string
        ; details : 'a
        } [@@deriving bin_io]
    ]}

    Applications that need to understand all the details of an event could use:

    {[ type concrete_event = Details.t Blob.t event [@@deriving bin_io] ]}

    An application that filters events to downsteam consumers based on just [source] or
    [time] (but doesn't need to parse [details]) may use:

    {[ type opaque_event = Blob.Opaque.Bigstring.t event [@@deriving bin_io] ]}

    This has two advantages:
    - (de)serializing messages is faster because potentially costly (de)serialization of
      [details] is avoided
    - the application can be compiled without any knowledge of any conrete [Details.t]
      type, so it's robust to changes in [Details.t]

    An application that's happy to throw away [details] may use:

    {[ type ignored_event = Blob.Ignored.t event [@@deriving bin_read] ]}

    Whereas [opaque_event]s roundtrip, [ignored_event]s actually drop the bytes
    representing [details] when deserializing, and therefore do not roundtrip.
@��	,book/duniverse/bin_prot.v0.13.0/src/blob.mliBAA�f��@@@@��BAA�f��@@���@@ ���@@ �A��
BAA�f��@���A�    �"id��h���h��@����!a��h���h��@@@B@@@A���!a��#h���$h��@@@@��&h���'h��@@��)h���*h��@���A�    �!t��3m`h�4m`i@����!a��;m`e�<m`g@@@B@@@A���!a��Bm`l�Cm`n@@@���(deriving��Im`r�Jm`z@��������'compare��Um`{�Vm`�@��Xm`{�Ym`�@@@@��[m`{�\m`�@@��^m`o�_m`�@@��am``�bm`�@@��dm``�em`�@�����������-ocaml.warning��sm``�tm`�@�������#-32@��~m``�m`�@@@@���m``��m`�@@���m``��m`�@���m``��m`�@���Р'compare���m`h��m`i@��@��@��_���m`e��m`g@@@��@��f���m`e��m`g@@@����#int���m`e��m`g@@���m`e��m`g@@@���m`e��m`g@@@���m`e��m`g@@@��@��������m`h��m`i@�������m`e��m`g@@@@���m`h��m`i@@@��@��������m`h��m`i@�������m`e��m`g@@@@���m`h��m`i@@@����5���m`h��m`i@@���m`h��m`i@@@���m`h��m`i@@@���m`h��m`i@@@���m`e��m`g@@@@@���m``��m`�@���m``��m`�@@���m``��m`�@@���m``��m`�@���)ocaml.doc���m``��m`�@�������'@inline@��m``�m`�@@@@��	m``�
m`�@@��m``�m`�@@��m``�m`�@�����������'Binable"S1��o��� o��@��"o���#o��@@����!t��*o���+o��@    ���/o���0o��@����!a��7o���8o��@@@B@@@A�����"id��@o���Ao��@���!a��Go���Ho��@@@@��Jo���Ko��@@@@��Mo���No��@@��Po���Qo��@@��So���To��@@��Vo���Wo��@�����&Opaque��_~	�	��`~	�	�@�������)Bigstring��j	�	��k	�	�@�����������'Binable!S��z @	�	��{ @	�	�@��} @	�	��~ @	�	�@@��� @	�	��� @	�	�@@��� @	�	��� @	�	�@���Р)to_opaque��� B	�
�� B	�

@��@��!a��� B	�
�� B	�
@@@��@�����*Type_class&writer��� B	�
�� B	�
'@���!a��� B	�
�� B	�
@@@@��� B	�
�� B	�
'@@@����!t��� B	�
+�� B	�
,@@��� B	�
+�� B	�
,@@@��� B	�
�� B	�
,@@@��� B	�
�� B	�
,@@@@@��� B	�	��� B	�
,@��� B	�	��� B	�
,@���Р-of_opaque_exn��� C
-
5�� C
-
B@��@����!t��� C
-
E�� C
-
F@@��� C
-
E�� C
-
F@@@��@�����*Type_class&reader��� C
-
M�� C
-
^@���!a��� C
-
J�� C
-
L@@@@��� C
-
J�� C
-
^@@@��!a��� C
-
b�� C
-
d@@@��� C
-
J�� C
-
d@@@��� C
-
E�� C
-
d@@@@@��� C
-
1�� C
-
d@��� C
-
1�  C
-
d@@��	�	�� D
e
j@@@��	�	�� D
e
j@��	�	��	 D
e
j@�����&String�� F
l
u� F
l
{@�����������'Binable!S��! G
�
��" G
�
�@��$ G
�
��% G
�
�@@��' G
�
��( G
�
�@@��* G
�
��+ G
�
�@���Р&length��3 [���4 [��@��@����!t��= [���> [��@@��@ [���A [��@@@����#int��H [���I [�@@��K [���L [�@@@��N [���O [�@@@@���)ocaml.doc���@@ ���@@ �A�������
  F For performance's concern, we require caller of [to_opaque] and [of_opaque_exn] to
        pass in the [buf] as the intermediate buffer for bin_prot conversion. These two
        functions will write bytes into the buffer, but will not resize the buffer. So the
        caller should prepare big enough buffer for their need.

        For [of_opaque_exn t], the minimum buffer size should be [length t].

        For [to_opaque] the necessary buffer size can be computed using [size] from
        Type_class.writer or you can catch the exception [Bin_prot.Common.Buffer_short]
        (although the latter is not very reliable because some custom bin_io
        implementations raise a different exception).

        Additional caveat: if the opaque blob is malformed/partial then [of_opaque_exn]
        can read past the end of the blob, which can result in:
        - confusing/non-deterministic error messages (referring to the contents of [buf]
          rather than the contents of the blob)
        - degraded performance (having to read through the buffer just to fail at the end)
    @��` I
�
��a Z��@@@@��c I
�
��d Z��@@��@@ ��@@ �A@��i [���j [�@��l [���m [�@���Р)to_opaque��u ]�v ]@���#buf�����&Common#buf��� ]�� ]&@@��� ]�� ]&@@@��@��!a��� ]*�� ],@@@��@�����*Type_class&writer��� ]3�� ]D@���!a��� ]0�� ]2@@@@��� ]0�� ]D@@@����!t��� ]H�� ]I@@��� ]H�� ]I@@@��� ]0�� ]I@@@��� ]*�� ]I@@@��� ]�� ]I@@@@@��� ]�� ]I@��� ]�� ]I@���Р-of_opaque_exn��� ^JR�� ^J_@���#buf�����&Common#buf��� ^Jf�� ^Jp@@��� ^Jf�� ^Jp@@@��@����!t��� ^Jt�� ^Ju@@��� ^Jt�� ^Ju@@@��@�����*Type_class&reader��� ^J|�� ^J�@���!a��� ^Jy�� ^J{@@@@��� ^Jy�� ^J�@@@��!a�� ^J�� ^J�@@@�� ^Jy� ^J�@@@�� ^Jt� ^J�@@@��
 ^Jb� ^J�@@@@@�� ^JN� ^J�@�� ^JN� ^J�@@�� F
l
~� _��@@@�� F
l
n� _��@�� F
l
n� _��@@��~	�	�� `��@@���ΰ��@@ ���@@ �A�������
  � An [Opaque.Bigstring.t] or [Opaque.String.t] is an arbitrary piece of bin-prot. The
    bin-prot (de-)serializers simply read/write the data, prefixed with its size.

    When reading bin-prot data, sometimes you won't care about deserializing a particular
    piece: perhaps you want to operate on a bin-prot stream, transforming some bits of
    the stream and passing the others through untouched. In these cases you can
    deserialize using the bin-prot converters for a type involving [Opaque.t]. This is
    analogous to reading a sexp file / operating on a sexp stream and using
    (de-)serialization functions for a type involving [Sexp.t].

    The internal representation of [Opaque.Bigstring.t] is a Bigstring, while
    [Opaque.String.t] is a string.
@��-q���.}	�	�@@@@��0q���1}	�	�@@���@@ ���@@ �A@��6~	�	��7 `��@��9~	�	��: `��@�����'Ignored��B n���C n��@�����A�    �!t��N o���O o��@@@@A@@��Q o���R o��@@��T o���U o��@���Р*bin_size_t��] q���^ q��@�����$Size%sizer��g q���h q� @�����!t��p q���q q��@@��s q���t q��@@@@��v q���w q� @@@@@��y q���z q� @��| q���} q� @���Р*bin_read_t��� r�� r@�����$Read&reader��� r�� r!@�����!t��� r�� r@@��� r�� r@@@@��� r�� r!@@@@@��� r�� r!@��� r�� r!@���Р.__bin_read_t__��� s"(�� s"6@�����$Read&reader��� s"D�� s"O@���@����#int��� s":�� s"=@@��� s":�� s"=@@@����!t��� s"A�� s"B@@��� s"A�� s"B@@@��� s":�� s"B@@@@��� s"9�� s"O@@@@@��� s"$�� s"O@��� s"$�� s"O@���Р,bin_reader_t��� tPV�� tPb@�����*Type_class&reader��� tPg�� tPx@�����!t��� tPe�� tPf@@��� tPe�� tPf@@@@��� tPe�� tPx@@@@@�� tPR� tPx@�� tPR� tPx@@�� n��� uy|@@�������@@ ���@@ �A�������
   An [Ignored.t] is an unusable value with special bin-prot converters. The reader reads
    the size and drops that much data from the buffer. Writing is not supported, however
    the size of [t] is kept, so [bin_size_t] is available.

    This can be used in similar situations to [Opaque.t]. If instead of transforming a
    bin-prot stream, you are simply consuming it (and not passing it on anywhere), there
    is no need to remember the bin-prot representation for the bits you're ignoring. E.g.
    if you wish to extract a subset of information from a bin-prot file, which contains
    the serialized representation of some type T (or a bunch of Ts in a row, or something
    similar), you can define a type which is similar to T but has various components
    replaced with [Ignored.t].
@�� b��� m��@@@@�� b��� m��@@���@@ ���@@ �A@��! n���" uy|@��$ n���% uy|@@