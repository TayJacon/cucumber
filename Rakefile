require 'time'

#Run: rake hello
task :hello do
    puts 'Hello Rake'
end

#Run: rake hello_name["Taynara"]
task :hello_name, [:name] do |task, args|
    puts 'Hello ' + args[:name]
end

#Run: rake specs["-t @smoke"]
#Run: rake specs["-t @smoke","-p chrome"]
task :specs, [:tags, :browser] do |task, args|
    time = Time.now.utc.iso8601.tr(":", "")
    report = "--format html --out=log//report#{time}.html"
    sh "cucumber #{args[:tags]} #{report} #{args[:browser]}" 
end
