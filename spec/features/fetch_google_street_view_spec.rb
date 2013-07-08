require_relative '../../lib/fetch_google_street_view'

describe FetchGoogleStreetView do
  
  # First example from 
  # https://developers.google.com/maps/documentation/streetview/index
  # We can plug in the URL received directly into an image source
  it "should receive an address &
      return a google street view api link" do
    address = "New York, NY 10002, USA"
    FetchGoogleStreetView.new(address).fetch.
      should == "http://maps.googleapis.com/maps/api/streetview?size=400x400&location=40.720032,%20-73.988354&fov=90&heading=235&pitch=10&sensor=false"
  end
end

