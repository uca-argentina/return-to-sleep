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
	wormHoleSquares := (totalNumberOfSquares  * 0.2) ceiling.
	atomicBombSquares := (totalNumberOfSquares * 0.02) ceiling.
	moonWalkSquares := (totalNumberOfSquares * 0.1) ceiling.
	speedUpSquares := (totalNumberOfSquares * 0.2) ceiling.
	nonEffectSquares := totalNumberOfSquares - wormHoleSquares - atomicBombSquares
		- speedUpSquares.
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
	self calculateProportionsOfSquares.
	squares := Dictionary new. 
	
	
]

{ #category : #Creating }
SquareCreator >> initializeWithNSquares: aNumberOfSquares [
	totalNumberOfSquares := aNumberOfSquares
]

{ #category : #Accesing }
SquareCreator >> squares [
	^ squares
]

{ #category : #accessing }
SquareCreator >> totalNumberOfSquares [
	^ totalNumberOfSquares
]
