require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Thought.delete_all
    
    tags = [
      "ruby-on-rails", "ruby", "sinatra", "heroku", "http",
      "html", "css", "scss", "jquery", "coffeescript", "javascript",
      "python", "php", "java", "mcgill", "osx", "installing",
      "facebook", "amazon-s3", "configuration"
    ].combination(3).to_a
    
    115.times do
      
      params = {
        title: Faker::Lorem.words(Random.rand(3) + 5).join(" "),
        blurb: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraphs(Random.rand(2) + 2).join("\n\n"),
        author: 'aj.ostrow',
      }
      
      thought = Thought.new params
      
      thought.tag_list = tags.sample.sample(Random.rand(3) + 1).join(", ")
      
      thought.save
    end
    
  end
end