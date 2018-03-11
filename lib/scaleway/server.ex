defmodule Scaleway.Server do
  import Scaleway, only: [get: 1, post: 2, delete: 1, format_answer: 1, extract_body: 1]

  @endpoint "/servers"

  def list() do
    get(@endpoint) |> format_answer
  end
  def list!() do
    list() |> extract_body
  end

  def create(data) do
    post(@endpoint, data) |> format_answer
  end

  def remove(id) do
    delete("#{@endpoint}/#{id}") |> format_answer
  end
end
