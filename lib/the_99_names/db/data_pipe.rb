module The99Names
  module Database
    class DataPipe
      def initialize(config)
        ActiveRecord::Base.establish_connection(config)
      end

      class User < ActiveRecord::Base
        validates :phone_number, presence: true
        validates :frequency, presence: true
        validates :phone_number, uniqueness: true

      end
      class Name < ActiveRecord::Base
      end

      class Admin < ActiveRecord::Base
      end

      def reset
        User.delete_all
      end

      def create_user(params)
        user = User.new(phone_number: params[:phone_number], frequency: params[:frequency])
        user.name_count = 0
        if user.valid?
          user.save
          entity_user = The99Names::User.new(user.attributes)
        else
          entity_user = "not valid"
        end
        return entity_user
      end

      def list_names
        ar_names = Name.all
        entity_names = []

        ar_names.each do |name|
          entity_name = The99Names::Name.new(name.attributes)
          entity_names << entity_name
        end
        return entity_names
      end

      def get_name(name_id)
        ar_name = Name.find(name_id)
        entity_name = The99Names::Name.new(ar_name.attributes)
      end

      def create_admin(username, password)
        password_digest = BCrypt::Password.create(password)
        new_admin = Admin.new(username: username, password_digest: password_digest)
        new_admin.save
        entity_admin = The99Names::Admin.new(new_admin.attributes)
      end

      def get_admin_pw_hash(username)
        admin = Admin.find_by(username: username)
        pw_hash = BCrypt::Password.new(admin.password_digest)
      end
    end
  end
end
