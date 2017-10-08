defmodule DoggieTest do
  use ExUnit.Case
  doctest Doggie

  test "test email regex" do
    assert Regex.match?(Doggie.Patterns.email() , "likid.geimfari@gmail.com")
  end


  test "mac address" do
    assert Regex.match?(Doggie.Patterns.mac_address(), "00:08:C7:1B:8C:02")
    assert not(Regex.match?(Doggie.Patterns.mac_address(), "00:08:C7:1B:8C"))
  end

  test "hex value" do
    assert Regex.match?(Doggie.Patterns.hex_value(), "#a3c113")
    assert not(Regex.match?(Doggie.Patterns.hex_value(), "#3c113"))
  end

  test "roman numerals" do
    assert Regex.match?(Doggie.Patterns.roman_numerals(), "XX")
    assert not(Regex.match?(Doggie.Patterns.roman_numerals(), "20"))
  end

  test "isbn 10 and isbn 13" do
    assert Regex.match?(Doggie.Patterns.isbn(), "ISBN-13: 978-1-56619-909-4")
    assert Regex.match?(Doggie.Patterns.isbn(), "ISBN-13: 978 5 93286 159 2")
    assert Regex.match?(Doggie.Patterns.isbn(), "978-1-56619-909-4")
    assert Regex.match?(Doggie.Patterns.isbn(), "ISBN-10: 1-56619-909-3")
    assert Regex.match?(Doggie.Patterns.isbn(), "1-56619-909-3")
    assert Regex.match?(Doggie.Patterns.isbn(), "978 1 56619 909 4")
    assert not(Regex.match?(Doggie.Patterns.isbn(), "ISBN 13: 978-1-56619-909"))
  end

  test "time in 24 hour format" do
    assert Regex.match?(Doggie.Patterns.time_24_format(), "23:00")
    assert not(Regex.match?(Doggie.Patterns.time_24_format(), "25:00"))
  end

  test "phone number: :us" do
    # Phone number without country code.
    assert Regex.match?(Doggie.Patterns.phone_number(:us), "2345678901")
    # Phone number with space separators.
    assert Regex.match?(Doggie.Patterns.phone_number(:us), "1 234 567 8901")
    # Phone number with dash separators.
    assert Regex.match?(Doggie.Patterns.phone_number(:us), "1-234-567-8901")
    # Phone number with mixed separators.
    assert Regex.match?(Doggie.Patterns.phone_number(:us), "1 (234) 567-8901")
    # Invalid phone number
    assert not(Regex.match?(Doggie.Patterns.phone_number(:us), "+7-963)-871-45-67"))
  end

  test "zip code" do
    assert Regex.match?(Doggie.Patterns.zip_code(:at), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:at), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:au), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:au), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:az), "1234")
    assert Regex.match?(Doggie.Patterns.zip_code(:az), "AB1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:az), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ba), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:ba), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:bd), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:bd), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:be), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:be), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:bg), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:bg), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:by), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:by), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ch), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:ch), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:cl), "1234567")
    assert Regex.match?(Doggie.Patterns.zip_code(:cl), "123-4567")
    refute Regex.match?(Doggie.Patterns.zip_code(:cl), "1234567A")

    assert Regex.match?(Doggie.Patterns.zip_code(:cv), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:cv), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:cy), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:cy), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:de), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:de), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:dk), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:dk), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:do), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:do), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:dz), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:dz), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ee), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:ee), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:eg), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:eg), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:es), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:es), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:et), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:et), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:fi), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:fi), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:fo), "123")
    refute Regex.match?(Doggie.Patterns.zip_code(:fo), "123A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ge), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:ge), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:gn), "123")
    refute Regex.match?(Doggie.Patterns.zip_code(:gn), "123A")

    assert Regex.match?(Doggie.Patterns.zip_code(:gt), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:gt), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:gw), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:gw), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:hr), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:hr), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ht), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:ht), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:hu), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:hu), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:id), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:id), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:il), "12345")
    assert Regex.match?(Doggie.Patterns.zip_code(:il), "1234567")
    refute Regex.match?(Doggie.Patterns.zip_code(:il), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:in), "123456")
    assert Regex.match?(Doggie.Patterns.zip_code(:in), "123 456")
    refute Regex.match?(Doggie.Patterns.zip_code(:in), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:is), "356")
    refute Regex.match?(Doggie.Patterns.zip_code(:is), "44435423")
    refute Regex.match?(Doggie.Patterns.zip_code(:is), "12")
    refute Regex.match?(Doggie.Patterns.zip_code(:is), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:is), "123A")

    assert Regex.match?(Doggie.Patterns.zip_code(:it), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:it), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:jo), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:jo), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ke), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:ke), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:kg), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:kg), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:kh), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:kh), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:kw), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:kw), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:kz), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:kz), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:la), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:la), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:lk), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:lk), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:lr), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:lr), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ls), "123")
    refute Regex.match?(Doggie.Patterns.zip_code(:ls), "123A")

    assert Regex.match?(Doggie.Patterns.zip_code(:lt), "12345")
    assert Regex.match?(Doggie.Patterns.zip_code(:lt), "AB-12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:lt), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:lu), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:lu), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:lv), "1234")
    assert Regex.match?(Doggie.Patterns.zip_code(:lv), "AB-1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:lv), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ma), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:ma), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:md), "1234")
    assert Regex.match?(Doggie.Patterns.zip_code(:md), "AB1234")
    assert Regex.match?(Doggie.Patterns.zip_code(:md), "AB-1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:md), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:me), "81234")
    refute Regex.match?(Doggie.Patterns.zip_code(:me), "81234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:mg), "123")
    refute Regex.match?(Doggie.Patterns.zip_code(:mg), "123A")

    assert Regex.match?(Doggie.Patterns.zip_code(:mk), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:mk), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:mn), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:mn), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:mv), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:mv), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:mx), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:mx), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:my), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:my), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:nc), "98812")
    refute Regex.match?(Doggie.Patterns.zip_code(:nc), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:nc), "98812A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ne), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:ne), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ng), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:ng), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:no), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:no), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:np), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:np), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:nz), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:nz), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:pg), "123")
    refute Regex.match?(Doggie.Patterns.zip_code(:pg), "123A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ph), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:ph), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:pk), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:pk), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:pl), "12-345")
    refute Regex.match?(Doggie.Patterns.zip_code(:pl), "12-345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:py), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:py), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ro), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:ro), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:rs), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:rs), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ru), "654836")
    refute Regex.match?(Doggie.Patterns.zip_code(:ru), "4543563")
    refute Regex.match?(Doggie.Patterns.zip_code(:ru), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:sa), "12345")
    assert Regex.match?(Doggie.Patterns.zip_code(:sa), "12345-6789")
    refute Regex.match?(Doggie.Patterns.zip_code(:sa), "12345A")
    refute Regex.match?(Doggie.Patterns.zip_code(:sa), "12345-1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:se), "123 45")
    assert Regex.match?(Doggie.Patterns.zip_code(:se), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:se), "123 45A")
    refute Regex.match?(Doggie.Patterns.zip_code(:se), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:sg), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:sg), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:si), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:si), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:sj), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:sj), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:sn), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:sn), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:so), "12345")
    assert Regex.match?(Doggie.Patterns.zip_code(:so), "AB 12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:so), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:th), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:th), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:tj), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:tj), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:tm), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:tm), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:tn), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:tn), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:tr), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:tr), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ua), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:ua), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:us), "12345")
    assert Regex.match?(Doggie.Patterns.zip_code(:us), "12345 6789")
    assert Regex.match?(Doggie.Patterns.zip_code(:us), "12345-6789")
    refute Regex.match?(Doggie.Patterns.zip_code(:us), "12345 6789A")
    refute Regex.match?(Doggie.Patterns.zip_code(:us), "12345-6789A")
    refute Regex.match?(Doggie.Patterns.zip_code(:us), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:uy), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:uy), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:uz), "123456")
    refute Regex.match?(Doggie.Patterns.zip_code(:uz), "123456A")

    assert Regex.match?(Doggie.Patterns.zip_code(:ve), "1234")
    assert Regex.match?(Doggie.Patterns.zip_code(:ve), "1234-A")
    refute Regex.match?(Doggie.Patterns.zip_code(:ve), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:xk), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:xk), "12345A")

    assert Regex.match?(Doggie.Patterns.zip_code(:za), "1234")
    refute Regex.match?(Doggie.Patterns.zip_code(:za), "1234A")

    assert Regex.match?(Doggie.Patterns.zip_code(:zm), "12345")
    refute Regex.match?(Doggie.Patterns.zip_code(:zm), "12345A")

    {:error, :unsupported_country} = Doggie.Patterns.zip_code(:python)
  end
end
