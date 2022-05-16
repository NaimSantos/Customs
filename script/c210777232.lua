--Burning Pit Larva
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	Pendulum.AddProcedure(c)
	--Fusion from the pendulum zone
	local params = {aux.FilterBoolFunction(Card.IsAttribute,ATTRIBUTE_FIRE)}
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON+CATEGORY_FUSION_SUMMON)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_PZONE)
	e1:SetCountLimit(1)
	e1:SetTarget(Fusion.SummonEffTG(table.unpack(params)))
	e1:SetOperation(Fusion.SummonEffOP(table.unpack(params)))
	c:RegisterEffect(e1)
	--Add 1 monster to the Extra Deck
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetCategory(CATEGORY_TOEXTRA)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetCode(EVENT_SUMMON_SUCCESS)
	e1:SetCountLimit(1,{id,0})
	e2:SetTarget(s.tedtg)
	e2:SetOperation(s.tedop)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e3:SetCode(EVENT_SPSUMMON_SUCCESS)
	c:RegisterEffect(e3)
	--Place itself in the Extra Deck if used as Fusion material
	local e4=Effect.CreateEffect(c)
	e4:SetDescription(aux.Stringid(id,4))
	e4:SetCategory(CATEGORY_TOEXTRA)
	e4:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e4:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_CARD_TARGET)
	e4:SetCode(EVENT_BE_MATERIAL)
	e4:SetCountLimit(1,{id,1})
	e4:SetCondition(s.selfedcon)
	e4:SetTarget(s.selfedtg)
	e4:SetOperation(s.selfedop)
	c:RegisterEffect(e4)
end
s.listed_series={0xf13}
function s.tedfilter(c)
	return c:IsSetCard(0xf13) and c:IsType(TYPE_PENDULUM) and not c:IsForbidden()
end
function s.tedtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.tedfilter,tp,LOCATION_DECK,0,1,nil) end
end
function s.pzcheck(tp)
	return Duel.CheckLocation(tp,LOCATION_PZONE,0) or Duel.CheckLocation(tp,LOCATION_PZONE,1)
end
function s.tedop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,2))
	local g=Duel.SelectMatchingCard(tp,s.tedfilter,tp,LOCATION_DECK,0,1,1,nil)
	if #g>0 and Duel.SendtoExtraP(g,tp,REASON_EFFECT) and c:IsRelateToEffect(e) and s.pzcheck(tp) and Duel.SelectYesNo(tp,aux.Stringid(id,3)) then
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
function s.selfedop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) then
		Duel.SendtoExtraP(c,tp,REASON_EFFECT)
	end
end
