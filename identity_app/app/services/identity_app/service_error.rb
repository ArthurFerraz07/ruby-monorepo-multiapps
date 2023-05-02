module IdentityApp
  class ServiceError < StandardError
    attr_accessor :genesis_error

    def initialize(*args, genesis_error: nil)
      super(*args)
      @genesis_error = genesis_error
    end
  end
end
