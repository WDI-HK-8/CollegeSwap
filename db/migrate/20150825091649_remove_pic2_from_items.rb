class RemovePic2FromItems < ActiveRecord::Migration
  def change
    remove_column :items, :pic2, :string
  end
end
