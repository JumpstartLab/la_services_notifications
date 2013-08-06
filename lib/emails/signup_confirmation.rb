module Notifications
  class SignupConfirmation < Email
    def subject
      "Thanks for signing up!"
    end

    def template_name
      'signup_confirmation'
    end

    def name
      data["name"]
    end
  end
end