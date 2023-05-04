require_relative 'service_error'
require_relative 'service_response'

module SantaCruz
  class ServiceResponse
    attr_accessor :success, :error, :data, :error_message

    def initialize(success: true, data: nil, error: nil)
      @success = success
      @data = data
      @error = error
      @error_message = error&.message || error_message
    end
  end
end
