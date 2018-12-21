if not Man then
	Man = {}
	function Man.e(c)
		local e=Effect.CreateEffect(c)
		e:SetType(EFFECT_TYPE_QUICK_O)
		e:SetCode(EVENT_FREE_CHAIN)
		e:SetRange(LOCATION_MZONE)
		e:SetCost(Man.c)
		e:SetLabel(0)
		c:RegisterEffect(e)
		return e
	end
	function Man.g(c)
		return c:IsLocation(LOCATION_HAND) or c:IsAbleToHandAsCost() 
	end
	function Man.f(c)
		return (c:IsLocation(LOCATION_HAND) or c:IsAbleToHandAsCost()) and c:IsCode(2150024,2150025)
	end
	function Man.c(e,tp,eg,ep,ev,re,r,rp,chk)
		local l=bit.band(e:GetLabel(),1)>0 and 2 or 1
		if chk==0 then return e:GetHandler():GetFlagEffect(46772449)==0 and (Duel.IsExistingMatchingCard(Man.g,tp,LOCATION_HAND+LOCATION_ONFIELD,0,l,nil) or
							  Duel.IsExistingMatchingCard(Man.f,tp,LOCATION_HAND+LOCATION_ONFIELD,0,1,nil)) end
		e:GetHandler():RegisterFlagEffect(46772449,RESET_CHAIN,0,1)
		local g=Duel.SelectMatchingCard(tp,Man.g,tp,LOCATION_HAND+LOCATION_ONFIELD,0,1,1,nil)
		if l>1 and not g:GetFirst():IsCode(2150024,2150025) then
			g:Merge(Duel.SelectMatchingCard(tp,Man.g,tp,LOCATION_HAND+LOCATION_ONFIELD,0,1,1,g:GetFirst()))
		end
		Duel.SendtoHand(g,1-tp,REASON_COST)
		e:SetLabel(2+l-1)
	end
end
if not c2150020 then return end
function c2150020.initial_effect(c)
	local e=Man.e(c)
	e:SetRange(LOCATION_HAND)
	e:SetTarget(c2150020.t)
	e:SetOperation(c2150020.o)
	e:SetCategory(CATEGORY_SPECIAL_SUMMON+CATEGORY_SEARCH+CATEGORY_TOHAND)
end
function c2150020.f(c)
	return c:IsSetCard(0x220) and c:IsAbleToHand()
end
function c2150020.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsCanBeSpecialSummoned(e,0,tp,false,false) and Duel.IsExistingMatchingCard(c2150020.f,tp,LOCATION_DECK,0,1,nil) and Duel.GetLocationCount(tp,LOCATION_MZONE,0)>0 end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,e:GetHandler(),1,tp,LOCATION_HAND)
	Duel.SetOperationInfo(0,CATEGORY_SEARCH,nil,1,tp,LOCATION_DECK)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function c2150020.o(e,tp)
	if e:GetHandler():IsRelateToEffect(e) and e:GetHandler():IsLocation(LOCATION_HAND) then
		Duel.SpecialSummon(e:GetHandler(),0,tp,tp,false,false,POS_FACEUP)
		Duel.SendtoHand(Duel.SelectMatchingCard(tp,c2150020.f,tp,LOCATION_DECK,0,1,1,nil),tp,REASON_EFFECT)
		e:SetLabel(0)
	end
end