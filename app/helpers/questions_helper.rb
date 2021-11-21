module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('new_question', new_question: question.test.title)
    else
      t('edit_question', edit_question: question.test.title)
    end
  end
end
