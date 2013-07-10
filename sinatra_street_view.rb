# sinatra_street_view.rb
require 'sinatra'
require_relative './lib/fetch_google_street_view'

class SinatraStreetView < Sinatra::Base

  get '/' do
    erb :street_view
  end

  post '/street_view' do
    unless params[:address].empty?
      street_view_arguments = {
        address: params[:address],
      }

      street_view_arguments.merge!({
        size: params[:size]
      }) unless params[:size].empty?

      begin
        @image_src = FetchGoogleStreetView.new(street_view_arguments).
          fetch_image_source

      rescue InvalidSizeError
        @error = "Please enter a valid size like this. 400x400"
      rescue AddressUnavailableError
        @error = "This won't work without an address"
      end
    end

    erb :street_view
  end
end

