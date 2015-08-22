class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.string  :pic1        #i know this shouldn't be a string, but let's put this there for now
      t.string  :pic2
      t.string  :pic3
      t.text    :description
      t.integer :price 
      t.timestamps
    end
  end
end
