class RenameConfereceIdToConferenceIdInLogs < ActiveRecord::Migration
  def self.up
    rename_column :logs, :conferece_id, :conference_id
  end

  def self.down
    rename_column :logs, :conference_id, :conferece_id
  end
end
