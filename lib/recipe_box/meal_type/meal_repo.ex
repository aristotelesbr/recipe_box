defmodule RecipeBox.Meal.MealRepo do
  alias RecipeBoxWeb.{Repo, Meal}

  def find_meal(id) do
    Repo.find(Meal, id)
  end
end
