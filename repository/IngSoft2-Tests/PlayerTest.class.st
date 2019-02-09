Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#instVars : [
		'dice1',
		'dice2',
		'dice3',
		'setOfDices',
		'gamepiece',
		'player'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'player-tests' }
PlayerTest >> setUp [
	dice1 := LoadedDice withFaces: 5.
	dice2 := LoadedDice withFaces: 10.
	dice3 := LoadedDice withFaces: 5.
	setOfDices := Set new.
	setOfDices
		add: dice1;
		add: dice2;
		add: dice3.
	gamepiece := Gamepiece withInitialPosition.
	player := Player
		withName: 'Sol'
		aGamePiece: gamepiece
		aCard: Overload withValue
		andOtherCard: Overload withValue.
]

{ #category : #'player-tests' }
PlayerTest >> testAPlayerPositionChangesWhenPlays [
	self assert: player gamepiece position equals: 0.
	player playsATurnWith: setOfDices.
	self assert: player gamepiece position equals: 20.
	player playsATurnWith: setOfDices.
	self assert: player gamepiece position equals: 40
]

{ #category : #'player-tests' }
PlayerTest >> testCreateAPlayerWithAGamePieceAndTwoCards [
	self assert: player name equals: 'Sol'.
	self assert: player gamepiece position equals: 0.
]
