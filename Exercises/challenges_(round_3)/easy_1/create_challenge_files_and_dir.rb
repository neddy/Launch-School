require 'fileutils'

EX_NO = 2
EX_NAME = "sieve"

ex_dir = "ex_#{EX_NO}"


Dir.mkdir(ex_dir)

FileUtils.touch("./#{ex_dir}/#{EX_NAME}.rb")
FileUtils.touch("./#{ex_dir}/#{EX_NAME}_test.rb")
