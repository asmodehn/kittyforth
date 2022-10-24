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

function readchar(input_strm = stdin)  # TODO : curses and basic read versions
    x = read(input_strm, Char)
    println("char: $x")
    return x
end

# function readline()  # TODO: compare with base readline method... and with curses method...
#     c = readchar()
#     l = [c]
#     while c != '\n'
#         c = readchar()
#         l = push!(l,c)
#     end
#     println("line: $l")
# #     flush(stdout)
#     return l
# end


# function readline(io::IO=stdin; keep::Bool=false)
# end
#
# function readline(filename::AbstractString; keep::Bool=false)
# end


# TODO: allow pass char input modifying function somehow... or as an afterthought ?

# function readline(Ncurses::Window; keep::Bool=false)
#
# end


function dreamline(fun)
    :(Base.readline() |> fun)

end

### MACRO to modify pre-existing julia code...
# This can inject into existing code, illustrating the existing monadic pattern in the system
macro linein(expr::Expr)
    modify(expr,dummy)
end

function dummy()
     print("RL Found")
     "aaa"
end

modify(atom::Symbol, mod) = atom == :readline ? mod : atom
modify(e::Expr, mod) = Expr(e.head, map(e -> modify(e, mod), e.args)...)


# @linein uppercase(readline())
#
# julia> dump( :(uppercase(readline())))
# Expr
#   head: Symbol call
#   args: Array{Any}((2,))
#     1: Symbol uppercase
#     2: Expr
#       head: Symbol call
#       args: Array{Any}((1,))
#         1: Symbol readline



end