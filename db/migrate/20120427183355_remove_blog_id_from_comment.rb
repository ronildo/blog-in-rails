class RemoveBlogIdFromComment < ActiveRecord::Migration
  def up
  	remove_column :comments, :blog_id
  end

  def down
  end
end
