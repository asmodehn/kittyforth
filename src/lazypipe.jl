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

    abstract type Monad
    end

    abstract type CoMonad
    end

    struct ReadPipeline <: CoMonad
    # TODO : specialise these with String
        initial::Function
        then::Array{Function}
        ReadPipeline(initial, then=[]) = new(initial, then)
    end

    # compose (pipe) left associatively when called
    (rp::ReadPipeline)() = foldl(|>, rp.then ; init=rp.initial())

    # Redefine pipeline operator for a pipeline
    # TODO: Specialise for String -> String
    Base.:|>(rp::ReadPipeline, f ::Function) = ReadPipeline(rp.initial, [rp.then ; f])


    struct WritePipeline <: Monad
    # TODO : specialise with String
        terminal::Function
        before::Array{Function}
        WritePipeline(terminal, before=[]) = new(terminal, before)
    end

    # compose (pipe) right associatively when called
    (wp::WritePipeline)(s::String) = foldl(|>, wp.before ; init=s) |> wp.terminal

    # Redefine pipeline operator for a pipeline
    # TODO: Specialise for String -> String
    Base.:|>(f::Function, wp::WritePipeline) = WritePipeline(wp.terminal, [f ; wp.before])

end