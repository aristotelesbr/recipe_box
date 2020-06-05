defmodule RecipeBox.Recipe do
  @moduledoc """
    Recipe schema
  """
  use Ecto.Schema

  schema "recipes" do
    field :title, :string
    field :description, :string
    field :difficulty_level, :integer
    field :meal_type, :integer
    field :quantity_people, :string

    timestamps()
  end
end
