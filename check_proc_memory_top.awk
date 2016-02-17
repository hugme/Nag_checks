# This is script to list the top 5 processes and shoot out some proformance data
# Due to a requirement not to open a shell I've come up with this
# add an nrpe command which looks like this: 
# /bin/ps haxo "rss,%mem,pid,cmd" | awk -f (path to script)check_proc_memory_top.awk
# change (path to script) to the place where you've put this script

{
 top=5
 memu=$1
 memprc=$2
 memt=$2+memt
 rpid=$3
 command=$4

 t=0
 for (i=1;i<=top;i++) {
  if ( memu > mem[i] && t == 0 ) {
   for (j=top;j>i;j--) {
    mem[j]=mem[j-1];memp[j]=memp[j-1];pid[j]=pid[j-1];cmd[j]=cmd[j-1]
   }
   mem[i]=memu;memp[i]=memprc;pid[i]=rpid;cmd[i]=command
   t=1
  }
 }
}
END {
 print ""
 for (i=1;i<=top;i++){
  split (cmd[i],shortcmd,"/")
  shtcmd[i]=shortcmd[length(shortcmd)]
  memptot[i]=memp[i]/memt*100
 }
 printf "Top Processes: "shtcmd[1]","shtcmd[2]","shtcmd[3]","shtcmd[4]","shtcmd[5]" | "
 for (i=1;i<=top;i++){
 printf " Memory_"i"="mem[i]" Memory_Percentage_"i"="memptot[i]" PID_"i"="pid[i]" Command_"i"="shtcmd[i]
 }
 print ""
}
