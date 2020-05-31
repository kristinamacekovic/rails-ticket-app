json.extract! booking, :id, :card_number, :user_id, :ticket_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
