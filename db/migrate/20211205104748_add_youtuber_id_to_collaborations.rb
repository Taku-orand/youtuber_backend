class AddYoutuberIdToCollaborations < ActiveRecord::Migration[6.1]
  def change
    add_column :collaborations, :youtuber_id, :integer
  end
end
