# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'coffeescript', :input => 'src', :output => 'javascripts'
guard 'coffeescript', :input => 'test/src', :output => 'test/javascripts'
guard "js-static-require", :libs => ["javascripts", "test/javascripts"], :updates => "test/index.html"
