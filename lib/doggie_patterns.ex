defmodule Doggie.Patterns do
  @moduledoc """
  Doggie is a library that provides the most commonly used regular expression patterns,
  such as patterns for email, ip, isbn and etc.

  This library can be useful if you don't want to write regular expression manually.
  """

  @doc """
  Pattern for for matching email address.

  ## Examples
      iex> Regex.match?(Doggie.email(), "likid.geimfari@gmail.com")
      true

      iex> Regex.match?(Doggie.email(), "likid.geimfari@gmai'l.com")
      false
  """
  def email(), do: ~r/([a-z0-9!#$%&'*+\/=?^_`{|.}~-]+@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)/

  @doc """
  Pattern for matching mac address.

  ## Examples
      iex> Regex.match?(Doggie.mac_address(), "00:08:C7:1B:8C:02")
      true

      iex> Regex.match?(Doggie.mac_address(), "00:08:C7:1B:8C")
      false
  """
  def mac_address(), do: ~r/^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$/

  @doc """
  Pattern for matching bitcoin address

  ## Examples
      iex> Regex.match?(Doggie.hex_value(), "#a3c113")
      true

      iex> Regex.match?(Doggie.hex_value(), "a3c113")
      true
  """
  def hex_value(), do: ~r/^#?([a-f0-9]{6}|[a-f0-9]{3})$/

  @doc """
  Pattern that matches roman numerals.

  ## Examples
      iex> Regex.match?(Doggie.roman_numerals(), "XX")
      true

      iex> Regex.match?(Doggie.roman_numerals(), "20")
      false
  """
  def roman_numerals(), do: ~r/^(?=[MDCLXVI])M*(C[MD]|D?C*)(X[CL]|L?X*)(I[XV]|V?I*)$/


  @doc """
  Pattern that match ISBN 10 and ISBN 13.

  ## Examples
      iex> Regex.match?(Doggie.isbn(), "ISBN-13: 978-1-56619-909-4")
      true

      iex> Regex.match?(Doggie.isbn(), "ISBN-13: 978 5 93286 159 2")
      true

      iex> Regex.match?(Doggie.isbn(), "978-1-56619-909-4")
      true

      iex> Regex.match?(Doggie.isbn(), "ISBN-10: 1-56619-909-3")
      true

      iex> Regex.match?(Doggie.isbn(), "1-56619-909-3")
      true

      iex> Regex.match?(Doggie.isbn(), "978 1 56619 909 4")
      true

      iex> Regex.match?(Doggie.isbn(), "ISBN 13: 978-1-56619-909")
      false
  """
  def isbn() do
    ~r/^(?:ISBN(?:-1[03])?:? )?(?=[-0-9 ]{17}$|[-0-9X ]{13}$|[0-9X]{10}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?(?:[0-9]+[- ]?){2}[0-9X]$/
  end

  @doc """
  Pattern for matching 24 hour time format.

  ## Examples
      iex> Regex.match?(Doggie.time_24_format(), "23:00")
      true

      iex> Regex.match?(Doggie.time_24_format(), "25:00")
      false
  """
  def time_24_format(), do: ~r/(23:00|2[0-3]:[0-5][0-9]|[0-1][0-9]:[0-5][0-9])/

  @doc """
  Pattern for matching phone number for United States of America.

  ## Examples
      # Phone number without country code.
      iex> Regex.match?(Doggie.phone_number(:us), "2345678901")
      true

      # Phone number with space separators.
      iex> Regex.match?(Doggie.phone_number(:us), "1 234 567 8901")
      true

      # Phone number with dash separators.
      iex> Regex.match?(Doggie.phone_number(:us), "1-234-567-8901")
      true

      # Phone number with mixed separators.
      iex> Regex.match?(Doggie.phone_number(:us), "1 (234) 567-8901")
      true

      # Invalid phone number
      iex> Regex.match?(Doggie.phone_number(:us), "+45 12 23 45 67")
      false
  """
  def phone_number(:us) do
    ~r/(?P<countrycode>1?)[\s\(-]{0,2}(?P<areadcode>\d{3})[\s\)-]{0,2}(?P<phoneline0>\d{3})[\s-]?(?P<phoneline1>\d{4})/
  end

  @doc """
  Pattern for matching zip code of cuntry.

  ## Examples
      iex> Regex.match?(Doggie.zip_code(:ru), "454356")
      true

      iex> Regex.match?(Doggie.zip_code(:ru), "4543563")
      false

      iex> Regex.match?(Doggie.zip_code(:ru), "43564")
      false

      iex> Regex.match?(Doggie.zip_code(:is), "356")
      true

      iex> Regex.match?(Doggie.zip_code(:is), "35464")
      false

      iex> Doggie.zip_code(:python)
      {:error, :unsupported_country}
  """
  def zip_code(code) do
    case code do
      :at -> ~r/^\d{4}$/
      :au -> ~r/^\d{4}$/
      :az -> ~r/^([[:alpha:]]{2})?\d{4}$/
      :ba -> ~r/^\d{5}$/
      :bd -> ~r/^\d{4}$/
      :be -> ~r/^\d{4}$/
      :bg -> ~r/^\d{4}$/
      :by -> ~r/^\d{6}$/
      :ch -> ~r/^\d{4}$/
      :ck -> ~r/^\d{4}$/
      :cl -> ~r/^\d{3}-?\d{4}$/
      :cs -> ~r/^\d{5}$/
      :cv -> ~r/^\d{4}$/
      :cy -> ~r/^\d{4}$/
      :de -> ~r/^\d{5}$/
      :dk -> ~r/^\d{4}$/
      :do -> ~r/^\d{5}$/
      :dz -> ~r/^\d{5}$/
      :ee -> ~r/^\d{5}$/
      :eg -> ~r/^\d{5}$/
      :es -> ~r/^\d{5}$/
      :et -> ~r/^\d{4}$/
      :fi -> ~r/^\d{5}$/
      :fo -> ~r/^\d{3}$/
      :ge -> ~r/^\d{4}$/
      :gn -> ~r/^\d{3}$/
      :gt -> ~r/^\d{5}$/
      :gw -> ~r/^\d{4}$/
      :hm -> ~r/^\d{4}$/
      :hr -> ~r/^\d{5}$/
      :ht -> ~r/^\d{4}$/
      :hu -> ~r/^\d{4}$/
      :id -> ~r/^\d{5}$/
      :il -> ~r/^(\d{2})?\d{5}$/
      :in -> ~r/^\d{3} ?\d{3}$/
      :is -> ~r/^\d{3}$/
      :it -> ~r/^\d{5}$/
      :jo -> ~r/^\d{5}$/
      :ke -> ~r/^\d{5}$/
      :kg -> ~r/^\d{6}$/
      :kh -> ~r/^\d{5}$/
      :kw -> ~r/^\d{5}$/
      :kz -> ~r/^\d{6}$/
      :la -> ~r/^\d{5}$/
      :lk -> ~r/^\d{5}$/
      :lr -> ~r/^\d{4}$/
      :ls -> ~r/^\d{3}$/
      :lt -> ~r/^([[:alpha:]]{2}-)?\d{5}$/
      :lu -> ~r/^\d{4}$/
      :lv -> ~r/^([[:alpha:]]{2}-)?\d{4}$/
      :ma -> ~r/^\d{5}$/
      :md -> ~r/^([[:alpha:]]{2}-?)?\d{4}$/
      :me -> ~r/^8\d{4}$/
      :mg -> ~r/^\d{3}$/
      :mk -> ~r/^\d{4}$/
      :mn -> ~r/^\d{6}$/
      :mv -> ~r/^\d{5}$/
      :mx -> ~r/^\d{5}$/
      :my -> ~r/^\d{5}$/
      :nc -> ~r/^988\d{2}$/
      :ne -> ~r/^\d{4}$/
      :ng -> ~r/^\d{6}$/
      :no -> ~r/^\d{4}$/
      :np -> ~r/^\d{5}$/
      :nz -> ~r/^\d{4}$/
      :pg -> ~r/^\d{3}$/
      :ph -> ~r/^\d{4}$/
      :pk -> ~r/^\d{5}$/
      :pl -> ~r/^\d{2}-\d{3}$/
      :py -> ~r/^\d{4}$/
      :ro -> ~r/^\d{6}$/
      :rs -> ~r/^\d{5}$/
      :ru -> ~r/^\d{6}$/
      :sa -> ~r/^\d{5}(-\d{4})?$/
      :se -> ~r/^\d{3}[ ]?\d{2}$/
      :sg -> ~r/^\d{6}$/
      :si -> ~r/^\d{4}$/
      :sj -> ~r/^\d{4}$/
      :sn -> ~r/^\d{5}$/
      :so -> ~r/^([[:alpha:]]{2} )?\d{5}$/
      :th -> ~r/^\d{5}$/
      :tj -> ~r/^\d{6}$/
      :tm -> ~r/^\d{6}$/
      :tn -> ~r/^\d{4}$/
      :tr -> ~r/^\d{5}$/
      :ua -> ~r/^\d{5}$/
      :us -> ~r/^\d{5}([ \-]\d{4})?$/
      :uy -> ~r/^\d{5}$/
      :uz -> ~r/^\d{6}$/
      :ve -> ~r/^\d{4}(-[[:alpha:]])?$/
      :xk -> ~r/^\d{5}$/
      :yu -> ~r/^\d{5}$/
      :za -> ~r/^\d{4}$/
      :zm -> ~r/^\d{5}$/
      _ -> {:error, :unsupported_country}
    end
  end

end
