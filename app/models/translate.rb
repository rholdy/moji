class Translate < ActiveRecord::Base
  attr_accessible :message, :source
  validate :message_format

 def to_emoji
 	emoji_message = []
 	message.each_char do |m|
 		codepoint = (self.convert_hash[m])
    emoji_message << [codepoint.to_i(16)].pack("U*")
    end
 	emoji_message.join
 end

def to_english
	english_message = []
	message.each_char do |m|
		hex = m.codepoints.first.to_s(16)
		english_message << self.convert_hash.invert[hex.upcase].to_s
	end
	english_message.join
end

def convert
  if source == 'english'
    to_emoji
  else
  	to_english
  end 

end

def convert_hash
  YAML.load(File.open(Rails.root.join("map.yml")))['map']
end

def message_format
  valid = true
  if source == 'english'
    message.each_char do |c|
      valid = valid && (' '..'z').cover?(c)
    end
  else
    message.each_char do |c|
      valid = valid && !(' '..'z').cover?(c)
    end
  end
  if !valid 
    errors.add(:message, "Has to be all english or all emoji, try again.")
  end
end

end



