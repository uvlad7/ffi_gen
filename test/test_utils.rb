require "fileutils"
require "ffi_gen"

module FFI::Library
  alias_method :real_ffi_lib, :ffi_lib
  def ffi_lib(*)
    real_ffi_lib(FFI::CURRENT_PROCESS)
  end
end

def find_headers(dir, prefix = "")
  Dir.chdir dir do
    return Dir.glob("#{prefix}**/*.h")
  end
end

def run_test(options = {})
  options[:files].each do |header|
    output_file = "#{File.dirname(__FILE__)}/output/#{header.sub(/\.h$/, ".rb")}"
    FileUtils.mkdir_p File.dirname(output_file)
    
    FFIGen.generate(
      module_name: options[:library_name],
      ffi_lib:     options[:ffi_lib],
      headers:     [header],
      cflags:      ["-nostdinc", "-Itest/headers"] + options.fetch(:cflags, []),
      prefixes:    options.fetch(:prefixes, []),
      suffixes:    options.fetch(:suffixes, []),
      blocking:    options.fetch(:blocking, []),
      output:      output_file
    )
    
    require output_file
  end
  
  puts "#{options[:library_name]} test successful"
end
