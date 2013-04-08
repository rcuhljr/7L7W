Builder := Object clone
Builder forward := method(
    if(call message name == "depth", return 1)
    size := call message argCount    
    depth := doMessage(call message argAt(size-1));
    call message setArguments(call message arguments slice(0,-1))
    writeln(" " repeated(depth-1), "<", call message name, ">")
    call message arguments foreach(
        arg,
        arg appendArg(message(depth+1))        
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(" " repeated(depth), content)))
    writeln(" " repeated(depth-1), "</", call message name, ">"))

Builder ul(
    li("Io"),
    li(
        p("Lua"),
        p("More Lua")
        ),
    li("Javascript"),0)