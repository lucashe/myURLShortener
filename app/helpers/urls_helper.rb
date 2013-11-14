module UrlsHelper

ALPHABET =
  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
  # make your own alphabet using:
  # (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join
 
def bijective_encode(i)
  # from http://refactormycode.com/codes/125-base-62-encoding
  # with only minor modification
  return ALPHABET[0] if i == 0
  s = ''
  base = ALPHABET.length
  while i > 0
    s << ALPHABET[i.modulo(base)]
    i /= base
  end
  s.reverse
end
 
def bijective_decode(s)
  # based on base2dec() in Tcl translation 
  # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
  i = 0
  base = ALPHABET.length
  s.each_char { |c| i = i * base + ALPHABET.index(c) }
  i
end


def get_operating_system
  if request.env['HTTP_USER_AGENT'].downcase.match(/mac/i)
    "Mac"
  elsif request.env['HTTP_USER_AGENT'].downcase.match(/windows/i)
    "Windows"
  elsif request.env['HTTP_USER_AGENT'].downcase.match(/linux/i)
    "Linux"
  elsif request.env['HTTP_USER_AGENT'].downcase.match(/unix/i)
    "Unix"
  else
    "Unknown"
  end
end

def get_ip_address
  request.remote_ip
end



	
end
