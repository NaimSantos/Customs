--Vylon Omnicrom
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Synchro Summon procedure
	c:EnableReviveLimit()
	Synchro.AddProcedure(c,aux.FilterBoolFunctionEx(Card.IsSetCard,0x30),1,1,Synchro.NonTuner(nil),1,99)
	--ATK increase
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(s.val)
	c:RegisterEffect(e1)
	--DEF increase
	local e2=e1:Clone()
	e2:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e2)
	--Destroy and banish
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,0))
	e3:SetCategory(CATEGORY_DESTROY+CATEGORY_REMOVE)
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCountLimit(1)
	e3:SetTarget(s.destg)
	e3:SetOperation(s.desop)
	c:RegisterEffect(e3)
	--Negate attack and equip
	local e4=Effect.CreateEffect(c)
	e4:SetDescription(aux.Stringid(id,1))
	e4:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e4:SetCategory(CATEGORY_EQUIP)
	e4:SetRange(LOCATION_MZONE)
	e4:SetCode(EVENT_ATTACK_ANNOUNCE)
	e4:SetCountLimit(1)
	e4:SetCondition(s.ngtcond)
	e4:SetTarget(s.ngtg)
	e4:SetOperation(s.ngop)
	c:RegisterEffect(e4)
	--Special summon
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(id,4))
	e5:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e5:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e5:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_CARD_TARGET+EFFECT_FLAG_DAMAGE_STEP)
	e5:SetCode(EVENT_LEAVE_FIELD)
	e5:SetCondition(s.spcon2)
	e5:SetTarget(s.sptg2)
	e5:SetOperation(s.spop2)
	c:RegisterEffect(e5)
end
s.listed_series={0x30}
function s.val(e,c)
	return c:GetEquipCount()*200
end
function s.eqpsfilter(c,e)
	return c:IsFaceup() and c:IsType(TYPE_EQUIP) and c:IsDestructable(e)
end
function s.destg(e,tp,eg,ep,ev,re,r,rp,chk)
	local rg=Duel.GetMatchingGroup(Card.IsAbleToRemove,tp,0,LOCATION_HAND+LOCATION_EXTRA,nil,tp)
	if chk==0 then return Duel.IsExistingMatchingCard(s.eqpsfilter,tp,LOCATION_ONFIELD,0,1,nil,e) and #rg>0 end
	local dg=Duel.GetMatchingGroup(s.eqpsfilter,tp,LOCATION_ONFIELD,0,e:GetHandler())
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,dg,nil,0,0)
	Duel.SetOperationInfo(0,CATEGORY_REMOVE,rg,nil,0,0)
end
function s.desop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectMatchingCard(tp,s.eqpsfilter,tp,LOCATION_ONFIELD,0,1,99,nil,e)
	if #g>0 and Duel.Destroy(g,REASON_EFFECT)~=0 then
		local ct=#(Duel.GetOperatedGroup())
		if Duel.GetMatchingGroupCount(Card.IsAbleToRemove,tp,0,LOCATION_HAND+LOCATION_EXTRA,nil,tp)>=ct then
			Duel.ConfirmCards(1-tp,Duel.GetMatchingGroup(Card.IsAbleToRemove,tp,0,LOCATION_HAND+LOCATION_EXTRA,nil,tp))
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
			local rg=Duel.SelectMatchingCard(tp,Card.IsAbleToRemove,tp,0,LOCATION_HAND+LOCATION_EXTRA,ct,ct,nil,tp)
			if #rg>0 then
				Duel.Remove(rg,POS_FACEUP,REASON_EFFECT)
				Duel.ShuffleExtra(1-tp)
				Duel.ShuffleHand(1-tp)
			end
		end
	end
end
function s.ngtcond(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetAttacker()
	local dc=Duel.GetAttackTarget()
	return (tc:IsSetCard(0x30) and tc:GetEquipCount()==0 and tc:IsControler(tp))
		or (dc and dc:IsFaceup() and dc:IsSetCard(0x30) and dc:GetEquipCount()==0 and dc:IsControler(tp))
end
function s.ngtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_EQUIP,nil,1,tp,LOCATION_DECK)
end
function s.eqpfilter(c,ec,tp)
	return c:IsType(TYPE_EQUIP) and c:IsSetCard(0x30) and c:CheckEquipTarget(ec) and c:CheckUniqueOnField(tp)
end
function s.ngop(e,tp,eg,ep,ev,re,r,rp)
	local tc,dc=Duel.GetAttacker(),Duel.GetAttackTarget()
	if not tc and not dc then return end
	local a
	if tc and tc:IsControler(tp) and tc:IsSetCard(0x30) then
		a=tc
	elseif dc and dc:IsControler(tp) and dc:IsSetCard(0x30) then
		a=dc
	end
	if Duel.NegateAttack() and Duel.GetLocationCount(tp,LOCATION_SZONE)>0
		and a and Duel.IsExistingMatchingCard(s.eqpfilter,tp,LOCATION_DECK,0,1,nil,a,tp) and Duel.SelectYesNo(tp,aux.Stringid(id,2)) then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,3))
		local g=Duel.SelectMatchingCard(tp,s.eqpfilter,tp,LOCATION_DECK,0,1,1,nil,a,tp)
		if #g>0 then
			Duel.Equip(tp,g:GetFirst(),a)
		end
	end
end
function s.spcon2(e,tp,eg,ep,ev,re,r,rp)
	return rp==1-tp and e:GetHandler():IsPreviousControler(tp)
end
function s.spfilter(c,e,tp)
	return c:IsSetCard(0x30) and c:IsCanBeSpecialSummoned(e,0,tp,false,false,POS_FACEUP_DEFENSE) and not c:IsCode(id)
end
function s.sptg2(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and s.spfilter(chkc,e,tp) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingTarget(s.spfilter,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,s.spfilter,tp,LOCATION_GRAVE,0,1,1,nil,e,tp)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,g,1,0,0)
end
function s.thfilter(c)
	return c:IsSetCard(0x30) and c:IsAbleToHand()
end
function s.spop2(e,tp,eg,ep,ev,re,r,rp)
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	local g=Duel.GetTargetCards(e)
	if g and ft>0 and Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP_DEFENSE)~=0 then
		local sg=Duel.GetMatchingGroup(aux.NecroValleyFilter(s.thfilter),tp,LOCATION_GRAVE,0,nil)
		if not g:GetFirst():IsType(TYPE_SYNCHRO) and #sg>0 and Duel.SelectYesNo(tp,aux.Stringid(id,5)) then
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
			sg=sg:Select(tp,1,1,nil)
			Duel.BreakEffect()
			Duel.SendtoHand(sg,nil,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,sg)
			Duel.ShuffleDeck(tp)
		end
	end
end