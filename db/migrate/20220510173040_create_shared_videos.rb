class CreateSharedVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :shared_videos do |t|
      t.integer :user_id, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
