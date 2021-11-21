class TestsMailer < ApplicationMailer
  def completed_test(tests_user)
    @user = tests_user.user
    @test = tests_user.test

    mail to: @user.email
  end
end
