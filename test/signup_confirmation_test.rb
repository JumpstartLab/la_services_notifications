require './test/test_helper'

class SignupConfirmationTest < Minitest::Test

  def data
    data = {
      "name" => "Bob the Builder",
      "email" => "bob@example.com",
    }
  end

  attr_reader :email

  def setup
    @email = Notifications::SignupConfirmation.new(data)
  end

  def test_subject
    assert_equal "Thanks for signing up!", email.subject
  end

  def test_body
    body = File.read('test/fixtures/sample_signup_confirmation.txt')
    assert_equal body.chomp, email.body.chomp
  end

  def test_it_is_sent
    email.ship
  end
end