require 'pony'
require 'erb'
require_relative 'email'
require_relative 'emails/purchase_confirmation'
require_relative 'emails/signup_confirmation'

Pony.options = {
  :from => 'noreply@example.com',
  :via => :smtp,
  :via_options => {:address => "localhost", :port => 1025}
}

module Notifications
  class SubclassMustOverride < StandardError; end
end
