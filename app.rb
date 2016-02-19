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

get '/' do
	@barbers = Barber.all #выбираем все записи из таблицы barbers
	@srebrab = Barber.order "created_at Desc"
	erb :index
end