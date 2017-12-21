import datetime
import os

from PIL import Image


def screenshot():
    os.system('import -window root /tmp/i3lock.png')


def pixelate():
    # backgroundColor = (0,)*3
    pixelSize = 9

    image = Image.open('/tmp/i3lock.png')
    image_x = image.size[0]
    image_y = image.size[1]

    image = image.resize((int(image_x / pixelSize), int(image_y / pixelSize)),
                         Image.NEAREST)

    image_x = image.size[0]
    image_y = image.size[1]

    image = image.resize((image_x * pixelSize, image_y * pixelSize),
                         Image.NEAREST)
# image.load()

    #      for i in range(0,image.size[0],pixelSize):
    #          for j in range(0,image.size[1],pixelSize):
    #              for r in range(pixelSize):
    #                  pixel[i+r,j] = backgroundColor
    #                  pixel[i,j+r] = backgroundColor

    image.save('/tmp/i3lock.png')


def getResolution():
    image = Image.open('/tmp/i3lock.png')
    return image.size


def lock_config():
    'Generation of a customized lock command'

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
    clock_y = int(res_y * (83 / 100))

    date_x = left_margin
    date_y = clock_y + default_fontsize

    # clock config
    lock_clock_args = '-k'
    lock_clock_align = '--time-align 1 --date-align 1 --layout-align 1'
    clock = "{} {}".format(lock_clock_args, lock_clock_align)
    # time
    lock_time_pos = '--timepos="{}:{}"'.format(clock_x, clock_y)
    lock_time_size = '--timesize={}'.format(default_fontsize * 2)
    time = "{} {}".format(lock_time_pos, lock_time_size)
    # date
    lock_date_pos = '--datepos="{}:{}"'.format(date_x, date_y)
    lock_date_size = '--datesize={}'.format(default_fontsize)
    date = "{} {}".format(lock_date_pos, lock_date_size)
    # done
    datetime = "{} {}".format(time, date)

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

    indicator_outer_ring = "{} {} {} {} {} {}".format(lock_ring, lock_ring_w,
                                                      lock_ring_v, lock_press,
                                                      lock_del, lock_sep_color)
    # done
    indicator = "{} {}".format(indicator_inner, indicator_outer_ring)

    # background
    lock_pic = '-i /tmp/i3lock.png'

    return "{} {} {} {} {}".format(lock_core, clock, datetime, indicator,
                                   lock_pic)


def log_command(command):
    write_mode = ''
    home = os.path.expanduser('~')
    log_file_path = "{}/{}".format(home, ".scripts/lock.log")

    if (os.path.isfile(log_file_path)):
        write_mode = 'a'
    else:
        write_mode = 'w'

    with open(log_file_path, write_mode) as f:
        f.write("[{}] {}\n".format(str(datetime.datetime.now()), command))
        f.close()


def lock():
    'Locks the System'
    command = lock_config()

    log_command(command)

    os.system(command)


if __name__ == '__main__':
    screenshot()

    pixelate()

    lock()
