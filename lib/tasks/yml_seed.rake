namespace :yml_seed do
  desc 'Your task description'
  task seed: :environment do
    unless ENV['path']
      puts 'path does not provided'
      next
    end

    MenuParser.new(ENV['path']).parse
  end
end
