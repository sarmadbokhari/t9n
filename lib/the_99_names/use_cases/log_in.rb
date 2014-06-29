module The99Names
	class LogIn < UseCase
		def run(inputs)
			admin = The99Names.db.get_admin_by_username(inputs[:username])
			return failure(:incorrect_username_or_password) if !admin
			
			pw_check = The99Names.db.get_admin_pw_hash(inputs[:username])
			return failure(:incorrect_username_or_password) if pw_check != inputs[:password]

			success admin_id: admin.id

		end
	end
end