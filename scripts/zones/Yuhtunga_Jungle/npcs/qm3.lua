-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: ??? (Beastmen Treasure qm3/chest0)
--   ID: 17281642
-- !pos 83.726 -1.212 448.329 123
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")

function onTrigger(player,npc)
    dsp.bmt.handleQmOnTrigger(player,npc,ID.text.SOMETHING_IS_BURIED_HERE,ID.text.NOTHING_OUT_OF_ORDINARY,ID.npc.BEASTMEN_TREASURE)
end

function onTrade(player,npc,trade)
    dsp.bmt.handleQmOnTrade(player,npc,trade,ID.npc.BEASTMEN_TREASURE)
end

function onEventFinish(player,csid)
    dsp.bmt.handleQmOnEventFinish(player,csid)
end
