class AddPlacesInFrontTracking < ActiveRecord::Migration
  def up
    add_column :places, :reached_front, :boolean, :default => false
  end

  def down
    remove_column :places, :reached_front
  end
end
