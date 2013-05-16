
namespace :convert do
  desc "Convert all textile formatted text to html in the Redmine db"
  task :to_html => :environment do
    real = ENV['for_reals'] || false

    if real
      puts "This is not a Drill, I am updating the database!!!"
    else
      puts "Relax, this is a dry run, I wont touch anything"
    end

    puts "Updating issue descriptions..."
    Issue.find_each do |issue|
      old = issue.description
      issue.description = RedCloth.new(old).to_html
      puts "Converting #{old} to #{issue.description}"
      if real
        issue.save!
      end
    end

    puts "Updating issue notes..."
    Journal.find_each do |journal|
      old = journal.notes
      journal.notes = RedCloth.new(old).to_html
      puts "Converting:\n\n #{old}\n\n to:\n\n #{journal.notes}\n\n"
      if real
        journal.save!
      end
    end

    puts "Complete."
  end

  #desc "Convert all html formatted text to textile in the Redmine db"
end
