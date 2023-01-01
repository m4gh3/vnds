module vnds

#include <nds.h>

pub const key_start = 1<<3

fn C.scanKeys()
fn C.keysDown() u32

[inline]
pub fn scan_keys()
{ C.scanKeys() }

[inline]
pub fn keys_down () u32
{ return C.keysDown() }
