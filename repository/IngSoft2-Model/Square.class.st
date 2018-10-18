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

{ #category : #Creating }
Square >> effect [ 
	^ effect. 
]

{ #category : #Creating }
Square >> initializeWithAnEffect: anEffect [
	effect := anEffect.
]
