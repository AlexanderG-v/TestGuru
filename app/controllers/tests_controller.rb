class TestsController < ApplicationController

  before_action :find_test, only: %i[show]

  def index
    render inline: '<%= Test.pluck(:id, :title).sort %>'
  end

  def show
    render inline: '<%= @test.title %>'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end