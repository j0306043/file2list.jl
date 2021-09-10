function list_to_file(lst,file_name)
    open(file_name, "w") do f
        for elem in lst
            show(f, elem)
	    print(f, '\n')
	end
    end
end

function file_to_list(file_name)
    open(file_name, "r") do f
        [(Meta.parse(line) |> eval) for line in eachline(f) if line[1] != '#']
    end
end
