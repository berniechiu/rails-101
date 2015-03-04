class IndexGroupIdToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :group_id
  end
end
