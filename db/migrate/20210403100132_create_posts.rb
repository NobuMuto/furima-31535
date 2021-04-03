class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string   :postal_code     
      t.integer  :delivery_area_id 
      t.string   :city            
      t.string   :number          
      t.string   :building        
      t.string   :tel_number   
      t.string   :purchase_id        
      t.timestamps
    end
  end
end
