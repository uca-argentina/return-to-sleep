"
This is an abstract class of an Effect.
"
Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Effect class >> withAPowerValue: aPowerValue [
		^ self subclassResponsibility.
]

{ #category : #Accesing }
Effect >> applyEffectTo: aGamePiece ofGamepieceCollection: aCollection [
	^ self subclassResponsibility. 
]
