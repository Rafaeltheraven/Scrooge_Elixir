defmodule Scrooge.QR do
	
	@spec qr_string(String.t, String.t, String.t, String.t, String.t, String.t) :: Result.t
	defp qr_string(person_name, iban, amount, short_desc, desc, ref) do
		bic = Bankster.bic_calculate(iban)
		Result.Operators.and_then(bic, fn (bic_val) -> "BCD\n001\n1\nSCT\n#{bic_val}\n#{person_name}\n#{iban}\nEUR#{amount}\n#{short_desc}\n#{ref}\n#{desc}" end)
	end

	@spec qr_blob(String.t, String.t, String.t, String.t, String.t) :: Result.t
	def qr_blob(person_name, iban, amount, short_desc \\ "", desc \\ "", ref \\ "") do
		string = qr_string(person_name, iban, amount, short_desc, desc, ref)
		Result.Operators.and_then(string, fn (x) -> QRCode.create(x) end)
	end 
end
