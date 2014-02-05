Html := Object clone
Html identStep := 5
Html ident := 0
Html forward := method(
  tag := call message name
  write("" alignRight(ident, " ") ..  "<"  .. tag  .. ">")
  ident := ident + identStep
  the_args := call message arguments
  if(the_args size > 1, writeln)
  the_args foreach(
     arg,
     ident := ident + identStep;
     content := self doMessage(arg);
     ident := ident - identStep;
     if(content type == "Sequence",  write(content)))
  ident := ident - identStep;
  writeln("" alignRight(ident, " ") .. "</" .. tag .. ">"))

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
