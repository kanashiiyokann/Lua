
local modfunction=require("modfunction")

---最大化(99)物品堆叠大小
local size=GetModConfigData("stackable_size");
modfunction:maxStackableSize(size);

---狗牙陷阱可堆叠，默认中等物品大小
if (GetModConfigData("teeth_trap_stackable") == 1) then
modfunction:trapTeethStackable();
end




