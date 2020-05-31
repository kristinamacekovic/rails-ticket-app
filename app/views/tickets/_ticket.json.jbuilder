json.extract! ticket, :id, :company, :departure, :from, :to, :num_max, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
