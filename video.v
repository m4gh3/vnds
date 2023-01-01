module vnds

#include <nds.h>

pub const display_bg0_active 		= u32(1<<8)
pub const enable_3d					= u32(1<<3)

pub enum VideoMode as u32
{

	mode_0_2d = 0x10000
	mode_1_2d
	mode_2_2d
	mode_3_2d
	mode_4_2d
	mode_5_2d
	mode_6_2d

	mode_0_3d = 0x10000 | 1 << 8 | 1 << 3
	mode_1_3d
	mode_2_3d
	mode_3_3d
	mode_4_3d
	mode_5_3d
	mode_6_3d

	mode_fifo = 3 << 16
	mode_fb0  = 0x00020000
	mode_fb1  = 0x00060000
	mode_fb2  = 0x000a0000
	mode_fb3  = 0x000e0000

}

pub enum VramTypeA as u32
{
	lcd 								= 0
	main_bg 							= 1
	main_bg_0x06000000					= 1 | (0 << 3)
	main_bg_0x06020000					= 1 | (1 << 3)
	main_bg_0x06040000					= 1 | (2 << 3)
	main_bg_0x06060000					= 1 | (3 << 3)
	main_sprite_0x06400000				= 2 | (0 << 3)
	main_sprite_0x06420000				= 2 | (1 << 3)
	texture								= 3
	texture_slot0						= 3 | (0 << 3)
	texture_slot1						= 3 | (1 << 3)
	texture_slot2						= 3 | (2 << 3)
	texture_slot3						= 3 | (3 << 3)
}

pub enum VramTypeB as u32
{
	lcd									= 0
	main_bg								= 1
	main_bg_0x06000000					= 1 | (0 << 3)
	main_bg_0x06020000					= 1 | (1 << 3)
	main_bg_0x06040000					= 1 | (2 << 3)
	main_bg_0x06060000					= 1 | (3 << 3)
	main_sprite_0x06400000				= 2 | (0 << 3)
	main_sprite_0x06420000				= 2 | (1 << 3)
	texture								= 3 | (1 << 3)
	texture_slot0						= 3 | (0 << 3)
	texture_slot1						= 3 | (1 << 3)
	texture_slot2						= 3 | (2 << 3)
	texture_slot3						= 3 | (3 << 3)
}

pub enum VramTypeC as u32
{
	lcd 							= 0
	main_bg 						= 1
	main_bg_0x06000000				= 1 | (0 << 3)
	main_bg_0x06020000				= 1 | (1 << 3)
	main_bg_0x06040000				= 1 | (2 << 3)
	main_bg_0x06060000				= 1 | (3 << 3)
	arm7							= 2
	arm7_0x06000000					= 2 | (0 << 3)
	arm7_0x06020000					= 2 | (1 << 3)
	sub_bg							= 4
	sub_bg_0x06200000				= 4 | (0 << 3)
	texture							= 3 | (2 << 3)
	texture_slot0					= 3 | (0 << 3)
	texture_slot1					= 3 | (1 << 3)
	texture_slot2					= 3 | (2 << 3)
	texture_slot3					= 3 | (3 << 3)
}

fn C.videoSetMode(u32)
fn C.videoSetModeSub(u32)

fn C.vramSetBankA(u32)
fn C.vramSetBankB(u32)
fn C.vramSetBankC(u32)

[inline]
pub fn video_set_mode(mode VideoMode)
{ C.videoSetMode(mode) }

[inline]
pub fn video_set_mode_sub(mode VideoMode)
{ C.videoSetModeSub(mode) }

[inline]
pub fn vram_set_bank_a(vram_type VramTypeA)
{ C.vramSetBankA(u32(vram_type)) }

[inline]
pub fn vram_set_bank_b(vram_type VramTypeB)
{ C.vramSetBankB(u32(vram_type)) }

[inline]
pub fn vram_set_bank_c(vram_type VramTypeC)
{ C.vramSetBankC(u32(vram_type)) }