module The99Names
  class Subscribe < UseCase
    def run(inputs)
      phone_number = inputs[:phone_number]
      frequency = inputs[:frequency]

      user = The99Names.db.create_user(phone_number: phone_number, frequency: frequency)
      return failure(:missing_phone_number_or_frequency) if !user
    end

    def self.send_message(user)
      client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
      message = client.account.messages.create(
        :body => "You will be receiving a #{user.frequency} text containing one of God's 99 names.",
        :to => "#{user.phone_number}",
        :from => "4695073457"
      )

      puts "#{message.inspect}"
    end
  end
end
