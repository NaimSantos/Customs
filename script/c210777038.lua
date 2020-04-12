--Altar of the Earthbound Immortals
--Designed and scripted by Naim
--[[
(1) Each turn, 1 level 5 or higher "Earthbound Immortal" monster you would normal summon can be summoned without tribute. ok
(2) While you control an "Earthbound Immortal" monster your opponent cannot target this card with effects. ok
(3) If damage calculation is performed involving an "Earthbound Immortal" monster you control, at the end of the battle phase:
You can add 1 "Earthbound" card to your hand, from your deck or graveyard.
--]]
local s,id=GetID()
function s.initial_effect(c)
	--activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e1)
	--no tributes
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,0))
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_SUMMON_PROC)
	e2:SetRange(LOCATION_FZONE)
	e2:SetTargetRange(LOCATION_HAND,0)
	e2:SetCountLimit(1)
	e2:SetCondition(s.ntcon)
	e2:SetTarget(s.nttg)
	c:RegisterEffect(e2)
	--cannot be target
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e3:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	e3:SetRange(LOCATION_FZONE)
	e3:SetValue(aux.tgoval)
	e3:SetCondition(s.tgcon)
	c:RegisterEffect(e3)
end
s.listed_series={0x21}
function s.ntcon(e,c,minc)
	if c==nil then return true end
	return minc==0 and Duel.GetLocationCount(c:GetControler(),LOCATION_MZONE)>0
end
function s.nttg(e,c)
	return c:IsLevelAbove(5) and c:IsSetCard(0x21)
end
function s.cfilter(c)
	return c:IsFaceup() and c:IsSetCard(0x21)
end
function s.tgcon(e)
	return Duel.IsExistingMatchingCard(s.cfilter,e:GetHandlerPlayer(),LOCATION_MZONE,0,1,e:GetHandler())
end