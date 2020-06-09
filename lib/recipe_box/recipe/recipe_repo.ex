defmodule RecipeBox.Recipe.RecipeRepo do
  alias RecipeBox.{Recipe, Repo}

  def list_recipes do
    Repo.all(Recipe) |> Repo.preload(:meal)
  end
end
