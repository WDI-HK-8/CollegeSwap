class AddItemtoswapToOffers < ActiveRecord::Migration
  def change
  	add_column :offers, :itemtoswap, :integer
  end
end
