module SpaRails
  class Railtie < ::Rails::Railtie
    rake_tasks do |app|
      require 'spa_rails/task'
      SpaRails::Task.new(app)
    end
  end
end
