defmodule RecipeBoxWeb.RecipeController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.{CreateRecipe, Repo, Recipe}
  alias RecipeBoxWeb.ErrorView

  def index(conn, _params) do
    recipes = Repo.all(Recipe) |> Repo.preload(:meal)

    conn
    |> put_status(200)
    |> render("index.json", %{recipes: recipes})
  end

  def create(conn, params) do
    case CreateRecipe.run(params) do
      {:ok, recipe} ->
        recipe = recipe |> Repo.preload(:meal)
        conn
        |> put_status(201)
        |> render("show.json", %{recipe: recipe})

      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end
  end

  def show(conn, %{"id" => id}) do
    recipe_with_meal = Repo.get(Recipe, id) |> Repo.preload(:meal)

    conn
    |> render("show.json", %{recipe: recipe_with_meal})
  end
end
