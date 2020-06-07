defmodule RecipeBoxWeb.RecipeView do
  use RecipeBoxWeb, :view

  alias RecipeBox.Repo

  def render("recipe.json", %{recipe: recipe}) do
    ings = recipe |> Repo.preload(:ingredients)

    %{
      id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      difficulty_level: recipe.difficulty_level,
      quantity_people: recipe.quantity_people,
      meal:
        render_one(
          recipe.meal,
          RecipeBoxWeb.MealView,
          "show.json"
        ),
      ingredients:
        render_many(
          ings.ingredients,
          RecipeBoxWeb.IngredientView,
          "show.json"
        )
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
