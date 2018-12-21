require 'expansions.script.c2150020'
function c2150021.initial_effect(c)
	local e=Man.e(c)
	e:SetCountLimit(1,2150021)
	e:SetTarget(c2150021.t)
	e:SetOperation(c2150021.o)
	e:SetCategory(CATEGORY_SEARCH+CATEGORY_TOHAND)
end
function c2150021.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetFieldGroupCount(tp,0,LOCATION_DECK)>=2 end
	Duel.SetOperationInfo(0,CATEGORY_SEARCH,nil,1,1-tp,LOCATION_DECK)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,1-tp,LOCATION_DECK)
end
function c2150021.o(e,tp)
	if Duel.SendtoHand(Duel.GetDecktopGroup(1-tp,2),tp,REASON_EFFECT)>0 then
		e:SetLabel(0)
	end
end