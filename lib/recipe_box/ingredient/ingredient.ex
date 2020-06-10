defmodule RecipeBox.Ingredient do
  use Ecto.Schema

  alias RecipeBox.Recipe

  schema "ingredients" do
    field :name, :string
    field :price, :decimal
    belongs_to :recipe, Recipe

    timestamps()
  end
end
