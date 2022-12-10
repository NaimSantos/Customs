--Specimen Extinction
--Scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TOGRAVE)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,id)
	e1:SetLabel(0)
	e1:SetCost(s.cost)
	e1:SetTarget(s.target)
	e1:SetOperation(s.activate)
	c:RegisterEffect(e1)
end
s.listed_series={SET_FOSSIL}
function s.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	e:SetLabel(100)
	return true
end
function s.filter1(c)
	return c:IsSetCard(SET_FOSSIL) and c:IsType(TYPE_FUSION)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then
		if e:GetLabel()~=100 then return false end
		e:SetLabel(0)
		return Duel.CheckReleaseGroupCost(tp,s.filter1,1,false,nil,nil)
			and Duel.GetFieldGroupCount(tp,0,LOCATION_DECK+LOCATION_EXTRA)>0
	end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RELEASE)
	local rg=Duel.SelectReleaseGroupCost(tp,s.filter1,1,1,false,nil,nil)
	e:SetLabel(rg:GetFirst():GetLevel())
	Duel.Release(rg,REASON_COST)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RACE)
	local typ=Duel.AnnounceRace(tp,1,RACE_ALL)
	Duel.SetTargetParam(typ)
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,1,0,LOCATION_DECK+LOCATION_EXTRA)
end
function s.tgfilter(c,typ)
	return c:IsType(TYPE_MONSTER) and c:IsAbleToGrave() and c:IsRace(typ)
end
function s.activate(e,tp,eg,ep,ev,re,r,rp)
	local lvl=e:GetLabel()
	local typ=Duel.GetChainInfo(0,CHAININFO_TARGET_PARAM)
	local g=Duel.GetMatchingGroup(s.tgfilter,tp,0,LOCATION_DECK+LOCATION_EXTRA,nil,typ)
	local num=math.min(lvl,#g)
	local sg=Duel.SelectMatchingCard(1-tp,s.tgfilter,tp,0,LOCATION_DECK+LOCATION_EXTRA,num,num,nil,typ)
	if #sg>0 then
		Duel.SendtoGrave(sg,REASON_RULE)
	end
	local og=Duel.GetOperatedGroup()
	if #og~=lvl then
		local diff=lvl-#og
		local g1=Duel.GetFieldGroup(tp,LOCATION_ONFIELD,LOCATION_ONFIELD)
		if #g1>0 and Duel.SelectYesNo(tp,aux.Stringid(id,1)) then
			Duel.BreakEffect()
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
			local dg=g1:Select(tp,1,diff,nil)
			Duel.Destroy(dg,REASON_EFFECT)
		end
	end
end