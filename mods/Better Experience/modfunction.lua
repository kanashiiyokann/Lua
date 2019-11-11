
local modfunction={};

if TUNING==nil then TUNING={} end;
--最大化(99)物品堆叠大小
---maxStackableSize
---@param size number 物品堆叠大小
function modfunction:maxStackableSize(size)
    if (size < 1) then
        return;
    end
    TUNING.STACK_SIZE_SMALLITEM = size;
    TUNING.STACK_SIZE_MEDITEM = size;
    TUNING.STACK_SIZE_LARGEITEM = size;
end


---狗牙陷阱可堆叠，默认中等物品大小
function modfunction:trapTeethStackable ()
    AddPrefabPostInit("trap_teeth", function (inst)
        inst:AddComponent("stackable");
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM;
    end)
end

return modfunction ;