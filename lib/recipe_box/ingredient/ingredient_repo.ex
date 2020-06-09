defmodule RecipeBox.Ingredient.IngredientRepo do
  alias RecipeBox.{Ingredient, Repo}

  def list_ingredients() do
    Repo.all(Ingredient)
  end
end
