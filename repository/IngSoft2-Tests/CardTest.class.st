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
		aCard: (OverloadCard withNameTypeValueAndId: 1)
		andOtherCard: (OverloadCard withNameTypeValueAndId: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (CancellationCard withNameTypeValueAndId: 3)
		andOtherCard: (CancellationCard withNameTypeValueAndId: 4).
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := Set new.
	dices add: (LoadedDice withFaces: 1).
	player1 playsATurnWith: dices.
	player1 playCardById: 1 andApplyTo: player1.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 0.
	player2 playCardById: 3 applyTo: player1 removingCardEffectCausedByCardWithId: 1.
	player1 playsATurnWith: dices.
	self assert: player1 gamepiece position equals: 1.
]

{ #category : #'card-tests' }
CardTest >> testCreateACancellationCard [
	| card |
	card := CancellationCard withNameTypeValueAndId: 1.
	self assert: card type equals: 'instant'.
	self assert: card name equals: 'Cancellation'
]

{ #category : #'card-tests' }
CardTest >> testCreateAnOverloadCard [
	| card |
	card := OverloadCard withNameTypeValueAndId: 1.
	self assert: card type equals: 'permanent'.
	self assert: card name equals: 'Overload'.
	self assert: card value equals: -2
]

{ #category : #'card-tests' }
CardTest >> testOverloadCard [
	| player1 player2 dices |
	player1 := Player
		withName: 'Sol'
		aGamePiece: (Gamepiece withColor: 'pink')
		aCard: (OverloadCard withNameTypeValueAndId: 1)
		andOtherCard: (OverloadCard withNameTypeValueAndId: 2).
	player2 := Player
		withName: 'Dubi'
		aGamePiece: (Gamepiece withColor: 'blue')
		aCard: (OverloadCard withNameTypeValueAndId: 3)
		andOtherCard: (OverloadCard withNameTypeValueAndId: 4).
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
		raise: CardBelongToAPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ].
		
	self
		should: [ player2 playCardById: 4 andApplyTo: player1 ]
		raise: CardBelongToAPlayerFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'This player does not have this card' ]
]
