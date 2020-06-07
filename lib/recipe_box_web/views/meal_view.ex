defmodule RecipeBoxWeb.MealView do
  use RecipeBoxWeb, :view

  alias RecipeBoxWeb.MealView

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
      data: render_many(meals, MealView, "meal.json")
    }
  end

  def render("show.json", %{meal: meal}) do
    %{
      data: render_one(meal, MealView, "meal.json")
    }
  end
end
