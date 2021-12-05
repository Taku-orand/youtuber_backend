class CreateCollaborations < ActiveRecord::Migration[6.1]
  def change
    create_table :collaborations do |t|
      t.references :youtuber, null: false, foreign_key: true
      t.string :channel_title
      t.integer :count
      t.string :channel_id

      t.timestamps
    end
  end
end
