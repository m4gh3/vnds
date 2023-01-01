module vnds

#include <nds.h>

[flag]
pub enum KeyPad as u32
{
	a
	b
	_select
	start
	right
	left
	up
	down
	r
	l
	x
	y
	touch
	lid
}

fn C.scanKeys()
fn C.keysDown() u32

[inline]
pub fn scan_keys()
{ C.scanKeys() }

[inline]
pub fn keys_down () KeyPad
{ unsafe{return KeyPad(C.keysDown())} }
