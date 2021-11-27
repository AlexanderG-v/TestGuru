# frozen_string_literal: true

ResultObject = Struct.new(:success?, :html_url)
class GistQuestionService
  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response.html_url.present?, response.html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('description_gits', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    GitHubClient.new
  end
end
