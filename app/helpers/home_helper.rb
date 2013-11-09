module HomeHelper
	def emojify(content)
		html_string = '<img alt="' + content + '" height="20" src="' + asset_path("emoji/unicode/#{content}.png") + '" style="vertical-align:middle" width="20" />'
    html_string if content.present?
  end
end
