total=0
for i in `seq 1 100`
do 
  adb shell am force-stop dev.makepad.makepad_image_manipulation
  sleep 1
  time=$(adb shell am start-activity -W -n dev.makepad.makepad_image_manipulation/.MakepadApp | grep "TotalTime" | cut -d ' ' -f 2)
  total=$(echo "$total + $time" | bc)
done

average=$(echo "scale=2; $total / 100" | bc)
echo "Average startup time: $average ms"
