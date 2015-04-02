require "slim"

module SpaRails
  class Engine < ::Rails::Engine
    initializer 'spa-rails', group: :all  do |app|
      Slim::Engine.set_options(attr_list_delims: {'(' => ')', '[' => ']'})
      app.assets.register_engine('.slimpage', Slim::Template)
    end

    config.assets.paths << find_root('.').join("frontend")

    config.assets.precompile << lambda do |filename, path|
      path =~ /frontend/ && !%w(.js .css .htm).include?(File.extname(filename))
    end

    config.assets.precompile.push(/(?:\/|\\|\A)manifests(?:\/|\\)[^\/]+\.(css|js)$/)
  end
end
