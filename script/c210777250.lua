--Dragon Devouring Virus
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Activate
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_ACTIVATE)
	e0:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e0)
	--All monsters become Dragon
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetRange(LOCATION_FZONE)
	e1:SetTargetRange(LOCATION_MZONE+LOCATION_GRAVE,LOCATION_MZONE+LOCATION_GRAVE)
	e1:SetCode(EFFECT_CHANGE_RACE)
	e1:SetValue(RACE_ZOMBIE)
	e1:SetTarget(s.tg)
	c:RegisterEffect(e1)
end
function s.tg(e,c)
	if c:GetFlagEffect(1)==0 then
		c:RegisterFlagEffect(1,0,0,0)
		local eff
		if c:IsLocation(LOCATION_MZONE) then
			eff={Duel.GetPlayerEffect(c:GetControler(),EFFECT_NECRO_VALLEY)}
		else
			eff={c:GetCardEffect(EFFECT_NECRO_VALLEY)}
		end
		c:ResetFlagEffect(1)
		for _,te in ipairs(eff) do
			local op=te:GetOperation()
			if not op or op(e,c) then return false end
		end
	end
	return true
end

--[[
Dragon Devouring Virus
Field Spell Card
All monsters on the field and in the GYs become Zombie monsters.

Dragon Devouring Plague
Normal Trap Card
Destroy all Dragon monsters on the field during the End Phase of this turn.
You can banish this card from the GY, then target 1 monster in your opponent's GY; Special Summon 1 "Dragon Devouring" monster from your GY with a level lower than that target's level/rank/link and if you do, banish that target. You can only use each effect of "Dragon Devouring Plague" once per turn.

Dragon Devouring Plague
Normal Trap Card
Destroy all Dragon monsters on the field during the End Phase of this turn.
You can banish this card from the GY, then target 1 Dragon in your opponent's GY; Special Summon 1 "Dragon Devouring" monster from your GY with a level lower than that target's level/rank/link and if you do, banish that target. You can only use each effect of "Dragon Devouring Plague" once per turn.

Dragon Devouring Slumber
Quick Play Spell
Change all face-up Dragon monsters to face-down defense position, then if there are any face-up Dragon monsters on the field, return them to the hand.
You can banish this card from the GY, then target 1 Dragon in your opponent's GY; Special Summon 1 "Dragon Devouring" monster from your Deck with a level lower than that target's level/rank/link, but negate its effects, then shuffle that target into the Deck.

