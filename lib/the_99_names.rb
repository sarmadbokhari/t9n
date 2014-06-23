require "active_record"
require "active_model"
require 'pry-debugger'
require 'dotenv'
require "twilio-ruby"
require "bcrypt"
Dotenv.load

########## ENTITIES ##########
require_relative 'the_99_names/entity.rb'
require_relative 'the_99_names/entities/user.rb'
require_relative 'the_99_names/entities/name.rb'
require_relative 'the_99_names/entities/admin.rb'

########## DATABASES ##########
require_relative 'the_99_names/db/data_pipe.rb'

########## USE CASES / COMMANDS ##########
require_relative 'the_99_names/use_cases/use_case.rb'
require_relative 'the_99_names/use_cases/subscribe.rb'

module The99Names
  def self.db
    config = YAML.load_file File.join(File.dirname(__FILE__), "../db/config.yml")
    @__db__ ||= The99Names::Database::DataPipe.new(config["development"])
  end
end

@db = The99Names.db
