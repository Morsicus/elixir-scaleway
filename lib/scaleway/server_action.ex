defmodule Scaleway.Server.Action do
  import Scaleway, only: [get: 1, format_answer: 1, extract_body: 1]

  @endpoint "/servers"

  @doc """
  List all actions possible for a server by its id.
  """
  @spec list(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list(id) do
    get("#{@endpoint}/#{id}/action")
  end
  @spec list!(charlist()) :: map()
  def list!(id) do
    list(id)
    |> format_answer
    |> extract_body
  end
end
