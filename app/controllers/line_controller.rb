class LineController < ApplicationController
  def show
    @place = session[:place_in_line] || (session[:place_in_line] = next_place_in_line)
    @total = Place.last.id
  end

private
  def next_place_in_line
    Place.create.id
  end
end
