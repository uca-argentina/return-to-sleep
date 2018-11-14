"
This is a Hand of a Player. It has a collection of Cards.
"
Class {
	#name : #Hand,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Hand class >> withACard: aFirstCard andOtherCard: aSecondCard [ 
	^ self new initializeWithACard: aFirstCard andOtherCard: aSecondCard.
]

{ #category : #Initializing }
Hand >> initializeWithACard: aFirstCard andOtherCard: aSecondCard [
	cards := Set new.
	cards add: aFirstCard;
	add: aSecondCard. 
]

{ #category : #Accesing }
Hand >> playCardByID: aCardID applyTo: aPlayer andTellJudge: aJudge [
	| card |
	card := cards
		detect: [ :each | each id = aCardID ]
		ifNone: [ CardBelongFailed signal: 'This player does not have this card' ].
	card applyEffectTo: aPlayer.
	cards remove: card.
	aJudge tellLastCardPlayed: card. 
]

{ #category : #'as yet unclassified ' }
Hand >> playCardByID: aCardID applyTo: aPlayer redoingCardEffectMadeByCard: lastCard andTellJudge: aJudge [
	| myCard |
	myCard := cards
		detect: [ :each | each id = aCardID ]
		ifNone: [ CardBelongFailed signal: 'This player does not have this card' ].
	myCard applyEffectTo: aPlayer redoingCardEffectMadeByCard: lastCard.
	cards remove: myCard.
]

{ #category : #Accesing }
Hand >> playCardByID: aCardID applyTo: allPlayers redoingCardEffectMadeByCard: lastCard removingCardEffectCausedByCardWithId: causalCardID andTellJudge: aJudge [
	| myCard |
	myCard := cards
		detect: [ :each | each id = aCardID ]
		ifNone: [ CardBelongFailed signal: 'This player does not have this card' ].
	cards remove: myCard.
	lastCard applyEffectTo: allPlayers removingCardEffectCausedByCardWithId: causalCardID.
]

{ #category : #Accesing }
Hand >> playCardByID: aCardID applyTo: allPlayers removingCardEffectCausedByCardWithId: causalCardID andTellJudge: aJudge [
	| myCard |
	myCard := cards
		detect: [ :each | each id = aCardID ]
		ifNone: [ CardBelongFailed signal: 'This player does not have this card' ].
	myCard applyEffectTo: allPlayers removingCardEffectCausedByCardWithId: causalCardID.
	cards remove: myCard.
	aJudge tellLastCardPlayed: myCard. 
]

{ #category : #Accesing }
Hand >> playCardByID: aCardID applyingEffect: aSquareEffectApplied andTellJudge: aJudge [
	| card |
	card := cards detect: [ :each | each id = aCardID ] ifNone: [ CardBelongFailed signal: 'This player does not have this card' ].
	card applyingEffect: aSquareEffectApplied. 
	cards remove: card.
]

{ #category : #Initializing }
Hand >> receivesCard: aCard [
	cards add: aCard
]
