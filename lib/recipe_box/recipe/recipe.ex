defmodule RecipeBox.Recipe do
  @moduledoc """
    Recipe schema
  """
  alias RecipeBox.{DifficultyLevelEnum, Meal, Ingredient}

  use Ecto.Schema

  schema "recipes" do
    field :title, :string
    field :description, :string
    field :difficulty_level, DifficultyLevelEnum
    field :quantity_people, :string
    belongs_to :meal, Meal
    has_many :ingredients, Ingredient

    timestamps()
  end
end
