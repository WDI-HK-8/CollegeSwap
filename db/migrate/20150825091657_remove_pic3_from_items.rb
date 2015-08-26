class RemovePic3FromItems < ActiveRecord::Migration
  def change
    remove_column :items, :pic3, :string
  end
end
