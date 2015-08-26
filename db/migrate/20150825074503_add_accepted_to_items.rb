class AddAcceptedToItems < ActiveRecord::Migration
  def change
    add_column :items, :accepted, :boolean, default: 0
  end
end
