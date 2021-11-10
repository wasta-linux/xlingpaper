#!/bin/sh

# Wrapper script for xlingpaper.
#   - Present EULA on 1st run.
#   - Create confirmation file if accepted.
#   - Modify ENV?
#   - Copy default preferences to $SNAP_USER_DATA if not present.

xxe_dir="${SNAP}/opt/xxe-perso-8_2_0"
xxe_eula_name='XXEPersonalAndXLingPaperLicense'
xxe_eula_file="${xxe_dir}/${xxe_eula_name}.txt"
xxe_prefs="${xxe_dir}/config/preferences.properties"

# Get EULA text; replace NBSP with normal space.
# xxe_eula_text=$(sed -e 's/'$(echo "\xa0")'/ /g' "$xxe_ula_file")

# Ensure that EULA has been accepted.
accepted="${SNAP_USER_DATA}/${xxe_eula_name}_accepted"
if [ ! -f "$accepted" ]; then
    gedit "$xxe_eula" &
    zenity --question --text="The license agreement has been opened. Do you accept the terms?"
    if [ $? -ne 0 ]; then
        # User accepted.
        touch "$accepted"
    else
        # User declined or cancelled.
        exit 1
    fi
fi

# Ensure default preferences are set.
user_prefs="${SNAP_USER_DATA}/preferences.properties"
if [ ! -f "$user_prefs" ]; then
    cp "$xxe_prefs" "$prefs"
    # chown $USER:$USER "$prefs"
fi

# Launch XLingPaper/XMLMind XML Editor.
${xxe_dir}/bin/xxe
