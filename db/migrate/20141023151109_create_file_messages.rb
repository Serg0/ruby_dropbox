class CreateFileMessages < ActiveRecord::Migration
  def change
    create_table :file_messages do |t|
      t.integer :sender_id, :limit => 8, :null => false, :class_name => 'User'
      t.integer :recipient_id, :limit => 8, :null => false, :class_name => 'User'
      t.string :name
      t.text :link
      t.integer :bytes, :limit => 8
      t.text :icon
      t.text :thumbnailLink
      t.boolean :new, default: true

      t.timestamps
    end
  end
end
