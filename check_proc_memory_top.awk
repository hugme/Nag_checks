# This is script to list the top 5 processes and shoot out some proformance data
# Due to a requirement not to open a shell I've come up with this
# add an nrpe command which looks like this: 
# /bin/ps haxo "rss,%mem,pid,cmd" | awk -f (path to script)check_proc_memory_top.awk
# change (path to script) to the place where you've put this script

{
  mem=$1
  memp=$2
  memtot=$2+memtot
  pid=$3
  command=$4

  if ( mem > mem1 ) { mem1=mem;memp1=memp;pid1=pid;cmd1=command }
  else if ( mem > mem2 ) { mem2=mem;memp2=memp;pid2=pid;cmd2=command }
  else if ( mem > mem3 ) { mem3=mem;memp3=memp;pid3=pid;cmd3=command }
  else if ( mem > mem4 ) { mem4=mem;memp4=memp;pid4=pid;cmd4=command }
  else if ( mem > mem5 ) { mem5=mem;memp5=memp;pid5=pid;cmd5=command }
}

END {
  split (cmd1,shortcmd1,"/")
  split (cmd2,shortcmd2,"/")
  split (cmd3,shortcmd3,"/")
  split (cmd4,shortcmd4,"/")
  split (cmd5,shortcmd5,"/")
  memptot1=memp1/memtot*100
  memptot2=memp2/memtot*100
  memptot3=memp3/memtot*100
  memptot4=memp4/memtot*100
  memptot5=memp5/memtot*100
  print "Top Processes: "shortcmd1[length(shortcmd1)]","shortcmd2[length(shortcmd2)]","shortcmd3[length(shortcmd3)]","shortcmd4[length(shortcmd4)]","shortcmd5[length(shortcmd5)]" | " \
        "Memory_1="mem1" Memory_Percentage_1="memptot1" PID_1="pid1" Command_1="shortcmd1[length(shortcmd1)] \
        " Memory_2="mem2" Memory_Percentage_2="memptot2" PID_2="pid2" Command_2="shortcmd2[length(shortcmd2)] \
        " Memory_3="mem3" Memory_Percentage_3="memptot3" PID_3="pid3" Command_3="shortcmd3[length(shortcmd3)] \
        " Memory_4="mem4" Memory_Percentage_4="memptot4" PID_4="pid4" Command_4="shortcmd4[length(shortcmd4)] \
        " Memory_5="mem5" Memory_Percentage_5="memptot5" PID_5="pid5" Command_5="shortcmd5[length(shortcmd5)]
}
