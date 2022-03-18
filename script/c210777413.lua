--Polychimera Cerberus
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	c:SetUniqueOnField(1,0,id)
	c:EnableReviveLimit()
	Fusion.AddProcMixN(c,true,true,s.ffilter,3)
end
function s.ffilter(c,fc,sumtype,tp,sub,mg,sg)
	return c:IsRace(RACE_FIEND,fc,sumtype,tp) and c:HasLevel() and (not sg or not sg:IsExists(s.fusfilter,1,c,c:GetLevel(fc,sumtype,tp),fc,sumtype,tp))
end
function s.fusfilter(c,lvl,fc,sumtype,tp)
	return c:IsLevel(lvl) and not c:IsHasEffect(511002961)
end