# frozen_string_literal: true

def all_words_capitalized?(arr)
  arr.all? { |el| el.capitalize == el }
end

def no_valid_url?(urls)
  # tlds = %w[com net io org]
  # urls.none? do |url|
  #   tlds.include?(url.split('.')[1])
  # end
  tlds = %w[.com .net .io .org]
  urls.none? do |url|
    tlds.any? { |tld| url.end_with?(tld) }
  end
end

def any_passing_students?(arr)
  arr.any? do |el|
    (el[:grades].sum / el[:grades].size.to_f) >= 75
  end
end
