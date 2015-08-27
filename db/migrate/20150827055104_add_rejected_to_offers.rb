class AddRejectedToOffers < ActiveRecord::Migration
  def change
  	add_column :offers, :reject, :boolean, default: false
  end
end
