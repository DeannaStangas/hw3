class EntriesController < ApplicationController
  def show
    # find a Place
    @place = Place.find_by({"id"=> params["id"]})
    @entries=Entry.where({"place_id"=> @place["id"]})
    p @place
    # render places/show view with details about Place
  end

  def create
    # start with a new journal entry
    @entry = Entry.new

    # assign user-entered form data to Contact's columns
    @entry["title"] = params["title"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["description"] = params["description"]
  
    # assign relationship between journal entry and place
    @entry["place_id"] = params["place_id"]

    # save Contact row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end
end
