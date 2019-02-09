Class {
	#name : #CardCreatorTest,
	#superclass : #TestCase,
	#instVars : [
		'cardCreator'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardCreatorTest >> setUp [
	cardCreator := CardCreator
		withTotalTypesOfCardsKnowingNumberOfPlayers: 3.
]

{ #category : #tests }
CardCreatorTest >> testACardCreatorReturnACard [
	| card1 card2 |
	card1 := cardCreator createAndReturnACard.
	self assert: card1 class equals: Acceleration.
	card2 := cardCreator createAndReturnACard.
	self assert: card2 class equals: Speed
]

{ #category : #tests }
CardCreatorTest >> testCreateaCardCreator [
	self assert: cardCreator totalTypesOfCards equals: 6
]
