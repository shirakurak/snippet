puts "------------------------------------------------------------------------------------------"

EXCLUDED_DIRECTORIES = [
  'excluded_dir1',
  'excluded_dir2'
]

def random_file(path)
  Dir.glob("#{path}/**/*")
    .select do |name|
      File.file?(name) && !excluded_directory?(name)
    end
    .sample
end

def excluded_directory?(file_path)
  directory = File.dirname(file_path)
  EXCLUDED_DIRECTORIES.any? { |excluded_dir| directory.include?(excluded_dir) }
end

def print_random_line(file_path)
  file_lines = File.readlines(file_path)
  random_index = rand(file_lines.length)

  start_index = [0, random_index - 2].max
  end_index = [random_index + 2, file_lines.length - 1].min

  (start_index..end_index).each do |index|
    line_number = index + 1
    line_content = file_lines[index]
    puts "#{line_number}: #{line_content}"
  end
end

path = '/Users/taro-yamada/DEV/xxx_app'
random_file = random_file(path)

puts "#{random_file}"
puts "------------------------------------------------------------------------------------------"
print_random_line(random_file)
puts "------------------------------------------------------------------------------------------"
