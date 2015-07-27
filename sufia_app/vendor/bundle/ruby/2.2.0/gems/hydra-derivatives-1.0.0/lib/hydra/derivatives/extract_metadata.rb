require 'hydra-file_characterization'
require 'mime/types'

module Hydra
  module Derivatives
    module ExtractMetadata

      def extract_metadata
        return unless has_content?
        Hydra::FileCharacterization.characterize(content, filename_for_characterization.join(""), :fits) do |config|
          config[:fits] = Hydra::Derivatives.fits_path
        end
      end

      # Restored method. It was required by other creatures
      def to_tempfile(&block)
        return unless has_content?
        Tempfile.open(filename_for_characterization) do |f|
          f.binmode
          if content.respond_to? :read
            f.write(content.read)
          else
            f.write(content)
          end
          content.rewind if content.respond_to? :rewind
          f.rewind
          yield(f)
        end
      end

      protected

      def filename_for_characterization
        registered_mime_type = MIME::Types[mime_type].first
        Logger.warn "Unable to find a registered mime type for #{mime_type.inspect} on #{uri}" unless registered_mime_type
        extension = registered_mime_type ? ".#{registered_mime_type.extensions.first}" : ''
        version_id = 1 # TODO fixme
        m = /\/([^\/]*)$/.match(uri)
        ["#{m[1]}-#{version_id}", "#{extension}"]
      end

    end
  end
end
