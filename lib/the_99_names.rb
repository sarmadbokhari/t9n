require "active_record"
require "active_model"
require 'pry-debugger'
require 'dotenv'
Dotenv.load

require_relative 'the_99_names/entity.rb'
require_relative 'the_99_names/entities/user.rb'

require_relative 'the_99_names/db/data_pipe.rb'

module The99Names
  def self.db
    config = YAML.load_file File.join(File.dirname(__FILE__), "../db/config.yml")
    @__db__ ||= The99Names::Database::DataPipe.new(config[ENV['DB_ENV']])
  end
end
