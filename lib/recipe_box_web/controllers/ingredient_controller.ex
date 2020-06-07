defmodule RecipeBoxWeb.IngredientController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.{CreateIngredient}
  alias RecipeBoxWeb.ChangesetView

  def create(conn, params) do
    case CreateIngredient.run(params) do
      {:ok, ingredient} ->
        conn
        |> put_status(:created)
        |> render("show.json", ingredient: ingredient)

      {:error, changeset} ->
        conn
        |> put_status(422)
        |> render(ChangesetView, "422.json", %{changeset: changeset})
    end
  end
end
