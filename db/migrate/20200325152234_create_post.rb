class CreatePost < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title , null:false , index: {unique:true}   , limit:50
      t.text :content ,null: false 
      t.timestamps
    end
  end
end
