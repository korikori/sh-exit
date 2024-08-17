#!/bin/bash
on=1 # cancel button returns 0 , all others 1
while [ $on -eq 1 ]; do
  ans=$(zenity --info --title "Log out" \
      --text "Log out? Choose an option:" \
      --ok-label "Cancel" \
      --extra-button "Log out" \
      --extra-button "Suspend" \
      --extra-button "Reboot" \
      --extra-button "Power off" \
       )
  on=$?
  echo "${on}-${ans}"
  echo $ans
  if [[ $ans = "Log out" ]]
  then
        echo "Exiting Openbox, please standby..."
        openbox --exit
  elif [[ $ans = "Suspend" ]]
  then
        echo "Suspending, please standby..."
        systemctl suspend
  elif [[ $ans = "Reboot" ]]
  then
        echo "Rebooting, please standby..."
        systemctl reboot
  elif [[ $ans = "Power off" ]]
  then
        echo "Shutting down, please standby..."
        systemctl poweroff
  fi
done
