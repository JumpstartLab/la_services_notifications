module Notifications
  class PurchaseConfirmation < Email
    def subject
      "Thanks for your purchase!"
    end

    def template_name
      'purchase_confirmation'
    end

    def name
      data["name"]
    end

    def total
      data["total"]
    end

    def items
      data["items"]
    end
  end
end