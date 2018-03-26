#!/usr/bin/python
import subprocess
import time
import os

def find_proc(proc_name):
    this_proc = "pythonspotify-play.py"
    proc_path = '/proc'
    proc = next(os.walk('{}/'.format(proc_path)))[1]
    for process in proc:
        cmdline_path = '{}/{}/cmdline'.format(proc_path,process)
        try:
            with open(cmdline_path, 'r') as cmd:
                proc_content = cmd.readline()
                if (proc_name in proc_content):
                    return True
        except FileNotFoundError:
            pass
    return False


def spotify_running():
    return find_proc('/usr/bin/spotify')


def main():
    state = -1
    while spotify_running():
        with open('~/.scripts/playstate', 'r') as f:
            try:
                file_state = int(f.readline().strip('\n'))
            except ValueError:
                pass
        if state != file_state:
            state = file_state
            if state == 0:
                print("")
                subprocess.run(["playerctl","pause"])
            elif state == 1:
                print("")
                subprocess.run(["playerctl","play"])
        time.sleep(0.1)
        
if __name__ == '__main__':
    main()
