begin
  SimpleEditable::InlineTextStorage.new.read_all
rescue => e
  puts 'was not able to load inline texts storage'
end
