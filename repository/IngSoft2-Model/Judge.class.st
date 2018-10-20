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
	(aPlayer position >= board goal)
	ifTrue: [
		self thereIsAWinner: aPlayer name.] 
	
  
	
]

{ #category : #Accesing }
Judge >> playerTriesToPlay: aPlayer [
	self validateTurn: playingSequence currentPlayer and: aPlayer.
]

{ #category : #Accesing }
Judge >> thereIsAWinner [
	^ thereIsAWinner.
]

{ #category : #Accesing }
Judge >> thereIsAWinner: aWinner [
 	winner:= aWinner.
	thereIsAWinner := true.
]

{ #category : #Accesing }
Judge >> validateRoundsOfPlayers [
	| gamepieces gamepieces4 |
	gamepieces := board gamepieces.
	gamepieces4 := gamepieces values collect: [ :each | each ] as: Set.
	gamepieces4 do: [ :y | y changeRoundTo: (y position / board endOfBoard) floor. ]
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
