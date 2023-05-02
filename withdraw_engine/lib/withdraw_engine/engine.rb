module WithdrawEngine
  class Engine < ::Rails::Engine
    isolate_namespace WithdrawEngine
    config.generators.api_only = true
  end
end
