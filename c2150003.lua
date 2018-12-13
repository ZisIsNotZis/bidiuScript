require 'expansions.script.c2150000'
function c2150003.initial_effect(c)
	BiDiu(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e:SetCost(EVENT_SUMMON_SUCCESS)
	e:SetProperty(EFFECT_FLAG_DELAY)
	e:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e:SetTarget(c2150003.t)
	e:SetOperation(c2150003.o)
	c:RegisterEffect(a)
	a=a:Clone()
end
function c2150003.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(BiDiu.f,tp,LOCATION_DECK,0,1,nil,e,tp) and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_DECK)
end
function c2150003.o(e,tp)
	Duel.SpecialSummon(Duel.SelectMatchingCard(tp,BiDiu.f,tp,LOCATION_DECK,0,1,1,nil,e,tp),0,tp,tp,false,false,POS_FACEUP)
end