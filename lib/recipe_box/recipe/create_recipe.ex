defmodule RecipeBox.CreateRecipe do
  @moduledoc """
    Create a new Recipe
  """
  import Ecto.Changeset

  alias RecipeBox.{Recipe, Repo}

  def run(params) do
    %Recipe{}
    |> cast(params, [:title, :description, :quantity_people, :difficulty_level, :meal_id])
    |> validate_required([:title, :description, :meal_id])
    |> Repo.insert()
  end
end
