Html := Object clone
Html ident ::= 0;
Html forward := method(
  tag := call message name
  prettyPrefix := (" " repeated(self ident() ));
  #                        ¬ esses pontinhos concatenaram o próprio sistema
  # writeln(prettyPrefix,  .. "<" .. tag  .. ">");
  writeln(prettyPrefix,  "<" .. tag  .. ">");
  self setIdent( self ident + 1 );
  call message arguments foreach( arg,
     content := self doMessage(arg);
     if(content type == "Sequence",  writeln(prettyPrefix, " ", content););
  );
  self setIdent( self ident() - 1);
  writeln(prettyPrefix, "</", tag, ">");
);

Html h1("Interesting stuff here")
Html ul(
  li("Cool"),
  li("List"),
  li("Of items :)", 
    ul(
      li("sub"),
      li("itens")
    ))
)
Html div(
 p("Cool paragraph"),
 p("Other paragraph",
   div(
     ul(
       li("ra unique li"),
       li("hiii")))),
 pre("Show me the code!")
)
