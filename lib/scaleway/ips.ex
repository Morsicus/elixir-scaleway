defmodule Scaleway.IP do
  import Scaleway, only: [get: 1, post: 2, put: 2, delete: 1, format_answer: 1, extract_body: 1]

  @endpoint "/ips"

  @doc """
  Create a new IP
  """
  @spec create(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def create(organization) do
    data = %{:organization => organization}
    post(@endpoint, data)
  end
  @spec create!(charlist()) :: map()
  def create!(organization) do
    create(organization)
    |> format_answer
    |> extract_body
  end

  @doc """
  Retrieves all IPs addresses
  """
  @spec list() :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list() do
    get(@endpoint)
  end
  @spec list!() :: map()
  def list!() do
    list()
    |> format_answer
    |> extract_body
  end

  @doc """
  Retrieves an IP address by its id.
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
  Attach an IP address.
  """
  @spec attach(charlist(), map()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def attach(ip_id, data) do
    put("#{@endpoint}/#{ip_id}", data)
  end
  @spec attach!(charlist(), map()) :: map()
  def attach!(ip_id, data) do
    attach(ip_id, data)
    |> format_answer
    |> extract_body
  end

  @doc """
  Remove an IP address.
  """
  @spec remove(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def remove(id) do
    delete("#{@endpoint}/#{id}")
  end
  @spec remove!(charlist()) :: map()
  def remove!(id) do
    remove(id)
    |> format_answer
    |> extract_body
  end
end
