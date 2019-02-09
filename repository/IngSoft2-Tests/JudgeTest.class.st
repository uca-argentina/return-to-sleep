Class {
	#name : #JudgeTest,
	#superclass : #TestCase,
	#instVars : [
		'gamepiece1',
		'gamepiece2',
		'gamepieces'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'judge-tests' }
JudgeTest >> setUp [
	gamepiece1 := Gamepiece withInitialPosition.
	gamepiece2 := Gamepiece withInitialPosition.
	gamepieces := Set new.
	gamepieces
		add: gamepiece1;
		add: gamepiece2.
		
]

{ #category : #'judge-tests' }
JudgeTest >> testCreateAJudge [
	| judge player1 player2 players aFirstCard aSecondCard |
	player1 := Player
		withName: 'Sol'
		aGamePiece: Gamepiece withInitialPosition
		aCard: aFirstCard
		andOtherCard: aSecondCard.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: Gamepiece withInitialPosition
		aCard: aFirstCard
		andOtherCard: aSecondCard.
		
	players := OrderedCollection new.
		players
		add: player1;
		add: player2.
	judge := Judge
		named: 'Pitana'
		assuring: players
		on: Board new.
	self assert: judge name equals: 'Pitana'
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeGiveCardToAPlayer [
	| player1 dices1 judge board players squares effect1 effect4 square0 square1 square2 square3 square4 card1 card2 giftedCard nonEffect |
	nonEffect := NonEffect new. effect1 := MoonWalk withAPowerValue: 2.
	effect4 := SpeedUp withAPowerValue: 2.
	square0 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square1 := Square
		withAnEffect: nonEffect
		thatGivesCard: true.
	square2 := Square
		withAnEffect: nonEffect
		thatGivesCard: true.
	square3 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square4 := Square
		withAnEffect: effect4
		thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	card1 := Overload withValue.
	card2 := Overload withValue.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: card1
		andOtherCard: card2.
	players := OrderedCollection new.
	players add: player1.
	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 1).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge
		named: 'Pitana'
		assuring: players
		on: board.
	player1 playsATurnWith: dices1.
	board updateGamepiecesPositionOnBoard.
	giftedCard := judge giveCardTo: player1.
	player1
		playCard: giftedCard
		applyTo: players
		removingCardEffectCausedByCard: card1
		andTellJudge: judge
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeGiveCardsToAPlayer [
	| player1 dices1 judge board players squares effect1 effect4 square0 square1 square2 square3 square4 card1 card2 giftedCard1 giftedCard2 nonEffect |
	nonEffect := NonEffect new.
	effect1 := MoonWalk withAPowerValue: 2.
	effect4 := SpeedUp withAPowerValue: 2.
	square0 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square1 := Square
		withAnEffect: effect1
		thatGivesCard: true.
	square2 := Square
		withAnEffect: nonEffect
		thatGivesCard: true.
	square3 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square4 := Square
		withAnEffect: effect4
		thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	card1 := Overload withValue.
	card2 := Overload withValue.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: card1
		andOtherCard: card2.
	players := OrderedCollection new.
	players add: player1.
	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 1).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge
		named: 'Pitana'
		assuring: players
		on: board.
	player1 playsATurnWith: dices1.
	board updateGamepiecesPositionOnBoard.
	giftedCard1 := judge giveCardTo: player1.
	giftedCard2 := judge giveCardTo: player1.
	player1
		playCard: giftedCard1
		applyTo: players
		removingCardEffectCausedByCard: card1
		andTellJudge: judge.
	self
		should: [ player1
				playCard: giftedCard1
				applyTo: players
				removingCardEffectCausedByCard: card1
				andTellJudge: judge ]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText
				equals: 'This player does not have this card' ].
	player1
		playCard: giftedCard2
		applyingEffect: board lastSquareEffectApplied
		andTellJudge: judge.
	self
		should: [ player1
				playCard: giftedCard2
				applyingEffect: board lastSquareEffectApplied
				andTellJudge: judge ]
		raise: CardBelongToPlayerFailed
		withExceptionDo: [ :exception | 
			self
				assert: exception messageText
				equals: 'This player does not have this card' ]
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateTurn [
	| judge turn player1 player2 collectionOfPlayers board squares |
	
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers
		add: player1;
		add: player2.
	turn := PlayingSequence
		withAllPlayers: collectionOfPlayers.
	squares := Set new.
	squares
		add: (Square withAnEffect: NonEffect new thatGivesCard: false).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge
		named: 'Pitana'
		assuring: collectionOfPlayers
		on: board.
	self
		should: [ judge validateTurnOf: player2 ]
		raise: JudgeValidationFailed
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateTurnWhenAPlayerPlaysAPermanentCard [
	| player1 player2 dices players judge square0 square1 square2 square3 square4 squares board card1 card2 card3 card4 nonEffect |
	card1 := Repeat withValue.
	card2 := Overload withValue.
	card3 := Overload withValue.
	card4 := Repeat withValue.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: card1
		andOtherCard: card2.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: card3
		andOtherCard: card4.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 4).
	nonEffect := NonEffect new.
	square0 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square1 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square2 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square3 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square4 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge
		named: 'Pitana'
		assuring: players
		on: board.
	judge validateTurnOf: player1.
	player1 playsATurnWith: dices.
	player1
		playCard: card2
		applyTo: player2
		andTellJudge: judge.
	judge validateRoundsOfPlayers.
	board updateGamepiecesPositionOnBoard.
	board applyEffectToAGamepiece: gamepiece1.
	self assert: player1 gamepiece position equals: 4.
	judge changeTurnOfPlayers.
	player1
		playCard: card1
		applyingEffect: board lastSquareEffectApplied
		andTellJudge: judge.
	judge validateTurnOf: player2.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: 2.
	judge changeTurnOfPlayers.
	self
		should: [ player2
				playCard: card3
				applyTo: player1
				andTellJudge: judge ]
		raise: JudgeValidationFailed
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateWhenPlayerCompletesARound [
	| board squares square1 square2 square3 square4 player dices effect1 effect2 effect3 effect4 effect0 square0 judge |
	effect0 := NonEffect new.
	effect1 := AtomicBomb new.
	effect2 := SpeedUp withAPowerValue: 1.
	effect3 := WormHole withAPowerValue: 2.
	effect4 := MoonWalk withAPowerValue: 1.
	square0 := Square
		withAnEffect: effect0
		thatGivesCard: false.
	square1 := Square
		withAnEffect: effect1
		thatGivesCard: false.
	square2 := Square
		withAnEffect: effect2
		thatGivesCard: false.
	square3 := Square
		withAnEffect: effect3
		thatGivesCard: false.
	square4 := Square
		withAnEffect: effect4
		thatGivesCard: false.
	player := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 5.
	dices := Set new.
	dices add: (LoadedDice withFaces: 3).
	judge := Judge
		named: 'Pitana'
		assuring: player asOrderedCollection
		on: board.
	player playsATurnWith: dices.
	self assert: gamepiece1 position equals: 3.
	board updateGamepiecesPositionOnBoard.
	board applyEffectToAGamepiece: gamepiece1.
	self assert: gamepiece1 position equals: 1.
	player playsATurnWith: dices.
	board updateGamepiecesPositionOnBoard.
	board applyEffectToAGamepiece: gamepiece1.
	self assert: gamepiece1 position equals: 4.
	player playsATurnWith: dices.
	board updateGamepiecesPositionOnBoard.
	self assert: gamepiece1 position equals: 7.
	judge validateRoundsOfPlayers.
	self assert: gamepiece1 rounds equals: 1
]

{ #category : #'judge-tests' }
JudgeTest >> testJudgeValidateWhenPlayerHasToUndoARoundBecauseOfWormHoleEffect [
	| board squares square1 square2 player dices effect1 square0 judge players nonEffect |
	nonEffect := NonEffect new.
	effect1 := WormHole withAPowerValue: 3.
	square0 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square1 := Square
		withAnEffect: effect1
		thatGivesCard: false.
	square2 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	player := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	players := OrderedCollection new.
	players add: player.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2)}.
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 5.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	judge := Judge
		named: 'Pitana'
		assuring: players
		on: board.
	player playsATurnWith: dices.
	gamepiece1
		positionOnBoardBasedOnNSquares: board squares size.
	self assert: gamepiece1 position equals: 1.
	board applyEffectToAGamepiece: gamepiece1.
	self assert: gamepiece1 position equals: -2.
	judge validateRoundsOfPlayers.
	self assert: gamepiece1 rounds equals: -1
]

{ #category : #'judge-tests' }
JudgeTest >> testJugdeDeterminateWinner [
	| player1 player2 dices1 judge board players winner squares  effect1 effect4 square0 square1 square2 square3 square4 dices2 nonEffect |
	nonEffect := NonEffect new.
	effect1 := MoonWalk withAPowerValue: 2.
	effect4 := SpeedUp withAPowerValue: 2.
	square0 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square1 := Square
		withAnEffect: effect1
		thatGivesCard: false.
	square2 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square3 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square4 := Square
		withAnEffect: effect4
		thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 1).
	dices2 := Set new.
	dices2 add: (LoadedDice withFaces: 2).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge
		named: 'Pitana'
		assuring: players
		on: board.
	[ judge playerHasWon ]
		whileFalse: [ judge validateTurnOf: player1.
			player1 playsATurnWith: dices1.
			judge validateRoundsOfPlayers.
			board updateGamepiecesPositionOnBoard.
			judge giveCardTo: player1.
			board applyEffectToAGamepiece: gamepiece1.
			judge changeTurnOfPlayers.
			judge validateTurnOf: player2.
			player2 playsATurnWith: dices2.
			judge validateRoundsOfPlayers.
			board updateGamepiecesPositionOnBoard.
			judge giveCardTo: player2.
			board applyEffectToAGamepiece: gamepiece2.
			judge validateRoundsOfPlayers.
			winner := judge winner.
			judge changeTurnOfPlayers ].
	self assert: judge playerHasWon equals: true.
	self assert: winner name equals: 'Dubi'.
	self assert: player1 gamepiece finalRanking equals: 2.
	self assert: player2 gamepiece finalRanking equals: 1
]

{ #category : #'judge-tests' }
JudgeTest >> testJugdeTellsRankingOfAPlayer [
	| player1 player2 dices1 judge board players squares effect1 effect2 effect3 effect4 square0 square1 square2 square3 square4 square5 dices2 nonEffect |
	nonEffect := NonEffect new.
	effect1 := SpeedUp withAPowerValue: 1.
	effect2 := MoonWalk withAPowerValue: 2.
	effect3 := WormHole withAPowerValue: 2.
	effect4 := AtomicBomb new.
	square0 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	square1 := Square
		withAnEffect: effect1
		thatGivesCard: false.
	square2 := Square
		withAnEffect: effect2
		thatGivesCard: false.
	square3 := Square
		withAnEffect: effect3
		thatGivesCard: false.
	square4 := Square
		withAnEffect: effect4
		thatGivesCard: false.
	square5 := Square
		withAnEffect: nonEffect
		thatGivesCard: false.
	squares := Dictionary
		newFrom:
			{(0 -> square0).
			(1 -> square1).
			(2 -> square2).
			(3 -> square3).
			(4 -> square4)}.
	player1 := Player
		withName: 'Sol'
		aGamePiece: gamepiece1
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: gamepiece2
		aCard: Overload withValue
		andOtherCard: Overload withValue.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices1 := Set new.
	dices1 add: (LoadedDice withFaces: 4).
	dices2 := Set new.
	dices2 add: (LoadedDice withFaces: 3).
	board := Board
		withSquares: squares
		gamepieces: gamepieces
		andRounds: 2.
	judge := Judge
		named: 'Pitana'
		assuring: players
		on: board.
	judge validateTurnOf: player1.
	player1 playsATurnWith: dices1.
	judge validateRoundsOfPlayers.
	judge playerHasWon.
	judge changeTurnOfPlayers.
	judge validateTurnOf: player2.
	player2 playsATurnWith: dices2.
	judge validateRoundsOfPlayers.
	judge playerHasWon.
	judge changeTurnOfPlayers.
	judge validateTurnOf: player1.
	player1 playsATurnWith: dices1.
	judge validateRoundsOfPlayers.
	judge playerHasWon.
	judge changeTurnOfPlayers.
	judge validateTurnOf: player2.
	player2 playsATurnWith: dices2.
	judge validateRoundsOfPlayers.
	judge playerHasWon.
	self assert: (judge ranking: player2 gamepiece) equals: 2.
	self assert: (judge ranking: player1 gamepiece) equals: 1
]

{ #category : #'judge-tests' }
JudgeTest >> testTellLastCardPlayedToJudge [
	| judge player1 player2 players card1 card2 card3 card4 |
	card1 := Overload withValue.
	card2 := Overload withValue.
	card3 := Overload withValue.
	card4 := Overload withValue.
	player1 := Player
		withName: 'Sol'
		aGamePiece: Gamepiece withInitialPosition
		aCard: card1
		andOtherCard: card2.
	player2 := Player
		withName: 'Dubi'
		aGamePiece: Gamepiece withInitialPosition
		aCard: card3
		andOtherCard: card4.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	player1 playCard: card1 applyTo: player2 andTellJudge: judge.
	self assert: judge lastCardPlayed equals: card1
]
