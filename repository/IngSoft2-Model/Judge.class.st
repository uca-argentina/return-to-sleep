"
This is a Judge who validates the game's turns and check if there is a winner.
"
Class {
	#name : #Judge,
	#superclass : #Object,
	#instVars : [
		'name',
		'board',
		'playingSequence',
		'players',
		'lastCardPlayed',
		'cardCreator',
		'playerHasWon'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Judge class >> named: aName assuring: players on: aBoard [
	^ self new initializeNamed: aName assuring: players on: aBoard
]

{ #category : #Accesing }
Judge >> changeTurnOfPlayers [
	playingSequence changeToNextPlayer. 
]

{ #category : #Accesing }
Judge >> determinateFinalRankings [
	| gamepieces |
	gamepieces := board gamepieces. 
	gamepieces do: [ :each | each finalRanking: (self ranking: each) ]
]

{ #category : #Accesing }
Judge >> giveCardTo: aPlayer [
	| gamepiece positionOfPlayerOnBoard square giftedCard |
	gamepiece := aPlayer gamepiece.
	positionOfPlayerOnBoard := gamepiece positionOnBoard.
	square := board squares at: positionOfPlayerOnBoard.
	square givesCard
		ifTrue: [ 
			giftedCard:= cardCreator createAndReturnACard.
			aPlayer receivesCard: giftedCard.		
			^ giftedCard. 
			]
]

{ #category : #Initializing }
Judge >> initializeNamed: aName assuring: anOrderedCollectionOfPlayers on: aBoard [
	name := aName.
	players := anOrderedCollectionOfPlayers.
	playingSequence := PlayingSequence withAllPlayers: anOrderedCollectionOfPlayers.
	board := aBoard.
	playerHasWon := false.
	lastCardPlayed := false.
	cardCreator := CardCreator withTotalTypesOfCardsKnowingNumberOfPlayers: players size
]

{ #category : #Accesing }
Judge >> lastCardPlayed [
	^ lastCardPlayed
]

{ #category : #Accesing }
Judge >> name [
^ name.
]

{ #category : #Accesing }
Judge >> playerHasWon [
	^ playerHasWon. 
]

{ #category : #Accesing }
Judge >> ranking: aPlayerGamepiece [
	| gamepieces otherGamepieces ranking |
	ranking := 1.
	gamepieces := board gamepieces.
	otherGamepieces := gamepieces select: [ :each | each  ~= aPlayerGamepiece  ].
	otherGamepieces
		do: [ :each | 
			each position > aPlayerGamepiece position
				ifTrue: [ ranking := ranking + 1 ] ].
	^ ranking
]

{ #category : #Accesing }
Judge >> tellLastCardPlayed: aCard [ 
	lastCardPlayed := aCard. 
]

{ #category : #Accesing }
Judge >> validateRoundsOfPlayers [
	| gamepieces |
	gamepieces := board gamepieces. 
	gamepieces do: [ :each | each changeRoundTo: (each position / board endOfBoard) floor ]
]

{ #category : #Accesing }
Judge >> validateTurnOf: whoWantsToPlay [
	playingSequence currentPlayer = whoWantsToPlay
		ifFalse: [ JudgeValidationFailed signal: 'You cannot play when is not your turn' ]
]

{ #category : #Accesing }
Judge >> winner [
	| winner |
	winner := players detect: [ :each | each gamepiece rounds >= board rounds ] ifNone: [ ^ false ].
	self determinateFinalRankings.
	playerHasWon := true. 
	^ winner
]
