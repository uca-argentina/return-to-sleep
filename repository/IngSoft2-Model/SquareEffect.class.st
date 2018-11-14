"
This is an abstract class of an Effect.
"
Class {
	#name : #SquareEffect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
SquareEffect class >> withAPowerValue: aPowerValue [
		^ self subclassResponsibility.
]

{ #category : #Accesing }
SquareEffect >> applyEffectTo: aGamePiece ofGamepieceCollection: aCollection [
	^ self subclassResponsibility. 
]
