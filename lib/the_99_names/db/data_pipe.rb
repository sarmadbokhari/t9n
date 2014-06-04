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
    end
  end
end
