module kittyforth

greet() = print("Hello World!")

function readall()

    # CAREFUL : TODO first buffered or unbuffered terminal...

    # TODO second curses compatibility ???

    while !eof(stdin)
        x = read(stdin, Char)  # we want char by char for customiation of terminal navigation
        println("Found: $x")
    end

end

end # module kittyforth
