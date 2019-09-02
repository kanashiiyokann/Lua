local function trapTeethStackable(inst)
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
end

local function maxStackableSize(size)
    if (size < 1) then
        return
    end
    TUNING.STACK_SIZE_SMALLITEM = size
    TUNING.STACK_SIZE_MEDITEM = size
    TUNING.STACK_SIZE_LARGEITEM = size
end
--最大化(99)物品堆叠大小
local size = GetModConfigData("stackable_size")
maxStackableSize(size)
--狗牙陷阱可堆叠，默认中等物品大小
local flag = GetModConfigData("teeth_trap_stackable")
if (flag == 1) then
    AddPrefabPostInit("trap_teeth", trapTeethStackable)
end


