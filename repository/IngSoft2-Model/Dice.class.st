"
This is a class Dice
"
Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #Creations }
Dice class >> assertValidNumberOfFaces: aNumberOfFaces [ 
	(aNumberOfFaces <1)
	ifTrue: [ InstanceCreationFailed signal: 'You cannot create a dice with zero or negative faces' ].
]

{ #category : #Creations }
Dice class >> newwithNFaces: aNumberOfFaces [
	self assertValidNumberOfFaces: aNumberOfFaces.
	^self new initializeWithFaces: aNumberOfFaces
]

{ #category : #'as yet unclassified' }
Dice >> faces [
	^ faces
]

{ #category : #Creations }
Dice >> initializeWithFaces: aNumberOfFaces [
	faces:= aNumberOfFaces
]
