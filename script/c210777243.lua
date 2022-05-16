--The Burning Pit
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Activate
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_ACTIVATE)
	e0:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e0)
	--Increase ATK/DEF
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_FZONE)
	e1:SetTargetRange(LOCATION_MZONE,0)
	e1:SetTarget(aux.TargetBoolFunction(Card.IsRace,RACE_PYRO))
	e1:SetValue(300)
	c:RegisterEffect(e1)
	--Increase DEF
	local e2=e1:Clone()
	e2:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e2)
	--Draw then destroy
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,0))
	e3:SetCategory(CATEGORY_DRAW+CATEGORY_DESTROY)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e3:SetCode(EVENT_SPSUMMON_SUCCESS)
	e3:SetProperty(EFFECT_FLAG_DELAY)
	e3:SetRange(LOCATION_FZONE)
	e3:SetCountLimit(1)
	e3:SetCondition(s.condition)
	e3:SetTarget(s.target)
	e3:SetOperation(s.operation)
	c:RegisterEffect(e3)
end
function s.fusfilter(c)
	return c:IsSummonType(SUMMON_TYPE_FUSION) and c:IsType(TYPE_FUSION)
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	return eg and eg:IsExists(s.fusfilter,1,nil)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsPlayerCanDraw(tp,1) end
	Duel.SetTargetPlayer(tp)
	Duel.SetTargetParam(1)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)
	Duel.SetPossibleOperationInfo(0,CATEGORY_HANDES,nil,0,tp,1)
	Duel.SetPossibleOperationInfo(0,CATEGORY_DESTROY,nil,0,PLAYER_ALL,LOCATION_ONFIELD)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	if Duel.Draw(p,d,REASON_EFFECT)>0 and eg:IsExists(Card.IsRace,1,nil,RACE_PYRO) then
		local tg=Duel.GetMatchingGroup(Card.IsAbleToGrave,tp,LOCATION_HAND,0,nil)
		local dg=Duel.GetMatchingGroup(aux.TRUE,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,nil)
		if #tg>0 and #dg>0 and Duel.SelectYesNo(tp,aux.Stringid(id,1)) then
			Duel.BreakEffect()
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
			local sg=tg:Select(tp,1,1,nil)
			if Duel.SendtoGrave(sg,REASON_EFFECT)>0 then
				Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
				local tc=Duel.SelectMatchingCard(tp,aux.TRUE,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
				Duel.HintSelection(tc)
				Duel.Destroy(tc,REASON_EFFECT)
			end
		end
	end
end