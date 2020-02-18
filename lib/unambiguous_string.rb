# frozen_string_literal: true

module UnambiguousString
  require_relative "unambiguous_string/version"

  NUMBERS = ("0".."9").to_a.freeze
  LETTERS = ("a".."z").to_a.freeze
  ALL_CHARS = (NUMBERS + LETTERS).freeze
  AMBIGUOUS = %w[1 l i 0 o 6 b 2 z].freeze
  UNAMBIGUOUS_CHARS = (ALL_CHARS - AMBIGUOUS).freeze

  def self.call(joiner: "-", size: 10, groups: 1)
    chars = size.times.map { UNAMBIGUOUS_CHARS.sample }
    groups = chars.each_slice(size / groups).map(&:join)
    groups.join(joiner)
  end
end

puts UnambiguousString.call(groups: 2, joiner: ".")
