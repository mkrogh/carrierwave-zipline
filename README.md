# Carrierwave::Zipline
A simple in memory zipfile processing gem usefull for doing zip upload of images with e.g. carrierwave.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carrierwave-zipline', :require => 'carrierwave/zipline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-zipline

## Usage

You can take the gem for at testdrive by running:

```ruby
rake console
#and you can use FakeUpload
file = FakeUpload.new("spec/files/simple.zip")
Carrierwave::Zipline.process(file) {|f| puts f.original_filename}
```

Example:

```ruby
#POST
def zip_file
  gallery_id = params[:pictures][:gallery_id]
  @gallery = Gallery.find(gallery_id)
  authorize! :manage, @gallery
  zip_file = params[:pictures][:zip]
  require 'carrierwave/zipline'
  count = Carrierwave::Zipline.process(zip_file) do |file|
    if %w{jpg jpeg gif png}.include? file.ext
      img = Picture.new({gallery_id: @gallery.id})
      img.image= file
      img.save
    else
      false
    end
  end
  flash[:success] = t("zip_pic.success", count: count)
  redirect_to gallery_pictures_path(@gallery)
end
```

## Contributing

1. Fork it ( https://github.com/mkrogh/carrierwave-zipline/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
