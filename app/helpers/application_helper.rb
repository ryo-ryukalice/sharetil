module ApplicationHelper
  def github_link_to(user)
    link_to "@#{user.nickname}", "https://github.com/#{user.nickname}", class: 'nickname', target: '_blank'
  end
end
