class AddPhoneNumberAndCompanyToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_number, :string
    add_column :users, :company, :string
  end

  def self.down
    remove_column :users, :company
    remove_column :users, :phone_number
  end
end
