defmodule RecipeBoxWeb.RecipeController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.{CreateRecipe, Repo, Recipe}


  def index(conn, _params) do
    recipes = Repo.all(Recipe)
    conn
    |> put_status(200)
    |> render("index.json", %{recipes: recipes})
  end

  def create(conn, params) do
    case CreateRecipe.run(params) do
      {:ok, recipe} ->
        conn
        |> put_status(201)
        |> render("show.json", %{recipe: recipe})

      {:error, _} ->
        conn
        |> put_status(422)
        |> json(%{status: "unprocessable entity"})
    end
  end
end
