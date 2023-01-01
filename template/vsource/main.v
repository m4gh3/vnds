import vnds

__global
( frame = u32(0) )

fn v_blank()
{ frame++ }

fn main()
{

	mut touch_xy := vnds.TouchPosition{}
	vnds.irq_set(vnds.irq_vblank, v_blank )

	vnds.console_demo_init()

	println("      Hello DS dev'rs\n")
	println("     \x1b[32mwww.devkitpro.org\n")
	println("   \x1b[32;1mwww.drunkencoders.com\x1b[39m")

	for
	{

		vnds.swi_wait_for_vblank()
		vnds.scan_keys()
		keys := vnds.keys_down()
		if keys & vnds.key_start != 0
		{ break }

		vnds.touch_read(touch_xy)

		println("\x1b[10;0HFrame = ${frame}")
		println("\x1b[16;0HTouch x = ${touch_xy.rawx}, ${touch_xy.px}" )
		println("Touch y = ${touch_xy.rawy}, ${touch_xy.py}" )

	}

}
