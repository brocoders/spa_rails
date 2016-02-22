require "slim"

module SpaRails
  class Engine < ::Rails::Engine
    config.spa_rails = ActiveSupport::OrderedOptions.new
    config.spa_rails.manifest_extensions = %w(.js .css .htm .html)

    config.assets.paths << find_root('.').join("frontend")

    config.assets.precompile.push(/(?:\/|\\|\A)manifests(?:\/|\\)[^\/]+\.(css|js)$/)

    config.before_configuration do |app|
      config.ng_annotate.paths = [app.root.to_s]
    end

    config.assets.configure do |env|
      env.register_engine('.slimpage', Slim::Template)
    end

    config.after_initialize do |app|
      Slim::Engine.set_options(attr_list_delims: {'(' => ')', '[' => ']'})

      if config.spa_rails.manifest_extensions.present?
        config.assets.precompile << lambda do |filename, path|
          path =~ /frontend/ && !config.spa_rails.manifest_extensions.include?(File.extname(filename))
        end
      end
    end
  end
end
