namespace :dev do
  desc "Reset existing data"
  task reset: :environment do
    Group.reset_column_information
    Group.find_in_batches do |groups|
      groups.each { |g| g.update_attribute(:posts_count, group.posts.length) }
    end
  end
end
