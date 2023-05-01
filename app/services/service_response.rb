class ServiceResponse
  class ServiceError < StandardError; end

  attr_accessor :success, :error, :data, :error_message

  def initialize(success:, data:, error:)
    @data = data
    @error = error
    @error_message = error&.message || error_message
  end
end
