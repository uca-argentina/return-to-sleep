"
This is a SquareEffectApplied. It saves the last square effect applied on game. 
"
Class {
	#name : #SquareEffectApplied,
	#superclass : #Object,
	#instVars : [
		'effect',
		'affectedGamepiece',
		'gamepieces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
SquareEffectApplied class >> withEffect: anEffect affecting: aGamepiece ofGamepieceCollection: aGamepieceCollection [
	^ self new initializeWithEffect: anEffect affecting: aGamepiece ofGamepieceCollection: aGamepieceCollection
]

{ #category : #Accesing }
SquareEffectApplied >> affectedGamepiece [
	^ affectedGamepiece
]

{ #category : #Accesing }
SquareEffectApplied >> effect [
	^ effect
]

{ #category : #Accesing }
SquareEffectApplied >> gamepieces [
	^ gamepieces
]

{ #category : #Initializing }
SquareEffectApplied >> initializeWithEffect: anEffect affecting: aGamepiece ofGamepieceCollection: aGamepieceCollection [
	effect := anEffect.
	affectedGamepiece := aGamepiece.
	gamepieces := aGamepieceCollection
]
