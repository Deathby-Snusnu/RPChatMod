local _, addon = ...

RPChatMod = addon
addon.ready = false

SLASH_RPCHATMOD1 = "/rc"
SlashCmdList["RPCHATMOD"] = addon.HandleCommand

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function()
    addon.InitializeDatabase()
    addon.ready = true
    print("|cffc79c6eRP Chat Mod|r geladen. Befehl: |cffffd100/rc|r")
end)
