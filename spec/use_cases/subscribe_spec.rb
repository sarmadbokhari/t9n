require 'spec_helper'

describe The99Names::Subscribe do
  it 'exists' do
    expect(described_class).to be_a(Class)
  end

  it 'sends a success message to the newly subscribed user' do
    user = The99Names.db.create_user(phone_number: "4693230314", frequency: "daily")

    VCR.use_cassette('twilio/send-confirmation') do
      message = described_class.send_message(user)
    end
  end
end
