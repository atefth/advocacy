class CreateAdvocates < ActiveRecord::Migration[5.0]
  def change
    create_table :advocates do |t|
      t.string :f_name
      t.string :l_name
      t.date :dob
      t.string :phone

      t.timestamps
    end
  end
end
