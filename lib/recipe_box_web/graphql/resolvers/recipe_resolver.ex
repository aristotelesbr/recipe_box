defmodule RecipeBoxWeb.Graphql.Resolvers.RecipeResolver do
  alias RecipeBox.Recipe.RecipeRepo

  def recipes(_root, _args, _info) do
    recipes = RecipeRepo.list_recipes()
    {:ok, recipes}
  end
end
