class RemovePic1FromItems < ActiveRecord::Migration
  def change
    remove_column :items, :pic1, :string
  end
end
