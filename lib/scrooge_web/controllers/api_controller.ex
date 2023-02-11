defmodule ScroogeWeb.APIController do
	use ScroogeWeb, :controller

	def index(conn, _params) do
		case Scrooge.QR.qr_blob(:ingb, "NAME", "IBAN", "1.00", "test", "a test") do
			{:ok, blob} ->
				conn 
				|> put_resp_content_type("image/svg+xml")
				|> send_resp(200, blob)
			{:error, msg} ->
				conn
				|> send_resp(500, msg)
		end
	end
end