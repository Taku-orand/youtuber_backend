class CreateYoutubers < ActiveRecord::Migration[6.1]
  def change
    create_table :youtubers do |t|
      t.string :channel_title
      t.integer :channel_id
      t.string :channel_thumbnail
      t.string :last_editor
      t.text :content

      t.timestamps
    end
  end
end
