defmodule Doggie do
  @moduledoc """
  Documentation for Doggie.
  Doggie is a tiny library that provides RegEx patterns. This can be useful if
  you don't want to write regular expression manually.
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
  Pattern for matching IPv4 address.

  ## Examples
      iex> Regex.match?(Doggie.ipv4(), "209.18.181.23")
      true

      iex> Regex.match?(Doggie.ipv4(), "209.18.181")
      false
  """
  def ipv4(), do: ~r/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/


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
  Pattern for matching bitcoin address

  ## Examples
      iex> Regex.match?(Doggie.bitcoin_address(), "1BoatSLRHtKNngkdXEeobR76b53LETtpyT")
      true

      iex> Regex.match?(Doggie.bitcoin_address(), "3GD1wceAmdmQhWhWwQTqPt4tB")
      false
  """
  def bitcoin_address do
    ~r/(?<![a-km-zA-HJ-NP-Z0-9])[13][a-km-zA-HJ-NP-Z0-9]{26,33}(?![a-km-zA-HJ-NP-Z0-9])/
  end

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
  Pattern for matching phone number for Denmark.
  ## Examples
      iex> Regex.match?(Doggie.phone_number(:dk), "+45 12 23 45 67")
      true

      iex> Regex.match?(Doggie.phone_number(:dk), "+4512 23 45 67")
      true
  """
  def phone_number(:dk), do: ~r/^(?:\+45)?(\s*\d){8}$/

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
      iex> Regex.match?(Doggie.zip_code(:ad), "AD524")
      true

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
      :ad -> ~r/AD\d{3}/
      :am -> ~r/(37)?\d{4}/
      :ar -> ~r/([A-HJ-NP-Z])?\d{4}([A-Z]{3})?/
      :at -> ~r/\d{4}/
      :au -> ~r/\d{4}/
      :ax -> ~r/22\d{3}/
      :az -> ~r/\d{4}/
      :ba -> ~r/\d{5}/
      :bb -> ~r/(BB\d{5})?/
      :bd -> ~r/\d{4}/
      :be -> ~r/\d{4}/
      :bg -> ~r/\d{4}/
      :bh -> ~r/((1[0-2]|[2-9])\d{2})?/
      :bm -> ~r/[A-Z]{2}[ ]?[A-Z0-9]{2}/
      :bn -> ~r/[A-Z]{2}[ ]?\d{4}/
      :br -> ~r/\d{5}[\-]?\d{3}/
      :by -> ~r/\d{6}/
      :ca -> ~r/^[A-Z]\d[A-Z] ?\d[A-Z]\d$/
      :ch -> ~r/\d{4}/
      :ck -> ~r/\d{4}/
      :cl -> ~r/\d{7}/
      :cn -> ~r/[1-9]\d{5}/
      :cr -> ~r/\d{4,5}|\d{3}-\d{4}/
      :cs -> ~r/\d{5}/
      :cv -> ~r/\d{4}/
      :cy -> ~r/\d{4}/
      :cz -> ~r/\d{3}[ ]?\d{2}/
      :de -> ~r/\d{5}/
      :dk -> ~r/\d{4}/
      :do -> ~r/\d{5}/
      :dz -> ~r/\d{5}/
      :ec -> ~r/([A-Z]\d{4}[A-Z]|(?:[A-Z]{2})?\d{6})?/
      :ee -> ~r/\d{5}/
      :eg -> ~r/\d{5}/
      :es -> ~r/\d{5}/
      :et -> ~r/\d{4}/
      :fi -> ~r/\d{5}/
      :fo -> ~r/\d{3}/
      :fr -> ~r/\d{2}[ ]?\d{3}/
      :ge -> ~r/\d{4}/
      :gf -> ~r/9[78]3\d{2}/
      :gl -> ~r/39\d{2}/
      :gn -> ~r/\d{3}/
      :gp -> ~r/9[78][01]\d{2}/
      :gr -> ~r/\d{3}[ ]?\d{2}/
      :gt -> ~r/\d{5}/
      :gw -> ~r/\d{4}/
      :hm -> ~r/\d{4}/
      :hn -> ~r/(?:\d{5})?/
      :hr -> ~r/\d{5}/
      :ht -> ~r/\d{4}/
      :hu -> ~r/\d{4}/
      :id -> ~r/\d{5}/
      :il -> ~r/\d{5}/
      :in -> ~r/\d{6}/
      :iq -> ~r/^\d{5}$/
      :is -> ~r/^\d{3}$/
      :it -> ~r/\d{5}/
      :jo -> ~r/\d{5}/
      :jp -> ~r/\d{3}-\d{4}/
      :ke -> ~r/\d{5}/
      :kg -> ~r/\d{6}/
      :kh -> ~r/\d{5}/
      :kr -> ~r/\d{3}[\-]\d{3}/
      :kw -> ~r/\d{5}/
      :kz -> ~r/\d{6}/
      :la -> ~r/\d{5}/
      :lk -> ~r/\d{5}/
      :lr -> ~r/\d{4}/
      :ls -> ~r/\d{3}/
      :lt -> ~r/\d{5}/
      :lu -> ~r/\d{4}/
      :lv -> ~r/\d{4}/
      :ma -> ~r/\d{5}/
      :mc -> ~r/980\d{2}/
      :md -> ~r/\d{4}/
      :me -> ~r/8\d{4}/
      :mg -> ~r/\d{3}/
      :mk -> ~r/\d{4}/
      :mn -> ~r/\d{6}/
      :mq -> ~r/9[78]2\d{2}/
      :mt -> ~r/[A-Z]{3}[ ]?\d{2,4}/
      :mu -> ~r/(\d{3}[A-Z]{2}\d{3})?/
      :mv -> ~r/\d{5}/
      :mx -> ~r/\d{5}/
      :my -> ~r/\d{5}/
      :nc -> ~r/988\d{2}/
      :ne -> ~r/\d{4}/
      :ng -> ~r/(\d{6})?/
      :ni -> ~r/((\d{4}-)?\d{3}-\d{3}(-\d{1})?)?/
      :nl -> ~r/\d{4}[ ]?[A-Z]{2}/
      :no -> ~r/\d{4}/
      :np -> ~r/\d{5}/
      :nz -> ~r/\d{4}/
      :om -> ~r/(PC )?\d{3}/
      :pf -> ~r/987\d{2}/
      :pg -> ~r/\d{3}/
      :ph -> ~r/\d{4}/
      :pk -> ~r/\d{5}/
      :pl -> ~r/\d{2}-\d{3}/
      :pr -> ~r/00[679]\d{2}([ \-]\d{4})?/
      :pt -> ~r/\d{4}([\-]\d{3})?/
      :py -> ~r/\d{4}/
      :ro -> ~r/\d{6}/
      :rs -> ~r/\d{6}/
      :ru -> ~r/^\d{6}$/
      :sa -> ~r/\d{5}/
      :se -> ~r/\d{3}[ ]?\d{2}/
      :sg -> ~r/\d{6}/
      :si -> ~r/\d{4}/
      :sj -> ~r/\d{4}/
      :sk -> ~r/\d{3}[ ]?\d{2}/
      :sn -> ~r/\d{5}/
      :so -> ~r/\d{5}/
      :th -> ~r/\d{5}/
      :tj -> ~r/\d{6}/
      :tm -> ~r/\d{6}/
      :tn -> ~r/\d{4}/
      :tr -> ~r/\d{5}/
      :tw -> ~r/\d{3}(\d{2})?/
      :ua -> ~r/\d{5}/
      :us -> ~r/\d{5}([ \-]\d{4})?/
      :uy -> ~r/\d{5}/
      :uz -> ~r/\d{6}/
      :ve -> ~r/\d{4}/
      :xk -> ~r/\d{5}/
      :yu -> ~r/\d{5}/
      :za -> ~r/\d{4}/
      :zm -> ~r/\d{5}/
      _ -> {:error, :unsupported_country}
    end
  end

end
