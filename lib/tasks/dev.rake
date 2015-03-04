namespace :dev do
  desc "Rebuild system"
  task build: ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]
  task rebuild: ["dev:build", "db:seed"]

  desc "Fake system data"
  task fake: :environment do
    require "faker"
    require "populator"

    User.populate(20) do |user|
      user.email = Faker::Internet.email
      user.name = Faker::Name.name
      user.encrypted_password = User.new(password: "password").encrypted_password
      user.sign_in_count = 1

      Group.populate(1..2) do |group|
        group.user_id = user.id
        group.title = Populator.words(1..3).titleize
        group.description = Populator.sentences(1..2)
        group.created_at = 2.years.ago..Time.now
        GroupUser.create(user_id: user.id, group_id: group.id)
        posts_count = 1

        Post.populate(1..2) do |post|
          group.posts_count = posts_count
          post.user_id = user.id
          post.group_id = group.id
          post.content = Populator.sentences(1)
          post.created_at = 2.hours.ago..Time.now
          posts_count = 1
        end
      end
    end
  end
end
