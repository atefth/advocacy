class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :f_name
      t.string :l_name
      t.date :dob
      t.string :phone

      t.timestamps
    end
  end
end
