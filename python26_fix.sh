command -v easy_install >/dev/null 2>&1 || { wget "https://bootstrap.pypa.io/ez_setup.py" -O - | python; }
easy_install argparse
