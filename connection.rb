require 'active_record'

SQL_DIR_NAME = 'sql'

def create_db(db_name)
  `createdb #{db_name}`
end

def drop_db(db_name)
  `dropdb #{db_name}`
end

def connect(db_name)
  ActiveRecord::Base.establish_connection "postgres://localhost/#{db_name}?pool=5"
end

def read_sql_file(sql_file)
  File.open("./#{SQL_DIR_NAME}/#{sql_file}.sql", 'r').read
end

def run(sql)
  ActiveRecord::Base.connection.execute(sql)
end

def run_with_values(sql)
  ActiveRecord::Base.connection.execute(sql).values
end

def run_script(sql_file)
  run(read_sql_file(sql_file))
end

def run_script_with_values(sql_file)
  run_with_values(read_sql_file(sql_file))
end