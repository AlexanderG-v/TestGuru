class TestsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.tests_user(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
