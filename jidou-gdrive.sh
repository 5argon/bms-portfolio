source "settings.sh";
gdrive sync upload "$BMS_ZIP" $GDRIVE_BMS_FOLDER;
gdrive share $GDRIVE_BMS_FOLDER;
gdrive list --query "'$GDRIVE_BMS_FOLDER' in parents" --no-header > gdrive_list.txt;
cat gdrive_list.txt;
