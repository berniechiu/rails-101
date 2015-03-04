class IndexUserIdOnGroups < ActiveRecord::Migration
  def change
    add_index :groups, :user_id
  end
end
