require 'rails/generators/base'
require 'securerandom'

module SpaRails
  module Generators
    class SpaRailsGenerator < Rails::Generators::Base
      namespace "spa_rails"

      desc "Install SPA in rails"

      source_root File.expand_path("../templates", __FILE__)

      def add_routes
        routes = []
        routes << %Q|get '/api/posts', to: proc { [200, {"Content-Type" => "application/json"}, ['{"resources": [{"title": "Title1"}, {"title": "Title2"}]}']] }|
        routes << "match '/(*path)', via: :all, to: frontend_page('index.htm')"

        log :route, "Add SPA routes"

        in_root do
          routes.each do |route|
            inject_into_file 'config/routes.rb', "  #{route}\n", { before: /end\Z/, verbose: false }
          end
        end
      end

      def add_configs
        environment do
          "config.angular_templates.inside_paths << Rails.root.join('frontend')"
        end
      end

      def add_dev_configs
        configs = [
            "config.assets.version = '1.0'",
            "config.assets.compile = true",
            "config.assets.digest = false",
            "config.assets.compress = false",
            "config.assets.debug = true"
        ]

        environment(nil, env: "development") do
          configs.join("\n  ")
        end
      end

      def add_prod_config
        configs = [
            "config.assets.version = '1.0'",
            "config.assets.compile = false",
            "config.assets.digest = true",
            "config.assets.compress = true",
            "config.assets.debug = false",
            "config.assets.js_compressor = :uglifier"
        ]

        environment(nil, env: "production") do
          configs.join("\n  ")
        end
      end

      def add_dependencies
        gem 'angular-rails-templates', github: 'sars/angular-rails-templates'

        log :gemfile, "rails-assets gems"

        in_root do
          append_file "Gemfile", "\nsource 'https://rails-assets.org' do", force: true

          @in_group = true

          gem 'rails-assets-angular'
          gem 'rails-assets-ui-utils'
          gem 'rails-assets-ui-router'
          gem 'rails-assets-restangular', '1.4.0'
          gem 'rails-assets-lodash'
          gem 'rails-assets-angular-bootstrap'
          gem 'rails-assets-bootstrap'

          @in_group = false

          append_file "Gemfile", "\nend\n", force: true
        end
      end

      def copy_frontend
        directory "frontend", "frontend"
      end
    end
  end
end
