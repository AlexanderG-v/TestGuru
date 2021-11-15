class TestsMailer < ApplicationMailer
  def comleted_test(tests_user)
    @user = tests_user.user
    @test = tests_user.test

    mail to: @user.email, subject: 'You jast completed the TestGuru!'
  end
end
