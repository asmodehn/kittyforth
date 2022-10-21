
import Pkg
Pkg.develop("TextUserInterfaces")

using TextUserInterfaces
using TextUserInterfaces.NCurses

load_ncurses()
stdscr = initscr()
clear()
printw("Hello World !")
refresh()
getch()
endwin()