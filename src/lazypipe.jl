"""
# module lazypipe

- Julia version:
- Author: alexv
- Date: 2022-10-25

This module is here to provide a lazy function composition primitive

# Examples

```jldoctest
julia>
```
"""
module lazypipe
    abstract type CoMonad
    end

    struct ReadPipeline <: CoMonad
    # TODO : specialise these with String
        initial::Function
        then::Array{Function}
        ReadPipeline(initial, then=[]) = new(initial, [identity; then])
    end

    (rp::ReadPipeline)() = rp.initial() |> ∘(rp.then...)

# TODO: Specialise for String -> String
    Base.:∘(rp::ReadPipeline, f ::Function) = ReadPipeline(rp.initial, [rp.then ; f])

end