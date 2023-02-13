defmodule Scrooge.QR do
	
	# @spec qr_string(Scrooge.Banks.banks, String.t, String.t, String.t, String.t, String.t) :: String.t
	defp qr_string(bank, person_name, iban, amount, short_desc, desc, ref) do
		"BCD\n001\n1\nSCT\n#{Scrooge.Banks.get_bic(bank)}\n#{person_name}\n#{iban}\nEUR#{amount}\n#{short_desc}\n#{ref}\n#{desc}"
	end

	@spec qr_blob(Scrooge.Banks.banks, String.t, String.t, String.t, String.t, String.t) :: Result.t
	def qr_blob(bank, person_name, iban, amount, short_desc \\ "", desc \\ "", ref \\ "") do
		QRCode.create(qr_string(bank, person_name, iban, amount, short_desc, desc, ref))
	end 

end