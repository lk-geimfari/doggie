defmodule Doggie do
  @moduledoc """
  Doggie is a library that provides the most commonly used regular expression patterns,
  such as patterns for email, ip, isbn and etc.

  This library can be useful if you don't want to write regular expression manually.
  """

  alias Doggie.Patterns

  @doc """
  """
  def is_email(e_mail) do
    Regex.match?(Patterns.email(), e_mail)
  end

  @doc """
  """
  def is_mac_address(address) do
    Regex.match?(Patterns.mac_address(), address)
  end

  @doc """
  """
  def is_hex(value) do
    Regex.match?(Patterns.hex_value(), value)
  end

  @doc """
  """
  def is_roman_numerals(num) do
    Regex.match?(Patterns.roman_numerals(), num)
  end

  @doc """
  """
  def is_isbn(value) do
    Regex.match?(Patterns.isbn(), value)
  end

  @doc """
  """
  def is_time_24_format(time) do
    Regex.match?(Patterns.time_24_format(), time)
  end

  @doc """
  """
  def is_phone_number(number, :us) do
    Regex.match?(Patterns.phone_number(:us), number)
  end

end
