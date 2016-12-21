class CreateCaseFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :case_files do |t|
      t.string :name
      t.date :file_received_on
      t.integer :advocate_id
      t.integer :client_id
      t.date :appeal_on
      t.date :convocation_on
      t.string :amount_paid
      t.integer :status

      t.timestamps
    end
  end
end
