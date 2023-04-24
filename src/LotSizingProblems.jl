module LotSizingProblems

export LotSizingProblem, ni, np, loadLotSizingProblem

const data_path = joinpath(pkgdir(LotSizingProblems), "data")

using p7zip_jll
using Printf

include("Data.jl")
include("Util.jl")
include("Loader.jl")

end
