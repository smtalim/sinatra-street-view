# sinatra_street_view.rb
require 'sinatra'

class SinatraStreetView < Sinatra::Base
  get '/' do
    "Hello, RubyLearning!"
  end
end

