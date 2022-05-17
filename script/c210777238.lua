--Burning Pit Drago
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	Pendulum.AddProcedure(c,c)
	--Fusion Summon procedure
	Fusion.AddProcMix(c,true,true,aux.FilterBoolFunctionEx(Card.IsSetCard,0xf13),aux.FilterBoolFunctionEx(Card.IsType,TYPE_PENDULUM))
	--Add to hand 1 "Burning Pit" card from the GY 
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_TOHAND)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_PZONE)
	e1:SetCountLimit(1)
	e1:SetTarget(s.thtg)
	e1:SetOperation(s.thop)
	c:RegisterEffect(e1)
	--If Special Summoned, destroy 1 monster and apply effects
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,0))
	e2:SetCategory(CATEGORY_DESTROY+CATEGORY_RECOVER+CATEGORY_DAMAGE+CATEGORY_REMOVE+CATEGORY_HANDES)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetTarget(s.target)
	e2:SetOperation(s.operation)
	c:RegisterEffect(e2)
	--Place itself in the pendulum zone
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,5))
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e3:SetProperty(EFFECT_FLAG_DELAY)
	e3:SetCode(EVENT_LEAVE_FIELD)
	e3:SetCondition(s.pencon1)
	e3:SetTarget(s.pentg)
	e3:SetOperation(s.penop)
	c:RegisterEffect(e3)
	local e4=e3:Clone()
	e4:SetCode(EVENT_BE_MATERIAL)
	e4:SetCondition(s.pencon2)
	c:RegisterEffect(e4)
end
s.listed_series={0xf13}
function s.thfilter(c)
	return c:IsSetCode(0xf13) and c:IsAbleToHand()
end
function s.thtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.thfilter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_GRAVE)
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,aux.NecroValleyFilter(s.thfilter),tp,LOCATION_GRAVE,0,1,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(aux.TRUE,tp,LOCATION_MZONE,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,nil,1,tp,LOCATION_MZONE)
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,1,tp,0)
	Duel.SetPossibleOperationInfo(0,CATEGORY_DAMAGE,nil,1,1-tp,500)
	Duel.SetPossibleOperationInfo(0,CATEGORY_TOGRAVE,nil,1,1-tp,LOCATION_EXTRA)
	Duel.SetPossibleOperationInfo(0,CATEGORY_REMOVE,nil,1,1-tp,LOCATION_GRAVE)
	Duel.SetPossibleOperationInfo(0,CATEGORY_HANDES,nil,1,1-tp,1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local dg=Duel.SelectMatchingCard(tp,aux.TRUE,tp,LOCATION_MZONE,0,1,1,nil)
	if #dg>0 and Duel.Destroy(dg,REASON_EFFECT)>0 then
		local tc=Duel.GetOperatedGroup():GetFirst()
		local atk=tc:GetAttack()
		if atk==0 then return end
		Duel.BreakEffect()
		Duel.Recover(tp,atk/2,REASON_EFFECT)
		--If it was FIRE, inflict 500 damage
		if tc:IsAttribute(ATTRIBUTE_FIRE) and Duel.SelectYesNo(tp,aux.Stringid(id,2)) then
			Duel.BreakEffect()
			Duel.Damage(1-tp,500,REASON_EFFECT)
		end
		--If it was Pyro, send 1 card from opponent's Extra Deck
		local b1=Duel.GetMatchingGroup(aux.TRUE,tp,0,LOCATION_EXTRA,nil)
		if tc:IsRace(RACE_PYRO) and #b1>0 and Duel.SelectYesNo(tp,aux.Stringid(id,3)) then
			Duel.BreakEffect()
			local tg=b1:RandomSelect(tp,1)
			if #tg>0 then
				Duel.SendtoGrave(tg,REASON_EFFECT)
			end
		end
		--If it was Pendulum, banish 1 card from the opponent's GY
		local b2=Duel.GetFieldGroup(tp,0,LOCATION_HAND)
		if tc:IsType(TYPE_PENDULUM) and #b2>0 and Duel.SelectYesNo(tp,aux.Stringid(id,4)) then
			Duel.BreakEffect()
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
			local g=Duel.SelectMatchingCard(tp,Card.IsAbleToRemove,tp,0,LOCATION_GRAVE,1,1,nil)
			if #g>0 then
				Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
			end
		end
		--If it was Fusion, discard 1 random card from the opponent's hand
		local b3=Duel.GetFieldGroup(tp,0,LOCATION_HAND)
		if tc:IsType(TYPE_FUSION) and #b3>0 and Duel.SelectYesNo(tp,aux.Stringid(id,5)) then
			Duel.BreakEffect()
			local sg=b3:RandomSelect(1-tp,1)
			Duel.SendtoGrave(sg,REASON_EFFECT+REASON_DISCARD)
		end
	end
end
function s.pencon1(e,tp,eg,ep,ev,re,r,rp)
	return rp==1-tp and e:GetHandler():IsFaceup()
end
function s.pencon2(e,tp,eg,ep,ev,re,r,rp)
	return (r&REASON_FUSION)==REASON_FUSION and e:GetHandler():IsFaceup()
end
function s.pzcheck(tp)
	return Duel.CheckLocation(tp,LOCATION_PZONE,0) or Duel.CheckLocation(tp,LOCATION_PZONE,1)
end
function s.pentg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return s.pzcheck(tp) end
end
function s.penop(e,tp,eg,ep,ev,re,r,rp)
	if not s.pzcheck(tp) then return false end
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) then
		Duel.MoveToField(c,tp,tp,LOCATION_PZONE,POS_FACEUP,true)
	end
end