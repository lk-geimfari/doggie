defmodule DoggieTest do
  use ExUnit.Case
  doctest Doggie

  test "test email regex" do
    assert Regex.match?(Doggie.email() , "likid.geimfari@gmail.com")
  end

  test "ip version 4" do
    assert Regex.match?(Doggie.ipv4(), "209.18.181.23")
    assert not(Regex.match?(Doggie.ipv4(), "209.18.181"))
  end

  test "mac address" do
    assert Regex.match?(Doggie.mac_address(), "00:08:C7:1B:8C:02")
    assert not(Regex.match?(Doggie.mac_address(), "00:08:C7:1B:8C"))
  end

  test "hex value" do
    assert Regex.match?(Doggie.hex_value(), "#a3c113")
    assert not(Regex.match?(Doggie.hex_value(), "#3c113"))
  end

  test "bitcoin address" do
    assert Regex.match?(Doggie.bitcoin_address(), "1BoatSLRHtKNngkdXEeobR76b53LETtpyT")
    assert not(Regex.match?(Doggie.bitcoin_address(), "3GD1wceAmdmQhWhWwQTqPt4tB"))
  end

  test "roman numerals" do
    assert Regex.match?(Doggie.roman_numerals(), "XX")
    assert not(Regex.match?(Doggie.roman_numerals(), "20"))
  end

  test "isbn 10 and isbn 13" do
    assert Regex.match?(Doggie.isbn(), "ISBN-13: 978-1-56619-909-4")
    assert Regex.match?(Doggie.isbn(), "ISBN-13: 978 5 93286 159 2")
    assert Regex.match?(Doggie.isbn(), "978-1-56619-909-4")
    assert Regex.match?(Doggie.isbn(), "ISBN-10: 1-56619-909-3")
    assert Regex.match?(Doggie.isbn(), "1-56619-909-3")
    assert Regex.match?(Doggie.isbn(), "978 1 56619 909 4")
    assert not(Regex.match?(Doggie.isbn(), "ISBN 13: 978-1-56619-909"))
  end

  test "time in 24 hour format" do
    assert Regex.match?(Doggie.time_24_format(), "23:00")
    assert not(Regex.match?(Doggie.time_24_format(), "25:00"))
  end

  test "phone number: :dk" do
    assert Regex.match?(Doggie.phone_number(:dk), "+45 12 23 45 67")
    assert Regex.match?(Doggie.phone_number(:dk), "+4512 23 45 67")
    assert not(Regex.match?(Doggie.phone_number(:dk), "+7-963)-871-45-67"))
  end

  test "phone number: :us" do
    # Phone number without country code.
    assert Regex.match?(Doggie.phone_number(:us), "2345678901")
    # Phone number with space separators.
    assert Regex.match?(Doggie.phone_number(:us), "1 234 567 8901")
    # Phone number with dash separators.
    assert Regex.match?(Doggie.phone_number(:us), "1-234-567-8901")
    # Phone number with mixed separators.
    assert Regex.match?(Doggie.phone_number(:us), "1 (234) 567-8901")
    # Invalid phone number
    assert not(Regex.match?(Doggie.phone_number(:us), "+7-963)-871-45-67"))
  end

  test "zip code" do
    assert Regex.match?(Doggie.zip_code(:ru), "654836")
    assert not(Regex.match?(Doggie.zip_code(:ru), "4543563"))
    assert Regex.match?(Doggie.zip_code(:is), "356")
    assert not(Regex.match?(Doggie.zip_code(:is), "44435423"))
    assert Regex.match?(Doggie.zip_code(:ad), "AD524")
    {:error, :unsupported_country} = Doggie.zip_code(:python)
  end
end
