Class {
	#name : #EffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'effect-tests' }
EffectTest >> testApplyAtomicBombToAGamePiece [
	| player1 player2 dices1 judge board players playingSequence gamepiece1 gamepiece2 gamepieces squares effect0 effect1 effect2 square0 square1 square2 dices2 |
	gamepiece1 := Gamepiece withColor: 'pink'.
	gamepiece2 := Gamepiece withColor: 'blue'.
	gamepieces := Dictionary
		newFrom:
			{(gamepiece1 color -> gamepiece1).
			(gamepiece2 color -> gamepiece2)}.
	effect0 := NonEffect new.
	effect1 := AtomicBomb new.
	effect2 := NonEffect new.
	square0 := Square withAnEffect: effect0.
	square1 := Square withAnEffect: effect1.
	square2 := Square withAnEffect: effect2.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2)}.
	player1 := Player withName: 'Sol' andAGamePiece: gamepiece1.
	player2 := Player withName: 'Dubi' andAGamePiece: gamepiece2.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices1 := Set new.
	dices1 add: (PowerfulDice withFaces: 2).
	dices2 := Set new.
	dices2 add: (PowerfulDice withFaces: 4).
	board := Board withSquares: squares gamePieces: gamepieces andRounds: 2.
	playingSequence := PlayingSequence withAllPlayers: players.
	judge := Judge named: 'Pitana' assuring: playingSequence on: board.
	judge playerTriesToPlay: player1.
	player1 playsWith: dices1.
	judge validateRoundsOfPlayers.
	gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
	board applyEffectToAGamePieceUsingKey: gamepiece1 color.
	judge playerTriesToPlay: player2.
	player2 playsWith: dices2.
	judge validateRoundsOfPlayers.
	gamepiece2 positionOnBoardBasedOnNSquares: board squares size.
	board applyEffectToAGamePieceUsingKey: gamepiece2 color.
	gamepiece2 positionOnBoardBasedOnNSquares: board squares size.
	gamepiece1 positionOnBoardBasedOnNSquares: board squares size.
	self assert: gamepiece1 position equals: 0.
	self assert: gamepiece1 positionOnBoard equals: 0.
	self assert: gamepiece2 position equals: 3.
	self assert: gamepiece2 positionOnBoard equals: 0
]

{ #category : #'effect-tests' }
EffectTest >> testApplyMoonWalkToAGamePiece [
	| effect1 effect2 gamepiece1 gamepiece2 gamepiece3 pieces |
	effect1 := SpeedUp withAPowerValue: 4.
	gamepiece1 := Gamepiece withColor: 'pink'.
	effect1 applyEffectTo: gamepiece1 ofGamePieceCollection: #().
	self assert: gamepiece1 position equals: 4.
	gamepiece2 := Gamepiece withColor: 'blue'.
	effect1 applyEffectTo: gamepiece2 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece2 ofGamePieceCollection: #().
	gamepiece3 := Gamepiece withColor: 'deep-purple'.
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	self assert: gamepiece3 position equals: 12.
	effect2 := MoonWalk withAPowerValue: 3.
	pieces:= OrderedCollection new. 
	pieces add: gamepiece1;
	add:gamepiece2;
	add:gamepiece3. 
	effect2 applyEffectTo: gamepiece1 ofGamePieceCollection: pieces.   
	self
		assert: gamepiece1 position
		equals: 4.
	self assert: gamepiece2 position equals: 5.
	self assert: gamepiece3 position equals: 9
]

{ #category : #'effect-tests' }
EffectTest >> testApplyNonEffectToGamePiece [
	| effect1 gamepiece effect2 |
	effect1 := SpeedUp withAPowerValue: 4.
	gamepiece := Gamepiece withColor: 'pink'.
	effect1 applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 4.
	effect2 := NonEffect new.
	effect2 applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 4.
]

{ #category : #'effect-tests' }
EffectTest >> testApplySpeedUpToAGamePiece [
	| effect gamepiece |
	effect := SpeedUp withAPowerValue: 4.
	gamepiece := Gamepiece withColor: 'pink'.
	effect applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 4
]

{ #category : #'effect-tests' }
EffectTest >> testApplyWormHoleToAGamePiece [
	| effect1 effect2 gamepiece |
	effect1 := SpeedUp withAPowerValue: 4.
	gamepiece := Gamepiece withColor: 'pink'.
	effect1 applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 4.
	effect2 := WormHole withAPowerValue: 4.
	effect2 applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 0
]
