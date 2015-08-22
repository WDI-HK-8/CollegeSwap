class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
    	t.string :text
    	t.string :time
    	t.string :location
    	t.boolean :accepted
      t.timestamps null: false
    end
  end
end
