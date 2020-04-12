--Buster Blader, the Destruction Sword Tamer
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--fusion procedure
	c:EnableReviveLimit()
	Fusion.AddProcMix(c,true,true,78193831,aux.FilterBoolFunctionEx(Card.IsRace,RACE_WARRIOR),aux.FilterBoolFunctionEx(Card.IsRace,RACE_DRAGON))
	--name change
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCode(EFFECT_CHANGE_CODE)
	e1:SetRange(LOCATION_MZONE+LOCATION_GRAVE)
	e1:SetValue(78193831)
	c:RegisterEffect(e1)
	--atkup
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e2:SetCode(EFFECT_UPDATE_ATTACK)
	e2:SetRange(LOCATION_MZONE)
	e2:SetValue(s.val)
	c:RegisterEffect(e2)
	--atkup
	local e3=e2:Clone()
	e3:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e3)
end
s.listed_names={78193831}
function s.filter(c)
	return c:IsRace(RACE_DRAGON) and (c:IsLocation(LOCATION_GRAVE) or c:IsLocation(LOCATION_REMOVED) or c:IsFaceup())
end
function s.val(e,c)
	return Duel.GetMatchingGroupCount(s.filter,0,LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,nil)*300
end