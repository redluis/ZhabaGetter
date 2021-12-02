load "internetlib.ring"


class zhabaModel 
	image
	zhaba_getter = new zhabaGetter

	func update()
		update_image()
		write("img.jpg", image)
	
	private	
	func update_image
		this.image = zhaba_getter.get_zhaba_image()

class zhabaGetter
	client_id = # YOUR_CLIENT_ID
	zhaba_request = "https://api.unsplash.com/photos/random?client_id=" + client_id + "&query=toads"

	#returns ZhabaModel object	
	func get_zhaba_image
		zhaba_json = get_zhaba_json()
		image_url = parse_image_url(zhaba_json)
		return download(image_url)
					
	private
	#returns json from unsplash api	
	func get_zhaba_json	
		return download(zhaba_request)

	#parse an image from json
	func parse_image_url(json)
		property = "thumb"
		start = substr(json, property) 	
		search_string = substr(json, start)
		content_start = substr(search_string, "http")
		search_string = substr(search_string, content_start)			
		content_length = substr(search_string, `"`) - 1
		content = left(search_string, content_length)
		return content
		
