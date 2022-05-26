--Nest of the Black Dragons
--designed by DavidKManner#3522, scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--activate
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_ACTIVATE)
	e0:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e0)
	--Fusion summon using a "Red-Eyes" monster
	local params={matfilter=s.mfilter,extrafil=s.fextra}
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON+CATEGORY_FUSION_SUMMON)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_FZONE)
	e1:SetCountLimit(1,id)
	e1:SetTarget(Fusion.SummonEffTG(params))
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
			if not e:GetHandler():IsRelateToEffect(e) then return end
			Fusion.SummonEffOP(params)(e,tp,eg,ep,ev,re,r,rp)
			end)
	c:RegisterEffect(e1)
	--Add 1 Level for or lower "Red-Eyes" monster
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_FZONE)
	e2:SetCountLimit(1,id)
	e2:SetTarget(s.thtg)
	e2:SetOperation(s.thop)
	c:RegisterEffect(e2)
	--Make "Red-Eyes" Gemini gain their effects
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,2))
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetRange(LOCATION_FZONE)
	e3:SetCountLimit(1,id)
	e3:SetTarget(s.gemntg)
	e3:SetOperation(s.gemnop)
	c:RegisterEffect(e3)
	--Double damage
	local e4=Effect.CreateEffect(c)
	e4:SetDescription(aux.Stringid(id,3))
	e4:SetType(EFFECT_TYPE_IGNITION)
	e4:SetRange(LOCATION_FZONE)
	e4:SetCountLimit(1,id)
	e4:SetOperation(s.activate)
	c:RegisterEffect(e4)
end
s.listed_series={0x3b}
function s.mfilter(c)
	return (c:IsLocation(LOCATION_HAND+LOCATION_MZONE) and c:IsAbleToGrave())
end
function s.checkmat(tp,sg,fc)
	return sg:IsExists(Card.IsSetCard,1,nil,0x3b)
end
function s.fextra(e,tp,mg)
	return Duel.GetMatchingGroup(s.mfilter,tp,LOCATION_ONFIELD+LOCATION_HAND,0,nil),s.checkmat
end
function s.thfilter(c)
	return c:IsSetCard(0x3b) and c:IsLevelBelow(4) and c:IsType(TYPE_MONSTER) and c:IsAbleToHand()
end
function s.thtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.thfilter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,s.thfilter,tp,LOCATION_DECK,0,1,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end
function s.gemnfilter(c)
	return c:IsFaceup() and c:IsType(TYPE_GEMINI) and c:IsSetCard(0x3b) and not c:IsGeminiState()
end
function s.gemntg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.gemnfilter,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil) end
end
function s.gemnop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) then return end
	local g=Duel.GetMatchingGroup(s.gemnfilter,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
	if #g==0 then return end
	local fid=c:GetFieldID()
	for tc in g:Iter() do
		tc:EnableGeminiState()
		tc:RegisterFlagEffect(id,RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END,0,1,fid)
	end
end
function s.activate(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFlagEffect(tp,id)~=0 then return end
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_CHANGE_DAMAGE)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetTargetRange(1,1)
	e1:SetValue(s.value)
	e1:SetReset(RESET_PHASE+PHASE_END)
	Duel.RegisterEffect(e1,tp)
	local e2=Effect.CreateEffect(e:GetHandler())
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_PRE_BATTLE_DAMAGE)
	e2:SetCondition(s.rdcon)
	e2:SetOperation(s.rdop)
	e2:SetReset(RESET_PHASE+PHASE_END)
	Duel.RegisterEffect(e2,tp)
	Duel.RegisterFlagEffect(tp,id,RESET_PHASE+PHASE_END,0,1)
end
function s.rdcon(e,tp,eg,ep,ev,re,r,rp)
	local tc=eg:GetFirst()
	return ep==1-tp and tc:IsSetCard(0x3b)
end
function s.rdop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFlagEffect(ep,id)==0 then
		local dam=Duel.GetBattleDamage(ep)
		Duel.ChangeBattleDamage(ep,dam*2)
	end
end
function s.value(e,re,dam,r,rp,rp)
	if r&REASON_EFFECT==REASON_EFFECT and re then
		if re:GetHandler():IsSetCard(0x3b) then
			return dam*2
		else
			return dam
		end
	end
end
