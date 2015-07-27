# hydra-derivatives [![Version](https://badge.fury.io/rb/hydra-derivatives.png)](http://badge.fury.io/rb/hydra-derivatives) [![Build Status](https://travis-ci.org/projecthydra-labs/hydra-derivatives.png?branch=master)](https://travis-ci.org/projecthydra-labs/hydra-derivatives) [![Dependency Status](https://gemnasium.com/projecthydra-labs/hydra-derivatives.png)](https://gemnasium.com/projecthydra-labs/hydra-derivatives)

Derivative generation for hydra

If you have an ActiveFedora class like this:
```ruby
    class GenericFile < ActiveFedora::Base
        include Hydra::Derivatives

        contains 'content'
        attr_accessor :mime_type

        # Use a block to declare which derivatives you want to generate
        makes_derivatives do |obj|
          case obj.mime_type
          when 'application/pdf'
            obj.transform_file :content, { :thumb => "100x100>" }
          when 'audio/wav'
            obj.transform_file :content, { :mp3 => {format: 'mp3'}, :ogg => {format: 'ogg'} }, processor: :audio
          when 'video/avi'
            obj.transform_file :content, { :mp4 => {format: 'mp4'}, :webm => {format: 'webm'} }, processor: :video
          when 'image/png', 'image/jpg'
            obj.transform_file :content, { :medium => "300x300>", :thumb => "100x100>" }
          when 'image/tiff'
            obj.transform_file :content, { :service => { resize: "3600x3600>" } }, processor: 'jpeg2k_image'
          end
        end
    end
```

Or a class like this:

```ruby
    class GenericFile < ActiveFedora::Base
        include Hydra::Derivatives

        contains 'content'
        attr_accessor :mime_type

        # Use a callback method to declare which derivatives you want
        makes_derivatives :generate_derivatives

        def generate_derivatives
          case mime_type
          when 'application/pdf'
            transform_file :content, { :thumb => "100x100>" }
          when 'audio/wav'
            transform_file :content, { :mp3 => {format: 'mp3'}, :ogg => {format: 'ogg'} }, processor: :audio
          when 'video/avi'
            transform_file :content, { :mp4 => {format: 'mp4'}, :webm => {format: 'webm'} }, processor: :video
          when 'image/png', 'image/jpg'
            transform_file :content, { :medium => "300x300>", :thumb => {size: "100x100>", datastream: 'thumbnail'} }
          when 'image/tiff'
            transform_file :content, { :service => { recipe: :default } }, processor: 'jpeg2k_image'
          end
        end
    end
```

And you add some content to it:

```ruby
   obj = GenericFile.new
   obj.content.content = File.open(...)
   obj.mime_type = 'image/jpg'
   obj.save
```

Then when you call `obj.create_derivatives` two new files, 'thumbnail' and 'content_medium', will have been created with downsized images in them.

We recommend you run `obj.create_derivatives` in a background worker, because some derivative creation (especially videos) can take a long time.

# Installation

Just add `gem 'hydra-derivatives'` to your Gemfile.

## Dependencies

* [FITS](http://fitstool.org/)
* [FFMpeg](http://www.ffmpeg.org/)
* [LibreOffice](https://www.libreoffice.org/)
* [ImageMagick](http://www.imagemagick.org/)
* Kakadu's [kdu_compress](http://www.kakadusoftware.com/)

To enable LibreOffice, FFMpeg, ImageMagick, FITS support, and kdu_compress support, make sure they are on your path. Most people will put that in their .bash_profile or somewhere similar.

For example:

```bash
# in .bash_profile
export PATH=${PATH}:/Users/justin/workspace/fits-0.6.2:/Applications/LibreOffice.app/Contents/MacOS
```

Alternatively, you can configure their paths:
```ruby
Hydra::Derivatives.ffmpeg_path = '/opt/local/ffmpeg/bin/ffmpeg'
Hydra::Derivatives.fits_path = '/opt/local/fits/bin/fits.sh'
Hydra::Derivatives.libreoffice_path = '/opt/local/libreoffice_path/bin/soffice'
Hydra::Derivatives.kdu_compress_path = '/usr/local/bin/kdu_compress'
```

## JPEG2k Directives

Unlike the other processors, the `Jpeg2kImage` processor does not generally accept arguments that directly (or nearly so) translate to the arguments you would give to the corresponding command line utility.

Instead, each directive may contain these arguments:

  * `:datastream` (String) : The name for the new datastream
  * `:to_srgb` (Boolean) : If `true` and the image is a color image it will map the source image color profile to sRGB. Default: `true`
  * `:resize` (String) : Geometry; the same syntax as the `Hydra::Derivatives::Image` processor
  * `:recipe` :
    - If a Symbol the recipe will be read from the `Hydra::Derivatives.kdu_compress_recipes` hash. You can override this, or a couple of samples are supplied. The symbol in the config file should be the name in the model + `_{quality}`, e.g. `recipe: :default` will look `:default_color` or `:default_grey` in the hash.
    - If a String the recipe in the string will be used. You may include anything the command line utility will accept except `-i` or `-o`. See `$ kdu_compress -usage` in your shell.
    - If no `:recipe` is provided the processor will examine the image and make a best guess, but you can set a few basic options (the remainder of this list). Note that these are ignored if you provided a recipe via either of the first two methods described.
  * `:levels` (Integer) : The number of decomposition levels. The default is the number of times the long dimension can be divided by two, down to 96, e.g. a 7200 pixel image would have 6 levels (3600, 1800, 900, 450, 225, 112)
  * `:layers` (Integer) : The number of quality layers. Default: 8
  * `:compression` (Integer) : The left number of the compression ratio `n:1`, e.g. 12 will apply 12:1 compression. Default: 10.
  * `:tile_size` (Integer) : Pixel dimension of the tiles. Default: 1024
