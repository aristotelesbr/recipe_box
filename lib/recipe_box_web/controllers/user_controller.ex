defmodule RecipeBoxWeb.UserController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.Accounts
  alias RecipeBox.CreateUser
  alias RecipeBoxWeb.ChangesetView

  action_fallback RecipeBoxWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, params) do
    case CreateUser.run(params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: user)

      {:error, changeset} ->
        conn
        |> put_status(221)
        |> render(ChangesetView, "422.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end
end
