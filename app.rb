require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

# подключение к бд
set :database, "sqlite3:barbershop.db"

# создание сущности
class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :barber, presence: true
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

	c = Client.new params[:client]
	if c.save
		erb "<h2>Спасибо вы записались</h2>"
	else
		@error = c.errors.full_messages.first
		erb :visit
	end


end
