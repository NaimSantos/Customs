--Apoqliphort Diviner
--designed by Natalia, scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--cannot special summon
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetCode(EFFECT_SPSUMMON_CONDITION)
	c:RegisterEffect(e1)
	--tribute limit
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_TRIBUTE_LIMIT)
	e2:SetValue(s.tlimit)
	c:RegisterEffect(e2)
	--summon with 3 tribute
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,0))
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e3:SetCode(EFFECT_LIMIT_SUMMON_PROC)
	e3:SetCondition(s.ttcon)
	e3:SetOperation(s.ttop)
	e3:SetValue(SUMMON_TYPE_TRIBUTE)
	c:RegisterEffect(e3)
	local e4=e3:Clone()
	e4:SetCode(EFFECT_LIMIT_SET_PROC)
	c:RegisterEffect(e4)
	--immune
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_SINGLE)
	e5:SetProperty(EFFECT_FLAG_SINGLE_RANGE+EFFECT_FLAG_UNCOPYABLE)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCode(EFFECT_IMMUNE_EFFECT)
	e5:SetCondition(s.immcon)
	e5:SetValue(s.efilter)
	c:RegisterEffect(e5)
	--pos
	local e6=Effect.CreateEffect(c)
	e6:SetDescription(aux.Stringid(id,1))
	e6:SetCategory(CATEGORY_POSITION)
	e6:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e6:SetCode(EVENT_SPSUMMON_SUCCESS)
	e6:SetRange(LOCATION_MZONE)
	e6:SetCountLimit(1)
	e6:SetTarget(s.target)
	e6:SetOperation(s.operation)
	c:RegisterEffect(e6)
end
function s.tlimit(e,c)
	return not c:IsSetCard(0xaa)
end
function s.val(c,sc,ma)
	local eff3={c:GetCardEffect(EFFECT_TRIPLE_TRIBUTE)}
	if ma>=3 then
		for _,te in ipairs(eff3) do
			if type(te:GetValue())~='function' or te:GetValue()(te,sc) then return 0x30001 end
		end
	end
	local eff2={c:GetCardEffect(EFFECT_DOUBLE_TRIBUTE)}
	for _,te in ipairs(eff2) do
		if type(te:GetValue())~='function' or te:GetValue()(te,sc) then return 0x20001 end
	end
	return 1
end
function s.rescon(sg,e,tp,mg)
	local ct=sg:GetCount()
	return aux.ChkfMMZ(1)(sg,e,tp,mg) and sg:CheckWithSumEqual(s.val,3,ct,ct,e:GetHandler(),3)
end
function s.ttcon(e,c,minc)
	if c==nil then return true end
	local tp=c:GetControler()
	local g=Duel.GetTributeGroup(c)
	return minc<=3 and Duel.GetLocationCount(tp,LOCATION_MZONE)>-3 and aux.SelectUnselectGroup(g,e,tp,1,3,s.rescon,0)
end
function s.ttop(e,tp,eg,ep,ev,re,r,rp,c)
	local g=Duel.GetTributeGroup(c)
	local sg=aux.SelectUnselectGroup(g,e,tp,1,3,s.rescon,1,tp,HINTMSG_RELEASE,s.rescon)
	c:SetMaterial(sg)
	Duel.Release(sg,REASON_SUMMON+REASON_MATERIAL)
end
function s.immcon(e)
	return e:GetHandler():IsSummonType(SUMMON_TYPE_NORMAL)
end
function s.efilter(e,te)
	if te:IsActiveType(TYPE_SPELL+TYPE_TRAP) then return true
	else return aux.qlifilter(e,te) end
end
function s.filter(c,e,tp)
	return c:IsPosition(POS_FACEUP_ATTACK) and c:IsCanChangePosition()
		and (not e or c:IsRelateToEffect(e))
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return eg:IsExists(s.filter,1,nil,nil,tp) end
	Duel.SetTargetCard(eg)
	Duel.SetOperationInfo(0,CATEGORY_POSITION,eg,eg:GetCount(),0,0)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local g=eg:Filter(s.filter,nil,e,tp)
	if Duel.ChangePosition(g,POS_FACEUP_DEFENSE)~=(#g)	and Duel.IsExistingMatchingCard(Card.IsAbleToRemove,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil)
	and Duel.SelectYesNo(tp,aux.Stringid(id,2)) then
		g=Duel.SelectMatchingCard(tp,Card.IsAbleToRemove,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
		Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	end
end
