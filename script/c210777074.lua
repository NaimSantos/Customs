--Great Swarming Hunter
--designed byNitrogames#8002, scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--atk up
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(210777074,0))
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetCondition(s.atkcond)
	e1:SetValue(300)
	c:RegisterEffect(e1)
	--spsummom (battle damage)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(210777074,1))
	e2:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e2:SetCode(EVENT_BATTLE_DAMAGE)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetCondition(s.spcon1)
	e2:SetTarget(s.sptg1)
	e2:SetOperation(s.spop1)
	e2:SetCountLimit(1,210777074)
	c:RegisterEffect(e2)
	--spsummon (when sent from gy)
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(210777074,2))
	e3:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e3:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY)
	e3:SetCode(EVENT_TO_GRAVE)
	e3:SetCost(s.spcost)
	e3:SetTarget(s.sptg2)
	e3:SetOperation(s.spop2)
	c:RegisterEffect(e3)
	Duel.AddCustomActivityCounter(210777074,ACTIVITY_CHAIN,s.chainfilter)
end
function s.atkfilter(c)
	return c:IsFaceup() and c:IsSetCard(0xf11)
end
function s.atkcond(e)
	return Duel.IsExistingMatchingCard(s.atkfilter,e:GetHandlerPlayer(),LOCATION_MZONE,0,1,e:GetHandler())
end
function s.spcon1(e,tp,eg,ep,ev,re,r,rp)
	return ep~=tp
end
function s.spfilter1(c,e,tp)
	return c:IsSetCard(0xf11) and c:IsCanBeSpecialSummoned(e,186,tp,false,false)
end
function s.sptg1(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0 
		and Duel.IsExistingMatchingCard(s.spfilter1,tp,LOCATION_HAND+LOCATION_DECK,0,1,nil,e,tp) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_HAND+LOCATION_DECK)
end
function s.spop1(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,s.spfilter1,tp,LOCATION_HAND+LOCATION_DECK,0,1,1,nil,e,tp)
	if g:GetCount()>0 then
		Duel.SpecialSummon(g,186,tp,tp,false,false,POS_FACEUP)
	end
end
function s.chainfilter(re,tp,cid)
	return not (re:IsActiveType(TYPE_MONSTER) and re:GetHandler():IsSetCard(0xf11) and re:GetHandler():GetLocation()==LOCATION_GRAVE)
end
function s.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetCustomActivityCount(210777074,tp,ACTIVITY_CHAIN)==0 end
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_OATH)
	e1:SetCode(EFFECT_CANNOT_ACTIVATE)
	e1:SetTargetRange(1,0)
	e1:SetValue(s.aclimit)
	e1:SetReset(RESET_PHASE+PHASE_END)
	Duel.RegisterEffect(e1,tp)
end
function s.aclimit(e,re,tp)
	local loc=re:GetActivateLocation()
	return  re:IsActiveType(TYPE_MONSTER) and re:GetHandler():IsSetCard(0xf11) and not loc==LOCATION_GRAVE	
end
function s.spfilter2(c,e,tp)
	return c:IsSetCard(0xf11) and c:IsCanBeSpecialSummoned(e,186,tp,false,false)
	--186: is what i'm using to register "Special Summoned by a "Great Swarm" Card
end
function s.sptg2(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(s.spfilter2,tp,LOCATION_DECK+LOCATION_HAND,0,1,nil,e,tp) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_DECK+LOCATION_HAND)
end
function s.spop2(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,s.spfilter2,tp,LOCATION_DECK+LOCATION_HAND,0,1,1,nil,e,tp)
	if g:GetCount()>0 then
		Duel.SpecialSummon(g,186,tp,tp,false,false,POS_FACEUP)
	end
end
