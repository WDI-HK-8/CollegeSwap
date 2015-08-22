class InitialSchema < ActiveRecord::Migration
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

    create_table :users do |t|
      t.string  :username
      t.string  :password
      t.string  :email 
      t.integer :age 
      t.string  :profile_pic  #i know this shouldn't be a string, but let's put this there for now
      t.string  :school
      t.string  :major
      t.string  :year
      t.text    :description
    end

    create_table :ratings do |t|
        t.integer :value
        t.text    :comment
        t.timestamps
    end

      create_table :comments
        t.string :content
        t.timestamps
    end 

  end
end
