defmodule RedWeb.EditorController do
  use RedWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end


