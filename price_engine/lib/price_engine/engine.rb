module PriceEngine
  class Engine < ::Rails::Engine
    isolate_namespace PriceEngine
    config.generators.api_only = true
  end
end
