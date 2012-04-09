module Sinatra
  module Bundles
    # View helpers
    module Helpers
      # Emit a script tag for a javascript bundle
      #
      # @param [Symbol,String] bundle The bundle name
      # @return [String] HTML script tag
      def javascript_bundle_include_tag(bundle)
        sn = request.script_name rescue nil
        settings.javascript_bundles[bundle].to_html(sn)
      end
      
      # Emit a script tag for each file in a javascript bundle
      #
      # @param [Symbol,String] bundle The bundle name
      # @return [String] HTML script tag
      def javascript_bundle_include_tags(bundle)
        sn = request.script_name rescue nil
        files = settings.javascript_bundles[bundle].files.map do |file|
          "<script src=\"/javascripts/#{file}.js\" type=\"text/javascript\"></script>\n"
        end
      end

      # Emit a script tag for a stylesheet bundle
      #
      # @param [Symbol,String] bundle The bundle name
      # @return [String] HTML link tag
      def stylesheet_bundle_link_tag(bundle, media = :all)
        sn = request.script_name rescue nil
        settings.stylesheet_bundles[bundle].to_html(media, sn)
      end
      
      # Emit a script tag for each file in a stylesheet bundle
      #
      # @param [Symbol,String] bundle The bundle name
      # @return [String] HTML link tag
      def stylesheet_bundle_link_tags(bundle, media = :all)
        sn = request.script_name rescue nil
        settings.stylesheet_bundles[bundle].files.map do |file|
          "<link type=\"text/css\" href=\"/stylesheets/#{file}.css\" rel=\"stylesheet\" media=\"all\">\n"
        end
      end
    end
  end
end