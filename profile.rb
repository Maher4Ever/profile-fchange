require 'ruby-prof'
require 'fileutils'
require 'rb-fchange'

def write_results(result, type)
	FileUtils.mkdir("results") unless File.directory?("results")
	
	printer = RubyProf::FlatPrinter.new(result)
	printer.print(File.new("results/result-#{type}.txt", "w"))
	
	printer = RubyProf::GraphHtmlPrinter.new(result)
	printer.print(File.new("results/result-#{type}.html", "w"))
	
	printer = RubyProf::DotPrinter.new(result)
	printer.print(File.new("results/result-#{type}.dot", "w"))
end

#####################
# Without FChange
#####################

puts "Profiling without fchange"

# Profile the code
RubyProf.start

FileUtils.touch 'test'
FileUtils.rm 'test'

result = RubyProf.stop

write_results(result, "no-fchange")

#####################
# With FChange
#####################

puts "Profiling with fchange"

notifier = FChange::Notifier.new
notifier.watch(Dir.pwd, :all_events, :recursive, &Proc.new {})
t = Thread.new { notifier.run }
sleep(0.5)

# Profile the code
RubyProf.start

FileUtils.touch 'test'
FileUtils.rm 'test'

result = RubyProf.stop

Thread.kill(t)

# Print results
write_results(result, "fchange")

puts "Finished profiling"