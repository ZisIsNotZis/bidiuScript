require 'expansions.script.c2150000'
function c2150009.initial_effect(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_ACTIVATE)
	e:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e)
	e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e:SetCode(EVENT_FREE_CHAIN)
	e:SetRange(LOCATION_SZONE)
	e:SetCountLimit(1)
	e:SetTarget(c2150009.t)
	e:SetOperation(c2150010.o)
	c:RegisterEffect(e)
end
function c2150009.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk return Duel.IsExistingMatchingCard(Card.IsSetCard,tp,LOCATION_MZONE,0,1,nil,0x215) and Duel.IsExistingMatchingCard(Card.IsSetCard,tp,LOCATION_HAND,0,1,nil,0x215) and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 end
end
function c2150009.o(e,tp)
	Duel.Summon(tp,Duel.SelectMatchingCard(tp,Card.IsSetCard,tp,LOCATION_HAND,0,1,1,nil,0x215),true,nil)
	if Duel.SelectYesNo(aux.Stringid(2150009,0)) then
		Duel.SendtoHand(Duel.SelectMatchingCard(tp,Card.IsSetCard,tp,LOCATION_MZONE,0,1,1,nil,0x215),nil,REASON_EFFECT)
	end
end