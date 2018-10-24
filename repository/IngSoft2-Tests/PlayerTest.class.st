Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'player-tests' }
PlayerTest >> testAPlayerPositionChangesWhenPlays [
	| dice1 dice2 dice3 setOfDices player gamepiece |
	dice1 := PowerfulDice withFaces: 5.
	dice2 := PowerfulDice withFaces: 10.
	dice3 := PowerfulDice withFaces: 5.
	setOfDices := Set new.
	setOfDices
		add: dice1;
		add: dice2;
		add: dice3.
	gamepiece := Gamepiece withColor: 'pink'.
	player := Player withName: 'Sol' andAGamePiece: gamepiece.
	self assert: player gamepiece position equals: 0.
	player playsWith: setOfDices.
	self assert: player gamepiece position equals: 20.
	player playsWith: setOfDices.
	self assert: player gamepiece position equals: 40. 
]

{ #category : #'player-tests' }
PlayerTest >> testCreateAPlayerWithAGamePiece [
	| player aGamePiece |
	aGamePiece := Gamepiece withColor: 'red'.
	player := Player withName: 'Sol' andAGamePiece: aGamePiece.
	self assert: player name equals: 'Sol'
]
