# frozen_string_literal: true

module ApplicationHelper

  CONTEXTUAL_ALERT_CSS_CLASS = { notice: 'alert alert-info', alert: 'alert alert-danger' }

  def current_year
    Date.current.year
  end

  def github_url(author, repo = nil)
    title = repo.nil? ? t('author', author: author).to_s : t('project', project: repo).to_s
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(key)
    CONTEXTUAL_ALERT_CSS_CLASS[key.to_sym]
  end
end
