defmodule RecipeBox.Meal do
  use Ecto.Schema

  schema "meals" do
    field :active, :boolean, default: true
    field :description, :string
    field :title, :string

    timestamps()
  end
end
