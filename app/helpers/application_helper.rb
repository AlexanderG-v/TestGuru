module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo = nil)
    title = repo.nil? ? "#{t('author', author: author)}" : "#{t('project', project: repo)}"
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
