# frozen_string_literal: true

class BadgeService
  def initialize(tests_user)
    @tests_user = tests_user
    @user = tests_user.user
    @test = tests_user.test
  end

  def call
    Badge.select do |badge|
      @user.badges << badge if send(badge.rule_name, badge.rule_value, badge)
    end
  end

  private

  def all_tests_by_category(category_id, badge)
    all_tests_by_category = Test.where(category_id: category_id).count
    users_tests_by_category = TestsUser.success.joins(:test)
                                        .where(user_id: @user.id, tests: { category_id: category_id })
                                        .select(:test_id).distinct.count
    all_tests_by_category == users_tests_by_category && @test.category.id == badge.rule_value.to_i
  end

  def pass_test_by_level(level, badge)
    pass_test_by_level = Test.by_level(level).count
    users_all_tests_by_level = TestsUser.success.joins(:test)
                                        .where(user_id: @user.id, tests: { level: level })
                                        .select(:test_id).distinct.count
    pass_test_by_level == users_all_tests_by_level && @test.level == badge.rule_value.to_i
  end

  def successful_test?
    @test_passage.test_passed?
  end

  def first_test_passed(_param = nil, _badge)
    TestsUser.where(user_id: @user.id, test_id: @test.id).count == 1
  end
end
