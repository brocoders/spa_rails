module SpaRails
  class Engine < ::Rails::Engine
    config.assets.paths << find_root('.').join("frontend")

    config.assets.precompile << lambda do |filename, path|
      path =~ /frontend/ && !%w(.js .css).include?(File.extname(filename))
    end
  end
end
