--Red Dragon Archfiend's Warrio
--designed by CyberCatman, scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	Synchro.AddProcedure(c,nil,2,99,Synchro.NonTuner(Card.IsType,TYPE_SYNCHRO),1,1)
	--banish all cards
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_REMOVE)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
	e1:SetProperty(EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetCondition(s.remcon)
	e1:SetTarget(s.remtg)
	e1:SetOperation(s.remop)
	c:RegisterEffect(e1)
	--increase ATK
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_UPDATE_ATTACK)
	e2:SetRange(LOCATION_MZONE)
	e2:SetTargetRange(LOCATION_MZONE,0)
	e2:SetTarget(s.atktg)
	e2:SetValue(s.atkval)
	c:RegisterEffect(e2)
	--activation limit
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD)
	e3:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e3:SetCode(EFFECT_CANNOT_ACTIVATE)
	e3:SetRange(LOCATION_MZONE)
	e3:SetTargetRange(0,1)
	e3:SetValue(1)
	e3:SetCondition(s.actcon)
	c:RegisterEffect(e3)
end
function s.mfilter(c)
	return not c:IsType(TYPE_SYNCHRO)
end
function s.remcon(e,tp,eg,ep,ev,re,r,rp)
	local p=e:GetHandler()
	local mg=p:GetMaterial()
	return p:GetSummonType()==SUMMON_TYPE_SYNCHRO and mg and not mg:IsExists(s.mfilter,1,nil)
end
function s.remtg(e,tp,eg,ep,ev,re,r,rp,chk)
	local g=Duel.GetMatchingGroup(Card.IsAbleToRemove,tp,0,LOCATION_ONFIELD,nil)
	if chk==0 then return #g>0 end
	Duel.SetOperationInfo(0,CATEGORY_REMOVE,g,#g,0,LOCATION_ONFIELD)
	Duel.SetChainLimit(s.chainlm)
end
function s.chainlm(e,rp,tp)
	return tp==rp
end
function s.remop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Card.IsAbleToRemove,tp,0,LOCATION_ONFIELD,nil)
	if #g>0 then
		Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	end
end
function s.atktg(e,c)
	return c:IsFaceup() and c:IsType(TYPE_TUNER)
end
function s.atkval(e,c)
	return Duel.GetMatchingGroupCount(aux.TRUE,c:GetControler(),LOCATION_GRAVE,0,nil)*100
end
function s.tnrfilter(c,tp)
	return c:IsFaceup() and c:IsType(TYPE_TUNER)
end
function s.actcon(e)
	local tp=e:GetHandlerPlayer()
	local a=Duel.GetAttacker()
	return a and (s.tnrfilter(a,tp) or a==e:GetHandler())
end
