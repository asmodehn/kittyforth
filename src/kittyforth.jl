"""
# module kittyforth

- Julia version:
- Author: alexv
- Date: 2022-10-17

# Examples

```jldoctest
julia>
```
"""
module kittyforth

# TODO : find a sensible way to organize files...
include("compat.jl")

function readall()

    # CAREFUL : TODO first buffered or unbuffered terminal...

    # TODO second curses compatibility ???

    while !eof(stdin)
        l = compat.readline()
#         l = Base.readline()
#         println("line: $l")
        flush(stdout)  # because some terminals buffer output
    end

end

end # module kittyforth
