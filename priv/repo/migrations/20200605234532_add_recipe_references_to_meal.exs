defmodule RecipeBox.Repo.Migrations.AddRecipeReferencesToMeal do
  use Ecto.Migration

  def up do
    alter table("recipes") do
      remove :meal_type, :integer
      add :meal_id, references("meals")
    end

    create index("recipes", [:meal_id])
  end

  def down do
    alter table("recipes") do
      add :meal_type, :integer
      remove :meal_id, references("meats")
    end

    drop index("recipes", [:meal_id])
  end
end
