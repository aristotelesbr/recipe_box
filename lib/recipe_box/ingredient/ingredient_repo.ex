defmodule RecipeBox.IngredientRepo do
  alias RecipeBox.{Ingredient, Repo}

  def data(), do: Dataloader.Ecto.new(Repo, query: &query/2)

  def query(queryable, _params) do
    queryable
  end

  def list_ingredients() do
    Repo.all(Ingredient)
  end
end
