#
# Module Library for Qtile
#

import os
import sys
import subprocess
from libqtile import hook

@hook.subscribe.startup_once # Application starts only once
def autostart():
    #
    # Autostart Programs
    #

    # --- Input
    # Local Variables

    # --- Processing
    home = os.path.expanduser('~')
    # subprocess.Popen(["{}/.config/qtile/extlib.sh".format(home)])
    os.system("{}/.config/qtile/extlib.sh".format(home))

    # --- Output

def debug():
    autostart()

if __name__ == "__main__":
    debug()
