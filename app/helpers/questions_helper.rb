module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create New #{question.test.title} Questions"
    else
      "Edit #{question.test.title} Question"
    end
  end
end
