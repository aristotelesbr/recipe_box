defmodule RecipeBox.Recipe do
  @moduledoc """
    Recipe schema
  """
  alias RecipeBox.{DifficultyLevelEnum, Meal, Ingredient}
  alias RecipeBox.Repo

  def data(), do: Dataloader.Ecto.new(Repo, query: &query/2)

  def query(queryable, _params) do
    queryable
  end

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
