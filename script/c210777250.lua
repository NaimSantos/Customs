--Pyromania
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Destroy 1 FIRE monster and add 1 Pyro monster to the hand
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_DESTROY+CATEGORY_TOHAND+CATEGORY_SEARCH+CATEGORY_DAMAGE)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimi(1,id,EFFECT_COUNT_CODE_OATH)
	e1:SetTarget(s.target)
	e1:SetOperation(s.activate)
	c:RegisterEffect(e1)
end
function s.thfilter(c)
	return c:IsRace(RACE_PYRO) and c:IsAbleToHand()
end
function s.dstfilter(c)
	return c:IsAttribute(ATTRIBUTE_FIRE) and (c:IsFaceup() or c:IsLocation(LOCATION_HAND))
end
function s.destg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.dstfilter,tp,LOCATION_HAND+LOCATION_MZONE,0,1,nil)
		and Duel.IsExistingMatchingCard(s.thfilter,tp,LOCATION_DECK,0,1,nil) end
	local g=Duel.GetMatchingGroup(s.dstfilter,tp,LOCATION_HAND+LOCATION_MZONE,0,nil)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,tp,0)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,1,1-tp,500)
end
function s.desop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectMatchingCard(tp,s.dstfilter,tp,LOCATION_HAND+LOCATION_MZONE,0,1,1,nil)
	if #g>0 and Duel.Destroy(g,REASON_EFFECT)~=0 then
		local dg=Duel:GetOperatedGroup():GetFirst()
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
		local g=Duel.SelectMatchingCard(tp,s.thfilter,tp,LOCATION_DECK,0,1,1,nil)
		if #g>0 then
			Duel.SendtoHand(g,nil,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			if dg:IsRace(RACE_PYRO) then
				Duel.BreakEffect()
				Duel.Damage(1-tp,500,REASON_EFFECT)
			end
		end
	end
end