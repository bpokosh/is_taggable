# http://www.jroller.com/obie/tags/unicode
class String
  class << self
    def unpack(string)
      return ActiveSupport::Multibyte::Chars.g_unpack(string).collect{ |c| c[0] } if defined?(ActiveSupport::Multibyte::Chars)
      string.chars.collect{ |c| c[0] }
    end
  end
  
  def to_ascii
    # split in muti-byte aware fashion and translate characters over 127
    # and dropping characters not in the translation hash
    String.unpack(self).collect{ |c| (c <= 127) ? c.chr : translation_hash[c] }.join
  end
    
  protected
    def translation_hash
      @@translation_hash ||= setup_translation_hash
    end
  
    def setup_translation_hash
      accented_chars   = String.unpack("ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝàáâãäåçèéêëìíîïñòóôõöøùúûüý")
      unaccented_chars = "AAAAAACEEEEIIIIDNOOOOOxOUUUUYaaaaaaceeeeiiiinoooooouuuuy".split('')

      translation_hash = {}
      accented_chars.each_with_index { |char, idx| translation_hash[char] = unaccented_chars[idx] }
      translation_hash[String.unpack("Æ").first] = 'AE'
      translation_hash[String.unpack("æ").first] = 'ae'
      translation_hash
    end
end