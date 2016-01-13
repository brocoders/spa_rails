module SpaRails
  class Task < Sprockets::Rails::Task
    def define
      namespace :assets do
        desc "Precompile all pages with .slimpage ext"
        task :precompile_pages => :environment do
          with_logger do
            filter = lambda do |filename, path|
              File.extname(path) == '.slimpage'
            end

            manifest.find(filter) do |asset|
              if filter.call(asset.logical_path, asset.filename)
                target = File.join(File.expand_path(output), asset.logical_path)

                logger.info "Writing #{target}"
                asset.write_to target
              end
            end
          end
        end
      end

      Rake::Task['assets:precompile'].enhance do
        Rake::Task['assets:precompile_pages'].invoke
      end
    end
  end
end
