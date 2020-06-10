defmodule RecipeBoxWeb.Schema do
  use Absinthe.Schema

  alias RecipeBox.{Recipe, IngredientRepo}
  alias RecipeBoxWeb.Graphql.Resolvers

  def context(ctx) do
    loader =
      Dataloader.new(timeout: 36_000_00)
      |> Dataloader.add_source(IngredientRepo, IngredientRepo.data())
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
