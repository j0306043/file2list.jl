include("file2list.jl")

lis1=file_to_list("sample_read.txt")
println("lis1=",lis1)
list_to_file(lis1,"sample_write.txt")
lis2=file_to_list("sample_write.txt")
println("lis2=",lis2)
