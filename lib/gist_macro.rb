require 'net/http'

class GistMacro < FilteredColumn::Macros::Base
  
  def self.filter(attributes, inner_text='', text='')
    s = Net::HTTP.get(URI.parse("#{inner_text}.js"))
    s.scan(/document\.write\('(.*)'\)/)[1].to_s.gsub(/\\n/, '').gsub(/\\/, '')
  end

end