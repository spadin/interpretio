class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.references :conference
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
