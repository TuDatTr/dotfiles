#!/usr/bin/python
import subprocess
import time

def main():
    state = -1
    while 1:
        with open('/home/tuan/.scripts/playstate', 'r') as f:
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
        time.sleep(0.5)
        
if __name__ == '__main__':
    main()
