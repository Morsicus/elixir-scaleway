defmodule Scaleway.IP do
  import Scaleway, only: [get: 1, post: 2, put: 2, delete: 1, format_answer: 1, extract_body: 1]

  @moduledoc """
  A reserved IP address is a static IP address designed for cloud computing.
  Reserved IPs address allow you to mask the failure of a server rapidly reallocating the IPs address to another server in your account.

  [Scaleway documentation API for IPs](https://developer.scaleway.com/#ips)
  """

  @endpoint "/ips"

  @doc """
  Create a new IP

  ## Examples
      iex> data = %{
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a"
      }

      iex> Scaleway.IP.create(data)
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

  ## Examples
      iex> Scaleway.IP.list()
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

  ## Examples
      iex> ip_id = "b50cd740-892d-47d3-8cbf-88510ef626e7"
      "b50cd740-892d-47d3-8cbf-88510ef626e7"

      iex> Scaleway.IP.show(ip_id)
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

  ## Examples
      iex> ip_id = "b50cd740-892d-47d3-8cbf-88510ef626e7"
      "b50cd740-892d-47d3-8cbf-88510ef626e7"

      iex> data = %{
        :address => "212.47.226.88",
        :id => ip_id,
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :server => "c2d8994f-1582-413e-8d48-c53076db06cc"
      }
      %{
        :address => "212.47.226.88",
        :id => "b50cd740-892d-47d3-8cbf-88510ef626e7",
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :server => "c2d8994f-1582-413e-8d48-c53076db06cc"
      }

      iex> Scaleway.IP.attach(ip_id, data)
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

  ## Examples
      iex> ip_id = "b50cd740-892d-47d3-8cbf-88510ef626e7"
      "b50cd740-892d-47d3-8cbf-88510ef626e7"

      iex> Scaleway.IP.remove(ip_id)
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
