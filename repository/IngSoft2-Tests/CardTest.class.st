Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'card-tests' }
CardTest >> testAccelerationCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (Overload withValueAndID: 1)
		andOtherCard: (Acceleration withValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (Overload withValueAndID: 3)
		andOtherCard: (Acceleration withValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 1.
	player1 playCardByID: 2 applyTo: players andTellJudge: judge.
	judge changeTurnOfPlayers.
	judge changeTurnOfPlayers.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	player2 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 3.
	self assert: player2 gamepiece position equals: 2.
	player2 playCardByID: 4 applyTo: players andTellJudge: judge.
	judge changeTurnOfPlayers.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	player2 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: 6.
	self assert: player2 gamepiece position equals: 5.
	self
		should: [ player1 playCardByID: 2 applyTo: players andTellJudge: judge ]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	judge changeTurnOfPlayers.
	self
		should: [ player2 playCardByID: 4 applyTo: players andTellJudge: judge ]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testCancellationCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (Overload withValueAndID: 1)
		andOtherCard: (Acceleration withValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (Cancellation withValueAndID: 3)
		andOtherCard: (Cancellation withValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	player1 playsATurnWith: dices.
	player2 playsATurnWith: dices.
	player1 playCardByID: 1 applyTo: player2 andTellJudge: judge.
	player2 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 1.
	self assert: player2 gamepiece position equals: 0.
	player1 playCardByID: 2 applyTo: players andTellJudge: judge.
	player2 playsATurnWith: dices.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 3.
	self assert: player2 gamepiece position equals: 0.
	player2 playCardByID: 3 applyTo: players removingCardEffectCausedByCardWithId: 1 andTellJudge: judge.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: 2.
	self
		should: [ player2 playCardByID: 3 applyTo: players removingCardEffectCausedByCardWithId: 1 andTellJudge: judge]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	player2 playCardByID: 4 applyTo: players removingCardEffectCausedByCardWithId: 2 andTellJudge: judge.
	player2 playsATurnWith: dices.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 4.
	self assert: player2 gamepiece position equals: 3.
	self
		should: [ player2 playCardByID: 4 applyTo: players removingCardEffectCausedByCardWithId: 2 andTellJudge: judge ]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testCreateACancellationCard [
	| card |
	card := Cancellation withValueAndID: 1.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateARedoCard [
	| card |
	card := Redo withValueAndID: 1.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateARepeatCard [
	| card |
	card := Repeat withValueAndID: 1.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateASpeedCard [
	| card |
	card := Speed withValueAndID: 1.
	self assert: card value equals: 1.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateAnAccelerationCard [
	| card |
	card := Acceleration withValueAndID: 1.
	self assert: card value equals: 1.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateAnOverloadCard [
	| card |
	card := Overload withValueAndID: 1.
	self assert: card value equals: -2.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testOverloadCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (Overload withValueAndID: 1)
		andOtherCard: (Overload withValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (Overload withValueAndID: 3)
		andOtherCard: (Overload withValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: 1.
	player2 playCardByID: 3 applyTo: player1 andTellJudge: judge.
	judge changeTurnOfPlayers.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: 0.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: -1.
	player2 playCardByID: 4 applyTo: player1 andTellJudge: judge.
	judge changeTurnOfPlayers.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: -4.
	self
		should: [ player2 playCardByID: 3 applyTo: player1 andTellJudge: judge ]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	self
		should: [ player2 playCardByID: 4 applyTo: player1 andTellJudge: judge]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testRedoCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (Overload withValueAndID: 1)
		andOtherCard: (Cancellation withValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (Redo withValueAndID: 3)
		andOtherCard: (Redo withValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	player1 playCardByID: 1 applyTo: player2 andTellJudge: judge.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: -1.
	player2
		playCardByID: 3
		applyTo: player2
		redoingCardEffectMadeByCard: judge lastCardPlayed
		andTellJudge: judge.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: -4.
	player1
		playCardByID: 2
		applyTo: players
		removingCardEffectCausedByCardWithId: 1
		andTellJudge: judge.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: -5.
	player2
		playCardByID: 4
		applyTo: players
		redoingCardEffectMadeByCard: judge lastCardPlayed
		removingCardEffectCausedByCardWithId: 1
		andTellJudge: judge.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: -4.
	
self
		should: [ player2
		playCardByID: 3
		applyTo: player2
		redoingCardEffectMadeByCard: judge lastCardPlayed
		andTellJudge: judge.]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	self
		should: [ player2
		playCardByID: 4
		applyTo: players
		redoingCardEffectMadeByCard: judge lastCardPlayed
		removingCardEffectCausedByCardWithId: 1
		andTellJudge: judge.]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testRepeatCard [
	| player1 player2 dices players judge gamepiece1 gamepiece2 gamepieces effect0 effect1 effect2 effect3 effect4 square0 square1 square2 square3 square4 squares board |
	gamepiece1 := Gamepiece withColor: 'pink'.
	gamepiece2 := Gamepiece withColor: 'blue'.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: (Repeat withValueAndID: 1)
		andOtherCard: (Overload withValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: (Overload withValueAndID: 3)
		andOtherCard: (Repeat withValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 4).
	gamepieces := Dictionary
		newFrom:
			{(gamepiece1 color -> gamepiece1).
			(gamepiece2 color -> gamepiece2)}.
	effect0 := NonEffect new.
	effect1 := MoonWalk withAPowerValue: 2.
	effect2 := NonEffect new.
	effect3 := NonEffect new.
	effect4 := SpeedUp withAPowerValue: 2.
	square0 := Square withAnEffect: effect0 thatGivesCard: false.
	square1 := Square withAnEffect: effect1 thatGivesCard: false.
	square2 := Square withAnEffect: effect2 thatGivesCard: false.
	square3 := Square withAnEffect: effect3 thatGivesCard: false.
	square4 := Square withAnEffect: effect4 thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	board := Board withSquares: squares gamepieces: gamepieces andRounds: 2.
	judge := Judge named: 'Pitana' assuring: players on: board.
	judge validateTurnOf: player1.
	player1 playsATurnWith: dices.
	judge validateRoundsOfPlayers.
	board updateGamepiecesPositionOnBoard.
	board applyEffectToAGamepieceUsingKey: gamepiece1 color.
	self assert: player1 gamepiece position equals: 6.
	player2 playCardByID: 4 applyingEffect: board lastSquareEffectApplied andTellJudge: judge.
	self assert: player1 gamepiece position equals:8.
]

{ #category : #'card-tests' }
CardTest >> testRepeatCardWithAnAtomicBombEffect [
	| player1 player2 dices players judge gamepiece1 gamepiece2 gamepieces effect0 effect1 effect2 effect3 effect4 square0 square1 square2 square3 square4 squares board dices2 |
	gamepiece1 := Gamepiece withColor: 'pink'.
	gamepiece2 := Gamepiece withColor: 'blue'.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: (Repeat withValueAndID: 1)
		andOtherCard: (Overload withValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: (Overload withValueAndID: 3)
		andOtherCard: (Repeat withValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 4).
	dices2 := Set new.
	dices2 add: (LoadedDice withFaces: 3).
	gamepieces := Dictionary
		newFrom:
			{(gamepiece1 color -> gamepiece1).
			(gamepiece2 color -> gamepiece2)}.
	effect0 := NonEffect new.
	effect1 := NonEffect new.
	effect2 := NonEffect new.
	effect3 := NonEffect new.
	effect4 := AtomicBomb new.
	square0 := Square withAnEffect: effect0 thatGivesCard: false.
	square1 := Square withAnEffect: effect1 thatGivesCard: false.
	square2 := Square withAnEffect: effect2 thatGivesCard: false.
	square3 := Square withAnEffect: effect3 thatGivesCard: false.
	square4 := Square withAnEffect: effect4 thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	board := Board withSquares: squares gamepieces: gamepieces andRounds: 2.
	judge := Judge named: 'Pitana' assuring: players on: board.
	judge validateTurnOf: player1.
	player1 playsATurnWith: dices.
	judge validateRoundsOfPlayers.
	board updateGamepiecesPositionOnBoard.
	board applyEffectToAGamepieceUsingKey: gamepiece1 color.
	judge validateRoundsOfPlayers.
	
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: 0.
	judge validateTurnOf: player2.
	player2 playsATurnWith: dices2.
	judge validateRoundsOfPlayers.
	board updateGamepiecesPositionOnBoard.
	board applyEffectToAGamepieceUsingKey: gamepiece2 color.
	judge validateRoundsOfPlayers.
	judge changeTurnOfPlayers.
	self assert: player2 gamepiece position equals: 3.
	judge validateTurnOf: player1.
	player1 playsATurnWith: dices2.
	judge validateRoundsOfPlayers.
	board updateGamepiecesPositionOnBoard.
	board applyEffectToAGamepieceUsingKey: gamepiece1 color.
	judge validateRoundsOfPlayers.
	
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: 3.
	judge validateTurnOf: player2.
	player2 playsATurnWith: dices2.
	judge validateRoundsOfPlayers.
	board updateGamepiecesPositionOnBoard.
	board applyEffectToAGamepieceUsingKey: gamepiece2 color.
	judge validateRoundsOfPlayers.
	self assert: player2 gamepiece position equals: 6.
	player2 playCardByID: 4 applyingEffect: board lastSquareEffectApplied andTellJudge: judge.
	self assert: player2 gamepiece position equals: 5
]

{ #category : #'card-tests' }
CardTest >> testSpeedCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (Speed withValueAndID: 1)
		andOtherCard: (Speed withValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (Speed withValueAndID: 3)
		andOtherCard: (Speed withValueAndID: 4).
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: 1.
	player2 playCardByID: 3 applyTo: player1 andTellJudge: judge.
	judge changeTurnOfPlayers.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 3.
	judge changeTurnOfPlayers.
	judge changeTurnOfPlayers.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: 5.
	player2 playCardByID: 4 applyTo: player1 andTellJudge: judge.
	judge changeTurnOfPlayers.
	player1 playsATurnWith: dices.
	judge changeTurnOfPlayers.
	self assert: player1 gamepiece position equals: 8.
	self
		should: [ player2 playCardByID: 3 applyTo: player1 andTellJudge: judge. ]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
		judge changeTurnOfPlayers.
		judge changeTurnOfPlayers.
	self
		should: [ player2 playCardByID: 4 applyTo: player1 andTellJudge: judge.]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]
