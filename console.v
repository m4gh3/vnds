module vnds

#include <nds.h>

/*pub struct ConsoleFont
{
	gfx &u16
	pal &u16
	num_colors &u16

	bpp &u8

	ascii_offset u16
	num_chars u16
	convert_single_color bool
}*/

pub type ConsolePrint = fn (con voidptr, c u8 ) bool

/*pub struct PrintConsole
{

	font ConsoleFont

	font_bg_map &u16
	font_bg_gfx &u16

	map_base &u8
	gfx_base &u8

	bg_layer &u8
	bg_id int

	cursor_x int
	cursor_y int

	prev_cursor_x int
	prev_cursor_y int
	
	console_width int
	console_height int

	window_x int
	window_y int
	window_width int
	window_height int

	tab_size int

	font_char_offset u16
	font_cur_pal u16

	print_char &ConsolePrint

	console_initialized bool
	load_graphics bool

}*/

struct C.PrintConsole
type PrintConsole = C.PrintConsole

fn C.consoleDemoInit() &C.PrintConsole

[inline]
pub fn console_demo_init() &PrintConsole
{ return C.consoleDemoInit() }