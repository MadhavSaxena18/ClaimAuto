function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 8127;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 8127 > /dev/null;
done;

for child in $(list_child_processes 8606);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/madhavsaxena/Desktop/ClaimAuto/ClaimAuto.HealthSystems.Server/bin/Debug/net9.0/dfb5004033544561bd6c8aabc627edc1.sh;
