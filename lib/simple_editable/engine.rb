module SimpleEditable
  class Engine < ::Rails::Engine
    isolate_namespace SimpleEditable

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
