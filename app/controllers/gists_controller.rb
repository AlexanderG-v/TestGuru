# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tests_user = TestsUser.find(params[:tests_user_id])
    result = GistQuestionService.new(@tests_user.current_question).call

    if result.success?
      @gist = Gist.create(gist_url: result.html_url, user: current_user, question: @tests_user.current_question)
      flash[:notice] = view_context.link_to(result.html_url, t('.success'))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @tests_user
  end
end
