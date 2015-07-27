require 'mime/types'

module Hydra::ModelMethods
  extend ActiveSupport::Concern

  included do
    Deprecation.warn self, "Hydra::ModelMethods is deprecated and will be remove in hydra-head 10.0.0", caller(3)
    include Hydra::WithDepositor
  end

  # Puts the contents of file (posted blob) into a datastream and sets the title and label
  # Sets asset label and title to filename if they're empty
  #
  # @param [#read] file the IO object that is the blob
  # @param [String] file the IO object that is the blob
  def add_file(file, path, file_name, mime_type=nil)
    mime_type ||= best_mime_for_filename(file_name)
    options = { mime_type: mime_type, original_name: file_name }
    options[:path] = path if path
    super(file, options)
    set_title_and_label(file_name, only_if_blank: true)
  end

  def best_mime_for_filename(file_name)
    mime_types = MIME::Types.of(file_name)
    mime_types.empty? ? "application/octet-stream" : mime_types.first.content_type
  end


  # Set the title and label on the current object
  #
  # @param [String] new_title
  # @param [Hash] opts (optional) hash of configuration options
  #
  # @example Use :only_if_blank option to only update the values when the label is empty
  #   obj.set_title_and_label("My Title", :only_if_blank=> true)
  def set_title_and_label(new_title, opts={})
    if opts[:only_if_blank]
      if respond_to?(:label) && label.blank?
        self.label = new_title
        set_title new_title
      end
    else
      self.label = new_title if respond_to? :label
      set_title new_title
    end
  end

  # Set the title and label on the current object
  #
  # @param [String] new_title
  # @param [Hash] opts (optional) hash of configuration options
  def set_title(new_title, opts={})
    if respond_to? :title=
      self.title = self.class.multiple?(:title) ? Array(new_title) : new_title
    elsif attached_files.has_key?("descMetadata")
      Deprecation.warn ModelMethods, 'setting title in descMetadata is deprecated and will be remove in hydra-head 10.0. If you need this behavior declare `has_attribute :title`'
      if descMetadata.respond_to?(:title_values)
        descMetadata.title_values = new_title
      else
        descMetadata.title = new_title
      end
    end
  end

end
