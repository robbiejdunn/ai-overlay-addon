AIOverlay = { }


-- local _G = getglobal

local AIOverlay_Frame = CreateFrame("Frame", "AIOverlay", UIParent);
AIOverlay_Frame:SetPoint("TOPLEFT", UIParent);
AIOverlay_Frame:SetWidth(100);
AIOverlay_Frame:SetHeight(100);

AIOverlay_Frame.skeleton = AIOverlay_Frame:CreateTexture("AIOverlaySkeleton", "BORDER");
AIOverlay_Frame.skeleton:SetWidth(50);
AIOverlay_Frame.skeleton:SetHeight(100);
AIOverlay_Frame.skeleton:SetPoint("TOPLEFT", UIParent)
AIOverlay_Frame.skeleton:SetTexture(0, 0, 0);

AIOverlay_Frame.mana = AIOverlay_Frame:CreateTexture("AIOverlayMana", "BORDER");
AIOverlay_Frame.mana:SetWidth(50);
AIOverlay_Frame.mana:SetHeight(100);
AIOverlay_Frame.mana:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 50, 0);
AIOverlay_Frame.mana:SetTexture(0, 0, 0);

-- function AIOverlay:HealingHandler(self, a, ...)
--     DEFAULT_CHAT_FRAME:AddMessage("hello")
--     DEFAULT_CHAT_FRAME:AddMessage(event)
--     DEFAULT_CHAT_FRAME:AddMessage(a)
-- end

function AIOverlay:EventHandler(self, ...)  
    if event == "UNIT_MANA" then
        max_mana = UnitManaMax("player");
        curr_mana = UnitMana("player");
        pct_mana = 1 - (curr_mana / max_mana);
        AIOverlay_Frame.mana:SetTexture(pct_mana, pct_mana, pct_mana);
    else
        if UnitName("target") == "Splintertree Guard" then
            guardHp = UnitHealth("target");
            guardHpMax = UnitHealthMax("target");
            rgb = 1 - (guardHp / guardHpMax);
            AIOverlay_Frame.skeleton:SetTexture(rgb, rgb, rgb); 
        else
            AIOverlay_Frame.skeleton:SetTexture(1, 1, 1);
        end
    end
end

-- AIOverlay_Frame:RegisterEvent("COMBAT_TEXT_UPDATE")


AIOverlay_Frame:RegisterEvent("UNIT_COMBAT")
AIOverlay_Frame:RegisterEvent("PLAYER_TARGET_CHANGED");
AIOverlay_Frame:RegisterEvent("UNIT_MANA");
AIOverlay_Frame:SetScript("OnEvent", AIOverlay.EventHandler);
-- AIOverlay_Frame:SetScript("OnEvent", function(event, ...)
    -- if event == "COMBAT_TEXT_UDPATE" then
    -- DEFAULT_CHAT_FRAME:AddMessage("event")
    -- DEFAULT_CHAT_FRAME:AddMessage(event)

    -- local target = arg1
    -- DEFAULT_CHAT_FRAME:AddMessage("Target " .. target)
    -- local combType = arg2
    -- DEFAULT_CHAT_FRAME:AddMessage("Event type " .. combType)
    -- local crit = arg3
    -- DEFAULT_CHAT_FRAME:AddMessage("Crit? ")
    -- DEFAULT_CHAT_FRAME:AddMessage(crit)
    -- local overheal = arg4
    -- DEFAULT_CHAT_FRAME:AddMessage("Overheal ")
    -- DEFAULT_CHAT_FRAME:AddMessage(overheal)
    -- local heal = arg5
    -- DEFAULT_CHAT_FRAME:AddMessage("Heal ")
    -- DEFAULT_CHAT_FRAME:AddMessage(heal)

    -- -- DEFAULT_CHAT_FRAME:AddMessage(arg1)
    -- -- DEFAULT_CHAT_FRAME:AddMessage(arg2)
    -- -- DEFAULT_CHAT_FRAME:AddMessage(arg3)
    -- -- DEFAULT_CHAT_FRAME:AddMessage(arg4)
    -- -- DEFAULT_CHAT_FRAME:AddMessage(arg5)
    -- DEFAULT_CHAT_FRAME:AddMessage(arg6)
    -- DEFAULT_CHAT_FRAME:AddMessage(arg7)
    -- DEFAULT_CHAT_FRAME:AddMessage(arg8)
    -- DEFAULT_CHAT_FRAME:AddMessage(arg9)
    -- DEFAULT_CHAT_FRAME:AddMessage("finish")
        -- local a = select(1, ...)
        -- DEFAULT_CHAT_FRAME:AddMessage(a)
    -- end
-- end)

-- AIOverlay_Frame:RegisterEvent("UNIT_HEALTH");
-- AIOverlay_Frame:RegisterEvent("UNIT_MANA");
-- AIOverlay_Frame:RegisterEvent("UNIT_COMBAT");
-- AIOverlay_Frame:RegisterEvent("PLAYER_TARGET_CHANGED");

-- AIOverlay_Frame:SetScript("OnEvent", AIOverlay.EventHandler);
