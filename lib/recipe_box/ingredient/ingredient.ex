defmodule RecipeBox.Ingredient do
  use Ecto.Schema
  alias RecipeBox.Repo

  def data(), do: Dataloader.Ecto.new(Repo, query: &query/2)

  def query(queryable, _params) do
    queryable
  end

  alias RecipeBox.Recipe

  schema "ingredients" do
    field :name, :string
    field :price, :decimal
    belongs_to :recipe, Recipe

    timestamps()
  end
end
