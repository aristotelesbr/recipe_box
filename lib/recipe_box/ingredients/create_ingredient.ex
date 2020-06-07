defmodule RecipeBox.CreateIngredient do
  import Ecto.Changeset

  alias RecipeBox.{Ingredient, Repo}

  @doc false
  def run(params) do
    %Ingredient{}
    |> cast(params, [:name, :price, :recipe_id])
    |> validate_required([:name, :price, :recipe_id])
    |> Repo.insert()
  end
end
