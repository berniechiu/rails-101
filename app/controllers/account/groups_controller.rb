class Account::GroupsController < ApplicationController
  before_action :login_required

  def index
    @groups = current_user.participated_groups.order("posts_count DESC")
  end
end
