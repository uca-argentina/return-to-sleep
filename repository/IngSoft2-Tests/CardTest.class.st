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
		aCard: (OverloadCard withTypeValueAndID: 1)
		andOtherCard: (AccelerationCard withTypeValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (OverloadCard withTypeValueAndID: 3)
		andOtherCard: (AccelerationCard withTypeValueAndID: 4).
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
	player1 playsATurnWith: dices.
	player2 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 3.
	self assert: player2 gamepiece position equals: 2.
	player2 playCardByID: 4 applyTo: players andTellJudge: judge.
	player1 playsATurnWith: dices.
	player2 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 6.
	self assert: player2 gamepiece position equals: 5.
	self
		should: [ player1 playCardByID: 2 applyTo: players andTellJudge: judge ]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	self
		should: [ player2 playCardByID: 4 applyTo: players andTellJudge: judge ]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testCancellationCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (OverloadCard withTypeValueAndID: 1)
		andOtherCard: (AccelerationCard withTypeValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (CancellationCard withTypeValueAndID: 3)
		andOtherCard: (CancellationCard withTypeValueAndID: 4).
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
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	player2 playCardByID: 4 applyTo: players removingCardEffectCausedByCardWithId: 2 andTellJudge: judge.
	player2 playsATurnWith: dices.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 4.
	self assert: player2 gamepiece position equals: 3.
	self
		should: [ player2 playCardByID: 4 applyTo: players removingCardEffectCausedByCardWithId: 2 andTellJudge: judge ]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testCreateACancellationCard [
	| card |
	card := CancellationCard withTypeValueAndID: 1.
	self assert: card type equals: 'instant'.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateARedoCard [
	| card |
	card := RedoCard withTypeValueAndID: 1.
	self assert: card type equals: 'instant'.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateARepeatCard [
	| card |
	card := RepeatCard withTypeValueAndID: 1.
	self assert: card type equals: 'instant'.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateASpeedCard [
	| card |
	card := SpeedCard withTypeValueAndID: 1.
	self assert: card type equals: 'permanent'.
	self assert: card value equals: 1.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateAnAccelerationCard [
	| card |
	card := AccelerationCard withTypeValueAndID: 1.
	self assert: card type equals: 'permanent'.
	self assert: card value equals: 1.
	self assert: card id equals: 1.
]

{ #category : #'card-tests' }
CardTest >> testCreateAnOverloadCard [
	| card |
	card := OverloadCard withTypeValueAndID: 1.
	self assert: card type equals: 'permanent'.
	self assert: card value equals: -2.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testOverloadCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (OverloadCard withTypeValueAndID: 1)
		andOtherCard: (OverloadCard withTypeValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (OverloadCard withTypeValueAndID: 3)
		andOtherCard: (OverloadCard withTypeValueAndID: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 1.
	player2 playCardByID: 3 applyTo: player1 andTellJudge: judge.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 0.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: -1.
	player2 playCardByID: 4 applyTo: player1 andTellJudge: judge.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: -4.
	self
		should: [ player2 playCardByID: 3 applyTo: player1 andTellJudge: judge ]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	self
		should: [ player2 playCardByID: 4 applyTo: player1 andTellJudge: judge]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testRedoCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (OverloadCard withTypeValueAndID: 1)
		andOtherCard: (CancellationCard withTypeValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (RedoCard withTypeValueAndID: 3)
		andOtherCard: (RedoCard withTypeValueAndID: 4).
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
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	self
		should: [ player2
		playCardByID: 4
		applyTo: players
		redoingCardEffectMadeByCard: judge lastCardPlayed
		removingCardEffectCausedByCardWithId: 1
		andTellJudge: judge.]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testSpeedCard [
	| player1 player2 dices players judge |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (SpeedCard withTypeValueAndID: 1)
		andOtherCard: (SpeedCard withTypeValueAndID: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (SpeedCard withTypeValueAndID: 3)
		andOtherCard: (SpeedCard withTypeValueAndID: 4).
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	judge := Judge named: 'Pitana' assuring: players on: Board new.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 1.
	player2 playCardByID: 3 applyTo: player1 andTellJudge: judge.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 3.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 5.
	player2 playCardByID: 4 applyTo: player1 andTellJudge: judge.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 8.
	self
		should: [ player2 playCardByID: 3 applyTo: player1 andTellJudge: judge. ]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	self
		should: [ player2 playCardByID: 4 applyTo: player1 andTellJudge: judge.]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]
