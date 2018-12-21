require 'expansions.script.c2150000'
function c2150005.initial_effect(c)
	BiDiu.e(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e:SetCode(EVENT_PHASE+PHASE_END)
	e:SetRange(LOCATION_GRAVE)
	e:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e:SetCountLimit(1)
	e:SetTarget(c2150005.t)
	e:SetOperation(c2150005.o)
	c:RegisterEffect(e)
end
function c2150005.t(e,tp,eg,ep,ev,re,r,rp,chk)
	local h=e:GetHandler()
	if chk==0 then return Duel.IsExistingMatchingCard(Card.IsSetCard,tp,LOCATION_DECK,0,1,nil,0x215) and h:IsCanBeSpecialSummoned(e,0,tp,false,false) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,h,1,tp,LOCATION_GRAVE)
end
function c2150005.f(c)
	return c:IsSetCard(0x215) and not c:IsCode(2150005)
end
function c2150005.o(e)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) then return end
	Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP)
	Duel.SendtoGrave(Duel.SelectMatchingCard(tp,c2150005.f,tp,LOCATION_DECK,0,1,1,nil),REASON_EFFECT)
end
