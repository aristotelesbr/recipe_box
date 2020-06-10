defmodule RecipeBoxWeb.Graphql.Schema.RecipeType do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  # alias RecipeBoxWeb.Graphql.Resolvers
  alias RecipeBox.IngredientRepo

  object :recipe_type do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, non_null(:string)
    field :meal, :meal_type
    field :ingredients, list_of(:ingredient_type), resolve: dataloader(IngredientRepo)
  end

  input_object :recipe_input_type do
    field(:title, non_null(:string))
    field(:description, non_null(:string))
    field(:meal_id, non_null(:integer))
  end
end
