defmodule Scrooge.Groups.Group do
	use Ecto.Schema
	import Ecto.Changeset

	schema "groups" do
		field :title, :string
	end

end