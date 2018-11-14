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
	| typeNumber |
	self incrementIteratingIDNumber.
	typeNumber := iteratingIDNumber % totalTypesOfCards.
	typeNumber = 0
		ifTrue: [ ^ Overload withValueAndID: iteratingIDNumber ].
		 typeNumber = 1
		ifTrue: [ ^ Acceleration withValueAndID: iteratingIDNumber ] . typeNumber = 2
		ifTrue: [ ^ Speed withValueAndID: iteratingIDNumber ].  typeNumber = 3
		ifTrue: [ ^ Cancellation withValueAndID: iteratingIDNumber ].  typeNumber = 4
		ifTrue: [ ^ Repeat withValueAndID: iteratingIDNumber ] . typeNumber = 5
		ifTrue: [ ^ Redo withValueAndID: iteratingIDNumber ]
]

{ #category : #Accesing }
CardCreator >> incrementIteratingIDNumber [
	iteratingIDNumber := (iteratingIDNumber +1).
]

{ #category : #Initializing }
CardCreator >> initializeWithTotalTypesOfCardsKnowingNumberOfPlayers: numberOfPlayers [
	totalTypesOfCards := 6.
	iteratingIDNumber := (numberOfPlayers * 2 ).
]

{ #category : #Accesing }
CardCreator >> totalTypesOfCards [
	^ totalTypesOfCards
]
