defmodule RecipeBoxWeb.Router do
  use RecipeBoxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", RecipeBoxWeb do
    pipe_through :api

    # Recipe
    post("/recipes", RecipeController, :create)
    get("/recipes", RecipeController, :index)
    get("/recipes/:id", RecipeController, :show)

    # Meal
    post("/meals", MealController, :create)

    # Ingredient
    post("/ingredients", IngredientController, :create)
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: RecipeBoxWeb.Telemetry
    end

    forward("/graphql", Absinthe.Plug, schema: RecipeBoxWeb.Schem)
    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: RecipeBoxWeb.Schema)
  end
end
