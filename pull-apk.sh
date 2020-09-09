if [ -z "$1" ]; then                                                                                                                                                                                                                                                          
    echo "Missing package name"                                                                                                                                                                                                                                                 
    exit                                                                                                                                                                                                                                                                            
else                      
    if [ -z "$(adb shell pm path $1)" ]; then                                                                                                                                                                                                                                                          
        echo "Package not found"                                                                                                                                                                                                                                                 
        exit                                                                                                                                                                                                                                                                            
    else                                                                                                                                                                                                                                                                  
        echo "Found $1"                                                                                                                                                                                                                                                             
        mkdir $1                                                                                                                                                                                                                                                                          
        cd $1                                                                                                                                                                                                                                                                             
        APKS=$(awk -F ':' '{print $2}' <<<$(adb shell pm path $1))                                                                                                                                                                                                                  
        for APK in $APKS; do                                                                                                                                                                                                                                                              
            echo $APK                                                                                                                                                                                                                                                                     
            adb pull $APK                                                                                                                                                                                                                                                                 
        done
        cd ..
    fi                                                                                                                                                                                                                                                                         
fi     