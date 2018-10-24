"
This is a Judge who validates the game's turns and check if there is a winner.
"
Class {
	#name : #Judge,
	#superclass : #Object,
	#instVars : [
		'name',
		'board',
		'winner',
		'thereIsAWinner',
		'playingSequence'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Judge class >> named: aName assuring: aPlayingSequence on: aBoard [
	^ self new named: aName assuring: aPlayingSequence on: aBoard.
]

{ #category : #Accesing }
Judge >> determinateFinalRankings [
	| gamepieces |
	gamepieces := (board gamepieces values collect: [ :each | each ]) as: Set.
	gamepieces do: [ :each | each finalRanking: (self ranking: each) ]
]

{ #category : #Creating }
Judge >> name [
^ name.
]

{ #category : #Creating }
Judge >> named: aName assuring: aPlayingSequence on: aBoard. [
	name := aName.
	playingSequence := aPlayingSequence .
	board := aBoard.
	thereIsAWinner:= false.
]

{ #category : #Accesing }
Judge >> playerHasWon: aPlayer [
	aPlayer gamepiece rounds >= board rounds
		ifTrue: [ self thereIsAWinner: aPlayer ]
]

{ #category : #Accesing }
Judge >> playerTriesToPlay: aPlayer [
	self validateTurn: playingSequence currentPlayer and: aPlayer.
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
Judge >> thereIsAWinner [
	^ thereIsAWinner.
]

{ #category : #Accesing }
Judge >> thereIsAWinner: aWinner [
	thereIsAWinner
		ifFalse: [ winner := aWinner.
			thereIsAWinner := true.
			self determinateFinalRankings.
			 ]
]

{ #category : #Accesing }
Judge >> validateRoundsOfPlayers [
	| gamepieces |
	gamepieces := (board gamepieces values collect: [ :each | each ]) as: Set.
	gamepieces do: [ :each | each changeRoundTo: (each position / board endOfBoard) floor ]
]

{ #category : #Accesing }
Judge >> validateTurn: currentPlayer and: whoWantsToPlay [
	currentPlayer = whoWantsToPlay
		ifTrue: [ playingSequence changeToNextPlayer ]
		ifFalse: [ JudgeValidationFailed signal: 'You cannot play when is not your turn' ]
]

{ #category : #Accesing }
Judge >> winner [
	^ winner. 
]
