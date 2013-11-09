class Translate < ActiveRecord::Base
  attr_accessible :message, :source

 def to_emoji
 	emoji_message = []
 	message.downcase.each_char do |m|
 		codepoint = '1f'.concat(self.convert_hash[m.to_sym])
    emoji_message << [codepoint.to_i(16)].pack("U*")
    end
 	emoji_message.join
 end

def to_english
	english_message = []
	message.each_char do |m|
		hex = m.codepoints.first.to_s(16).gsub('1f', '')
		english_message << self.convert_hash.invert[hex].to_s
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
{a: '601',
b: '602',
c: '603',
d: '604',
e: '605',
f: '606'}
end


end



