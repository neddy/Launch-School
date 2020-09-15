class Crypto
  def initialize(string)
    @original_text = string
    nil
  end

  def normalize_plaintext
    @original_text.gsub(/[^\w]/, '').downcase # Pattern should be W without group, but highlighting breaks in Atom with this...
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil.to_i
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def normalize_ciphertext
    encode_plaintext(' ')
  end

  def encode_plaintext(delimiter = '')
    padded_text = plaintext_segments.map { |el| el.ljust(size) }
    padded_text.map(&:chars).transpose.map(&:join).map(&:strip).join(delimiter)
  end

  def ciphertext
    encode_plaintext
  end
end

# crypto = Crypto.new('Vampires are people too!')
# # expected = %w(neverv exthin eheart withid lewoes)
# p crypto.ciphertext
