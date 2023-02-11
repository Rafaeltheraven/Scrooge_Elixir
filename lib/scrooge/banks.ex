defmodule Scrooge.Banks do

	@bic_mappings %{
		:ingb => "INGBNL2A XXX",
		:abna => "ABNANL2A XXX",
		:rabo => "RABONL2U XXX",
		:knab => "KNABNL2H XXX",
		:bunq => "BUNQNL2A XXX",
		:snsb => "SNSBNL2A XXX",
		:trio => "TRIONL2U XXX",
		:asnb => "ASNBNL21 XXX",
		:regb => "RBRBNL21 XXX"
	}

	@atom_mappings %{
		:ingb => "ING",
		:abna => "ABN Amro",
		:rabo => "Rabobank",
		:knab => "Knab Bank",
		:bunq => "Bunq",
		:snsb => "SNS",
		:trio => "Triodos",
		:asnb => "Asn Bank",
		:regb => "Regiobank"
	}

	@all_banks [:ingb, :abna, :rabo, :knab, :bunq, :snsb, :trio, :asnb, :regb]

	@type banks ::
        unquote(
          @all_banks
          |> Enum.map(&inspect/1)
          |> Enum.join(" | ")
          |> Code.string_to_quoted!()
        )

	@spec get_bic(banks) :: String.t
	def get_bic(bank), do: @bic_mappings[bank]

	@spec get_name(banks) :: String.t
	def get_name(bank), do: @atom_mappings[bank]
	
end