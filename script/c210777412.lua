--Polychimera Drago
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	c:SetUniqueOnField(1,0,id)
	c:EnableReviveLimit()
	Fusion.AddProcMixN(c,true,true,s.ffilter,2)
	--Prevent the destruction of target
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	e1:SetHintTiming(0,TIMINGS_CHECK_MONSTER+TIMING_MAIN_END)
	c:RegisterEffect(e1)
end
function s.ffilter(c,fc,sumtype,tp,sub,mg,sg)
	return c:IsRace(RACE_FIEND,fc,sumtype,tp) and c:GetAttribute(fc,sumtype,tp)~=0
		and (not sg or not sg:IsExists(s.fusfilter,1,c,c:GetAttribute(fc,sumtype,tp),fc,sumtype,tp))
end
function s.fusfilter(c,attr,fc,sumtype,tp)
	return c:IsAttribute(attr,fc,sumtype,tp) and not c:IsHasEffect(511002961)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsOnField() and chkc:IsFaceup() end
	if chk==0 then return Duel.IsExistingTarget(Card.IsFaceup,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,Card.IsFaceup,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc and tc:IsRelateToEffect(e) and tc:IsFaceup() then
		--Cannot be destroyed by battle
		local e1=Effect.CreateEffect(c)
		e1:SetDescription(3008)
		e1:SetProperty(EFFECT_FLAG_CLIENT_HINT)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
		e1:SetValue(1)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		tc:RegisterEffect(e1)
		--Cannot be destroyed by effects
		local e2=e1:Clone()
		e2:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
		tc:RegisterEffect(e2)
		--Cannot be banished
		local e3=Effect.CreateEffect(c)
		e3:SetType(EFFECT_TYPE_SINGLE)
		e3:SetDescription(3008)
		e3:SetProperty(EFFECT_FLAG_SINGLE_RANGE+EFFECT_FLAG_CLIENT_HINT)
		e3:SetCode(EFFECT_CANNOT_REMOVE)
		e3:SetRange(LOCATION_ONFIELD)
		e3:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		tc:RegisterEffect(e3)
		local e4=e3:Clone()
		e4:SetType(EFFECT_TYPE_FIELD)
		e4:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
		e4:SetTargetRange(1,1)
		e4:SetTarget(s.rmlimit)
		e4:SetLabelObject(tc)
		tc:RegisterEffect(e4)
	end
end
function s.rmlimit(e,c,tp)
	return c==e:GetLabelObject()
end