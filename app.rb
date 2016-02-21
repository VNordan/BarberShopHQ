#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"
set :database, "sqlite3:development.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Employ < ActiveRecord::Base
end

before do
	@barbers = Barber.all #выбираем все записи из таблицы barbers
	@srebrab = Barber.order "created_at Desc" #выбираем все записи из таблицы barbers, сортируя по времени создания
	@employs = Employee_stats_departments.all
end

get '/' do

	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	

	erb "<h2>Спасибо, вы записались!</h2>"

end

get '/employ' do
	erb :employ
end