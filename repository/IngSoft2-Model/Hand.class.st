"
This is a Hand of a player. A player's hand has a collection of different Cards (it can be empty). 
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
Hand >> playCardById: aCardID andApplyTo: aPlayer [
	| card |
	card := cards detect: [ :each | each id = aCardID ] ifNone: [ CardBelongToAPlayerFailed signal: 'This player does not have this card' ].
	card applyEffectTo: aPlayer.
	cards remove: card
]

{ #category : #Accesing }
Hand >> playCardById: aCardID applyTo: allPlayers removingCardEffectCausedByCardWithId: causalCardID [
	| myCard |
	myCard := cards detect: [ :each | each id = aCardID ] ifNone: [ CardBelongToAPlayerFailed signal: 'This player does not have this card' ].
	myCard applyEffectTo: allPlayers removingCardEffectCausedByCardWithId: causalCardID.
	cards remove: myCard
]
