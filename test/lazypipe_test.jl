using kittyforth.lazypipe

@testset "lazypipe" begin

    @testset "ReadPipeline" begin
        inpt = lazypipe.ReadPipeline(() -> "abc")

        @test inpt() == "abc"
        @test inpt() == "abc"  # repeatable

        # monadic lazy ...
        inpt2 = inpt |> uppercase
    #     @test typeof(inpt2) isa lazypipe.ReadPipeline  #TODO : fix dimensions or typecheck
        @test inpt2() == "ABC"
    end

    @testset "WritePipeline" begin

        outp = lazypipe.WritePipeline((s::String) -> nothing)

        @test outp("abc") == nothing
        @test outp("abc") == nothing  # repeatable

        # monadic lazy ...
        outp2 = uppercase |> outp
    #     @test typeof(inpt2) isa lazypipe.ReadPipeline  #TODO : fix dimensions or typecheck
        @test outp2("abc") == nothing
        # TODO : test via sideeffects
    end


    @testset "LazyPipeLR" begin
        in = () -> "abc"
        # TODO : sideeffect for test
        out = (s::String) -> nothing

        pipe = lazypipe.LazyPipeLR(in)

        pipe2 = pipe |> uppercase

        pipe3 = pipe2 |> out

        @test pipe() == "abc"
        @test pipe() == "abc"
        @test pipe2() == "ABC"
        @test pipe2() == "ABC"
        @test pipe3() == nothing

    end

end