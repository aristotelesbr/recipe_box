defmodule RecipeBox.Repo.Migrations.CreateMeals do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :title, :string
      add :description, :text
      add :active, :boolean, default: false, null: false

      timestamps()
    end
  end
end
