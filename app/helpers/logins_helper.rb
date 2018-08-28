module LoginsHelper
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email)
		gravatar_url = "https://secure.gravatar.com/avatar#{gravatar_id}"
		image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
	end
end
