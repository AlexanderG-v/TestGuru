# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo = nil)
    title = repo.nil? ? t('author', author: author).to_s : t('project', project: repo).to_s
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(key)
    case key
    when 'notice' then 'alert alert-info'
    when 'alert' then 'alert alert-danger'
    end
  end
end
