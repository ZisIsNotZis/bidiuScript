require 'expansions.script.c2150020'
function c2150021.initial_effect(c)
	local e=Man.e(c)
	e:SetCountLimit(1,2150021)
	e:SetOperation(c2150021.t)
	e:SetOperation(c2150021.o)
end
function c2150021.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,0,LOCATION_DECK)>2 end
end
function c2150021.o(e,tp)
	Duel.SendtoHand(Duel.GetDecktopGroup(1-tp,2),tp,REASON_EFFECT)
	e:SetLabel(2)
end