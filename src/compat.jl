"""
# module readline

- Julia version: 
- Author: alexv
- Date: 2022-10-18

This module is here to modify & compare with the julia readline() function

# Examples

```jldoctest
julia>
```
"""
module compat

export readchar, readline

function readchar(input_strm = stdin)
    x = read(input_strm, Char)
    println("char: $x")
    return x
end

function readline()  # TODO: compare with base readline method...
    c = readchar()
    l = [c]
    while c != '\n'
        c = readchar()
        l = push!(l,c)
    end
    println("line: $l")
#     flush(stdout)
    return l
end


using Ncurses_jll


function cursed()
    # using lib curses
    # Note : does NOT work in repl !!!
    # useful to workaround buffered terminal for interactive tests

    # For library products, you can use the exported variable name in `ccall()` invocations directly
    num_chars = ccall((:initscr, Ncurses_jll.libncurses), Cint, ())

end


end