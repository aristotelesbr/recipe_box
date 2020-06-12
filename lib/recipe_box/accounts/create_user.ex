defmodule RecipeBox.CreateUser do
  import Ecto.Changeset
  alias RecipeBox.{User, Repo}

  @doc false
  def run(params) do
    %User{}
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> put_password()
    |> Repo.insert()
  end

  defp put_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    put_change(changeset, :password_hash, encrypt(password))
  end

  defp put_password(changeset), do: changeset

  defp encrypt(password), do: Bcrypt.hash_pwd_salt(password)
end
