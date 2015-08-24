class RemoveLovedFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :loved, :boolean
  end
end
