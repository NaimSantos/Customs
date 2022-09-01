--Chimeratech Cyber Burst Dragon
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	Fusion.AddProcMixN(c,true,true,s.matfilter1,1,aux.FilterBoolFunctionEx(Card.IsSetCard,0x1093),2)
	c:EnableReviveLimit()
	--If Fusion Summoned, Fusion Summon 1 level 8 or lower Fusion Monster
	local params = {fusfilter=s.fusfilter,matfilter=aux.FALSE,extrafil=s.fextra,extraop=Fusion.BanishMaterial,extratg=s.extratarget,stage2=s.stage2}
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON+CATEGORY_FUSION_SUMMON)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetProperty(EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetCountLimit(1,id)
	e1:SetCondition(s.spcon)
	e1:SetTarget(Fusion.SummonEffTG(params))
	e1:SetOperation(Fusion.SummonEffOP(params))
	c:RegisterEffect(e1)
	--Send cards to the GY
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetCategory(CATEGORY_TOGRAVE)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetCode(EVENT_TO_GRAVE)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetCondition(s.tgcond)
	e2:SetTarget(s.tgtg)
	e2:SetOperation(s.tgop)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e3:SetCode(EVENT_REMOVE)
	c:RegisterEffect(e3)
end
s.listed_series={0x1093}
s.listed_names={id}
s.material_setcode={0x93,0x1093}
function s.matfilter1(c,fc,sumtype,tp)
	return c:IsType(TYPE_FUSION,fc,sumtype,tp) and c:IsRace(RACE_MACHINE)
end
function s.fusfilter(c)
	return c:IsRace(RACE_MACHINE) and not c:IsCode(id) 
end
function s.spcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsSummonType(SUMMON_TYPE_FUSION)
end
function s.fextra(e,tp,mg)
	if not Duel.IsPlayerAffectedByEffect(tp,69832741) then
		return Duel.GetMatchingGroup(Fusion.IsMonsterFilter(Card.IsAbleToRemove),tp,LOCATION_GRAVE+LOCATION_HAND,0,nil)
	end
	return nil
end
function s.extratarget(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_REMOVE,nil,0,tp,LOCATION_HAND+LOCATION_GRAVE)
end
function s.desfilter(c,atk)
	return c:IsFaceup() and c:IsMonster() and c:IsAttackBelow(atk-1)
end
function s.stage2(e,tc,tp,sg,chk)
	if chk==1 then
		if Duel.IsExistingMatchingCard(s.desfilter,tp,0,LOCATION_MZONE,1,nil,tc:GetAttack()) and Duel.SelectYesNo(tp,aux.Stringid(id,2)) then
			Duel.BreakEffect()
			local tg=Duel.SelectMatchingCard(tp,s.desfilter,tp,0,LOCATION_MZONE,1,1,nil,tc:GetAttack())
			if #tg>0 then
				Duel.HintSelection(tg)
				Duel.Destroy(tg,REASON_EFFECT)
			end
		end
	end
end
function s.tgcond(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:IsReason(REASON_EFFECT) and rp==1-tp and c:IsPreviousControler(tp)
		and c:IsPreviousLocation(LOCATION_ONFIELD)
end
function s.mchfusfilter(c)
	return c:IsType(TYPE_FUSION) and c:IsRace(RACE_MACHINE)
end
function s.tgtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.mchfusfilter,tp,LOCATION_GRAVE,LOCATION_GRAVE,1,nil)
		and Duel.IsExistingTarget(Card.IsAbleToGrave,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil)
	end
	local ct=Duel.GetMatchingGroupCount(s.mchfusfilter,tp,LOCATION_GRAVE,LOCATION_GRAVE,nil)
	local tg=Duel.SelectTarget(tp,Card.IsAbleToGrave,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,ct,nil)
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,tg,#tg,0,0)
end
function s.tgop(e,tp,eg,ep,ev,re,r,rp)
	local tg=Duel.GetTargetCards(e)
	if #tg>0 then
		Duel.SendtoGrave(tg,REASON_EFFECT)
	end
end