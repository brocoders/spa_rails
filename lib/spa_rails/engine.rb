require "slim"

module SpaRails
  class Engine < ::Rails::Engine
    initializer 'spa-rails', group: :all  do |app|
      app.assets.register_engine('.slimpage', Slim::Template)
    end
  end
end
