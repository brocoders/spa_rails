require "slim"

module SpaRails
  class Engine < ::Rails::Engine
    initializer 'spa-rails', group: :all  do |app|
      Slim::Engine.set_options(attr_list_delims: {'(' => ')', '[' => ']'})
      app.assets.register_engine('.slimpage', Slim::Template)
    end
  end
end
