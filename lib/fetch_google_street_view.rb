class AddressUnavailableError < StandardError; end
class InvalidSizeError < StandardError; end
class FetchGoogleStreetView

  def initialize params
    @address = params.fetch(:address) { 
      raise AddressUnavailableError
    }

    @size = params.fetch(:size) { "400x400" }

    unless validate_size
      raise InvalidSizeError
    end

    @base_url = "http://maps.googleapis.com/maps/api/streetview?sensor=false" 
  end

  def fetch_image_source
    @base_url += add_size
    @base_url += add_address
    URI.escape(@base_url).to_s
  end

  private
  def add_address
    "&location=" + @address
  end

  def add_size
    "&size=" + @size
  end

  def validate_size
    regex = /\d+x\d+/
    @size[regex]
  end
end
