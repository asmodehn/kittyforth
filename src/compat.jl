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

function readchar()
    x = read(stdin, Char)
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

end