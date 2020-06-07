defmodule RecipeBox.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :string
      add :price, :decimal
      add :recipe_id, references(:recipes)

      timestamps()
    end

    create index(:ingredients, [:recipe_id])
  end
end
