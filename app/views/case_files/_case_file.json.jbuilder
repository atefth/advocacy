json.extract! case_file, :id, :name, :file_received_on, :advocate_id, :client_id, :appeal_on, :convocation_on, :amount_paid, :status, :created_at, :updated_at
json.url case_file_url(case_file, format: :json)