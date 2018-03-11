defmodule Scaleway do
  @moduledoc """
  Documentation for elixir-scaleway.
  """

  use HTTPoison.Base

  defp get_token, do: Application.get_env(:scaleway, :api_token)

  defp get_region(), do: Application.get_env(:scaleway, :region)

  defp get_endpoint(), do: "https://cp-#{get_region()}.scaleway.com"

  defp process_url(path), do: "#{get_endpoint()}" <> path

  defp process_request_headers(headers) do
    [{"Content-type", "application/json"}, {"X-Auth-Token", "#{get_token()}"}] ++ headers
  end

  defp process_request_body(req), do: Poison.encode!(req)

  defp process_response_body(""), do: ""
  defp process_response_body(body), do: Poison.decode!(body, keys: :atoms)

  @doc """
  Format the Scaleway API answer as a tuple
  """
  def format_answer({status, res}) when status == :ok do
    {status, res.body, res.headers}
  end
  def format_answer({status, res}) when status == :error do
    {status, res.reason}
  end

  @doc """
  Used to extract the body from format_answer/1.
  More usable by the final user.
  """
  def extract_body({_, body, _}), do: body
end
