--Number 39: Utopia Black Ray
--designed by CyberCatman and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--xyz summon
	Xyz.AddProcedure(c,aux.FilterBoolFunctionEx(Card.IsAttribute,ATTRIBUTE_WATER),4,2,s.ovfilter,aux.Stringid(id,0))
	c:EnableReviveLimit()
	--increase ATK
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(s.atkval)
	c:RegisterEffect(e1)
	--negate effects
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_DISABLE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetTargetRange(0,LOCATION_MZONE)
	e2:SetTarget(s.distg)
	c:RegisterEffect(e2)
	--attach monster destroy
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,2))
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
	e3:SetProperty(EFFECT_FLAG_DELAY)
	e3:SetCode(EVENT_BATTLE_DESTROYING)
	e3:SetCondition(aux.bdocon)
	e3:SetTarget(s.atchtg)
	e3:SetOperation(s.atchop)
	c:RegisterEffect(e3)
end
function s.ovfilter(c,tp,xyzc)
	return c:IsFaceup() and c:GetRank()<=5	and c:IsSetCard(0x48,xyzc,SUMMON_TYPE_XYZ,tp) and c:IsType(TYPE_XYZ,xyzc,SUMMON_TYPE_XYZ,tp)
		and not c:IsSummonCode(xyzc,SUMMON_TYPE_XYZ,tp,id)
end
function s.atkval(e,c)
	return c:GetOverlayCount()*200
end
function s.distg(e,c)
	return c==e:GetHandler():GetBattleTarget()
end
function s.atchtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local bc=e:GetHandler():GetBattleTarget()
	if chk==0 then return e:GetHandler():IsType(TYPE_XYZ) and not bc:IsType(TYPE_TOKEN) end
	Duel.SetTargetCard(bc)
	Duel.SetOperationInfo(0,CATEGORY_LEAVE_GRAVE,bc,1,0,0)
end
function s.atchop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if c:IsRelateToEffect(e) and c:IsFaceup() and tc and tc:IsRelateToEffect(e) and not tc:IsLocation(LOCATION_DECK) then
		local og=tc:GetOverlayGroup()
		if #og>0 then
			Duel.SendtoGrave(og,REASON_RULE)
		end
		Duel.Overlay(c,Group.FromCards(tc))
	end
end