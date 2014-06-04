module The99Names
  module Database
    class DataPipe
      def initialize(config)
        ActiveRecord::Base.establish_connection(config)
      end
    end
  end
end
