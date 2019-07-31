# Circular Buffer

Write a program that operates as a circular buffer. Elements are added one after the other, up to a certain number of elements depending on the buffer size. When an element is removed, the oldest element is removed. If the buffer is full when trying to add an element an error will be raised. Buffer elements can be overridden with a 'force' command, this will overwrite the oldest elements in the buffer.

# Data Structure
buffer as array
buffer length as integer

# Solution


read()
raise an exception if empty
read and remove the oldest item in the buffer

write()
check if buffer is full, should raise exception if full (Not tested)
should not write nil
add item to buffer in newest spot

write!()
should not write nill
should overwrite oldest item in buffer

clear()
should clear out buffer
