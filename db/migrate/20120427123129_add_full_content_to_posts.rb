class AddFullContentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :full_content, :text

  end
end
