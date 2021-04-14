class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string   :postal_code,     null: false
      t.integer  :delivery_area_id,  foreign_key: true 
      t.string   :city,            null: false
      t.string   :number,          null: false
      t.string   :building        
      t.string   :tel_number,      null: false
      t.string   :purchase_id,        foreign_key: true 
      t.timestamps
    end
  end
end
