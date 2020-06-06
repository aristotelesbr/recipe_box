defmodule RecipeBoxWeb.ErrorView do
  use RecipeBoxWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  def render("422.json", %{errors: errors}) do
    %{error: render_errors(errors)}
  end

  defp render_errors(errors) do
    require IEx; IEx.pry
    Enum.map(errors, fn {field, {message, _meta}} -> %{field: field, message: message} end)
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
