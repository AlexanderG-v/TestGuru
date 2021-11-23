# frozen_string_literal: true

ResultObject = Struct.new(:success?, :html_url)
class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response.html_url.present?, response.html_url)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
