defmodule RecipeBoxWeb.Graphql.Schema.MealType do
  use Absinthe.Schema.Notation

  object :meal_type do
    field :id, :id
    field :title, :string
    field :description, :string
  end

  input_object :meal_input_type do
    field(:title, non_null(:string))
    field(:description, non_null(:string))
  end
end
