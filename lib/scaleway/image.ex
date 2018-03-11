defmodule Scaleway.Image do
  import Scaleway, only: [get: 1]

  def list() do
    get("/images")
  end
end
