--Burning Pit Fusion
--scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	c:RegisterEffect(Fusion.CreateSummonEff({handler=c,fusfilter=aux.FilterBoolFunction(Card.IsAttribute,ATTRIBUTE_FIRE),stage2=s.stage2}))
end
s.listed_series={0xf13}
function s.stage2(e,tc,tp,sg,chk)
	if chk==1 and tc:IsSetCard(0xf13) then
		--Prevent reponses
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e1:SetCode(EVENT_CHAINING)
		e1:SetOperation(s.chainop(tc))
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		Duel.RegisterEffect(e1,tp)
		--Register hint
		local e2=Effect.CreateEffect(e:GetHandler())
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetProperty(EFFECT_FLAG_CLIENT_HINT)
		e2:SetDescription(aux.Stringid(id,0))
		e2:SetReset(RESET_EVENT+RESETS_STANDARD)
		tc:RegisterEffect(e2)
	end
end
function s.chainop(tc)
	return function (e,tp,eg,ep,ev,re,r,rp)
		if re:GetHandler()==tc and ep==tp then
			Duel.SetChainLimit(s.chainlm)
		end
	end
end
function s.chainlm(e,rp,tp)
	return tp==rp
end