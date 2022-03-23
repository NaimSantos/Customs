--Necrofake
--designed by Xeno, scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--fusion material
	c:EnableReviveLimit()
	Fusion.AddProcMix(c,true,true,28297833,s.matfilter)
	Fusion.AddContactProc(c,s.contactfil,s.contactop,s.splimit,s.contactcon,1)
	--spsummon condition
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetCode(EFFECT_SPSUMMON_CONDITION)
	e1:SetValue(s.splimit)
	c:RegisterEffect(e1)
	--to deck
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetCondition(s.sscd)
	e2:SetOperation(s.ssop)
	c:RegisterEffect(e2)
	--change name
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e3:SetCode(EFFECT_CHANGE_CODE)
	e3:SetRange(LOCATION_MZONE)
	e3:SetValue(28297833)
	c:RegisterEffect(e3)
end
function s.matfilter(c,fc,sumtype,tp)
	return c:IsRace(RACE_ZOMBIE,fc,sumtype,tp) or c:IsAttribute(ATTRIBUTE_DARK,fc,sumtype,tp)
end
function s.contactfil(tp)
	return Duel.GetMatchingGroup(Card.IsAbleToRemoveAsCost,tp,LOCATION_ONFIELD+LOCATION_GRAVE,0,nil)
end
function s.contactcon(tp)
	return Duel.GetFlagEffect(tp,id)==0
end
function s.contactop(g,tp)
	Duel.Remove(g,POS_FACEUP,REASON_COST+REASON_MATERIAL)
	Duel.RegisterFlagEffect(tp,id,RESET_PHASE+PHASE_END,0,1)
end
function s.splimit(e,se,sp,st)
	return not e:GetHandler():IsLocation(LOCATION_EXTRA)
end
function s.sscd(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetSummonType()==SUMMON_TYPE_SPECIAL+1
end
function s.ssop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,1))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetCode(EVENT_PHASE+PHASE_STANDBY)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1)
	e1:SetReset(RESET_EVENT+(RESETS_STANDARD|RESET_CONTROL)&~RESET_TOFIELD|RESET_PHASE|PHASE_STANDBY|RESET_SELF_TURN)
	e1:SetCondition(s.tdcond)
	e1:SetOperation(s.tdop)
	c:RegisterEffect(e1)
end
function s.tdcond(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp
end
function s.tdop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=Duel.GetFieldGroup(tp,LOCATION_REMOVED,LOCATION_REMOVED)
	Duel.SendtoDeck(g,nil,2,REASON_EFFECT)
end	