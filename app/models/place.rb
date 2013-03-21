class Place < ActiveRecord::Base
  scope :still_waiting, lambda {
    order("id asc").where(:reached_front => false)
  }

  # Mark a place as having reached the front.
  #
  # Returns nothing.
  def reached_front!
    update_attribute(:reached_front, true)
  end
end
