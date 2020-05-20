--Destruction Sword Requisition Fusion
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	c:RegisterEffect(Fusion.CreateSummonEff(c,nil,s.matfilter,s.fextra))
end
s.listed_names={78193831}
s.listed_series={0xd6,0xd7}
function s.matfilter(c)
	return c:IsSetCard(0xd6) or c:IsSetCard(0xd7) or c:IsRace(RACE_DRAGON) or c:IsRace(RACE_WARRIOR)
end
function s.fextra(e,tp,mg)
	return Duel.GetMatchingGroup(aux.FilterFaceupFunction(s.matfilter),tp,0,LOCATION_ONFIELD,nil)
end