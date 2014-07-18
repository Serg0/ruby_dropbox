class ChandeUsernameFromUser < ActiveRecord::Migration
  def change
    change_column :users , :username, :string, :unique => true, :limit => 255
  end
end
