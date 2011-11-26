require 'time'

Factory.define :marquee do |m|
  m.text "Foo to the bar."
end

Factory.define :notice do |n|
  n.text "Foo to the bar to the foo."
  n.urgent true
end

Factory.define :schedule do |s|
  s.name "Foobar"
  s.description "Foo to the bar."
end

Factory.define :period do |p|
  p.number 1
  p.name "Foobar"
  p.start Time.parse("7:32")
  p.finish Time.parse("8:14")
end

Factory.define :wallpaper do |w|
  w.name "Foobar"
  w.file file
end

