#!/bin/sh

# Wrapper script for xlingpaper.
#   - Present EULA on 1st run.
#   - Open SamplePaper.xml on 1st run.

SHOW_EXAMPLE=''
xxe_dir="${SNAP}/opt/xxe-perso-8_2_0"
if [ -f "${SNAP_USER_DATA}/1st_run" ]; then
    xxe_eula_name='XXEPersonalAndXLingPaperLicense'
    xxe_eula_file="${xxe_dir}/${xxe_eula_name}.txt"

    # Get EULA text; replace NBSP with normal space.
    # xxe_eula_text=$(sed -e 's/'$(echo "\xa0")'/ /g' "$xxe_ula_file")

    # Ensure that EULA has been accepted.
    accepted="${SNAP_USER_DATA}/${xxe_eula_name}_accepted"
    if [ ! -f "$accepted" ]; then
        gedit "$xxe_eula_file" &
        sleep 0.5
        zenity --question --width=200 \
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
    SHOW_EXAMPLE="${SNAP_USER_DATA}/examples/SamplePaper.xml"
    rm -f "${SNAP_USER_DATA}/1st_run"
fi
${xxe_dir}/bin/xxe "$SHOW_EXAMPLE"
