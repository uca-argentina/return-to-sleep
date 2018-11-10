Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'player-tests' }
PlayerTest >> testAPlayerPositionChangesWhenPlays [
	| dice1 dice2 dice3 setOfDices player gamepiece |
	dice1 := LoadedDice withFaces: 5.
	dice2 := LoadedDice withFaces: 10.
	dice3 := LoadedDice withFaces: 5.
	setOfDices := Set new.
	setOfDices
		add: dice1;
		add: dice2;
		add: dice3.
	gamepiece := Gamepiece withColor: 'pink'.
	player := Player
		withName: 'Sol'
		aGamePiece: gamepiece
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	self assert: player gamepiece position equals: 0.
	player playsATurnWith: setOfDices.
	self assert: player gamepiece position equals: 20.
	player playsATurnWith: setOfDices.
	self assert: player gamepiece position equals: 40
]

{ #category : #'player-tests' }
PlayerTest >> testCreateAPlayerWithAGamePieceAndTwoCards [
	| player aGamePiece |
	aGamePiece := Gamepiece withColor: 'red'.
	player := Player
		withName: 'Sol'
		aGamePiece: aGamePiece
		aCard: (OverloadCard withTypeValueAndId: 1)
		andOtherCard: (OverloadCard withTypeValueAndId: 2).
	self assert: player name equals: 'Sol'.
	self assert: player gamepiece color equals: 'red'
]
