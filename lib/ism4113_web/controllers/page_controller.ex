defmodule Ism4113Web.PageController do
  use Ism4113Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
