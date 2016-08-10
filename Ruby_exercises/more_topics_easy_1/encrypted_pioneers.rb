# The following list contains the names of pioneers in the field of 
# computing or that have had a significant influence of the field. 
# However, the names are in an encrypted form, using a very simple 
# (and incredibly weak) form of encryption called rot 13.

# Original:       a b c d e f g h i j k l m n o p q r s t u v w x y z
# Substitution:   n o p q r s t u v w x y z a b c d e f g h i j k l m

# def decryptor(word)
#   decrypted_word = []
#   original = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
#   substitution = %w(n o p q r s t u v w x y z a b c d e f g h i j k l m)
#   cyper = Hash[substitution.zip original]
#   word.split('').each do |character|
#     # decrypted_word << character if character == ' ' 
#     decrypted_word << cyper[character]
#   end

#   p decrypted_word.join('')
# end

# decryptor('Nqn Ybirynpr')

# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unyog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Wbua Ngnanfbss
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

# Write a program that deciphers and prints each of these names .

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unyog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Wbua Ngnanfbss',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end