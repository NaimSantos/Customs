--[[
P.Effect: You can destroy 1 other "Burning Pit" card in your hand or field; draw 1 card, then if you have a "Burning Pit" monster in your other Pendulum Zone you can destroy 1 Pendulum Monster card on the field.
M.Effect: If this card is Normal or Special Summoned: You can add 1 "Burning Pit" Pendulum monster that is face-up in your Extra Deck to your hand. If this this card is sent to the GY as Fusion Material, you can add this card to your hand. You can only use each monster effect of "Burning Pit" once per turn.

TO BE SCRIPTED
]]

--Burning Pit Salamander
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	Pendulum.AddProcedure(c)
	
end
s.listed_series={0xf13}