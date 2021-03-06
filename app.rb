#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 } 
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
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
	@c = Client.new
	@b = Barber.all
	erb :visit
end

post '/visit' do
	@b = Barber.all
	@c = Client.new params[:client]
	if @c.save
		erb "<h2>Спасибо, вы записались!</h2>"
	else
		@error = @c.errors.full_messages.first
		erb :visit
		
	end

end

get '/barber/:id' do
	@n = Barber.find(params[:id])
	erb :barber
end

get '/bookings' do
	@client = Client.order('datestamp')

	erb :bookings
end