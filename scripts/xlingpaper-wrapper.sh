#!/bin/sh

# Wrapper script for xlingpaper.
#   - Present EULA on 1st run.
#   - Open SamplePaper.xml on 1st run.
#   - Ensure default config is set.

first_run=''
xxe_dir="${SNAP}/opt/xxe-perso-8_2_0"
xxe_eula_name='XXEPersonalAndXLingPaperLicense'
eula="${xxe_eula_name}.txt"

# Ensure EULA in SNAP_USER_DATA.
if [ ! -f "${SNAP_USER_DATA}/${eula}" ]; then
    cp "${xxe_dir}/${eula}" "${SNAP_USER_DATA}/${eula}"
fi

# Ensure default preferences are set.
user_prefs="${SNAP_USER_DATA}/.config/preferences.properties"
if [ ! -f "$user_prefs" ]; then
    cp "${xxe_dir}/config/preferences.properties" "$user_prefs"
fi

# Copy examples into user data.
example_file="${SNAP_USER_DATA}/examples/SamplePaper.xml"
if [ ! -f "$example_file" ]; then
    mkdir -p "${SNAP_USER_DATA}/examples"
    cp "${xxe_dir}/examples/SamplePaper.xml" "$example_file"
fi

# Get EULA text; replace NBSP with normal space.
# xxe_eula_text=$(sed -e 's/'$(echo "\xa0")'/ /g' "$xxe_ula_file")

# Ensure that EULA has been accepted.
accepted="${SNAP_USER_DATA}/${xxe_eula_name}_accepted"
if [ ! -f "$accepted" ]; then
    first_run='YES'
    gedit "${SNAP_USER_DATA}/${eula}" &
    sleep 0.5
    zenity --question --width=300 \
        --text="The license agreement has been opened in another window.\n\nDo you accept the terms?"
    if [ $? -eq 0 ]; then
        # User accepted.
        touch "$accepted"
    else
        # User declined or cancelled.
        exit 1
    fi
fi

# Launch XLingPaper/XMLMind XML Editor.
if [ "$first_run" == 'YES' ]; then
    ${xxe_dir}/bin/xxe "${SNAP_USER_DATA}/examples/SamplePaper.xml"
    exit $?
else
    ${xxe_dir}/bin/xxe
    exit $?
fi
