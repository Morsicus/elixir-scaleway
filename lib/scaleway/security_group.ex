defmodule Scaleway.SecurityGroup do
  @moduledoc """
  Manage Security groups.
  """

  import Scaleway, only: [get: 1, post: 2, put: 2, delete: 1, format_answer: 1, extract_body: 1]

  @endpoint "/security_groups"

  @doc """
  Create a security group

  ## Examples
      iex> data = %{
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :name => "security-groups-01",
        :description => "Security group 01"
      }
      %{
        description: "Security group 01",
        name: "security-groups-01",
        organization: "000a115d-2852-4b0a-9ce8-47f1134ba95a"
      }

      iex> Scaleway.SecurityGroups.create(data)
  """
  @spec create(map()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def create(data) do
    post(@endpoint, data)
  end
  @spec create!(map()) :: map()
  def create!(data) do
    create(data)
    |> format_answer
    |> extract_body
  end

  @doc """
  List all security groups.

  ## Examples
      iex> Scaleway.SecurityGroups.list
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
  Retrieves a security group by its id.

  ## Examples
      iex> Scaleway.SecurityGroups.show("000a115d-2852-4b1a-9ce8-47f1134ba95a")
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
  Update a security group.

  ## Examples
      iex> data = %{
        :organization => "000a115d-2852-4b0a-9ce8-47f1134ba95a",
        :name => "security-groups-01",
        :description => "Security group 01"
      }
      %{
        description: "Security group 01",
        name: "security-groups-01",
        organization: "000a115d-2852-4b0a-9ce8-47f1134ba95a"
      }

      iex> security_group_id = "000a115d-2852-4b1a-9ce8-47f1134ba95a"
      "000a115d-2852-4b1a-9ce8-47f1134ba95a"

      iex> Scaleway.SecurityGroups.update(security_group_id, data)
  """
  @spec update(charlist(), map()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def update(id, data) do
    put("#{@endpoint}/#{id}", data)
  end
  @spec update!(charlist(), map()) :: map()
  def update!(id, data) do
    update(id, data)
    |> format_answer
    |> extract_body
  end

  @doc """
  Delete a security group.

  ## Examples
      iex> security_group_id = "000a115d-2852-4b1a-9ce8-47f1134ba95a"
      "000a115d-2852-4b1a-9ce8-47f1134ba95a"

      iex> Scaleway.SecurityGroups.delete(security_group_id)
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
