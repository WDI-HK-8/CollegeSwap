class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
			t.integer :value
			t.belongs_to :user
      t.text    :comment
      t.references :posting_user_id
      t.timestamps null: false
    end
  end
end
