class AddIdeaIdReferencesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :idea, index: true, foreign_key: true
  end
end
