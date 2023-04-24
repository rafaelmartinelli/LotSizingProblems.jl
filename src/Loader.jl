function loadLotSizingProblem(instance::Symbol)::Union{LotSizingProblem, Nothing}
    raw = getRawData(string(instance))
    return load(raw, string(instance))
end

function loadLotSizingProblem(file_name::String)::Union{LotSizingProblem, Nothing}
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end
    
    name = splitext(basename(file_name))[1]
    values = split(read(file_name, String))

    return load(values, name)
end

function load(values::Array{String}, name::String)::Union{LotSizingProblem, Nothing}
    n_items =   parse(Int64, values[1])
    n_periods = parse(Int64, values[2])
    cost =      parse(Int64, values[3])
    capacity =  parse(Int64, values[4])

    consumptions =       parse.(Float64, values[5:4:4 * n_items + 1])
    inv_costs =          parse.(Float64, values[6:4:4 * n_items + 2])
    setup_consumptions = parse.(Float64, values[7:4:4 * n_items + 3])
    setup_costs =        parse.(Float64, values[8:4:4 * n_items + 4])

    demands = parse.(Int64, values[4 * n_items + 5:4 * n_items + n_items * n_periods + 4])
    demands = reshape(demands, (n_items, n_periods))
    
    return LotSizingProblem(name, cost, capacity, consumptions, inv_costs, 
        setup_consumptions, setup_costs, demands, loadBounds(name)...)
end

function getRawData(file_name::String)::Union{Vector{String}, Nothing}
    data_file = joinpath(data_path, "data.7z")

    run(pipeline(`$(p7zip()) e $data_file -y -o$data_path $file_name`; stdout = devnull, stderr = devnull))

    abs_file_name = joinpath(data_path, file_name)
    if !isfile(abs_file_name)
        println("File $(string(instance)) not found!")
        return nothing
    end

    raw = split(read(abs_file_name, String))
    rm(abs_file_name)

    return raw
end
