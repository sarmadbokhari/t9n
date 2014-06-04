require 'spec_helper'

describe The99Names::Database::DataPipe do

  before do
    config = YAML.load_file("db/config.yml")
    @db = described_class.new(config[ENV["DB_ENV"]])
    @db.reset
  end

  it 'exists' do
    expect(@db).to be_a(described_class)
  end
  it 'creates a user' do
    user = @db.create_user(phone_number: "4693230314", frequency: "daily")
    expect(user.name_count).to eq(0)
    expect(user.phone_number).to eq("4693230314")
  end
  it 'does not create a user if the phone number provided already exists in the database' do
    user = @db.create_user(phone_number: "4693230314", frequency: "daily")
    user2 = @db.create_user(phone_number: "4693230314", frequency: "weekly")
    expect(user2).to eq("not valid")
  end

  it 'does not create a user if frequency is missing' do
    user = @db.create_user(phone_number: "4693230314")
    expect(user).to eq("not valid")
  end
end
