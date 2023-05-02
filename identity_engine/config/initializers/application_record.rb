module IdentityEngine
  class Engine < ::Rails::Engine
    initializer 'identity_engine.initialize_database' do
      ActiveSupport.on_load(:active_record) do
        config = Rails.application.config.database_configuration[Rails.env]
        config['database'] = config['database']
        ActiveRecord::Base.establish_connection(config)
      end
    end
  end
end
