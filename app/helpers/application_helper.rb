module ApplicationHelper
  def render_post_content(post)
    truncate(simple_format(post.content), length: 35)
  end
end
