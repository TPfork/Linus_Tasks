input_file = ARGV[0]
output_file = ARGV[1]
File.open(output_file, 'w'){|file|
  file << File.new(input_file).read
}

