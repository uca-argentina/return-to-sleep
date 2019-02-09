"
This object creates a collection of Squares with differents effects (by setted proportions). It needs to know the total number of squares.
"
Class {
	#name : #SquareCreator,
	#superclass : #Object,
	#instVars : [
		'totalNumberOfSquares',
		'quantityOfSquaresByEffect',
		'numberOfSquare'
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
SquareCreator >> assign: aSquareWithAnEffect to: squares [
	| quantityOfSquares |
	quantityOfSquares := quantityOfSquaresByEffect at: aSquareWithAnEffect effect name.
	[ quantityOfSquares > 0 ]
		whileTrue: [ squares at: numberOfSquare put: aSquareWithAnEffect.
			numberOfSquare := numberOfSquare + 1.
			quantityOfSquares := quantityOfSquares - 1 ]
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
			{('a WormHole' -> wormHoleSquares).
			('an AtomicBomb' -> atomicBombSquares).
			('a MoonWalk' -> moonWalkSquares).
			('a SpeedUp' -> speedUpSquares).
			('a NonEffect' -> nonEffectSquares)}
]

{ #category : #Accesing }
SquareCreator >> createSquares [
 	|squares| 
	self calculateProportionsOfSquares.
	squares := Dictionary new.
	numberOfSquare := 0.
	
	self assign: (Square withAnEffect: NonEffect  new thatGivesCard: false) to: squares.
	self assign: (Square withAnEffect: (MoonWalk withAPowerValue: 1) thatGivesCard: false) to: squares.
	
	self assign: (Square withAnEffect: (SpeedUp withAPowerValue: 4) thatGivesCard: false) to: squares.
	self assign: (Square withAnEffect: (WormHole withAPowerValue: 4) thatGivesCard: false) to: squares.
	self assign: (Square withAnEffect: AtomicBomb new thatGivesCard: false) to: squares.
	
	^ squares
]

{ #category : #Initializing }
SquareCreator >> initializeWithNSquares: aNumberOfSquares [
	totalNumberOfSquares := aNumberOfSquares
]

{ #category : #Accesing }
SquareCreator >> totalNumberOfSquares [
	^ totalNumberOfSquares
]
