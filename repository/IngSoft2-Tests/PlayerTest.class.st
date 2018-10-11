Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'player-tests' }
PlayerTest >> testAPlayerPositionChangesWhenPlays [
	
	| dice1 dice2 dice3 setOfDices player |
	
	dice1 := PowerfulDice  withFaces: 5.
	dice2 := PowerfulDice  withFaces: 10.
	dice3 := PowerfulDice withFaces: 5.
	setOfDices := Set new.
	setOfDices add: dice1;
		add:dice2;
		add:dice3.
	player:= Player withName: 'Sol'.
	self assert: player position equals: 1. 
	player playsWith: setOfDices.
	self assert: player position equals: 21. 
	player playsWith: setOfDices.
	self assert: player position equals: 41.
]

{ #category : #'player-tests' }
PlayerTest >> testCreateAPlayer [
	

	| player|
	
	player:= Player withName: 'Sol'.
	self assert: player name equals: 'Sol'.
]
