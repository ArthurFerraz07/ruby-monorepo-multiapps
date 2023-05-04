module WithdrawApp
  module ActiveRecord
    class Base
      def readonly?
        ENV['APP_NAME'] != WithdrawApp::APP_NAME
      end
    end
  end
end
