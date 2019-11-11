
local assets =
{
    Asset("ANIM", "anim/lotus_umbrella.zip"),
    Asset("ANIM", "anim/swap_lotus_umbrella.zip"),
    Asset("ATLAS", "images/inventoryimages/lotus_umbrella.xml"),
}

local function initializer()
    local inst = CreateEntity() -- 创建实体

    inst.entity:AddTransform() -- 添加变换组件
    inst.entity:AddAnimState() -- 添加动画组件
    inst.entity:AddNetwork() -- 添加网络组件

    MakeInventoryPhysics(inst) -- 添加物理属性

    inst.AnimState:SetBank("lotus_umbrella") -- 设置动画的Bank，也就是动画内容组合
    inst.AnimState:SetBuild("lotus_umbrella") -- 设置动画的Build，也就是外表材质
    inst.AnimState:PlayAnimation("idle") -- 设置生成时应该播放的动画

    inst:AddTag("nopunch")
    inst:AddTag("umbrella")

    inst:AddTag("waterproofer")
    ---------------------- 主客机分界代码 -------------------------
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    ---------------------------------------------------------------

    ---------------------- 通用组件 -------------------------
    -- 可检查
    inst:AddComponent("inspectable")
    -- 可放入物品栏
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/lotus_umbrella.xml" -- 设置物品栏图片文档。官方内置的物体有默认的图片文档，所以不需要设置这一项，但自己额外添加的物体使用自己的图片文档，就应该设置这一项

    -- 可装备
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onEquip) -- 设置装备时的回调函数
    inst.components.equippable:SetOnUnequip(onRelieve) -- 设置卸载时的回调函数

    ---------------------- 核心组件 -------------------------
    --防雨
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_HUGE) -- 设置防雨系数
    --遮阳
    inst:AddComponent("insulator")
    inst.components.insulator:SetSummer() -- 设置只能防热
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED) -- 设置防热系数


    ---------------------- 辅助组件 -------------------------
    -- 可腐烂的组件，耐久会随时间推移而自然地降低，常用于食物
    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED) -- 设置耐久度
    inst.components.perishable:StartPerishing() -- 当物体生成的时候就开始腐烂
    inst.components.perishable:SetOnPerishFn(onPerished) -- 设置耐久度归零的回调函数
    inst:AddTag("show_spoilage") -- 添加一个标签，与腐败有关的，你可以试试去掉，看看有什么效果

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME) -- 系统函数，设置物体可以被点燃
    MakeSmallPropagator(inst) -- 系统函数，设置物体可以传播明火

    return inst
end


--人物装备时
local function onEquip(inst,owner)
    owner.AnimState:Hide("ARM_normal");
    owner.AnimState:Show("ARM_carry");
    owner.DynamicShadow:SetSize(1.7, 1) -- 设置阴影大小，你可以仔细观察装备荷叶伞时，人物脚下的阴影变化
end

--卸下时
local function onRelieve(inst,owner)
    owner.AnimState:Hide("ARM_carry");
    owner.AnimState:Show("ARM_normal");
    owner.DynamicShadow:SetSize(1.3,0.6);
end

--腐烂后移除
local function onPerished(inst)
    inst:Remove();
end

return Prefab("common/inventory/lotus_umbrella",initializer,assets);