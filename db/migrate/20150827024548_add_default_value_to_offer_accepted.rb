class AddDefaultValueToOfferAccepted < ActiveRecord::Migration
  def change
  	change_column :offers, :accepted, :boolean, default: false
  end
end
