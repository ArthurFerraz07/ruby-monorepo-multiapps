class PricesController < ApplicationController
  def index
    render(json: PricesService.new.call)
  end
end
