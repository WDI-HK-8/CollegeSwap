class AddAcceptedToItems < ActiveRecord::Migration
  def change
    add_column :items, :accepted, :boolean
  end
end
