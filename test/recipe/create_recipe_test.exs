defmodule RecipeBox.CreateRecipeTest do
  use RecipeBox.DataCase, async: true

  alias RecipeBox.{Recipe, CreateRecipe}

  describe "run/1" do
    test "returns a struct when the params are valid" do
      params = %{title: "any title", description: "any description"}

      assert {:ok, %Recipe{} = recipe} = CreateRecipe.run(params)
    end

    test "returns error when title is missing" do
      params = %{title: "", description: "any description"}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateRecipe.run(params)
      %{title: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when description is missing" do
      params = %{title: "any title", description: ""}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateRecipe.run(params)
      %{description: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
