#!/bin/python3

import time
import os

from PIL import Image

DEBUG = False

def screenshot():
    ss_time = time.time()
    os.system('maim -f png /tmp/i3lock.png')
    print('Screenshot: {}'.format(time.time() - ss_time))


def pixelate():
    pxl_time = time.time()
    pixelSize = 12

    image = Image.open('/tmp/i3lock.png')

    image_x, image_y = image.size

    image = image.resize((int(image_x / pixelSize), int(image_y / pixelSize)), Image.NEAREST)
    image_x, image_y = image.size

    image = image.resize((image_x * pixelSize, image_y * pixelSize),
            Image.NEAREST)

    image.save('/tmp/i3lock.png')
    os.chmod('/tmp/i3lock.png', 0o666)
    print('pixelate: {}'.format(time.time() - pxl_time))


def getResolution():
    image = Image.open('/tmp/i3lock.png')
    return image.size


def lock_config():
    'Generation of a customized lock command'
    lock_time = time.time()
    # constants
    lock_core = 'i3lock'
    default_fontsize = 32
    # resolution
    res = getResolution()
    # res_x = int(res[0])
    res_y = int(res[1])

    # alignments
    left_margin = int(res[0] / 25)

    # clock pos
    clock_x = left_margin
    clock_y = int(res_y * (90 / 100))

    date_x = left_margin
    date_y = clock_y + default_fontsize

    # clock config
    lock_clock_args = '-k'
    lock_clock_align = '--time-align 1 --date-align 1 --layout-align 1'
    clock = "{} {}".format(lock_clock_args, lock_clock_align)
    # time
    lock_time_pos = '--timepos="{}:{}"'.format(clock_x, clock_y)
    lock_time_size = '--timesize={}'.format(default_fontsize * 2)
    l_time = "{} {}".format(lock_time_pos, lock_time_size)
    # date
    lock_date_pos = '--datepos="{}:{}"'.format(date_x, date_y)
    lock_date_size = '--datesize={}'.format(default_fontsize)
    date = "{} {}".format(lock_date_pos, lock_date_size)
    # date color
    datecolor = '--datecolor=777777ff'
    timecolor = '--timecolor=777777ff'
    color = '{} {}'.format(datecolor, timecolor)
    # done
    datetime = "{} {} {}".format(l_time, date, color)

    # Indicator config
    # Indicator inner
    # Color of the circle while resting/typing | Color: transparenet
    lock_rest_color = '--insidecolor 00000000 '
    # Color of the circle while "VERIFYING..." | Color: transparent
    lock_ver_color = '--insidevercolor 00000000 '
    # Color of the circle if wrong | Color: transparent
    lock_wrong_color = '--insidewrongcolor 00000000 '
    indicator_inner = "{} {} {}".format(lock_rest_color, lock_wrong_color,
            lock_ver_color)

    # indicator_outer_ring
    # Default Color of the ring | Color: torquoise
    lock_ring = '--ringcolor 00CED1FF'
    # Color of ring when wrong pw | Color: red
    lock_ring_w = '--ringwrongcolor D10000FF'
    # Color of ring when verifying | color dark-torquoise
    lock_ring_v = '--ringvercolor 25B6B8FF'
    # Color on Keypresses | Color: green
    lock_press = '--keyhlcolor 00D103FF'
    # Color on Deletion | Color: orange
    lock_del = '--bshlcolor D13400FF'
    # Color of seperator | Color: dark-blue
    lock_sep_color = '--separatorcolor 0000D1FF'
    # Right Text
    lock_right_text = '--veriftext="..."'
    # Wrong Text
    lock_wrong_text = '--wrongtext="Noope"'
    # Text Size
    # lock_text_size = '--textsize=20'
    # Ring Position
    lock_texts = '{} {}'.format(lock_right_text, lock_wrong_text)
    lock_pos = '--indpos={}:{}'.format(int(clock_x)+370, int(clock_y))
    # Ring size
    ring_size = 40
    lock_radius = '--radius {}'.format(ring_size)
    lock_stats = '{} {}'.format(lock_pos, lock_radius)
    indicator_outer_ring = "{} {} {} {} {} {} {} {}".format(lock_ring,
            lock_ring_w,
            lock_ring_v,
            lock_press,
            lock_del,
            lock_sep_color,
            lock_stats,
            lock_texts)
    # done
    indicator = "{} {}".format(indicator_inner, indicator_outer_ring)

    # background
    lock_pic = '-i /tmp/i3lock.png'

    print('lock: {}'.format(time.time() - lock_time))
    return "{} {} {} {} {}".format(lock_core, clock, datetime, indicator,
            lock_pic)


def lock():
    'Locks the System'
    command = lock_config()

    os.system(command)

def proc_exists(proc_name):
    proc_check = time.time()
    this_proc = "i3lock.py"
    proc_path = '/proc'
    proc = next(os.walk('{}/'.format(proc_path)))[1]
    counter = 0
    for process in proc:
        counter+=1
        cmdline_path = '{}/{}/cmdline'.format(proc_path,process)
        try:
            with open(cmdline_path, 'r') as cmd:
                proc_content = cmd.readline()
                proc_content = '{}: {}'.format(counter, proc_content)
                if proc_content: 
                    if proc_name in proc_content:
                        if 'xss-lock' not in proc_content:
                            if this_proc not in proc_content:
                                print('Process Exists: {}'.format(time.time() - proc_check))
                                return True
        except FileNotFoundError:
            pass
    print('Process Exists: {}'.format(time.time() - proc_check))
    return False



def is_running():
    return proc_exists("i3lock")


def log(start_time):
    write_mode = ''
    home = os.path.expanduser('~')
    log_file_path = "{}/{}".format(home, ".scripts/lock.log")

    if (os.path.isfile(log_file_path)):
        write_mode = 'a'
    else:
        write_mode = 'w'

    program_duration = time.time() - start_time
    with open(log_file_path, write_mode) as f:
        f.write("[{}] {} seconds runtime.\n".format(time.asctime(), program_duration))
        f.close()


if __name__ == '__main__':
    if not is_running():
        start_time = time.time()
        screenshot()
        pixelate()
        lock()
        log(start_time)
