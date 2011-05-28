class AddLocationAndPhoneToParticipants < ActiveRecord::Migration
  def self.up
    add_column :participants, :location, :string
    add_column :participants, :phone, :string
  end

  def self.down
    remove_column :participants, :phone
    remove_column :participants, :location
  end
end
