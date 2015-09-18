class AddColumnToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :image_url_list, :string
  end
end
