### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 22a366b6-8bf4-11eb-266e-2530b8fe5f25
begin
	using Pkg
	Pkg.activate(".")
	Pkg.instantiate()
	using CSV
	using DataFrames
	using VegaLite
	using VegaDatasets
	using Plots
	#using Plotly
	plotly()
end


# ╔═╡ 83761b12-8bf6-11eb-0dc1-7738e93a8951
md"## Topic-topic correlations"

# ╔═╡ 8e568ea4-8bf6-11eb-3093-41802a83f2be


# ╔═╡ a6960ae4-8bfb-11eb-0fab-9f492eca095d
md"Try with some plotly"

# ╔═╡ 6894a3bc-8bfc-11eb-27b8-e7c85a8bf989
begin
	markers = filter((m->begin
                m in Plots.supported_markers()
            end), Plots._shape_keys)
markers = reshape(markers, 1, length(markers))
n = length(markers)
x = (range(0, stop = 10, length = n + 2))[2:end - 1]
y = repeat(reshape(reverse(x), 1, :), n, 1)
scatter(x, y, m = (8, :auto), lab = map(string, markers), bg = :linen, xlim = (0, 10), ylim = (0, 10))
end

# ╔═╡ 5a32d46e-8bfd-11eb-132c-5fcb25726ee4
rehapedlist = begin
	xmarkers = filter((m->begin
                m in Plots.supported_markers()
            end), Plots._shape_keys)
	xmarkers = reshape(xmarkers, 1, length(xmarkers))
end

# ╔═╡ 7c3e633c-8bfd-11eb-3a6e-7766e9ac4a72
length(rehapedlist)

# ╔═╡ 9c5ebc0e-8bfd-11eb-2326-a31b184d1854


# ╔═╡ 668a3d24-8bf6-11eb-2f3d-a510424c1c3f
md"> Data sets"

# ╔═╡ e659fb14-8bf5-11eb-1a94-53f1143f7c86
f = pwd() * "/topictopic.csv"

# ╔═╡ 21566cac-8bf6-11eb-29c2-1d160f63a4e9
topictopicdf = CSV.File(f; header=false) |> DataFrame

# ╔═╡ e05fab06-8bfe-11eb-3d14-716eda71e076
row1 = begin
	row = topictopicdf[ 1, :]
	
end

# ╔═╡ e3597160-8bf8-11eb-1b3e-7fb5a6a70546
function vltopics()
	#row1 = topictopicdf[ 1, :]
	@vlplot() + #=@vlplot(	
		:circle,
		x= {1:25},
		y={fill(1, 25)}
	) +  @vlplot(
		:circle,
		x= {1:25},
		y={fill(24, 25)}
		) +
	=#
	 @vlplot(
		:circle,
		x= {1:25},
		y={row1}
		)
end

# ╔═╡ 24b777d6-8bfd-11eb-1e1f-7119ec25985a
vltopics()

# ╔═╡ cf7e1590-8bfc-11eb-2232-75fc38f58fe1
function plotlytopics()
	row1 = topictopicdf[ 1, :]
	x = [1:25]
	y = fill(23, 25)
	scatter(x,y)
end

# ╔═╡ 325c7a26-8bfd-11eb-32c4-733d9b66e3bb
plotlytopics()

# ╔═╡ 47d766c4-8bf6-11eb-0b10-8ba2873e7489
keyfile = pwd() * "/keys.csv"

# ╔═╡ 51f616c8-8bf6-11eb-0fdc-b5c04396e83d
CSV.File(keyfile; header=true)

# ╔═╡ Cell order:
# ╠═83761b12-8bf6-11eb-0dc1-7738e93a8951
# ╠═8e568ea4-8bf6-11eb-3093-41802a83f2be
# ╠═22a366b6-8bf4-11eb-266e-2530b8fe5f25
# ╠═e05fab06-8bfe-11eb-3d14-716eda71e076
# ╠═e3597160-8bf8-11eb-1b3e-7fb5a6a70546
# ╠═24b777d6-8bfd-11eb-1e1f-7119ec25985a
# ╟─a6960ae4-8bfb-11eb-0fab-9f492eca095d
# ╠═6894a3bc-8bfc-11eb-27b8-e7c85a8bf989
# ╠═5a32d46e-8bfd-11eb-132c-5fcb25726ee4
# ╠═7c3e633c-8bfd-11eb-3a6e-7766e9ac4a72
# ╠═cf7e1590-8bfc-11eb-2232-75fc38f58fe1
# ╠═325c7a26-8bfd-11eb-32c4-733d9b66e3bb
# ╠═9c5ebc0e-8bfd-11eb-2326-a31b184d1854
# ╟─668a3d24-8bf6-11eb-2f3d-a510424c1c3f
# ╟─e659fb14-8bf5-11eb-1a94-53f1143f7c86
# ╟─21566cac-8bf6-11eb-29c2-1d160f63a4e9
# ╟─47d766c4-8bf6-11eb-0b10-8ba2873e7489
# ╟─51f616c8-8bf6-11eb-0fdc-b5c04396e83d
