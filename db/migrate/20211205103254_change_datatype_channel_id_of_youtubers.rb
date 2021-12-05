class ChangeDatatypeChannelIdOfYoutubers < ActiveRecord::Migration[6.1]
  def change
    change_column :youtubers, :channel_id, :string
  end
end
