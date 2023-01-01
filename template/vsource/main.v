import m4gh3.vnds

__global
( frame = u32(0) )

fn v_blank()
{ frame++ }

fn main()
{

	mut touch := vnds.TouchPosition{}
	mut top_screen := vnds.PrintConsole{}
	mut bottom_screen := vnds.PrintConsole{}

	vnds.video_set_mode(vnds.VideoMode.mode_0_2d)
	vnds.video_set_mode_sub(vnds.VideoMode.mode_0_2d)

	vnds.vram_set_bank_a(vnds.VramTypeA.main_bg)
	vnds.vram_set_bank_c(vnds.VramTypeC.sub_bg)

	vnds.console_init(top_screen, 3, vnds.BgType.text4bpp, vnds.BgSize.t_256x256, 31, 0, true, true )
	vnds.console_init(bottom_screen, 3, vnds.BgType.text4bpp, vnds.BgSize.t_256x256, 31, 0, false, true )

	vnds.irq_set(vnds.irq_vblank, v_blank )

	vnds.console_select(top_screen)
	println("      Hello DS dev'rs\n")
	println("     \x1b[32mwww.devkitpro.org\n")
	println("   \x1b[32;1mwww.drunkencoders.com\x1b[39m")

	for
	{

		vnds.swi_wait_for_vblank()
		vnds.scan_keys()
		keys := vnds.keys_down()
		if keys.has(.start)
		{ break }

		vnds.touch_read(touch)

		vnds.console_select(bottom_screen)	
		println("\x1b[10;0HFrame = ${frame}")
		println("\x1b[16;0HTouch x = ${touch.rawx}, ${touch.px}" )
		println("Touch y = ${touch.rawy}, ${touch.py}" )

	}

}
