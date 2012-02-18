# require 'spree_core'

module SpreeFlatInRange
  class Engine < Rails::Engine
    engine_name 'spree_flat_in_range'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate

    end

    config.to_prepare &method(:activate).to_proc

    initializer "spree.register.calculators" do |app|
      require 'calculator/flat_in_range'
      app.config.spree.calculators.shipping_methods << Spree::Calculator::FlatInRange
    end
  end
end
