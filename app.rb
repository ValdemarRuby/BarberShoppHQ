require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

# подключение к бд
set :database, "sqlite3:barbershop.db"

# создание сущности
class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	@barbers = Barber.all
	erb :index
end

get '/visit' do
  erb :visit
end


post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datestamp = params[:datestamp]
	@barber = params[:barber]
	@color = params[:color]

	user = Client.new :name => "#{@username}", :phone => "#{@phone}", :datestamp => "#{@datestamp}", :barber => "#{@barber}", :color => "#{@color}"
	if user.new_record?
		user.save
	else
		@error = 'You are already recorded!'
	end

	erb "OK, username is #{@username}, #{@phone}, #{@datestamp}, #{@barber}, #{@color}"
end
