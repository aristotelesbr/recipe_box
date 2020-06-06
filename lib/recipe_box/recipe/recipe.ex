defmodule RecipeBox.Recipe do
  @moduledoc """
    Recipe schema
  """
  alias RecipeBox.{DifficultyLevelEnum, Meal}

  use Ecto.Schema

  schema "recipes" do
    field :title, :string
    field :description, :string
    field :difficulty_level, DifficultyLevelEnum
    field :quantity_people, :string
    belongs_to :meal, Meal

    timestamps()
  end
end
