require "_bootstrap.rb"
require "find"

Find.find(".") do |f|
  if (File.file?(f) and f.include? "_test.rb")
    require f
  end
end
