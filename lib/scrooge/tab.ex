defmodule Scrooge.Tab do
	@moduledoc """
		The Tab context. Keeping track of who owes what
	"""

	@typep debt_map :: %{required(String.t()) => %{required(:debit) => float(), optional(:credit) => float()}}

	@spec calc_credit(debt_map()) :: debt_map()
	def calc_credit(debt_map) do
		total = Enum.sum(Enum.map(Map.values(debt_map), fn mp -> Map.get(mp, :debit) end))
		shared = map_size(debt_map) / total
		Map.new(Enum.map(debt_map, fn {k, v} -> Map.put(debt_map[k][v], :credit, debt_map[k][v][:debit] - shared) end))
	end

	@spec get_debit(debt_map(), String.t()) :: float()
	def get_debit(debt_map, person) do
		debt_map[person][:debit]
	end

	@spec get_credit(debt_map(), String.t()) :: float()
	def get_credit(debt_map, person) do
		debt_map[person][:credit]
	end
end
