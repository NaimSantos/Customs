--Burning Pit Smithy
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Activate
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_ACTIVATE)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetCountLimit(1,id,EFFECT_COUNT_CODE_OATH)
	e0:SetTarget(s.target)
	c:RegisterEffect(e0)
	--Search
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,1))
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH+CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_SZONE)
	e1:SetCountLimit(1)
	e1:SetTarget(s.thtg)
	e1:SetOperation(s.thop)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsSetCard(0xf13) and c:IsType(TYPE_MONSTER) and c:IsFaceup()
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return true end
	local ct=Duel.GetMatchingGroupCount(s.filter,tp,LOCATION_MZONE+LOCATION_EXTRA,0,nil)
	if ct>0 and Duel.SelectYesNo(tp,aux.Stringid(id,0)) then
		e:SetCategory(CATEGORY_DAMAGE)
		e:SetOperation(s.activate)
		Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,1,1-tp,ct*100)
	else
		e:SetCategory(0)
		e:SetProperty(0)
		e:SetOperation(nil)
	end
end
function s.activate(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	local ct=Duel.GetMatchingGroupCount(s.filter,tp,LOCATION_MZONE+LOCATION_EXTRA,0,NIL)
	if ct>0 then
		Duel.Damage(1-tp,ct*100,REASON_EFFECT)
	end
end
function s.thfilter(c)
	return c:IsRace(RACE_PYRO) and c:IsLevelBelow(6) and c:IsAbleToHand()
end
function s.thtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.thfilter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
	Duel.SetPossibleOperationInfo(0,CATEGORY_DESTROY,e:GetHandler(),1,tp,0)
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,s.thfilter,tp,LOCATION_DECK,0,1,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
		if not g:GetFirst():IsSetCard(0xf13) then
			Duel.BreakEffect()
			Duel.Destroy(e:GetHandler(),REASON_EFFECT)
		end
	end
end