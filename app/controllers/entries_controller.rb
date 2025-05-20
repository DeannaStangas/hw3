class EntriesController < ApplicationController

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    # render entries/new view with new Entry form
  end

  def create
    # start with a new journal entry
    @entry = Entry.new

    # assign user-entered form data to entry's columns
    @entry["title"] = params["title"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["description"] = params["description"]
  
    # assign relationship between journal entry and place
    @entry["place_id"] = params["place_id"]

    # save entry row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end
end