require 'expansions.script.c2150020'
function c2150024.initial_effect(c)
	local e=Man.e(c)
	e:SetTarget(c2150024.t)
	e:SetOperation(c2150024.o)
	e:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e:SetLabel(0)
end
function c2150024.f(c)
	return c:IsLevelBelow(3) or c:IsRankBelow(3) or c:IsLinkBelow(3)
end
function c2150024.t(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsControler(1-tp) and chkc:IsLocation(LOCATION_ONFIELD) and c2150024.f(c) end
	if chk==0 then return Duel.IsExistingTarget(c2150024.f,tp,0,LOCATION_ONFIELD,1,nil) end
	Duel.SelectTarget(tp,c2150024.f,tp,0,LOCATION_ONFIELD,1,1,nil)
end
function c2150024.o(e,tp)
	local t=Duel.GetFirstTarget()
	if t:IsRelateToEffect(e) then
		Duel.NegateRelatedChain(t,0)
		Duel.SendtoHand(t,tp,REASON_EFFECT)
		e:SetLabel(0)
	end
end