Class {
	#name : #JudgeTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'judge-tests' }
JudgeTest >> testCreateAJudge [
	| judge |
	judge := Judge named: 'Pitana' assuring: PlayingSequence new on: Board new.
	self assert: judge name equals: 'Pitana'.
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateTurn [
	| judge turn player1 player2 collectionOfPlayers board |
	player1 := Player withName: 'Sol'.
	player2 := Player withName: 'Dubi'.
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers
		add: player1;
		add: player2.
	turn := PlayingSequence withAllPlayers: collectionOfPlayers.
	board := Board new.
	judge := Judge named: 'Pitana' assuring: turn on: board.
	self should: [ judge validateTurn: turn currentPlayer and: player2 ] raise: JudgeValidationFailed.
]
