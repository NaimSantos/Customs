--Call of Hermos
--designed by Xeno Disturbia#5235
--scripted by Naim, credits to Larry126 for the fixes
local s,id=GetID()
function s.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,id)
	e1:SetCost(s.cost)
	e1:SetTarget(s.target)
	e1:SetOperation(s.activate)
	e1:SetLabel(0)
	c:RegisterEffect(e1)
end
function s.hermfilter(c) --this is hermos
	return c:IsCode(46232525) and c:IsAbleToHand()
end
function s.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	e:SetLabel(100)
	if chk==0 then return true end
end
function s.tohandfilter(c,tc,e,tp) --the thing that should be added (this is a simplification)
	return c:GetOriginalLevel()==tc:GetOriginalLevel()
		and c:GetOriginalRace()==tc:GetOriginalRace()
		and c:GetOriginalAttribute()==tc:GetOriginalAttribute()
		and c:GetBaseAttack()==tc:GetBaseAttack()
		and c:GetBaseDefense()==tc:GetBaseDefense()
end
function s.exfilter(c,e,tp) --the thing in the ED that can be revealed
	return c:IsCode(19747827,83743222,46354113,10960419) and c:IsLocation(LOCATION_EXTRA)--cards that can only be summoned with Hermos
		and Duel.IsExistingMatchingCard(s.tohandfilter,tp,LOCATION_DECK+LOCATION_GRAVE,0,1,nil,c,e,tp)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then
		if e:GetLabel()~=100 then return false end
		e:SetLabel(0)
		return e:IsHasType(EFFECT_TYPE_ACTIVATE) and Duel.IsExistingMatchingCard(s.exfilter,tp,LOCATION_EXTRA,0,1,nil,e,tp) 
		and Duel.IsExistingMatchingCard(Card.IsDiscardable,tp,LOCATION_HAND,0,1,e:GetHandler())
		and Duel.IsExistingMatchingCard(s.hermfilter,tp,LOCATION_DECK+LOCATION_GRAVE,0,1,nil)
	end
	e:SetLabel(0)
	Duel.DiscardHand(tp,Card.IsDiscardable,1,1,REASON_COST+REASON_DISCARD,nil)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,2,tp,LOCATION_DECK+LOCATION_GRAVE)
	local g=Duel.SelectMatchingCard(tp,s.exfilter,tp,LOCATION_EXTRA,0,1,1,nil,e,tp)
	Duel.ConfirmCards(1-tp,g)
	e:SetLabelObject(g:GetFirst())
	Duel.SetTargetCard(g)
end
function s.activate(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	tc=e:GetLabelObject()
	local cg=Duel.SelectMatchingCard(tp,s.tohandfilter,tp,LOCATION_DECK+LOCATION_GRAVE,0,1,1,nil,tc,e,tp)
	if cg:GetCount()>0 and Duel.SendtoHand(cg,nil,REASON_EFFECT)>0 then
		Duel.ConfirmCards(1-tp,cg)
		local g=Duel.SelectMatchingCard(tp,s.hermfilter,tp,LOCATION_DECK+LOCATION_GRAVE,0,1,1,nil)
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end
