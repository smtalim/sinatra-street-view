require_relative '../lib/fetch_google_street_view'

describe FetchGoogleStreetView do
  
  # First example from 
  # https://developers.google.com/maps/documentation/streetview/index
  # We can plug in the URL received directly into an image source
  it "should receive an address &
      return a google street view api link" do
    address = "New York, NY 10002, USA"
    size = "400x400"
    final_output = "http://maps.googleapis.com/maps/api/streetview?sensor=false&size=" + size + "&location=" + address
    FetchGoogleStreetView.new(address: address, size: size).fetch_image_source.
      should == URI.escape(final_output)
  end
end

