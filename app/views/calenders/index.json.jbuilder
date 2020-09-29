json.array!(@calenders) do |calender|
  json.extract! calender, :id, :title, :body
  json.start calender.start
  json.end calender.end
  json.url calender_url(calender, format: :html)
end
