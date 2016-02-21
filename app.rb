#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all #выбираем все записи из таблицы barbers
	@srebrab = Barber.order "created_at Desc" #выбираем все записи из таблицы barbers, сортируя по времени создания
end

get '/' do

	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

	c = Client.new params[:client]
	c.save

	erb "<h2>Спасибо, вы записались!</h2>"

end

get '/employ' do
	erb :employ
end