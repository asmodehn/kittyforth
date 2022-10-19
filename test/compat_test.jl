
@testset "readchar()" begin
    # create stream
    teststrm = IOBuffer(b"data")
    # basic read test (maybe redundant... but a first step)
    @test kittyforth.compat.readchar(teststrm) == 'd'
    @test kittyforth.compat.readchar(teststrm) == 'a'
    @test kittyforth.compat.readchar(teststrm) == 't'
    @test kittyforth.compat.readchar(teststrm) == 'a'

end

@testset "readline()" begin
end