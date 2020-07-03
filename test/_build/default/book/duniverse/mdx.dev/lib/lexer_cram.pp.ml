
# 1 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
 
# 2 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
open Astring
let commands s = String.cuts ~sep:"\\\n> " s


# 7 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
# 7 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\249\255\250\255\001\000\002\000\001\000\003\000\002\000\
    \255\255\015\000\005\000\254\255\002\000\029\000\014\000\007\000\
    \253\255\252\255\251\255\008\000\252\255\253\255\254\255\011\000\
    \255\255\013\000\006\000\253\255\254\255\007\000\255\255\001\000\
    \254\255\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\006\000\006\000\006\000\006\000\006\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\003\000\
    \255\255\255\255\255\255\255\255\255\255\002\000\255\255\255\255\
    \255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\000\000\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\020\000\000\000\000\000\000\000\255\255\
    \000\000\255\255\027\000\000\000\000\000\255\255\000\000\032\000\
    \000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\006\000\002\000\033\000\013\000\000\000\010\000\011\000\
    \015\000\016\000\022\000\000\000\025\000\024\000\025\000\024\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \006\000\018\000\017\000\013\000\004\000\010\000\013\000\015\000\
    \028\000\030\000\021\000\025\000\000\000\025\000\005\000\014\000\
    \014\000\012\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\009\000\009\000\009\000\015\000\013\000\003\000\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\000\000\000\000\012\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\007\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\029\000\000\000\023\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\010\000\000\000\000\000\000\000\
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
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \008\000\033\000\000\000\000\000\000\000\011\000\255\255\016\000\
    \022\000\000\000\000\000\024\000\000\000\024\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\031\000\006\000\255\255\010\000\010\000\
    \015\000\015\000\019\000\255\255\023\000\023\000\025\000\025\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\003\000\004\000\006\000\000\000\010\000\013\000\015\000\
    \026\000\029\000\019\000\023\000\255\255\025\000\000\000\005\000\
    \012\000\006\000\007\000\007\000\007\000\007\000\007\000\007\000\
    \007\000\007\000\007\000\007\000\014\000\013\000\000\000\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\255\255\255\255\013\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\026\000\255\255\019\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\009\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\031\000\255\255\255\255\255\255\010\000\026\000\015\000\
    \019\000\255\255\255\255\023\000\255\255\025\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\010\000\000\000\004\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000";
  Lexing.lex_backtrk_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000";
  Lexing.lex_default_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000";
  Lexing.lex_trans_code =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
    \001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
    \001\000\001\000\001\000\001\000\000\000\000\000\000\000\000\000\
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
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000";
  Lexing.lex_check_code =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
    \007\000\007\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\009\000\009\000\009\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255";
  Lexing.lex_code =
   "\255\001\255\255\000\001\255";
}

let rec token lexbuf =
  lexbuf.Lexing.lex_mem <- Array.make 2 (-1); __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.new_engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->

# 11 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     
# 11 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     ( [] )

# 200 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 201 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 1 ->
let

# 12 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                  
# 12 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                  str

# 206 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
# 206 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_mem.(0) in

# 13 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     
# 13 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     ( `Exit (int_of_string str) :: token lexbuf )

# 210 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 211 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 2 ->

# 14 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     
# 14 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     ( `Ellipsis :: token lexbuf )

# 215 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 216 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 3 ->

# 15 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     
# 15 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     (
      let buf = Buffer.create 8 in
      let line, cont = command_line buf lexbuf in
      if cont then `Command_first line :: token lexbuf
      else `Command line :: token lexbuf
    )

# 225 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 226 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 4 ->

# 21 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     
# 21 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     (
      let buf = Buffer.create 8 in
      let line, cont = command_line buf lexbuf in
      if cont then `Command_cont line :: token lexbuf
      else `Command_last line :: token lexbuf
    )

# 235 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 236 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 5 ->

# 27 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     
# 27 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     ( `Output "" :: token lexbuf )

# 240 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 241 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 6 ->
let

# 28 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
        
# 28 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
        c

# 246 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
# 246 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in

# 28 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     
# 28 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                     (
     let buf = Buffer.create 8 in
     Buffer.add_char buf c;
     let line = line buf lexbuf in
     `Output line :: token lexbuf
   )

# 255 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 256 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and command_line buf lexbuf =
   __ocaml_lex_command_line_rec buf lexbuf 19
and __ocaml_lex_command_line_rec buf lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->

# 36 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                
# 36 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                ( Buffer.contents buf, true )

# 267 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 268 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 1 ->

# 37 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                
# 37 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                ( Buffer.contents buf, false )

# 272 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 273 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 2 ->

# 38 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
          
# 38 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
          (
     let xbuf = Buffer.create 8 in
     Buffer.add_char xbuf '\"';
     Buffer.add_string buf (string xbuf lexbuf);
     command_line buf lexbuf )

# 281 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 282 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 3 ->
let

# 43 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
        
# 43 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
        c

# 287 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
# 287 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in

# 43 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
          
# 43 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
          ( Buffer.add_char buf c; command_line buf lexbuf )

# 291 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 292 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_command_line_rec buf lexbuf __ocaml_lex_state

and string buf lexbuf =
   __ocaml_lex_string_rec buf lexbuf 26
and __ocaml_lex_string_rec buf lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
let

# 46 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
             
# 46 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
             str

# 304 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
# 304 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_start_pos + 2) in

# 46 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                 
# 46 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                 ( Buffer.add_string buf str; string buf lexbuf )

# 308 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 309 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 1 ->

# 47 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                 
# 47 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                 ( Buffer.add_char buf '\"'; Buffer.contents buf )

# 313 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 314 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 2 ->
let

# 48 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
        
# 48 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
        c

# 319 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
# 319 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in

# 48 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                 
# 48 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
                 ( Buffer.add_char buf c; string buf lexbuf )

# 323 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 324 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_string_rec buf lexbuf __ocaml_lex_state

and line buf lexbuf =
   __ocaml_lex_line_rec buf lexbuf 31
and __ocaml_lex_line_rec buf lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->

# 51 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
          
# 51 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
          ( Buffer.contents buf )

# 335 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 336 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | 1 ->
let

# 52 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
        
# 52 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
        c

# 341 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
# 341 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in

# 52 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
          
# 52 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
          ( Buffer.add_char buf c; line buf lexbuf )

# 345 "book/duniverse/mdx.dev/lib/lexer_cram.ml"

  
# 346 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_line_rec buf lexbuf __ocaml_lex_state

;;


# 54 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
 
# 55 "book/duniverse/mdx.dev/lib/lexer_cram.mll"
let token lexbuf =
  try token lexbuf
  with Failure _ -> Misc.err lexbuf "incomplete cram test"


# 358 "book/duniverse/mdx.dev/lib/lexer_cram.ml"
