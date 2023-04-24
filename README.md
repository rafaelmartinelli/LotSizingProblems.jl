# LotSizingProblems.jl

[![Build Status](https://github.com/rafaelmartinelli/LotSizingProblems.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/rafaelmartinelli/LotSizingProblems.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

This package reads data files for Capacitated Lot Sizing Problem (CLSP) instances.

## Usage

The type used by the package is `LotSizingProblem`, defined as follows:

```julia
struct LotSizingProblem
    name::String                        # Instance name

    cost::Int64                         # Unitary production cost
    capacity::Int64                     # Capacity

    consumptions::Vector{Float64}       # Unitary resource consumption
    inv_costs::Vector{Float64}          # Unitary inventory costs
    setup_consumptions::Vector{Float64} # Setup resource consumptions
    setup_costs::Vector{Float64}        # Setup costs
    demands::Matrix{Int64}              # Demands

    lb::Float64                         # Lower bound (-Inf if not known)
    ub::Float64                         # Upper bound ( Inf if not known)
end
```

The package also provides two helper functions `ni(data)` and `np(data)`, which return the number of items and periods, respectively.

Some classical CLSP instances from the literature are preloaded. For example, to load CLSP instance `X11117A`:

```julia
clsp = loadLotSizingProblem(:X11117A)
```

The package also loads custom CLSP instances. For example:

```julia
clsp = loadLotSizingProblem("/full/path/to/your/instance")
```

## Installation

`LotSizingProblems` is _not_ a registered Julia Package...

You can install `LotSizingProblems` through the Julia package manager.

Open Julia's interactive session (REPL) and type:

```julia
] add https://github.com/rafaelmartinelli/LotSizingProblems.jl
```

__Do not forget__ to :star:star:star: our package! :grin:

## Other packages

- [Knapsacks.jl](https://github.com/rafaelmartinelli/Knapsacks.jl): Knapsack algorithms in Julia
- [InventoryRoutingProblems.jl](https://github.com/rafaelmartinelli/InventoryRoutingProblems.jl): Inventory Routing Problems Lib
- [FacilityLocationProblems.jl](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl): Facility Location Problems Lib
- [AssignmentProblems.jl](https://github.com/rafaelmartinelli/AssignmentProblems.jl): Assignment Problems Lib
- [BPPLib.jl](https://github.com/rafaelmartinelli/BPPLib.jl): Bin Packing and Cutting Stock Problems Lib
- [CARPData.jl](https://github.com/rafaelmartinelli/CARPData.jl): Capacitated Arc Routing Problem Lib
- [MDVSP.jl](https://github.com/rafaelmartinelli/MDVSP.jl): Multiple-Depot Vehicle Scheduling Problem Lib
- [CVRPLIB.jl](https://github.com/chkwon/CVRPLIB.jl): Capacitated Vehicle Routing Problem Lib
- [TSPLIB.jl](https://github.com/matago/TSPLIB.jl): Traveling Salesman Problem Lib
