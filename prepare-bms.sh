source "settings.sh";
for bms_path in $BMS/* ;do
    #echo $bms_path;
    FOLDER_NAME=$(basename "$bms_path")
    echo "Zipping BMS : " $FOLDER_NAME;
    zip -1 -q -X -r "$BMS_ZIP/$FOLDER_NAME".zip "$bms_path";
    echo "Packing for Bemuse : " $FOLDER_NAME;
    cp -r "$bms_path" "$BMS_PLAY";
    bemuse-tools pack "$BMS_PLAY/$FOLDER_NAME";
    rm -f "$BMS_PLAY/$FOLDER_NAME/"*.wav;
    rm -f "$BMS_PLAY/$FOLDER_NAME/"*.ogg;
done
cd "$BMS_PLAY";
bemuse-tools index;
cd ..;
