defmodule RecipeBoxWeb.Graphql.Resolvers.IngredientResolver do
  alias RecipeBox.IngredientRepo

  def list_ingredients(_root, _args, _info) do
    ingredients = IngredientRepo.list_ingredients()
    {:ok, ingredients}
  end
end
