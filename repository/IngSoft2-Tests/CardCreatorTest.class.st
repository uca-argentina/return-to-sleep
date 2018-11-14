Class {
	#name : #CardCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardCreatorTest >> testACardCreatorReturnACard [
	| cardCreator card1 card2 |
	cardCreator := CardCreator
		withTotalTypesOfCardsKnowingNumberOfPlayers: 3.
	card1 := cardCreator createAndReturnACard.
	self assert: card1 id equals: 7.
	self assert: card1 class equals: Acceleration.
	card2 := cardCreator createAndReturnACard.
	self assert: card2 id equals: 8.
	self assert: card2 class equals: Speed
]

{ #category : #tests }
CardCreatorTest >> testCreateaCardCreator [
	| cardCreator |
	cardCreator := CardCreator
		withTotalTypesOfCardsKnowingNumberOfPlayers: 3.
	self assert: cardCreator totalTypesOfCards equals: 6
]
