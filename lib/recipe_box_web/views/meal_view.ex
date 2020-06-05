defmodule RecipeBoxWeb.MealView do
  use RecipeBoxWeb, :view

  def render("meal.json", %{meal: meal}) do
    %{
      id: meal.id,
      title: meal.title,
      description: meal.description,
      active: meal.active
    }
  end

  def render("index.json", %{meals: meals}) do
    %{
      data: render_many(meals, RecipeBoxWeb.MealView, "meal.json")
    }
  end

  def render("show.json", %{meal: meal}) do
    %{
      data: render_one(meal, RecipeBoxWeb.MealView, "meal.json")
    }
  end
end
