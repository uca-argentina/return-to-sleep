"
This is a Square of the Board. It is initialized with an effect. 
"
Class {
	#name : #Square,
	#superclass : #Object,
	#instVars : [
		'numberOnBoard',
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Square class >> withAnEffect: anEffect [
	^ self new initializeWithAnEffect: anEffect. 
]

{ #category : #Initializing }
Square >> effect [ 
	^ effect. 
]

{ #category : #Initializing }
Square >> initializeWithAnEffect: anEffect [
	effect := anEffect.
]
