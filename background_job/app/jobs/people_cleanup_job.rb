class PeopleCleanupJob < ApplicationJob
  queue_as :default

  def perform(*people)
    puts 'hello from PeopleCleanupJob!'
    people.each do |person|
      person.update(name: 'CLEANED UP YO')
    end
  end
end
