module vnds

#include <nds.h>

pub const irq_vblank = 1

pub type VoidFn = fn ()

fn C.irqSet(u32, VoidFn )
fn C.swiWaitForVBlank()

[inline]
pub fn irq_set(irq u32, handler VoidFn )
{ C.irqSet(irq, handler) }

[inline]
pub fn swi_wait_for_vblank()
{ C.swiWaitForVBlank() }