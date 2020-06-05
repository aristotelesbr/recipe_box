defmodule RecipeBox.CreateRecipe do
  @moduledoc """
    Create a new Recipe
  """
  import Ecto.Changeset

  alias RecipeBox.{Recipe, Repo}

  def run(params) do
    %Recipe{}
    |> cast(params, [:title, :description, :quantity_people, :meal_type, :difficulty_level])
    |> validate_required([:title, :description])
    |>Repo.insert()
  end
end
