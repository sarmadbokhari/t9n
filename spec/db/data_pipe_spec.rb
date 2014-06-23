require 'spec_helper'

describe The99Names::Database::DataPipe do

  before do
    config = YAML.load_file("db/config.yml")
    @db = described_class.new(config['test'])
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
  it 'creates an admin' do
    password = BCrypt::Password.create('arfarf')
    BCrypt::Password.stub(:create).and_return(password)
    created_admin = @db.create_admin('t9n_admin', 'arfarf')
    expect(created_admin.username).to eq(created_admin.username)
    expect(created_admin.password_digest).to_not eq(password)
  end

  it 'gets admin pw_hash by username' do
    password = BCrypt::Password.create('arfarf')
    BCrypt::Password.stub(:create).and_return(password)
    pw_check = BCrypt::Password.new(password)
    BCrypt::Password.stub(:new).and_return(pw_check)
    admin = @db.create_admin('t9n_admin', 'arfarf')
    retrieved_pw_hash = @db.get_admin_pw_hash(admin.username)
    expect(retrieved_pw_hash).to_not eq(admin.password_digest)
    expect(retrieved_pw_hash).to eq('arfarf')    
  end
end
