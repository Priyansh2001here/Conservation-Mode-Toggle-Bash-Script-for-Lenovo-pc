#!/bin/bash
status=`cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode`  

if [[ $status == 1 ]]
then 
	echo "conservation mode is on"
	
	read -p "Do you want to turn it off y/n : " inp

	if [[ $inp == 'y' ]] || [[ $inp == 'Y' ]]
		then

				echo "turning it off"
				exec echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
				echo "Conservation mode sucesfully turned off"

	else
		exit 0
	fi


elif [[ $status == 0 ]]
then
	echo "conservation mode is off"
        
        read -p "Do you want to turn it on y/n : " inp
        
	if [[ $inp == 'y' ]] || [[ $inp == 'Y' ]]
        then

                echo "turning it on"
                exec echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
				echo "Conservation mode sucesfully turned on"

	else
		exit 0

	fi
fi
