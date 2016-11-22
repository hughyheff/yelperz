class HomeController < ApplicationController
  def index
  	#may want to put in a dropdown for states
  end

  def results
  	# params coming the form in the index page
    # capitalization (or lack thereof) shouldn't be a problem
    @food = params[:food]
    @location = params[:location]

    # the client search set up by the Yelp gem
    # takes only two arguments, so if I want to
    # pass more, I can include them in a hash
    parameters = { term: @food, limit: 9 }

    # using the Yelp gem to make the API call
    # the two arguments passed are the location I
    # want to search for, and then the extra parameters
    @results = Yelp.client.search(@location, parameters)
  end

  def test 
  # just testing things out - with hardcoded params
    parameters = { term: "nachos", limit: 10 }

    @results = Yelp.client.search('Atlanta, GA', parameters)

    # printing out to the server to test out other
    # method calls on the API results
    puts "****************"
    puts @results.region.center.latitude
    puts @results.region.center.longitude
    puts "****************"
  end
end

