require 'fileutils'

EX_NO = 10
EX_NAME = "diamond"

ex_dir = "ex_#{EX_NO}"


Dir.mkdir(ex_dir)

FileUtils.touch("./#{ex_dir}/#{EX_NAME}.rb")
FileUtils.touch("./#{ex_dir}/#{EX_NAME}_test.rb")
