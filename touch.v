module vnds

#include <nds.h>

struct C.touchPosition
{
	pub:
		rawx	u16
		rawy	u16
		px		u16
		py		u16
		z1		u16
		z2		u16
}
pub type TouchPosition = C.touchPosition

fn C.touchRead(&C.touchPosition)

[inline]
pub fn touch_read(touch_pos &TouchPosition)
{ C.touchRead(touch_pos) }
