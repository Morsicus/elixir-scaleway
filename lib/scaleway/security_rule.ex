defmodule Scaleway.SecurityGroup.Rule do
  @moduledoc """
  Manage Security Rule used in Security groups

  [Scaleway documentation API for security rules](https://developer.scaleway.com/#security-groups-manage-rules)
  """

  import Scaleway, only: [get: 1, post: 2, put: 2, delete: 1, format_answer: 1, extract_body: 1]

  @endpoint "/security_groups"

  # Used to craft an endpoint in order to manage lifecycle of a security rule.
  defp endpoint_rule(security_group_id) do
    "#{@endpoint}/#{security_group_id}/rules"
  end

  @doc """
  Create a new rule

  ## Examples
      iex> data = %{
        :action => "drop",
        :direction => "inbound",
        :ip_range => "0.0.0.0/0",
        :protocol => "TCP"
      }
      %{
        :action => "drop",
        :direction => "inbound",
        :ip_range => "0.0.0.0/0",
        :protocol => "TCP"
      }

      iex> security_group_id = "000989a-4242-5c55-ue42-33f1742ab87b"
      "000989a-4242-5c55-ue42-33f1742ab87b"

      iex> Scaleway.SecurityGroup.Rule.create(security_group_id, data)
  """
  @spec create(charlist(), map()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def create(id, data) do
    post("#{endpoint_rule(id)}", data)
  end
  @spec create!(charlist(), map()) :: map()
  def create!(id, data) do
    create(id, data)
    |> format_answer
    |> extract_body
  end

  @doc """
  List all rules for a specific security_group.

  ## Examples
      iex> security_group_id = "000989a-4242-5c55-ue42-33f1742ab87b"
      "000989a-4242-5c55-ue42-33f1742ab87b"

      iex> Scaleway.SecurityGroup.Rule.list(security_group_ip)
  """
  @spec list(charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def list(security_group_id) do
    get(endpoint_rule(security_group_id))
  end
  @spec list!(charlist()) :: map()
  def list!(security_group_id) do
    list(security_group_id)
    |> format_answer
    |> extract_body
  end

  @doc """
  Retrieves a security rule.

  ## Examples
      iex> security_rule_id = "ef2136c9-6c21-491a-b238-b38de24726a7"
      "ef2136c9-6c21-491a-b238-b38de24726a7"

      iex> security_group_id = "000989a-4242-5c55-ue42-33f1742ab87b"
      "000989a-4242-5c55-ue42-33f1742ab87b"

      iex> Scaleway.SecurityGroup.Rule.show(security_group_id, security_rule_id)
  """
  @spec show(charlist(), charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def show(security_group_id, security_rule_id) do
    get("#{endpoint_rule(security_group_id)}/#{security_rule_id}")
  end
  @spec show!(charlist(), charlist()) :: map()
  def show!(security_group_id, security_rule_id) do
    show(security_group_id, security_rule_id)
    |> format_answer
    |> extract_body
  end

  @doc """
  Update a security rule.

  ## Examples
      iex> data = %{
        :action => "drop",
        :direction => "inbound",
        :ip_range => "0.0.0.0/0",
        :protocol => "TCP"
      }
      %{
        :action => "drop",
        :direction => "inbound",
        :ip_range => "0.0.0.0/0",
        :protocol => "TCP"
      }

      iex> security_rule_id = "ef2136c9-6c21-491a-b238-b38de24726a7"
      "ef2136c9-6c21-491a-b238-b38de24726a7"

      iex> security_group_id = "000989a-4242-5c55-ue42-33f1742ab87b"
      "000989a-4242-5c55-ue42-33f1742ab87b"

      iex> Scaleway.SecurityGroup.Rule.update(security_group_id, security_rule_id, data)
  """
  @spec update(charlist(), charlist(), map()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def update(security_group_id, security_rule_id, data) do
    put("#{endpoint_rule(security_group_id)}/#{security_rule_id}", data)
  end
  @spec update!(charlist(), charlist(), map()) :: map()
  def update!(security_group_id, security_rule_id, data) do
    update(security_group_id, security_rule_id, data)
    |> format_answer
    |> extract_body
  end

  @doc """
  Delete a security rule.

  ## Examples
      iex> security_rule_id = "ef2136c9-6c21-491a-b238-b38de24726a7"
      "ef2136c9-6c21-491a-b238-b38de24726a7"

      iex> security_group_id = "000989a-4242-5c55-ue42-33f1742ab87b"
      "000989a-4242-5c55-ue42-33f1742ab87b"

      iex> Scaleway.SecurityGroup.Rule.remove(security_group_id, security_rule_id)
  """
  @spec remove(charlist(), charlist()) :: {:ok, HTTPoison.Response} | {:error, HTTPoison.Error}
  def remove(security_group_id, security_rule_id) do
    delete("#{endpoint_rule(security_group_id)}/#{security_rule_id}")
  end
  @spec remove!(charlist(), charlist()) :: map()
  def remove!(security_group_id, security_rule_id) do
    remove(security_group_id, security_rule_id)
    |> format_answer
    |> extract_body
  end
end
