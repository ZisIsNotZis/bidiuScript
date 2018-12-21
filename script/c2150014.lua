function c2150014.initial_effect(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_ACTIVATE)
	e:SetCode(EVENT_FREE_CHAIN)
	e:SetCategory(CATEGORY_DRAW)
	e:SetTarget(c2150014.t)
	e:SetOperation(c2150014.o)
	c:RegisterEffect(e)
end
function c2150014.f(c)
	return c:IsFaceup() and c:IsSetCard(0x215)
end
function c2150014.g(c,d)
	return c:IsFaceup() and c:IsSetCard(0x215) and c~=d
end
function c2150014.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c2150014.f,0,LOCATION_ONFIELD,LOCATION_ONFIELD,2,e:GetHandler()) and Duel.IsPlayerCanDraw(tp,1) end
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)
end
function c2150014.o(e,tp,eg,ep,ev,re,r,rp)
	local c=Duel.SelectMatchingCard(tp,c2150014.f,0,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,e:GetHandler()):GetFirst()
	Duel.SendtoHand(Duel.GetMatchingGroup(c2150014.g,0,LOCATION_ONFIELD,LOCATION_ONFIELD,c,e:GetHandler()),nil,REASON_EFFECT)
	Duel.Draw(tp,1,REASON_EFFECT)
end