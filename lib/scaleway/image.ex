defmodule Scaleway.Image do
  import Scaleway, only: [get: 1, format_answer: 1]

  @doc """
  List all images.
  """
  def list() do
    get("/images") |> format_answer
  end
end
