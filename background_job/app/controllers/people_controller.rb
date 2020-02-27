class PeopleController < ApplicationController
  def index
    @people = Person.all
    puts 'hello from people#index!'
  end

  def change_names
    puts 'hello from change_names!'
    PeopleCleanupJob.set(wait: 15.seconds).perform_later(Person.first)
  end
end
