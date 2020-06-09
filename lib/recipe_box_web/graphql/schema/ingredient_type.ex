defmodule RecipeBoxWeb.Graphql.Schema.IngredientType do
  use Absinthe.Schema.Notation

  object :ingredient_type do
    field :id, :id
    field :name, :string
    field :price, :decimal
  end

  input_object :ingredient_input_type do
    field(:name, non_null(:string))
    field(:price, non_null(:decimal))
  end
end
