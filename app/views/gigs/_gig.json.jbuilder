json.extract! gig, :date, :time, :venue, :location, :description, :musictype_id, :set_length, :tickets_presale, :door_charge, :payment, :created_at, :updated_at
json.url gig_url(gig, format: :json)