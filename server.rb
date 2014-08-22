require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require'csv'

get '/' do
@articles = CSV.readlines("articles.csv")
  erb :index
end

get '/submit' do
  erb :submit
end

post '/submit' do
  articles = [params["article_url"],params["article_title"],params["article_description"]]
CSV.open('articles.csv','a') do |file|
  file.puts(articles)
end
redirect '/'
end


# get '/' do
#   @tasks = File.readlines('public/tasks.csv')
#   erb :index
# end

# post '/tasks' do
#   binding.pry
#   # Read the input from the form the user filled out
#   task = params['task_name']

#   # Open the "tasks" file and append the task
#   File.open('tasks', 'a') do |file|
#     file.puts(task)
#   end

#   # Send the user back to the home page which shows
#   # the list of tasks
#   redirect '/'
# end
