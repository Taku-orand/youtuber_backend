class RemoveYoutuberFromCollaborations < ActiveRecord::Migration[6.1]
  def change
    remove_reference :collaborations, :youtuber, null: false, foreign_key: true
  end
end
