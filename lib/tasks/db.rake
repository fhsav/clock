namespace :mm do
  desc "Export the database to a flat file."
  task :export do
    exec "mongodump -d clock_production -o db/backups"
  end

  desc "Import exported files to the database."
  task :import do
    exec "mongorestore -d clock_production db/backups/clock_production"
  end

  namespace :backups do
    desc "Clears the database backups."
    task :clear do
      exec "rm -rf db/"
    end
  end
end