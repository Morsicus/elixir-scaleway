defmodule Scaleway.Server do
  import Scaleway, only: [get: 1, post: 2, delete: 1, format_answer: 1, extract_body: 1]

  @endpoint "/servers"

  @doc """
  List all servers.
  """
  def list() do
    get(@endpoint) |> format_answer
  end

  @doc """
  Similar to list/0 but with the body only.
  """
  def list!() do
    list() |> extract_body
  end

  @doc """
  Create a new server.
  """
  def create(data) do
    post(@endpoint, data) |> format_answer
  end

  @doc """
  Remove a specific server by its id.
  """
  def remove(id) do
    delete("#{@endpoint}/#{id}") |> format_answer
  end
end
