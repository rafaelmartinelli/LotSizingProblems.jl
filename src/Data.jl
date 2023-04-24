struct LotSizingProblem
    name::String

    cost::Int64
    capacity::Int64

    consumptions::Vector{Float64}
    inv_costs::Vector{Float64}
    setup_consumptions::Vector{Float64}
    setup_costs::Vector{Float64}
    demands::Matrix{Int64}

    lb::Float64
    ub::Float64
end

ni(data::LotSizingProblem)::Int64 = length(data.consumptions)
np(data::LotSizingProblem)::Int64 = size(data.demands, 2)

function Base.show(io::IO, data::LotSizingProblem)
    @printf(io, "CLSP Data %s", data.name)
    @printf(io, " (%d items,", ni(data))
    @printf(io, " %d periods)", np(data))
    @printf(io, " [%.3f, %.3f]", data.lb, data.ub)
end
