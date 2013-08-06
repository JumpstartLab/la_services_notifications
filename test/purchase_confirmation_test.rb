require './test/test_helper'

class PurchaseConfirmationTest < Minitest::Test

  def data
    data = {
      "name" => "Alice Smith",
      "email" => "alice@example.com",
      "items" => [
        {
          "title" => "Li Hing Mui Lollypops",
          "quantity" => 3
        }
      ],
      "total" => 12.00
    }
  end

  attr_reader :email

  def setup
    @email = Notifications::PurchaseConfirmation.new(data)
  end

  def test_subject
    assert_equal "Thanks for your purchase!", email.subject
  end

  def test_body
    body = File.read('test/fixtures/sample_purchase_confirmation.txt')
    assert_equal body.chomp, email.body.chomp
  end

  def test_it_is_sent
    email.ship
  end
end