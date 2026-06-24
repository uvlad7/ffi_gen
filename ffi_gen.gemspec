Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY

  s.name = "ffi_gen"
  s.version = "1.2.1.uvlad.7.1"
  s.summary = "A generator for Ruby FFI bindings"
  s.description = "A generator for Ruby FFI bindings, directly from header files via LLVM's Clang compiler"
  s.authors = ["Richard Musiol", "Greg Hazel", "Make Technology", "Vladimir Ulianitsky"]
  s.email = ["mail@richard-musiol.de", "uvlad7@gmail.com"]
  s.homepage = "https://github.com/uvlad7/ffi_gen"
  s.license = "MIT"

  s.add_dependency "ffi", "~> 1.0"
  s.files = Dir["lib/**/*.rb"] + ["LICENSE", "README.md", "lib/ffi_gen/empty.h", "lib/ffi_gen/java_interface.java", "lib/ffi_gen/java_static.java"]
  s.require_path = "lib"
end
