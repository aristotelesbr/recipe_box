defmodule RecipeBoxWeb.Schema do
  use Absinthe.Schema

  alias RecipeBox.{Recipe, Ingredient}
  alias RecipeBoxWeb.Graphql.Resolvers

  def context(ctx) do
    loader =
      Dataloader.new
      |> Dataloader.add_source(Ingredient, Ingredient.data())
      |> Dataloader.add_source(Recipe, Recipe.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  import_types(Absinthe.Type.Custom)
  import_types(RecipeBoxWeb.Graphql.Schema.Types)

  query do
    @desc "Get a list of all recipes"
    field :recipes, list_of(:recipe_type) do
      resolve(&Resolvers.RecipeResolver.recipes/3)
    end
  end
end
