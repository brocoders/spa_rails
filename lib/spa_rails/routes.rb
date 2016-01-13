module ActionDispatch::Routing
  class Mapper
    def frontend_page(page_name)
      Rails.application.assets.dup.instance_eval do
        @context_class.instance_eval do
          config = Rails.application.config.assets
          self.digest_assets = config.digest
        end

        define_singleton_method :call do |env|
          path = "pages/#{page_name}"
          # Look up the asset.
          asset = find_asset(path, :bundle => !body_only?(env))
          ok_response(asset, env)
        end

        self
      end
    end
  end
end
