defmodule Hue.PageController do
  use Hue.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
