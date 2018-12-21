require 'expansions.script.c2150020'
function c2150023.initial_effect(c)
	local e=Man.e(c)
	e:SetTarget(c2150023.t)
	e:SetOperation(c2150023.o)
	e:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e:SetLabel(1)
end
function c2150023.t(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsControler(1-tp) and chkc:IsLocation(LOCATION_ONFIELD) end
	if chk==0 then return Duel.IsExistingTarget(nil,tp,0,LOCATION_ONFIELD,1,nil) end
	Duel.SelectTarget(tp,nil,tp,0,LOCATION_ONFIELD,1,1,nil)
end
function c2150023.o(e,tp)
	local t=Duel.GetFirstTarget()
	if t:IsRelateToEffect(e) then
		Duel.NegateRelatedChain(t,0)
		t:CancelToGrave()
		Duel.SendtoHand(t,tp,REASON_EFFECT)
		e:SetLabel(1)
	end
end