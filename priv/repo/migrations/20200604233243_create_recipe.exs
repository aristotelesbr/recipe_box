defmodule RecipeBox.Repo.Migrations.CreateRecipe do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string, null: false
      add :description, :text, null: false
      add :quantity_people, :string
      add :meal_type, :integer
      add :difficulty_level, :integer

      timestamps()
    end
  end
end
