--Oraqliphort Annihilator
--designed by Natalia, scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--pendulum summon
	Pendulum.AddProcedure(c)
	--splimit
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_CANNOT_DISABLE)
	e2:SetRange(LOCATION_PZONE)
	e2:SetTargetRange(1,0)
	e2:SetCondition(s.splimcon)
	e2:SetTarget(s.splimit)
	c:RegisterEffect(e2)
	--atk up (scale 1)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD)
	e3:SetRange(LOCATION_PZONE)
	e3:SetCode(EFFECT_UPDATE_ATTACK)
	e3:SetTargetRange(LOCATION_MZONE,0)
	e3:SetCondition(s.atkincreasecond)
	e3:SetTarget(aux.TargetBoolFunction(Card.IsSetCard,0xaa))
	e3:SetValue(300)
	c:RegisterEffect(e3)
	--atk down (scale 9)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_FIELD)
	e4:SetRange(LOCATION_PZONE)
	e4:SetCode(EFFECT_UPDATE_ATTACK)
	e4:SetTargetRange(0,LOCATION_MZONE)
	e4:SetCondition(s.atkdecreascond)
	e4:SetValue(-300)
	c:RegisterEffect(e4)
	--summon with no tribute
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(id,0))
	e5:SetType(EFFECT_TYPE_SINGLE)
	e5:SetCode(EFFECT_SUMMON_PROC)
	e5:SetCondition(s.ntcon)
	c:RegisterEffect(e5)
	--change level
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_SINGLE)
	e6:SetCode(EFFECT_SUMMON_COST)
	e6:SetOperation(s.lvop)
	c:RegisterEffect(e6)
	local e7=Effect.CreateEffect(c)
	e7:SetType(EFFECT_TYPE_SINGLE)
	e7:SetCode(EFFECT_SPSUMMON_COST)
	e7:SetOperation(s.lvop2)
	c:RegisterEffect(e7)
	--immune
	local e8=Effect.CreateEffect(c)
	e8:SetType(EFFECT_TYPE_SINGLE)
	e8:SetCode(EFFECT_IMMUNE_EFFECT)
	e8:SetProperty(EFFECT_FLAG_SINGLE_RANGE+EFFECT_FLAG_UNCOPYABLE)
	e8:SetRange(LOCATION_MZONE)
	e8:SetCondition(s.immcon)
	e8:SetValue(aux.qlifilter)
	c:RegisterEffect(e8)
	--banish a card
	local e9=Effect.CreateEffect(c)
	e9:SetDescription(aux.Stringid(id,1))
	e9:SetCategory(CATEGORY_REMOVE)
	e9:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e9:SetCode(EVENT_SUMMON_SUCCESS)
	e9:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e9:SetCondition(s.thcon)
	e9:SetTarget(s.thtg)
	e9:SetOperation(s.thop)
	c:RegisterEffect(e9)
	--tribute check
	local e10=Effect.CreateEffect(c)
	e10:SetType(EFFECT_TYPE_SINGLE)
	e10:SetCode(EFFECT_MATERIAL_CHECK)
	e10:SetValue(s.valcheck)
	e10:SetLabelObject(e9)
	c:RegisterEffect(e10)
end
function s.splimcon(e)
	return not e:GetHandler():IsForbidden()
end
function s.splimit(e,c)
	return not c:IsSetCard(0xaa)
end
function s.atkincreasecond(e)
	local c=e:GetHandler()
	local scale
	if c:IsSequence(0,1,6) then
		scale=c:GetLeftScale()
	else
		scale=c:GetRightScale()
	end
	return scale==1
end
function s.atkdecreascond(e)
	local c=e:GetHandler()
	local scale
	if c:IsSequence(0,1,6) then
		scale=c:GetLeftScale()
	else
		scale=c:GetRightScale()
	end
	return scale==9
end
function s.ntcon(e,c,minc)
	if c==nil then return true end
	return minc==0 and c:GetLevel()>4 and Duel.GetLocationCount(c:GetControler(),LOCATION_MZONE)>0
end
function s.lvcon(e)
	return e:GetHandler():GetMaterialCount()==0
end
function s.lvop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_CHANGE_LEVEL)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.lvcon)
	e1:SetValue(4)
	e1:SetReset(RESET_EVENT+0xff0000)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_SET_BASE_ATTACK)
	e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCondition(s.lvcon)
	e2:SetValue(1800)
	e2:SetReset(RESET_EVENT+0xff0000)
	c:RegisterEffect(e2)
end
function s.lvop2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_CHANGE_LEVEL)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(4)
	e1:SetReset(RESET_EVENT+0x7f0000)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_SET_BASE_ATTACK)
	e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetValue(1800)
	e2:SetReset(RESET_EVENT+0x7f0000)
	c:RegisterEffect(e2)
end
function s.immcon(e)
	return e:GetHandler():IsSummonType(SUMMON_TYPE_NORMAL)
end
function s.thcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsSummonType(SUMMON_TYPE_TRIBUTE) and e:GetLabel()==1
end
function s.thtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsOnField() and chkc:IsAbleToRemove() end
	if chk==0 then return Duel.IsExistingTarget(Card.IsAbleToRemove,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	local g=Duel.SelectTarget(tp,Card.IsAbleToRemove,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
	Duel.SetOperationInfo(0,HINTMSG_REMOVE,g,1,0,0)
	Duel.SetChainLimit(s.chlimit)
end
function s.chlimit(e,ep,tp)
	return tp==ep
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
end
function s.valcheck(e,c)
	local g=c:GetMaterial()
	if g:IsExists(Card.IsSetCard,1,nil,0xaa) then
		e:GetLabelObject():SetLabel(1)
	else
		e:GetLabelObject():SetLabel(0)
	end
end

