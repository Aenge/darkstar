-----------------------------------
-- Area: Chamber of Oracles
-- Name: Shattering stars - Maat Fight
-- !pos -221 -24 19 206
-----------------------------------
local ID = require("scripts/zones/Chamber_of_Oracles/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        if player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.SHATTERING_STARS) == QUEST_ACCEPTED and player:getFreeSlotsCount() > 0 then
            player:addItem(4181)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4181)
        end
        local pjob = player:getMainJob()
        player:setVar("maatDefeated", pjob)
        local maatsCap = player:getVar("maatsCap")
        if bit.band(maatsCap, bit.lshift(1, pjob - 1)) ~= 1 then
            player:setVar("maatsCap", bit.bor(maatsCap, bit.lshift(1, pjob - 1)))
        end
        player:addTitle(dsp.title.MAAT_MASHER)
    end
end
