--Burning Pit Wyvern
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	Pendulum.AddProcedure(c,c)
	--Fusion Summon procedure
	Fusion.AddProcFun2(c,aux.FilterBoolFunction(Card.IsAttribute,ATTRIBUTE_FIRE),aux.FilterBoolFunction(Card.IsRace,RACE_PYRO),true)
	--If Special Summoned, send 1 "Burning Pit" to GY and destroy 1 card on the field
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_TOGRAVE+CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetProperty(EFFECT_FLAG_DELAY)
	e1:SetCountLimit(1,{id,1})
	e1:SetTarget(s.tgtg)
	e1:SetOperation(s.tgop)
	c:RegisterEffect(e1)
	--Shuffle a card into the Deck then place a "Burning Pit" monster in the Pendulum Zone
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetCategory(CATEGORY_TODECK)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1,id)
	e2:SetTarget(s.tdtg)
	e2:SetOperation(s.tdop)
	c:RegisterEffect(e2)
	--Add 1 "Polymerization" or Burning Pit Fusion
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,2))
	e3:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetRange(LOCATION_PZONE)
	e3:SetCountLimit(1)
	e3:SetTarget(s.thtg)
	e3:SetOperation(s.thop)
	c:RegisterEffect(e3)
	--Place itself in the pendulum zone
	local e4=Effect.CreateEffect(c)
	e4:SetDescription(aux.Stringid(id,5))
	e4:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e4:SetProperty(EFFECT_FLAG_DELAY)
	e4:SetCode(EVENT_LEAVE_FIELD)
	e4:SetCondition(s.pencon1)
	e4:SetTarget(s.pentg)
	e4:SetOperation(s.penop)
	c:RegisterEffect(e4)
	local e5=e4:Clone()
	e5:SetCode(EVENT_BE_MATERIAL)
	e5:SetCondition(s.pencon2)
	c:RegisterEffect(e5)
end
s.listed_series={0xf13}
s.listed_names={CARD_POLYMERIZATION,210777240}
function s.tgfilter(c)
	return c:IsSetCard(0xf13) and c:IsMonster() and c:IsAbleToGrave()
end
function s.tgtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.tgfilter,tp,LOCATION_EXTRA,0,1,nil)
		and Duel.GetFieldGroupCount(tp,LOCATION_ONFIELD,LOCATION_ONFIELD)>0 end
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,1,tp,LOCATION_EXTRA)
	local g=Duel.GetFieldGroup(tp,LOCATION_ONFIELD,LOCATION_ONFIELD)
	if #g>0 then
		Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,0,0)
	end
end
function s.tgop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,s.tgfilter,tp,LOCATION_EXTRA,0,1,1,nil)
	if #g>0 and Duel.SendtoGrave(g,REASON_EFFECT)>0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
		local d=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
		if #d>0 then
			Duel.BreakEffect()
			Duel.Destroy(d,REASON_EFFECT)
		end
	end
end
function s.tdfilter(c)
	return c:IsSetCard(0xf13) and c:IsMonster() and c:IsFaceup() and c:IsAbleToDeck()
end
function s.tdtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return Duel.IsExistingMatchingCard(s.tdfilter,tp,LOCATION_EXTRA,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TODECK,nil,1,tp,LOCATION_EXTRA)
end
function s.tpzfilter(c)
	return c:IsSetCard(0xf13) and c:IsType(TYPE_PENDULUM) and not c:IsForbidden()
		and (c:IsLocation(LOCATION_HAND+LOCATION_GRAVE)	or (c:IsLocation(LOCATION_REMOVED) and c:IsFaceup()))
end
function s.pzcheck(tp)
	return Duel.CheckLocation(tp,LOCATION_PZONE,0) or Duel.CheckLocation(tp,LOCATION_PZONE,1)
end
function s.tdop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TODECK)
	local g=Duel.SelectMatchingCard(tp,s.tdfilter,tp,LOCATION_EXTRA,0,1,1,nil)
	if #g>0 and Duel.SendtoDeck(g,tp,LOCATION_DECKSHF,REASON_EFFECT)>0 and Duel.GetOperatedGroup():GetFirst():IsLocation(LOCATION_DECK) then
		if Duel.IsExistingMatchingCard(s.tpzfilter,tp,LOCATION_HAND+LOCATION_GRAVE+LOCATION_REMOVED,0,1,nil) and s.pzcheck(tp) and Duel.SelectYesNo(tp,aux.Stringid(id,3)) then
			Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,4))
			local tfg=Duel.SelectMatchingCard(tp,aux.NecroValleyFilter(s.tpzfilter),tp,LOCATION_HAND+LOCATION_GRAVE+LOCATION_REMOVED,0,1,1,nil)
			if #tfg>0 then
				Duel.BreakEffect()
				Duel.MoveToField(tfg:GetFirst(),tp,tp,LOCATION_PZONE,POS_FACEUP,true)
			end
		end
	end
end
function s.thfilter(c)
	return c:IsCode(CARD_POLYMERIZATION,210777240) and c:IsAbleToHand()
end
function s.thtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.thfilter,tp,LOCATION_DECK+LOCATION_GRAVE,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK+LOCATION_GRAVE)
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,aux.NecroValleyFilter(s.thfilter),tp,LOCATION_DECK+LOCATION_GRAVE,0,1,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end
function s.pencon1(e,tp,eg,ep,ev,re,r,rp)
	return rp==1-tp and e:GetHandler():IsFaceup()
end
function s.pencon2(e,tp,eg,ep,ev,re,r,rp)
	return (r&REASON_FUSION)==REASON_FUSION and e:GetHandler():IsFaceup()
end
function s.pentg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return s.pzcheck(tp) end
end
function s.penop(e,tp,eg,ep,ev,re,r,rp)
	if not Duel.CheckLocation(tp,LOCATION_PZONE,0) and not Duel.CheckLocation(tp,LOCATION_PZONE,1) then return false end
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) then
		Duel.MoveToField(c,tp,tp,LOCATION_PZONE,POS_FACEUP,true)
	end
end
