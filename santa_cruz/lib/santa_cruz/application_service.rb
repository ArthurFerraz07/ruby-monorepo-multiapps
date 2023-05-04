module SantaCruz
  class ApplicationService
    attr_reader :response

    private

    def build_response(success: true, data: nil, error: nil)
      @response = SantaCruz::ServiceResponse.new(success:, data:, error:)
      @response
    end
  end
end
