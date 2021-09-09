--Metalfoes Alloy
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--fusion procedure
	c:EnableReviveLimit()
	Fusion.AddProcMix(c,true,true,aux.FilterBoolFunctionEx(Card.IsAttribute,ATTRIBUTE_FIRE),aux.FilterBoolFunctionEx(Card.IsRace,RACE_PSYCHIC))
	--recover
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCategory(CATEGORY_RECOVER)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
	--effect gain
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_BE_MATERIAL)
	e2:SetCondition(s.efcon)
	e2:SetOperation(s.efop)
	c:RegisterEffect(e2)
end
s.listed_series={0x11a,0xe1}
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetMatchingGroupCount(aux.FilterFaceupFunction(Card.IsSetCard,0xe1),tp,LOCATION_ONFIELD+LOCATION_GRAVE,0,nil)>0 end
	Duel.SetTargetPlayer(tp)
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,0,tp,0)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local rt=Duel.GetMatchingGroupCount(aux.FilterFaceupFunction(Card.IsSetCard,0xe1),tp,LOCATION_ONFIELD+LOCATION_GRAVE,0,nil)*100
	local p=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER)
	Duel.Recover(p,rt,REASON_EFFECT)
end
function s.efcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local rc=c:GetReasonCard()
	return c:IsPreviousLocation(LOCATION_ONFIELD) and (rc:IsSetCard(0x11a) or rc:IsType(RACE_PSYCHIC) or rc:IsAttribute(ATTRIBUTE_FIRE))
end
function s.efop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local rc=c:GetReasonCard()
	if not rc:IsType(TYPE_EFFECT) then
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_ADD_TYPE)
		e1:SetValue(TYPE_EFFECT)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		rc:RegisterEffect(e1,true)
	end
	if rc:IsAttribute(ATTRIBUTE_FIRE) then
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE+EFFECT_FLAG_CLIENT_HINT)
		e2:SetDescription(aux.Stringid(id,1))
		e2:SetRange(LOCATION_MZONE)
		e2:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
		e2:SetValue(1)
		e2:SetReset(RESET_EVENT+RESETS_STANDARD)
		rc:RegisterEffect(e2,true)
	end
	if rc:IsRace(RACE_PSYCHIC) then
		local e3=Effect.CreateEffect(c)
		e3:SetType(EFFECT_TYPE_SINGLE)
		e3:SetCode(EFFECT_UPDATE_ATTACK)
		e3:SetValue(1000)
		e3:SetReset(RESET_EVENT+RESETS_STANDARD_DISABLE)
		rc:RegisterEffect(e3,true)
	end
	if rc:IsSetCard(0xe1) then
		local e4=Effect.CreateEffect(c)
		e4:SetType(EFFECT_TYPE_SINGLE)
		e4:SetCode(EFFECT_IMMUNE_EFFECT)
		e4:SetProperty(EFFECT_FLAG_SINGLE_RANGE+EFFECT_FLAG_CLIENT_HINT)
		e4:SetDescription(aux.Stringid(id,3))
		e4:SetRange(LOCATION_MZONE)
		e4:SetCondition(s.imcon)
		e4:SetValue(s.immval)
		e4:SetReset(RESET_EVENT+RESETS_STANDARD)
		rc:RegisterEffect(e4,true)
	end
end
function s.imcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetCurrentPhase()==PHASE_MAIN1 or Duel.GetCurrentPhase()==PHASE_MAIN2
end
function s.immval(e,te)
	local tc=te:GetHandler()
	return te:GetOwner()~=e:GetHandler() and te:IsActivated()
end