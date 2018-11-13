"
This is a Square of the Board. It is initialized with an effect. 
"
Class {
	#name : #Square,
	#superclass : #Object,
	#instVars : [
		'effect',
		'givesCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Square class >> withAnEffect: anEffect thatGivesCard: aBooleanValue [
	^ self new initializeWithAnEffect: anEffect thatGivesCard: aBooleanValue.
]

{ #category : #Initializing }
Square >> effect [ 
	^ effect. 
]

{ #category : #Initializing }
Square >> givesCard [
	^ givesCard 
]

{ #category : #Initializing }
Square >> initializeWithAnEffect: anEffect thatGivesCard: aBooleanValue [
	effect := anEffect.
	givesCard:= aBooleanValue.
]
