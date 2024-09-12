include("file2list.jl")

lis1=file_to_list("sample_read_mixed_array.txt")
println("lis1=",lis1)
list_to_file(lis1,"sample_write_mixed_array_with_any.txt")
list_to_file(lis1,"sample_write_mixed_array_without_any.txt"; :typeinfo => Vector{Any})
println("See two files: sample_write_mixed_array_with_any.txt and sample_write_mixed_array_without_any.txt.")

lis2=file_to_list("sample_read_tuple.txt")
println("lis2=",lis2)
list_to_file(lis2,"sample_write_tuple.txt")
println("See sample_write_tuple.txt. This is a good practice for Julia.")
