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
		'thereIsAWinner',
		'lastCardPlayed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Judge class >> named: aName assuring: players on: aBoard [
	^ self new initializeNamed: aName assuring: players on: aBoard
]

{ #category : #Accesing }
Judge >> determinateFinalRankings [
	| gamepieces |
	gamepieces := (board gamepieces values collect: [ :each | each ]) as: Set.
	gamepieces do: [ :each | each finalRanking: (self ranking: each) ]
]

{ #category : #Accesing }
Judge >> giveCardTo: aPlayer [
	| gamepiece positionOfPlayerOnBoard square |
	gamepiece := aPlayer gamepiece.
	positionOfPlayerOnBoard := gamepiece positionOnBoard.
	square := board squares at: positionOfPlayerOnBoard.
	square givesCard
		ifTrue: [ aPlayer receivesCard: (OverloadCard withTypeValueAndID: 100) ]
]

{ #category : #Initializing }
Judge >> initializeNamed: aName assuring: anOrderedCollectionOfPlayers on: aBoard [
	name := aName.
	players := anOrderedCollectionOfPlayers.
	playingSequence := PlayingSequence withAllPlayers: anOrderedCollectionOfPlayers.
	board := aBoard.
	thereIsAWinner := false.
	lastCardPlayed := false. 
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
|winner| 
	winner:= self winnerIfNone: [ ^ false ].
	^ winner. 
]

{ #category : #Accesing }
Judge >> ranking: aPlayerGamepiece [
	| gamepieces otherGamepieces ranking |
	ranking := 1.
	gamepieces := (board gamepieces values collect: [ :each | each ]) as: Set.
	otherGamepieces := gamepieces select: [ :each | each color ~= aPlayerGamepiece  color ].
	otherGamepieces
		do: [ :each | 
			each position > aPlayerGamepiece  position
				ifTrue: [ ranking := ranking + 1 ] ].
	^ ranking
]

{ #category : #Accesing }
Judge >> tellLastCardPlayed: aCard [ 
	lastCardPlayed := aCard. 
]

{ #category : #Accesing }
Judge >> thereIsAWinner [
	^ thereIsAWinner
]

{ #category : #Accesing }
Judge >> validateRoundsOfPlayers [
	| gamepieces |
	gamepieces := (board gamepieces values collect: [ :each | each ]) as: Set.
	gamepieces do: [ :each | each changeRoundTo: (each position / board endOfBoard) floor ]
]

{ #category : #Accesing }
Judge >> validateTurnOf: whoWantsToPlay [
	playingSequence currentPlayer  = whoWantsToPlay
		ifTrue: [ playingSequence changeToNextPlayer ]
		ifFalse: [ JudgeValidationFailed signal: 'You cannot play when is not your turn' ]
]

{ #category : #Accesing }
Judge >> winnerIfNone: aBlock [
	| winner |
	winner := players detect: [ :each | each gamepiece rounds >= board rounds ] ifNone: aBlock.
	self determinateFinalRankings.
	thereIsAWinner := true.
	^ winner
]
