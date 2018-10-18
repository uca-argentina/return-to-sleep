Class {
	#name : #JudgeTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'judge-tests' }
JudgeTest >> testCreateAJudge [
	| judge |
	judge := Judge named: 'Pitana' assuring: PlayingSequence new on: DeterministicBoard new.
	self assert: judge name equals: 'Pitana'.
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateTurn [
	| judge turn player1 player2 collectionOfPlayers board gamepiece1 gamepiece2|
	
	gamepiece1:= GamePiece withColor: 'red'.
	gamepiece2:= GamePiece withColor: 'blue'. 
	player1 := Player withName: 'Sol' andAGamePiece: gamepiece1.
	player2 := Player withName: 'Dubi' andAGamePiece: gamepiece2. 
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers
		add: player1;
		add: player2.
	turn := PlayingSequence withAllPlayers: collectionOfPlayers.
	board := Board withNSquares: 100.
	judge := Judge named: 'Pitana' assuring: turn on: board.
	self
		should: [ judge validateTurn: turn currentPlayer and: player2 ]
		raise: JudgeValidationFailed
]
