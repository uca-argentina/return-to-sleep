Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'card-tests' }
CardTest >> testCancellationCard [
	| player1 player2 dices players |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (OverloadCard withTypeValueAndId: 1)
		andOtherCard: (OverloadCard withTypeValueAndId: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (CancellationCard withTypeValueAndId: 3)
		andOtherCard: (CancellationCard withTypeValueAndId: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	player2 playsATurnWith: dices.
	player1 playCardById: 1 andApplyTo: player2.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: 0.
	player1 playCardById: 2 andApplyTo: player2.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: -3.
	player2 playCardById: 3 applyTo: players removingCardEffectCausedByCardWithId: 1.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: -4.
	self
		should: [ player2 playCardById: 3 applyTo: players removingCardEffectCausedByCardWithId: 1 ]
		raise: CardBelongFailed
		withExceptionDo:
			[ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	player2 playCardById: 4 applyTo: players removingCardEffectCausedByCardWithId: 2.
	player2 playsATurnWith: dices.
	self assert: player2 gamepiece position equals: -3.
	self
		should: [ player2 playCardById: 4 applyTo: players removingCardEffectCausedByCardWithId: 2 ]
		raise: CardBelongFailed
		withExceptionDo:
			[ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
]

{ #category : #'card-tests' }
CardTest >> testCreateACancellationCard [
	| card |
	card := CancellationCard withTypeValueAndId: 1.
	self assert: card type equals: 'instant'.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateASpeedCard [
	| card |
	card := SpeedCard withTypeValueAndId: 1.
	self assert: card type equals: 'permanent'.
	self assert: card value equals: 1.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testCreateAnOverloadCard [
	| card |
	card := OverloadCard withTypeValueAndId: 1.
	self assert: card type equals: 'permanent'.
	self assert: card value equals: -2.
	self assert: card id equals: 1
]

{ #category : #'card-tests' }
CardTest >> testOverloadCard [
	| player1 player2 dices |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (OverloadCard withTypeValueAndId: 1)
		andOtherCard: (OverloadCard withTypeValueAndId: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (OverloadCard withTypeValueAndId: 3)
		andOtherCard: (OverloadCard withTypeValueAndId: 4).
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 1.
	player2 playCardById: 3 andApplyTo: player1.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 0.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: -1.
	player2 playCardById: 4 andApplyTo: player1.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: -4.
	self
		should: [ player2 playCardById: 3 andApplyTo: player1 ]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
		
	self
		should: [ player2 playCardById: 4 andApplyTo: player1 ]
		raise: CardBelongFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]

{ #category : #'card-tests' }
CardTest >> testSpeedCard [
	| player1 player2 dices |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (SpeedCard withTypeValueAndId: 1)
		andOtherCard: (SpeedCard withTypeValueAndId: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (SpeedCard withTypeValueAndId: 3)
		andOtherCard: (SpeedCard withTypeValueAndId: 4).
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 1.
	player2 playCardById: 3 andApplyTo: player1.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 3.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 5.
	player2 playCardById: 4 andApplyTo: player1.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 8.
	self
		should: [ player2 playCardById: 3 andApplyTo: player1 ]
		raise: CardBelongFailed
		withExceptionDo:
			[ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
	self
		should: [ player2 playCardById: 4 andApplyTo: player1 ]
		raise: CardBelongFailed
		withExceptionDo:
			[ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]
