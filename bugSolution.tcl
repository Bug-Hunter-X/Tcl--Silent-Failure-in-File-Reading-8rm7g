proc read_file {filename} { 
  set fileId [open $filename r]
  if {$fileId == -1} { 
    return -code error "Could not open file: $filename"
  }
  set content [read $fileId]
  close $fileId
  return $content
}

set data [read_file non_existent_file.txt]
if {[catch {puts $data} msg]} {
  puts "Error: $msg"
}
#Alternative way to handle error
catch {
    set data [read_file non_existent_file.txt]
    puts $data
} result msg
if {$result != 0} {
    puts "Error reading file: $msg"
} 