"
This object creates a collection of Squares with differents effects (by setted proportions). It needs to know the total number of squares.
"
Class {
	#name : #SquareCreator,
	#superclass : #Object,
	#instVars : [
		'totalNumberOfSquares',
		'squares',
		'quantityOfSquaresByEffect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
SquareCreator class >> assertValidNumberOfSquares: aNumberOfSquares [
	aNumberOfSquares < 1
		ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 1 squares.' ]
]

{ #category : #Creating }
SquareCreator class >> withNSquares: aNumberOfSquares [
	self assertValidNumberOfSquares: aNumberOfSquares.
	^ self new initializeWithNSquares: aNumberOfSquares
]

{ #category : #Accesing }
SquareCreator >> calculateProportionsOfSquares [
	| atomicBombSquares moonWalkSquares speedUpSquares wormHoleSquares nonEffectSquares |
	atomicBombSquares := 0.
	wormHoleSquares := 0.
	speedUpSquares := 0.
	moonWalkSquares := 0.
	nonEffectSquares := 0.
	wormHoleSquares := (totalNumberOfSquares * 0.2) floor.
	atomicBombSquares := (totalNumberOfSquares * 0.02) floor.
	moonWalkSquares := (totalNumberOfSquares * 0.1) floor.
	speedUpSquares := (totalNumberOfSquares * 0.2) floor.
	nonEffectSquares := totalNumberOfSquares - wormHoleSquares - atomicBombSquares - speedUpSquares.
	quantityOfSquaresByEffect := Dictionary
		newFrom:
			{('WormHole' -> wormHoleSquares).
			('AtomicBomb' -> atomicBombSquares).
			('MoonWalk' -> moonWalkSquares).
			('SpeedUp' -> speedUpSquares).
			('NonEffect' -> nonEffectSquares)}
]

{ #category : #Accesing }
SquareCreator >> createSquares [
	| firstHalfNonEffectQuantity atomicBombQuantity moonWalkQuantity speedUpQuantity wormHoleQuantity numberOfSquare secondHalfNonEffectQuantity |
	self calculateProportionsOfSquares.
	squares := Dictionary new.
	firstHalfNonEffectQuantity := ((quantityOfSquaresByEffect at: 'NonEffect') / 2) floor.
	secondHalfNonEffectQuantity := (quantityOfSquaresByEffect at: 'NonEffect') - firstHalfNonEffectQuantity.
	atomicBombQuantity := quantityOfSquaresByEffect at: 'AtomicBomb'.
	moonWalkQuantity := quantityOfSquaresByEffect at: 'MoonWalk'.
	speedUpQuantity := quantityOfSquaresByEffect at: 'SpeedUp'.
	wormHoleQuantity := quantityOfSquaresByEffect at: 'WormHole'.
	numberOfSquare := 0.
	[ firstHalfNonEffectQuantity > 0 ]
		whileTrue: [ squares at: numberOfSquare put: (Square withAnEffect: NonEffect new thatGivesCard: false).
			numberOfSquare := numberOfSquare + 1.
			firstHalfNonEffectQuantity := firstHalfNonEffectQuantity - 1 ].
	[ atomicBombQuantity > 0 ]
		whileTrue: [ squares at: numberOfSquare put: (Square withAnEffect: AtomicBomb new thatGivesCard: false).
			numberOfSquare := numberOfSquare + 1.
			atomicBombQuantity := atomicBombQuantity - 1 ].
	[ moonWalkQuantity > 0 ]
		whileTrue: [ squares at: numberOfSquare put: (Square withAnEffect: (MoonWalk withAPowerValue: 1) thatGivesCard: false).
			numberOfSquare := numberOfSquare + 1.
			moonWalkQuantity := moonWalkQuantity - 1 ].
	[ speedUpQuantity > 0 ]
		whileTrue: [ squares at: numberOfSquare put: (Square withAnEffect: (SpeedUp withAPowerValue: 4) thatGivesCard: false).
			numberOfSquare := numberOfSquare + 1.
			speedUpQuantity := speedUpQuantity - 1 ].
	[ wormHoleQuantity > 0 ]
		whileTrue: [ squares at: numberOfSquare put: (Square withAnEffect: (WormHole withAPowerValue: 4)thatGivesCard: false).
			numberOfSquare := numberOfSquare + 1.
			wormHoleQuantity := wormHoleQuantity - 1 ].
	[ secondHalfNonEffectQuantity > 0 ]
		whileTrue: [ squares at: numberOfSquare put: (Square withAnEffect: NonEffect new thatGivesCard: false).
			numberOfSquare := numberOfSquare + 1.
			secondHalfNonEffectQuantity := secondHalfNonEffectQuantity - 1 ].
	^ squares
]

{ #category : #Initializing }
SquareCreator >> initializeWithNSquares: aNumberOfSquares [
	totalNumberOfSquares := aNumberOfSquares
]

{ #category : #Accesing }
SquareCreator >> squares [
	^ squares
]

{ #category : #Accesing }
SquareCreator >> totalNumberOfSquares [
	^ totalNumberOfSquares
]
