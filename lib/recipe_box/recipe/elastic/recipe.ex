defmodule EUser do
  @es_type "user"
  @es_index "users_development_20190408132432878"
  use Elastic.Document.API

  defstruct id: nil, email: nil, name: nil
end
