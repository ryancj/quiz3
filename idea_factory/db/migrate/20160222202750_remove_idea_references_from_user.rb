class RemoveIdeaReferencesFromUser < ActiveRecord::Migration
  def change
    remove_reference :users, :idea, index: true, foreign_key: true
  end
end
