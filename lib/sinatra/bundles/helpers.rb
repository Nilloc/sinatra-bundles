module Sinatra
  module Bundles
    # View helpers
    module Helpers
      # Emit a script tag for a javascript bundle
      #
      # @param [Symbol,String] bundle The bundle name
      # @return [String] HTML script tag
      def javascript_bundle_include_tag(bundle)
        options.javascript_bundles[bundle].to_html(bundle)
      end

      # Emit a script tag for a stylesheet bundle
      #
      # @param [Symbol,String] bundle The bundle name
      # @return [String] HTML link tag
      def stylesheet_bundle_link_tag(bundle, media = nil)
        options.stylesheet_bundles[bundle].to_html(bundle, media)
      end
    end
  end
end