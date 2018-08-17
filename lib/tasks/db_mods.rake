# Fix RSpec deprecation error for SQLite3 boolean serialization:
namespace :db_mods do

  desc "Update SQLite boolean serialization"

  task bool_fix: :environment do
    puts "Begin..."
    User.where("admin = 't'").update_all(admin: 1)
    User.where("admin = 'f'").update_all(admin: 0)
    puts "...Complete"
  end

end
