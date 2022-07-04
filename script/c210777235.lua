--Burning Pit Hound
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	Pendulum.AddProcedure(c)
	--Search 1 "Burning Pit" monster, then destroy itself
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH+CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_PZONE)
	e1:SetCountLimit(1)
	e1:SetTarget(s.thtg)
	e1:SetOperation(s.thop)
	c:RegisterEffect(e1)
	--Search 1 "Burning Pit" monster and 1 "Polymerization"
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetCondition(s.thpcon)
	e2:SetTarget(s.thptg)
	e2:SetOperation(s.thpop)
	c:RegisterEffect(e2)
	--Place itself in the Extra Deck if used as Fusion material
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,2))
	e3:SetCategory(CATEGORY_TOEXTRA)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e3:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_CARD_TARGET)
	e3:SetCode(EVENT_BE_MATERIAL)
	e3:SetCountLimit(1,{id,1})
	e3:SetCondition(s.selfedcon)
	e3:SetTarget(s.selfedtg)
	e3:SetOperation(s.selfedop)
	c:RegisterEffect(e3)
end
s.listed_series={0xf13}
s.listed_names={CARD_POLYMERIZATION,210777240}
function s.thfilter(c)
	return c:IsSetCard(0xf13) and c:IsMonster() and not c:IsCode(id) and c:IsAbleToHand()
end
function s.thtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.thfilter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,e:GetHandler(),1,tp,LOCATION_PZONE)
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,s.thfilter,tp,LOCATION_DECK,0,1,1,nil)
	if #g>0 and Duel.SendtoHand(g,nil,REASON_EFFECT)>0 then
		Duel.ConfirmCards(1-tp,g)
		Duel.BreakEffect()
		Duel.Destroy(e:GetHandler(),REASON_EFFECT)
	end
end
function s.thpcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsSummonType(SUMMON_TYPE_PENDULUM)
end
function s.polyfilter(c)
	return (c:IsCode(CARD_POLYMERIZATION) or c:IsCode(210777240)) and c:IsAbleToHand()
end
function s.thfilter2(c)
	return c:IsSetCard(0xf13) and c:IsMonster() and c:IsAbleToHand()
end
function s.thptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.thfilter2,tp,LOCATION_DECK,0,1,nil)
		and Duel.IsExistingMatchingCard(s.polyfilter,tp,LOCATION_DECK+LOCATION_GRAVE,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK+LOCATION_GRAVE)
end
function s.thpop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g2=Duel.SelectMatchingCard(tp,s.thfilter2,tp,LOCATION_DECK,0,1,1,nil)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g1=Duel.SelectMatchingCard(tp,aux.NecroValleyFilter(s.polyfilter),tp,LOCATION_DECK+LOCATION_GRAVE,0,1,1,nil)
	g2:Merge(g1)
	if #g2>0 then
		Duel.SendtoHand(g2,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g2)
	end
end
function s.tedop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,2))
	local g=Duel.SelectMatchingCard(tp,s.tedfilter,tp,LOCATION_DECK,0,1,1,nil)
	if #g>0 and Duel.SendtoExtraP(g,tp,REASON_EFFECT) and c:IsRelateToEffect(e) and aux.(tp) and Duel.SelectYesNo(tp,aux.Stringid(id,3)) then
		Duel.BreakEffect()
		Duel.MoveToField(c,tp,tp,LOCATION_PZONE,POS_FACEUP,true)
	end
end
function s.selfedcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return (r&REASON_FUSION)==REASON_FUSION and c:IsLocation(LOCATION_GRAVE)
end
function s.selfedtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_TOEXTRA,e:GetHandler(),1,tp,LOCATION_GRAVE)
end
function s.tpzfilter(c)
	return c:IsSetCard(0xf13) and c:IsType(TYPE_PENDULUM) and not c:IsForbidden()
end
function s.selfedop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) and Duel.SendtoExtraP(c,tp,REASON_EFFECT)>0 then
		if Duel.IsExistingMatchingCard(s.tpzfilter,tp,LOCATION_HAND,0,1,nil) and aux.(tp) and Duel.SelectYesNo(tp,aux.Stringid(id,3)) then
			Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,3))
			local g=Duel.SelectMatchingCard(tp,s.tpzfilter,tp,LOCATION_HAND,0,1,1,nil)
			if #g>0 then
				Duel.BreakEffect()
				Duel.MoveToField(g:GetFirst(),tp,tp,LOCATION_PZONE,POS_FACEUP,true)
			end
		end
	end
end
