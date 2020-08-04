require 'pry'

class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    text.gsub(/[^[:alnum:]]/, '').downcase
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def normalize_ciphertext
    segments_split = plaintext_segments.map(&:chars)
    cipher_segments = segments_split[0].zip(*segments_split[1..-1]).map(&:join)
    cipher_segments.join(' ')
  end

  def ciphertext
    normalize_ciphertext.gsub(/\s/, '')
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  private

  attr_reader :text
end

# crypto = Crypto.new('If man was meant to stay on the ground god would have given us roots')
# puts crypto.normalize_plaintext
# puts crypto.size
# p crypto.plaintext_segments
# p crypto.normalize_ciphertext
# p crypto.ciphertext
