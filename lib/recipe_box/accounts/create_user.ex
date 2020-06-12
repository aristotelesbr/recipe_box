defmodule RecipeBox.CreateUser do
  import Ecto.Changeset
  alias RecipeBox.{User, Repo}

  @doc false
  def run(params) do
    %User{}
    |> cast(params, [:name, :email, :password_hash])
    |> validate_required([:name, :email, :password_hash])
    |> Repo.insert()
  end
end
