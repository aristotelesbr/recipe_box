defmodule RecipeBoxWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(RecipeBoxWeb.Graphql.Schema.Types)

  alias RecipeBoxWeb.Graphql.Resolvers

  query do
    @desc "Get a list of all recipes"
    field :recipes, list_of(:recipe_type) do
      resolve(&Resolvers.RecipeResolver.recipes/3)
    end
  end
end
