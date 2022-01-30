--Performapal Blazing Magician
--Scripted and designed by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Fusion Summon procedure
	c:EnableReviveLimit()
	Fusion.AddProcMix(c,true,true,s.ffilter,aux.FilterBoolFunctionEx(Card.IsType,TYPE_PENDULUM))
	Fusion.AddContactProc(c,s.contactfil,s.contactop,s.splimit,s.spcondition)
	--Return 1 Spell to hand and activate 1 Continuous Spell
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,1))
	e1:SetCategory(CATEGORY_TOHAND)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1)
	e1:SetTarget(s.thtg)
	e1:SetOperation(s.thop)
	c:RegisterEffect(e1)
end
function s.ffilter(c,fc,sumtype,tp)
	return c:IsSetCard(0x9f,fc,sumtype,tp) and not c:IsType(TYPE_PENDULUM,fc,sumtype,tp)
end
function s.splimit(e,se,sp,st)
	return (st&SUMMON_TYPE_FUSION)==SUMMON_TYPE_FUSION
end
function s.contactfil(tp)
	return Duel.GetReleaseGroup(tp)
end
function s.contactop(g)
	Duel.Release(g,REASON_COST+REASON_MATERIAL)
end
function s.spcondition(e,c)
	return Duel.IsExistingTarget(aux.FilterFaceupFunction(Card.IsType,TYPE_SPELL),e:GetHandlerPlayer(),LOCATION_ONFIELD,0,1,nil)
end
function s.thfilter(c)
	return c:IsFaceup() and c:GetType()==TYPE_SPELL and c:IsAbleToHand()
end
function s.thtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_SZONE) and chkc:IsControler(tp) and s.thfilter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(s.thfilter,tp,LOCATION_SZONE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RTOHAND)
	local g=Duel.SelectTarget(tp,s.thfilter,tp,LOCATION_SZONE,0,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,g,1,0,0)
end
function s.tffilter(c,tp)
	return c:IsSetCard(0x98) and c:GetType()==TYPE_SPELL+TYPE_CONTINUOUS and c:GetActivateEffect():IsActivatable(tp,true)
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and Duel.SendtoHand(tc,nil,REASON_EFFECT)>0 then
		local g=Duel.GetMatchingGroup(s.tffilter,tp,LOCATION_HAND,0,nil,tp)
		if #g>0 and Duel.SelectYesNo(tp,aux.Stringid(id,2)) then
			Duel.BreakEffect()
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOFIELD)
			local sc=g:Select(tp,1,1,nil):GetFirst()
			Duel.MoveToField(sc,tp,tp,LOCATION_SZONE,POS_FACEUP,true)
			local te=sc:GetActivateEffect()
			local tep=sc:GetControler()
			local cost=te:GetCost()
			if cost then cost(te,tep,eg,ep,ev,re,r,rp,1) end
			Duel.RaiseEvent(sc,id,te,0,tp,tp,Duel.GetCurrentChain())
		end
	end
end
