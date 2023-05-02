class PricesService < ApplicationService
  def call
    ('a'..'r').to_a.each_with_index.map do |letter, index|
      { currency: "USD#{letter.upcase}", price: index * 10 + 1 }
    end
  end
end
