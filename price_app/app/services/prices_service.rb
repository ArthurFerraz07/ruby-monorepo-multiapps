require 'santa_cruz'

class PricesService < SantaCruz::ApplicationService
  def call
    prices = ('a'..'r').to_a.each_with_index.map do |letter, index|
      { currency: "USD#{letter.upcase}", price: index * 10 + 1 }
    end
    build_response(data: prices)
  end
end
