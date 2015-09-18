class RemoveColumnFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :image_url_list, :integer
  end
end
