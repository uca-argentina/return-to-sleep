"
This is a CardCreator. It creates and return a card based on the number of players and the total type of cards. 
"
Class {
	#name : #CardCreator,
	#superclass : #Object,
	#instVars : [
		'totalTypesOfCards',
		'iteratingIDNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
CardCreator class >> withTotalTypesOfCardsKnowingNumberOfPlayers: numberOfPlayers [
	^ self new initializeWithTotalTypesOfCardsKnowingNumberOfPlayers: numberOfPlayers
]

{ #category : #Accesing }
CardCreator >> createAndReturnACard [
	| typeNumber typeOfCards |
	self incrementIteratingIDNumber.
	typeNumber := iteratingIDNumber % totalTypesOfCards.
	typeOfCards := Array
		with: Overload withValue
		with: Acceleration withValue
		with: Speed withValue
		with: Cancellation withValue
		with: Repeat withValue
		with: Redo withValue.
	^ (typeOfCards at: typeNumber). 
]

{ #category : #Accesing }
CardCreator >> incrementIteratingIDNumber [
	iteratingIDNumber := (iteratingIDNumber +1).
]

{ #category : #Initializing }
CardCreator >> initializeWithTotalTypesOfCardsKnowingNumberOfPlayers: numberOfPlayers [
	totalTypesOfCards := 6.
	iteratingIDNumber := numberOfPlayers * 2 + 1.
]

{ #category : #Accesing }
CardCreator >> totalTypesOfCards [
	^ totalTypesOfCards
]
