using kittyforth.lazypipe

@testset "lazypipe" begin

    inpt = lazypipe.ReadPipeline(() -> "abc")

    @test inpt() == "abc"
    @test inpt() == "abc"  # repeatable

    # monadic lazy ...
    inpt2 = inpt ∘ uppercase
#     @test typeof(inpt2) isa lazypipe.ReadPipeline  #TODO : fix dimensions or typecheck
    @test inpt2() == "ABC"



end