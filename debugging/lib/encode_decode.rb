def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  # p ('a'...'z').to_a not going all the way to z 
  p cipher
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  p cipher
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[char.ord - 65] 
    # was returning nil because this created a -venumber when it was 65 - char.ord. Needed reversing.
  end
  return plaintext_chars.join
end

p encode("theswiftfoxjumpedoverthelazydog", "secretkey")

p decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")