class FetchGoogleStreetView

  def initialize params
    @address = params.fetch :address
    @size = params.fetch(:size) { "400x400" }
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
end
