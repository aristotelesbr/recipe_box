defmodule RecipeBoxWeb.Graphql.Schema.Types do
  use Absinthe.Schema.Notation

  alias RecipeBoxWeb.Graphql.Schema

  import_types(Schema.RecipeType)
  import_types(Schema.MealType)
end
