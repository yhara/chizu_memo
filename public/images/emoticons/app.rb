
#img_map = Dir["*.gif"].group_by{|path| path.chars.first}
#
#puts "<style>*{font-family:serif}</style>"
#puts "<table border=1>"
#img_map.each do |ch, imgs|
#  puts "<tr><th>#{ch}</th><td>"
#  imgs.each do |img|
#    puts "<img src='#{img}' width=32/>#{img.sub(/.gif/,"")}"
#  end
#  puts "</td></tr>"
#end
#
#puts "</table>"

load "/Users/yhara/proj/_forked/jpmobile/jpemoji.rb"

require 'sinatra'
require 'nokogiri'
enable :run

#IMG_BASE = "file:///Users/yhara/Dropbox/proj/_work/webdb/4/emoticons/"
IMG_BASE = "/"

def code_of(img)
  tr = img.ancestors("tr").first
  tr and (tr/:td)[4].text.to_i(16)
end

get '/' do
  accessed = {}
  doc = Nokogiri::HTML File.read("docomo.html", :encoding => "shift_jis")
  (doc/:img).each do |img|
    table = img.ancestors("table").first
    if table and table["id"] == "first"
      img["src"] = "http://www.nttdocomo.co.jp/service/imode/make/content/pictograph/basic/" + img["src"]
    elsif table and table["id"] == "second"
      img["src"] = "http://www.nttdocomo.co.jp/service/imode/make/content/pictograph/extention/" + img["src"]
    end
    name = Jpmobile::PCEmoticon::TABLE[ code_of(img) ]
    if name
      img.add_next_sibling("<img src='#{IMG_BASE}#{name}.gif' width=30/>")
      accessed[name.to_s] = true
    end
  end

  all = Dir["*.gif"]
  rest = all - accessed.keys.map{|name| "#{normalize name}.gif"}
  
  doc.to_html + rest.map{|gif|
    "#{gif} <img src='#{IMG_BASE}#{gif}' width=20/>"
  }.join
end

def normalize(name)
  case name
  when /\A_(.*)/
    $1
  when /_/
    name.gsub(/_/, "-")
  else
    name
  end
end

get '/*.gif' do
  name = params[:splat].first
  File.read("#{normalize name}.gif")
end
