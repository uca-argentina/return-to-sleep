"
This is a Board with N Squares
"
Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'squares',
		'goal',
		'meta'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Board class >> assertValidNumberOfSquares: aNumberOfSquares [
	(aNumberOfSquares <10)
	ifTrue: [ InstanceCreationFailed signal: 'You cannot create a board with less than 10 squares.' ].
]

{ #category : #Creating }
Board class >> newWithNSquares: aNumberOfSquares [
self assertValidNumberOfSquares: aNumberOfSquares.
^ self new initializeWithNumberOfSquaresAndAGoal: aNumberOfSquares.

	
]

{ #category : #Creating }
Board >> goal [
	^goal
]

{ #category : #Creating }
Board >> initializeWithNumberOfSquaresAndAGoal: aNumberOfSquares [
	squares:= aNumberOfSquares.
	goal:= aNumberOfSquares 
]

{ #category : #'as yet unclassified' }
Board >> squares [
	^ squares
]
