# frozen_string_literal: true

require "test_helper"

class UnambiguousStringTest < Minitest::Test
  test "returns string without ambiguous chars" do
    10_000.times do
      refute_match(/[1li0o6b2z]/, UnambiguousString.call)
    end
  end

  test "returns string with custom size" do
    assert_equal 5, UnambiguousString.call(size: 5).size
  end

  test "returns string with custom group" do
    assert_match(/^.{5}-.{5}$/, UnambiguousString.call(groups: 2))
  end

  test "returns string with custom group and joiner" do
    assert_match(/^.{5}_.{5}$/, UnambiguousString.call(groups: 2, joiner: "_"))
  end
end
