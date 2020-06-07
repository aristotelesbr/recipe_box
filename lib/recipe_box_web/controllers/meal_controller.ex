defmodule RecipeBoxWeb.MealController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.{CreateMeal}
  alias RecipeBoxWeb.ChangesetView

  def create(conn, params) do
    case CreateMeal.run(params) do
      {:ok, meal} ->
        conn
        |> put_status(201)
        |> render("show.json", %{meal: meal})

      {:error, changeset} ->
        conn
        |> put_status(422)
        |> render(ChangesetView, "422.json", %{changeset: changeset})
    end
  end
end
