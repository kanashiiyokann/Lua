
-- This information tells other players more about the mod
name = "Better Experience"
description = ""
author = " "
version = "1.0.0"

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = false

configuration_options={
    {
        name = "teeth_trap_stackable",
        label = "狗牙陷阱可堆叠",
     --   hover = "狗牙陷阱可堆叠",
        options =
        {
            {description="否", data = 0},
            {description="是", data = 1}
        },
        default = 1,
    },
    {
        name = "stackable_size",
        label = "最大堆叠数量",
        --   hover = "狗牙陷阱可堆叠",
        options =
        {
            {description="不修改", data = -1},
            {description="99", data = 99},

        },
        default = 99,
    }
}