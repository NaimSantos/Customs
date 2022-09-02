--Mist Valley Winds
--designed and scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Activate and add 1 "Mist Valley" monster to the hand
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetOperation(s.activate)
	c:RegisterEffect(e1)
	--Return 1 "Mist Valley" monster and Special Summon another from the GY
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetCategory(CATEGORY_TOHAND+CATEGORY_SPECIAL_SUMMON)
	e2:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_SZONE)
	e2:SetTarget(s.sptg)
	e2:SetOperation(s.spop)
	c:RegisterEffect(e2)
end
s.listed_series={0x37}
function s.thfilter(c,fspell,maxlv)
	return c:IsType(TYPE_MONSTER) and c:IsSetCard(0x37) and c:IsAbleToHand() and (fspell or c:IsLevelBelow(maxlv))
end
function s.spellfilter(c)
	return c:IsType(TYPE_SPELL) and c:IsType(TYPE_FIELD) and c:IsSetCard(0x37) and c:IsFaceup()
end
function s.activate(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	local ct=Duel.GetFieldGroupCount(tp,0,LOCATION_ONFIELD)
	local fspell=Duel.IsExistingMatchingCard(s.spellfilter,tp,LOCATION_ONFIELD,0,1,nil)
	local g=Duel.GetMatchingGroup(s.thfilter,tp,LOCATION_DECK,0,nil,fspell,ct)
	if #g>0 and Duel.SelectYesNo(tp,aux.Stringid(id,0)) then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
		local sg=g:Select(tp,1,1,nil)
		Duel.SendtoHand(sg,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,sg)
	end
end
function s.spfilter(c,e,tp)
	return c:IsSetCard(0x37) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function s.rthfilter(c,e,tp)
	return c:IsFaceup() and c:IsSetCard(0x37) and c:IsAbleToHand() and Duel.GetMZoneCount(tp,c)>0
		and Duel.IsExistingMatchingCard(s.spfilter,tp,LOCATION_GRAVE,0,1,nil,e,tp)
end
function s.sptg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and s.rthfilter(chkc,e,tp) end
	if chk==0 then return Duel.IsExistingTarget(s.rthfilter,tp,LOCATION_MZONE,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RTOHAND)
	local tg=Duel.SelectTarget(tp,s.rthfilter,tp,LOCATION_MZONE,0,1,1,nil,e,tp) 
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,tg,1,0,0)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,0,LOCATION_GRAVE)
end
function s.spop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and Duel.SendtoHand(tc,nil,REASON_EFFECT)>0
		and tc:IsLocation(LOCATION_HAND) and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 then
		local g=Duel.GetMatchingGroup(aux.NecroValleyFilter(s.spfilter),tp,LOCATION_GRAVE,0,nil,e,tp)
		if #g>0 then
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
			local sc=g:Select(tp,1,1,nil):GetFirst()
			Duel.BreakEffect()
			local c=e:GetHandler()
			if Duel.SpecialSummon(sc,0,tp,tp,true,false,POS_FACEUP)>0 then
				local fid=c:GetFieldID()
				sc:RegisterFlagEffect(id,RESET_EVENT+RESETS_STANDARD,0,1,fid)
				--Return it to the hand during the End Phase
				local e1=Effect.CreateEffect(c)
				e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
				e1:SetCode(EVENT_PHASE+PHASE_END)
				e1:SetCountLimit(1)
				e1:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
				e1:SetLabel(fid)
				e1:SetLabelObject(sc)
				e1:SetCondition(s.thcon)
				e1:SetOperation(s.thop)
				Duel.RegisterEffect(e1,tp)
			end
		end
	end
end
function s.thcon(e,tp,eg,ep,ev,re,r,rp)
	local tc=e:GetLabelObject()
	if tc:GetFlagEffectLabel(id)~=e:GetLabel() then
		e:Reset()
		return false
	else return true end
end
function s.thop(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoHand(e:GetLabelObject(),nil,REASON_EFFECT)
end