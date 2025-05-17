class PlacesController < ApplicationController
  def index
    # find all place rows
    @places = Place.all
    # render posts/index view
  end

  def show
    # find a Place
    @place = Place.find_by({"name"=> params["name"]})
    @entries=Entry.where({"place_id"=> @place["id"]})
    p @place
    # render companies/show view with details about Company
  end

  def new
    # render posts/new view with new Post form
  end

  def create
    #start a new place
    @place = Place.new
    #assign user-entered form data to places column
    @place["name"] = params["name"]
    #save place row
    @place.save
    #redirect user
    redirect_to "/places"
  end

end


