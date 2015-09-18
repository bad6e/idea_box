class RemoveImageIdFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :image_id, :integer
  end
end
