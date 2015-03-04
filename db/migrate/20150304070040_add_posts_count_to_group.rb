class AddPostsCountToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :posts_count, :integer, default: 0

    Group.reset_column_information
    Group.all.each do |group|
      group.update_attribute(:posts_count, group.posts.length)
    end
  end
end
