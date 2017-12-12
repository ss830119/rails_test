class CreateSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :systems do |t|
      #meta tag
      t.string :title
      t.string :description
      t.string :keywords
      
      #corporate information
      t.string :name
      t.string :email
      t.string :phone
      t.string :address

      #social
      t.text :socials

      t.datetime :deleted_at

      t.timestamps
    end
  end
end
