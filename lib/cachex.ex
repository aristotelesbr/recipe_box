defmodule RecipeBox.Cachex do

  def start() do
    %{
      id: :my_cache_id,
      start: {Cachex, :start_link, [:my_cache, []]}
    }
  end
end
