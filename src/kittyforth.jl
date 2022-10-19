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


function getUserInput(T=String,msg="")
  flush(stdout)  # because some terminals buffer output
  print("$msg ")
  flush(stdout)  # because some terminals buffer output
  if T == String
      return compat.readline()
#         l = Base.readline()
#         println("line: $l")
  else
    try
      return parse(T, compat.readline())
#         l = Base.readline()
#         println("line: $l")
#         return parse(T, l)
    catch
     println("Sorry, I could not interpret your answer. Please try again")
     getUserInput(T,msg)
    end
  end
end


function readall()

    # CAREFUL : TODO first buffered or unbuffered terminal...

    # TODO second curses compatibility ???

    while !eof(stdin)
        l = getUserInput(String, "> ")  # TODO : use default arg ?
    end

end

end # module kittyforth
