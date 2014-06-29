require 'spec_helper'

describe The99Names::LogIn do
	it 'logs an admin in' do
	  admin = The99Names.db.create_admin('bubba', 'frothymilk')

	  result = The99Names::LogIn.run(username: 'bubba', password: 'frothymilk')
	  expect(result.admin_id).to eq(admin.id)
	end
	
	it 'throws an error if admin username does not exist' do
	  result = The99Names::LogIn.run(username: 'mukmukdang', password: 'frothymilk')
	  expect(result.success?).to eq(false)
	  expect(result.error).to eq(:incorrect_username_or_password)
	end

	it 'throws an error if password provided is incorrect' do
	  admin = The99Names.db.create_admin('bubba', 'frothymilk')

	  result = The99Names::LogIn.run(username: 'bubba', password: 'blueberry scones')
	  expect(result.success?).to eq(false)
	  expect(result.error).to eq(:incorrect_username_or_password)
	end

	it 'throws an error if nothing is provided' do
	  result = The99Names::LogIn.run(username: '')
	  expect(result.success?).to eq(false)
	  expect(result.error).to eq(:incorrect_username_or_password)
	end
end