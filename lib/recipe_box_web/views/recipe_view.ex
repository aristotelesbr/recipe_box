defmodule RecipeBoxWeb.RecipeView do
  use RecipeBoxWeb, :view

  def render("recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      difficulty_level: recipe.difficulty_level,
      meal_type: recipe.meal_type,
      quantity_people: recipe.quantity_people
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
