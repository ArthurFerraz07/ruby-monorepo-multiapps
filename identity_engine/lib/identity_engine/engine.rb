module IdentityEngine
  class Engine < ::Rails::Engine
    isolate_namespace IdentityEngine
    config.generators.api_only = true
  end
end
