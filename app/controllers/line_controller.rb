class LineController < ApplicationController
  before_filter :verify_api_token, :only => :destroy
  before_filter :ensure_place_in_line, :only => [:show, :get_in]
  protect_from_forgery :except => [:move]
  # skip_before_filter :verify_authenticity_token, :only => :move

  def show
    @in_front = Place.still_waiting.where(["id <= ?", @place.id]).count
    @behind = Place.still_waiting.where(["id > ?", @place.id]).count
  end

  def get_in
    if @place.reached_front?
      session.delete(:place_in_line)
    end
    redirect_to root_path
  end

  def move
    move_line
    render :nothing => true
  end

private
  def next_place_in_line
    Place.create
  end

  def ensure_place_in_line
    place_id = session[:place_in_line]
    unless place_id && @place = Place.where(id: place_id).first
      @place = next_place_in_line
      session[:place_in_line] = @place.id
    end
  end

  def move_line
    if place = Place.still_waiting.first
      place.reached_front!
    end
  end

  def verify_api_token
    token = ENV['API_TOKEN']
    unless token && params[:token] == token
      head :forbidden
      false
    end
  end
end
