require 'active_record'

SQL_DIR_NAME = 'sql'

def create_db(db_name)
  `createdb #{db_name}`
  puts "\e[33mdatabase #{db_name} created\e[0m"
end

def drop_db(db_name)
  `dropdb #{db_name}`
  puts "\e[33mdatabase #{db_name} dropped\e[0m"
end

def connect(db_name)
  ActiveRecord::Base.establish_connection "postgres://localhost/#{db_name}?pool=5"
end

def run_console
  loop do
    print '> '
    run_with_values(STDIN.gets.chomp)
  rescue => e
    puts e
  end
end

def read_sql_file(sql_file)
  File.open("./#{SQL_DIR_NAME}/#{sql_file}.sql", 'r').read
end

def run(sql)
  ActiveRecord::Base.connection.execute(sql)
end

def run_with_values(sql, print: true)
  print ? p(run(sql).values) : run(sql).values
end

def run_script(sql_file)
  run(read_sql_file(sql_file))
end

def run_script_with_values(sql_file)
  run_with_values(read_sql_file(sql_file))
end