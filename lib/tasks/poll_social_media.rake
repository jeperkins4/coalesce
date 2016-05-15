namespace :twitter do
  desc 'Poll Twitter for messages'
  task :poll => :environment do
    Identity.all.each do |identity|
      puts "Polling #{identity.name}"
      PollSocialMedia.new(identity).run
    end
  end
end
