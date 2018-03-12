defmodule Scaleway.Snapshot do
  import Scaleway, only: [get: 1, format_answer: 1, extract_body: 1]

  @doc """
  List all snapshots.
  """
  @spec list() :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list() do
    get("/snapshots") 
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
end
