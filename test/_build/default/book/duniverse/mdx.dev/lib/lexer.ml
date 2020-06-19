# 1 "book/duniverse/mdx.dev/lib/lexer.mll"
 
open Astring

let line_ref = ref 1

let newline lexbuf =
  Lexing.new_line lexbuf;
  incr line_ref

# 12 "book/duniverse/mdx.dev/lib/lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\252\255\001\000\002\000\004\000\255\255\003\000\254\255\
    \005\000\006\000\253\255\008\000\009\000\010\000\254\255\011\000\
    \012\000\255\255\013\000\015\000\016\000\251\255\017\000\018\000\
    \020\000\021\000\255\255\019\000\254\255\022\000\253\255\023\000\
    \027\000\024\000\031\000\033\000\032\000\035\000\036\000\034\000\
    \039\000\040\000\044\000\047\000\045\000\051\000\048\000\050\000\
    \052\000\059\000\061\000\054\000\056\000\055\000\064\000\062\000\
    \065\000\068\000\057\000\252\255\063\000\069\000\070\000\072\000\
    \071\000\051\000\254\255\255\255\074\000\253\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\002\000\000\000\002\000\002\000\002\000\000\000\006\000\000\000\
    \002\000\009\000\000\000\012\000\012\000\015\000\000\000\015\000\
    \015\000\000\000\015\000\015\000\022\000\000\000\022\000\022\000\
    \022\000\022\000\000\000\027\000\000\000\029\000\000\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\000\000\022\000\022\000\022\000\022\000\
    \255\255\255\255\000\000\000\000\068\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\001\000\001\000\001\000\007\000\001\000\001\000\
    \010\000\011\000\010\000\010\000\014\000\014\000\014\000\014\000\
    \019\000\017\000\021\000\021\000\021\000\028\000\021\000\021\000\
    \030\000\021\000\021\000\004\000\006\000\021\000\011\000\004\000\
    \011\000\021\000\021\000\021\000\021\000\021\000\021\000\019\000\
    \024\000\021\000\021\000\025\000\029\000\027\000\021\000\021\000\
    \025\000\021\000\021\000\033\000\021\000\021\000\021\000\031\000\
    \021\000\021\000\021\000\059\000\032\000\021\000\050\000\021\000\
    \021\000\021\000\021\000\021\000\023\000\037\000\021\000\021\000\
    \021\000\066\000\021\000\068\000\069\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\050\000\000\000\000\000\
    \003\000\000\000\008\000\000\000\000\000\009\000\000\000\065\000\
    \000\000\000\000\016\000\000\000\018\000\019\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\034\000\038\000\
    \000\000\039\000\000\000\000\000\041\000\000\000\035\000\036\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\040\000\000\000\
    \044\000\043\000\042\000\045\000\046\000\049\000\050\000\056\000\
    \052\000\000\000\000\000\047\000\054\000\000\000\048\000\053\000\
    \058\000\000\000\000\000\060\000\051\000\055\000\000\000\057\000\
    \000\000\000\000\000\000\061\000\000\000\062\000\000\000\000\000\
    \000\000\000\000\000\000\063\000\058\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \005\000\001\000\001\000\007\000\001\000\001\000\010\000\000\000\
    \010\000\010\000\017\000\014\000\014\000\014\000\000\000\017\000\
    \026\000\021\000\021\000\028\000\021\000\021\000\030\000\021\000\
    \021\000\000\000\000\000\021\000\000\000\000\000\000\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\000\000\000\000\021\000\
    \021\000\000\000\000\000\000\000\021\000\021\000\000\000\021\000\
    \021\000\000\000\021\000\021\000\021\000\000\000\021\000\021\000\
    \021\000\059\000\000\000\021\000\000\000\021\000\021\000\021\000\
    \021\000\021\000\000\000\000\000\021\000\021\000\021\000\067\000\
    \021\000\000\000\069\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\002\000\003\000\006\000\004\000\008\000\
    \009\000\011\000\011\000\012\000\013\000\015\000\016\000\018\000\
    \019\000\019\000\020\000\022\000\023\000\027\000\024\000\025\000\
    \029\000\031\000\033\000\000\000\004\000\032\000\009\000\004\000\
    \011\000\034\000\036\000\035\000\039\000\037\000\038\000\019\000\
    \020\000\040\000\041\000\020\000\024\000\025\000\042\000\044\000\
    \025\000\043\000\046\000\032\000\047\000\045\000\048\000\023\000\
    \051\000\053\000\052\000\058\000\031\000\049\000\050\000\050\000\
    \055\000\060\000\054\000\056\000\020\000\036\000\057\000\061\000\
    \062\000\064\000\063\000\065\000\068\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\050\000\255\255\255\255\
    \000\000\255\255\003\000\255\255\255\255\008\000\255\255\064\000\
    \255\255\255\255\013\000\255\255\016\000\018\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\033\000\037\000\
    \255\255\038\000\255\255\255\255\040\000\255\255\034\000\035\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\039\000\255\255\
    \043\000\042\000\041\000\044\000\045\000\048\000\049\000\055\000\
    \050\000\255\255\255\255\046\000\053\000\255\255\047\000\052\000\
    \057\000\255\255\255\255\051\000\050\000\054\000\255\255\056\000\
    \255\255\255\255\255\255\060\000\255\255\061\000\255\255\255\255\
    \255\255\255\255\255\255\062\000\063\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\002\000\003\000\006\000\004\000\008\000\009\000\255\255\
    \011\000\012\000\013\000\015\000\016\000\018\000\255\255\019\000\
    \020\000\022\000\023\000\027\000\024\000\025\000\029\000\031\000\
    \033\000\255\255\255\255\032\000\255\255\255\255\255\255\034\000\
    \036\000\035\000\039\000\037\000\038\000\255\255\255\255\040\000\
    \041\000\255\255\255\255\255\255\042\000\044\000\255\255\043\000\
    \046\000\255\255\047\000\045\000\048\000\255\255\051\000\053\000\
    \052\000\058\000\255\255\049\000\255\255\050\000\055\000\060\000\
    \054\000\056\000\255\255\255\255\057\000\061\000\062\000\064\000\
    \063\000\255\255\068\000";
  Lexing.lex_base_code =
   "\000\000\009\000\001\000\002\000\004\000\000\000\003\000\027\000\
    \005\000\006\000\057\000\008\000\009\000\010\000\084\000\011\000\
    \012\000\000\000\013\000\014\000\015\000\095\000\016\000\017\000\
    \019\000\020\000\000\000\018\000\118\000\021\000\128\000\022\000\
    \023\000\024\000\027\000\031\000\032\000\033\000\034\000\035\000\
    \036\000\037\000\038\000\039\000\043\000\044\000\046\000\047\000\
    \048\000\049\000\051\000\052\000\053\000\054\000\055\000\056\000\
    \057\000\058\000\059\000\146\000\060\000\061\000\062\000\063\000\
    \000\000\042\000\000\000\000\000\065\000\084\000";
  Lexing.lex_backtrk_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_default_code =
   "\001\000\000\000\001\000\001\000\001\000\000\000\022\000\000\000\
    \001\000\041\000\000\000\064\000\076\000\081\000\000\000\081\000\
    \081\000\000\000\081\000\081\000\087\000\000\000\087\000\087\000\
    \087\000\087\000\000\000\113\000\000\000\123\000\000\000\087\000\
    \087\000\087\000\087\000\087\000\087\000\087\000\087\000\087\000\
    \087\000\087\000\087\000\087\000\087\000\087\000\087\000\087\000\
    \087\000\087\000\087\000\087\000\087\000\087\000\087\000\087\000\
    \087\000\087\000\087\000\000\000\087\000\087\000\087\000\087\000\
    \000\000\000\000\000\000\000\000\081\000\000\000";
  Lexing.lex_trans_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\069\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\004\000\012\000\000\000\050\000\017\000\
    \069\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\090\000\098\000\103\000\000\000\000\000\108\000\
    \000\000\000\000\000\000\000\000\136\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\081\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\136\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\032\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\131\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\141\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\151\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000";
  Lexing.lex_check_code =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\002\000\003\000\006\000\004\000\008\000\
    \009\000\011\000\011\000\012\000\013\000\015\000\016\000\018\000\
    \019\000\020\000\022\000\023\000\027\000\024\000\025\000\029\000\
    \031\000\032\000\033\000\000\000\004\000\034\000\009\000\004\000\
    \011\000\035\000\036\000\037\000\038\000\039\000\040\000\041\000\
    \042\000\043\000\020\000\024\000\025\000\044\000\045\000\025\000\
    \046\000\047\000\048\000\049\000\050\000\050\000\051\000\052\000\
    \053\000\054\000\055\000\056\000\057\000\058\000\060\000\061\000\
    \062\000\063\000\065\000\068\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\050\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\008\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\049\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\057\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\063\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\002\000\003\000\006\000\004\000\008\000\009\000\255\255\
    \011\000\012\000\013\000\015\000\016\000\018\000\019\000\020\000\
    \022\000\023\000\027\000\024\000\025\000\029\000\031\000\032\000\
    \033\000\255\255\255\255\034\000\255\255\255\255\255\255\035\000\
    \036\000\037\000\038\000\039\000\040\000\041\000\042\000\043\000\
    \255\255\255\255\255\255\044\000\045\000\255\255\046\000\047\000\
    \048\000\049\000\255\255\050\000\051\000\052\000\053\000\054\000\
    \055\000\056\000\057\000\058\000\060\000\061\000\062\000\063\000\
    \255\255\068\000";
  Lexing.lex_code =
   "\255\003\255\255\004\255\003\255\255\000\003\255\005\255\003\255\
    \255\003\255\004\255\255\003\255\005\255\255\001\005\000\004\255\
    \008\255\007\255\006\255\003\255\255\003\255\007\255\008\255\006\
    \255\255\008\255\007\255\003\255\255\001\007\002\008\000\006\255\
    \008\255\003\255\255\003\255\007\255\008\255\255\003\255\008\255\
    \255\001\255\255\000\001\255\002\255\255\003\255\002\255\255\000\
    \002\255\005\255\002\255\255\004\255\002\255\255\002\255\003\255\
    \255\002\255\004\255\255\001\004\000\003\255\002\255\005\255\255\
    \000\005\255\006\255\002\255\255\002\255\006\255\255\007\255\002\
    \255\255\000\006\001\007\255\002\255\007\255\255";
}

let rec text section lexbuf =
  lexbuf.Lexing.lex_mem <- Array.make 9 (-1);(* L=1 [3] <- p ;  *)
  lexbuf.Lexing.lex_mem.(3) <- lexbuf.Lexing.lex_curr_pos ;
 __ocaml_lex_text_rec section lexbuf 0
and __ocaml_lex_text_rec section lexbuf __ocaml_lex_state =
  match Lexing.new_engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 15 "book/duniverse/mdx.dev/lib/lexer.mll"
        ( [] )
# 266 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 1 ->
let
# 16 "book/duniverse/mdx.dev/lib/lexer.mll"
             n
# 272 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_mem.(0)
and
# 16 "book/duniverse/mdx.dev/lib/lexer.mll"
                                 str
# 277 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_mem.(0) + 1) lexbuf.Lexing.lex_mem.(1) in
# 17 "book/duniverse/mdx.dev/lib/lexer.mll"
      ( let section = (String.length n, str) in
        newline lexbuf;
        `Section section :: text (Some section) lexbuf )
# 283 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 2 ->
let
# 20 "book/duniverse/mdx.dev/lib/lexer.mll"
                           h
# 289 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 3) lexbuf.Lexing.lex_mem.(0)
and
# 20 "book/duniverse/mdx.dev/lib/lexer.mll"
                                               l
# 294 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_mem.(1) lexbuf.Lexing.lex_mem.(2) in
# 21 "book/duniverse/mdx.dev/lib/lexer.mll"
      ( let header = if h = "" then None else Some h in
        let contents = block lexbuf in
        let labels = Block.labels_of_string l in
        let value = Block.Raw in
        let file = lexbuf.Lexing.lex_start_p.Lexing.pos_fname in
        newline lexbuf;
        let line = !line_ref in
        List.iter (fun _ -> newline lexbuf) contents;
        newline lexbuf;
        `Block { Block.file; line; section; header; contents; labels; value }
        :: text section lexbuf )
# 308 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 3 ->
let
# 32 "book/duniverse/mdx.dev/lib/lexer.mll"
                 str
# 314 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_mem.(0) in
# 33 "book/duniverse/mdx.dev/lib/lexer.mll"
      ( newline lexbuf;
        `Text str :: text section lexbuf )
# 319 "book/duniverse/mdx.dev/lib/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_text_rec section lexbuf __ocaml_lex_state

and block lexbuf =
  lexbuf.Lexing.lex_mem <- Array.make 2 (-1);(* L=1 [1] <- p ;  *)
  lexbuf.Lexing.lex_mem.(1) <- lexbuf.Lexing.lex_curr_pos ;
 __ocaml_lex_block_rec lexbuf 13
and __ocaml_lex_block_rec lexbuf __ocaml_lex_state =
  match Lexing.new_engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 37 "book/duniverse/mdx.dev/lib/lexer.mll"
                           ( [] )
# 333 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 1 ->
let
# 38 "book/duniverse/mdx.dev/lib/lexer.mll"
                  str
# 339 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_mem.(0) in
# 38 "book/duniverse/mdx.dev/lib/lexer.mll"
                           ( str :: block lexbuf )
# 343 "book/duniverse/mdx.dev/lib/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_block_rec lexbuf __ocaml_lex_state

and cram_text section lexbuf =
  lexbuf.Lexing.lex_mem <- Array.make 8 (-1);(* L=1 [2] <- p ;  *)
  lexbuf.Lexing.lex_mem.(2) <- lexbuf.Lexing.lex_curr_pos ;
 __ocaml_lex_cram_text_rec section lexbuf 20
and __ocaml_lex_cram_text_rec section lexbuf __ocaml_lex_state =
  match Lexing.new_engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 42 "book/duniverse/mdx.dev/lib/lexer.mll"
        ( [] )
# 357 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 1 ->
let
# 43 "book/duniverse/mdx.dev/lib/lexer.mll"
             n
# 363 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_mem.(0)
and
# 43 "book/duniverse/mdx.dev/lib/lexer.mll"
                                 str
# 368 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_mem.(0) + 1) lexbuf.Lexing.lex_mem.(1) in
# 44 "book/duniverse/mdx.dev/lib/lexer.mll"
      ( let section = (String.length n, str) in
        newline lexbuf;
        `Section section :: cram_text (Some section) lexbuf )
# 374 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 2 ->
let
# 47 "book/duniverse/mdx.dev/lib/lexer.mll"
                      first_line
# 380 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 2) lexbuf.Lexing.lex_mem.(0) in
# 48 "book/duniverse/mdx.dev/lib/lexer.mll"
      ( let header = Syntax.cram_default_header in
        let requires_empty_line, contents = cram_block lexbuf in
        let contents = first_line :: contents in
        let labels = [] in
        let value = Block.Raw in
        let file = lexbuf.Lexing.lex_start_p.Lexing.pos_fname in
        let line = !line_ref in
        List.iter (fun _ -> newline lexbuf) contents;
        let rest = cram_text section lexbuf in
        `Block { Block.file; line; section; header; contents; labels; value }
        :: (if requires_empty_line then `Text "" :: rest else rest) )
# 394 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 3 ->
let
# 59 "book/duniverse/mdx.dev/lib/lexer.mll"
                                                         choice
# 400 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_mem.(0) lexbuf.Lexing.lex_mem.(1) in
# 60 "book/duniverse/mdx.dev/lib/lexer.mll"
      ( let header = Syntax.cram_default_header in
        let requires_empty_line, contents = cram_block lexbuf in
        let labels = ["non-deterministic", Some (`Eq, choice)] in
        let value = Block.Raw in
        let file = lexbuf.Lexing.lex_start_p.Lexing.pos_fname in
        newline lexbuf;
        let line = !line_ref in
        List.iter (fun _ -> newline lexbuf) contents;
        let rest = cram_text section lexbuf in
        `Block { Block.file; line; section; header; contents; labels; value }
        :: (if requires_empty_line then `Text "" :: rest else rest) )
# 414 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 4 ->
let
# 71 "book/duniverse/mdx.dev/lib/lexer.mll"
                 str
# 420 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_mem.(0) in
# 72 "book/duniverse/mdx.dev/lib/lexer.mll"
      ( newline lexbuf;
        `Text str :: cram_text section lexbuf )
# 425 "book/duniverse/mdx.dev/lib/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_cram_text_rec section lexbuf __ocaml_lex_state

and cram_block lexbuf =
  lexbuf.Lexing.lex_mem <- Array.make 2 (-1); __ocaml_lex_cram_block_rec lexbuf 64
and __ocaml_lex_cram_block_rec lexbuf __ocaml_lex_state =
  match Lexing.new_engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 76 "book/duniverse/mdx.dev/lib/lexer.mll"
        ( false, [] )
# 437 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 1 ->
# 77 "book/duniverse/mdx.dev/lib/lexer.mll"
        ( newline lexbuf; true, [] )
# 442 "book/duniverse/mdx.dev/lib/lexer.ml"

  | 2 ->
let
# 78 "book/duniverse/mdx.dev/lib/lexer.mll"
                       str
# 448 "book/duniverse/mdx.dev/lib/lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 2) lexbuf.Lexing.lex_mem.(0) in
# 79 "book/duniverse/mdx.dev/lib/lexer.mll"
      ( let requires_empty_line, lst = cram_block lexbuf in
        requires_empty_line, str :: lst )
# 453 "book/duniverse/mdx.dev/lib/lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_cram_block_rec lexbuf __ocaml_lex_state

;;

# 82 "book/duniverse/mdx.dev/lib/lexer.mll"
 
let token syntax lexbuf =
  try
    match syntax with
    | Syntax.Normal -> text      None lexbuf
    | Syntax.Cram   -> cram_text None lexbuf
  with Failure _ -> Misc.err lexbuf "incomplete code block"

# 469 "book/duniverse/mdx.dev/lib/lexer.ml"
