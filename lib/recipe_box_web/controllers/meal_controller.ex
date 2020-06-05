defmodule RecipeBoxWeb.MealController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.{CreateMeal}

  def create(conn, params) do
    case CreateMeal.run(params) do
      {:ok, meal} ->
        conn
        |> put_status(201)
        |> render("show.json", %{meal: meal})

      {:error, _} ->
        conn
        |> put_status(422)
        |> json(%{status: "unprocessable entity"})
    end
  end
end
