class CreateBarbers < ActiveRecord::Migration
  def change
  	create_table :barbers do |t|
  		t.text :name

  		t.timestamps
  	end

  	Barber.create :name => 'Vened Nordan'
  	Barber.create :name => 'Amrod Oelsten'
  	Barber.create :name => 'Elrik de Foks'
  	Barber.create :name => 'Altimir the Greate'  	

  end
end
