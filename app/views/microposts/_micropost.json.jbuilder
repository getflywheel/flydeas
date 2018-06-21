json.extract! micropost, :id, :Submissions, :title, :content, :user_id, :upvotes, :donwvotes, :created_at, :updated_at
json.url micropost_url(micropost, format: :json)
