module Notifications
  class Email
    attr_reader :data

    def initialize(args)
      @data = args
    end

    def to
      data["email"]
    end

    def body
      ERB.new(template).result(binding)
    end

    def ship
      Pony.mail(:to => to, :subject => subject, :body => body)
    end

    def template
      path = File.join(template_dir, template_name) + ".erb"
      File.read(path)
    end

    def subject
      raise SubclassMustOverride.new("Please create a subclass of Email with its own subject")
    end

    def template_name
      raise SubclassMustOverride.new("Please create a subclass of Email with its own template_name")
    end

    def template_dir
      './lib/emails/templates'
    end
  end

end