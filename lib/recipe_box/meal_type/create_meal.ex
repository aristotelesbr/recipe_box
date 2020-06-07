defmodule RecipeBox.CreateMeal do
  @moduledoc """
    Create meal
  """
  import Ecto.Changeset

  alias RecipeBox.{Meal, Repo}

  @doc false
  def run(params) do
    %Meal{}
    |> cast(params, [:title, :description])
    |> validate_required([:title])
    |> Repo.insert()
  end
end
