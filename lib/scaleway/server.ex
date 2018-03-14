defmodule Scaleway.Server do
  import Scaleway, only: [get: 1, post: 2, delete: 1, format_answer: 1, extract_body: 1]

  @endpoint "/servers"

  @doc """
  List all servers.
  """
  @spec list() :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list() do
    get(@endpoint)
  end

  @doc """
  Similar to list/0 but with the body only.
  """
  @spec list!() :: map()
  def list!() do
    list()
    |> format_answer
    |> extract_body
  end

  @doc """
  Retrieve informations on a specific server by its id.
  """
  @spec show(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def show(id) do
    get("#{@endpoint}/#{id}")
  end
  @spec show!(charlist()) :: map()
  def show!(id) do
    show(id)
    |> format_answer
    |> extract_body
  end

  @doc """
  Create a new server.
  """
  @spec create(map()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def create(data) do
    post(@endpoint, data)
  end

  @doc """
  Remove a specific server by its id.
  """
  @spec remove(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def remove(id) do
    delete("#{@endpoint}/#{id}")
  end
end
