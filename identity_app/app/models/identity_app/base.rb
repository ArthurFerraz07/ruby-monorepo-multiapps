module IdentityApp
  module ActiveRecord
    class Base
      def readonly?
        ENV['APP_NAME'] != 'identity_app'
      end
    end
  end
end
