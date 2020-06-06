--Vylon Psy
--Odesigned and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--link summon
	c:EnableReviveLimit()
	Synchro.AddProcedure(c,aux.FilterBoolFunctionEx(Card.IsSetCard,0x30),1,1,Synchro.NonTuner(nil),1,99)
	--Equip
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_EQUIP)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_CARD_TARGET)
	e1:SetCountLimit(1,id)
	e1:SetCondition(s.eqcon)
	e1:SetTarget(s.eqtg)
	e1:SetOperation(s.eqop)
	c:RegisterEffect(e1)
	--destroy/negate
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetCategory(CATEGORY_DESTROY+CATEGORY_DISABLE)
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1,id+100)
	e2:SetHintTiming(0,TIMINGS_CHECK_MONSTER_E)
	e2:SetCost(s.descost)
	e2:SetTarget(s.destg)
	e2:SetOperation(s.desop)
	c:RegisterEffect(e2)
end
s.listed_series={0x30}
function s.eqcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsSummonType(SUMMON_TYPE_SYNCHRO)
end
function s.filter(c)
	return c:IsFaceup() and c:IsSetCard(0x30)
end
function s.eqfilter(c,tp)
	return c:CheckUniqueOnField(tp) and not c:IsForbidden() and c:IsSetCard(0x30)
		and ((c:IsType(TYPE_MONSTER) and c:IsLocation(LOCATION_HAND+LOCATION_GRAVE))
			or (c:IsType(TYPE_EQUIP) and c:IsLocation(LOCATION_DECK)))
end
function s.eqtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and s.filter(chkc) and chkc~=c end
	if chk==0 then return Duel.IsExistingTarget(s.filter,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil)
		and Duel.GetLocationCount(tp,LOCATION_SZONE)>0
		and Duel.IsExistingMatchingCard(s.eqfilter,tp,LOCATION_DECK+LOCATION_HAND+LOCATION_GRAVE,0,1,nil,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,s.filter,tp,LOCATION_MZONE,LOCATION_MZONE,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_EQUIP,nil,1,tp,LOCATION_DECK)
end
function s.eqop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsFacedown() or not tc:IsRelateToEffect(e) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_EQUIP)
	local ec=Duel.SelectMatchingCard(tp,s.eqfilter,tp,LOCATION_DECK,0,1,1,nil,tp):GetFirst()
	if ec then
		s.equipop(tc,e,tp,ec)
	end
end
function s.equipop(c,e,tp,tc)
	if tc:IsType(TYPE_SPELL) then
		return Duel.Equip(tp,tc,c)
	end
	if not aux.EquipByEffectAndLimitRegister(c,e,tp,tc,nil,true) then return end
	--atkup
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_EQUIP)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(500)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD)
	tc:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_UPDATE_DEFENSE)
	tc:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetCode(EFFECT_EQUIP_LIMIT)
	e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e3:SetValue(s.eqlimit)
	e3:SetReset(RESET_EVENT+RESETS_STANDARD)
	tc:RegisterEffect(e3)
end
function s.eqlimit(e,c)
	return c:GetControler()==e:GetHandlerPlayer()
end
function s.tgfilter(c)
	return c:IsFaceup() and c:IsType(TYPE_EQUIP) and c:IsAbleToGraveAsCost()
end
function s.descost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.tgfilter,tp,LOCATION_SZONE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,s.tgfilter,tp,LOCATION_SZONE,0,1,1,nil)
	if g:GetFirst():GetEquipTarget()==e:GetHandler() then
		e:SetLabel(1)
	else
		e:SetLabel(0)
	end
	Duel.SendtoGrave(g,REASON_COST)
end
function s.destg(e,tp,eg,ep,ev,re,r,rp,chk)
	local dg1=Duel.GetMatchingGroup(aux.TRUE,tp,0,LOCATION_ONFIELD,nil)
	local dg2=Duel.GetMatchingGroup(aux.disfilter1,tp,0,LOCATION_ONFIELD,nil)
	if chk==0 then return #dg1>0 or #dg2>0 end
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,dg1,1,0,0)
	Duel.SetOperationInfo(0,CATEGORY_DISABLE,dg2,1,0,0)
end
function s.desop(e,tp,eg,ep,ev,re,r,rp)
	local dg1=Duel.GetMatchingGroup(aux.TRUE,tp,0,LOCATION_ONFIELD,nil)
	local dg2=Duel.GetMatchingGroup(aux.disfilter1,tp,0,LOCATION_ONFIELD,nil)
	local opt
	if #dg1>0 and #dg2>0 and e:GetLabel()==1 then
		opt=Duel.SelectOption(tp,aux.Stringid(id,2),aux.Stringid(id,3),aux.Stringid(id,4))
	elseif #dg1>0 and #dg2>0 and e:GetLabel()==0 then
		opt=Duel.SelectOption(tp,aux.Stringid(id,2),aux.Stringid(id,3))
	elseif #dg1>0 and #dg2==0 then
		opt=Duel.SelectOption(tp,aux.Stringid(id,2))
	elseif #dg2>0 and #dg1==0 then
		opt=Duel.SelectOption(tp,aux.Stringid(id,3))+1
	end
	if opt==0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_NEGATE)
		local sg=dg2:Select(tp,1,1,nil)
		Duel.HintSelection(sg)
		Duel.NegateRelatedChain(sg:GetFirst(),RESET_TURN_SET)
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_DISABLE)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		sg:GetFirst():RegisterEffect(e1)
		local e2=Effect.CreateEffect(e:GetHandler())
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetCode(EFFECT_DISABLE_EFFECT)
		e2:SetValue(RESET_TURN_SET)
		e2:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		sg:GetFirst():RegisterEffect(e2)
	elseif opt==1 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
		local sg=dg1:Select(tp,1,1,nil)
		Duel.HintSelection(sg)
		Duel.Destroy(sg,REASON_EFFECT)
	elseif opt==2 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_NEGATE)
		local dsg=dg2:Select(tp,1,1,nil)
		Duel.HintSelection(dsg)
		Duel.NegateRelatedChain(dsg:GetFirst(),RESET_TURN_SET)
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_DISABLE)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		dsg:GetFirst():RegisterEffect(e1)
		local e2=Effect.CreateEffect(e:GetHandler())
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetCode(EFFECT_DISABLE_EFFECT)
		e2:SetValue(RESET_TURN_SET)
		e2:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		dsg:GetFirst():RegisterEffect(e2)
		Duel.BreakEffect()
		dg1=Duel.GetMatchingGroup(aux.TRUE,tp,0,LOCATION_ONFIELD,nil)
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
		local sg=dg1:Select(tp,1,1,nil)
		Duel.HintSelection(sg)
		Duel.Destroy(sg,REASON_EFFECT)
	end
end
