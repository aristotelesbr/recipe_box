defmodule RecipeBoxWeb.RecipeView do
  use RecipeBoxWeb, :view

  alias RecipeBox.{Meal, Recipe, Repo}

  def render("recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      difficulty_level: recipe.difficulty_level,
      quantity_people: recipe.quantity_people,
      meal: %{
        id: recipe.meal.id,
        title: recipe.meal.title,
        description: recipe.meal.description,
        active: recipe.meal.active,
        inserted_at: recipe.meal.inserted_at,
        updated_at: recipe.meal.updated_at
      }
    }
  end

  def render("index.json", %{recipes: recipes}) do
    %{
      data: render_many(recipes, RecipeBoxWeb.RecipeView, "recipe.json")
    }
  end

  def render("show.json", %{recipe: recipe}) do
    %{
      data: render_one(recipe, RecipeBoxWeb.RecipeView, "recipe.json")
    }
  end
end
