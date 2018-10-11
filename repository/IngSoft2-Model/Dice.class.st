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
Dice class >> withFaces: aNumberOfFaces [
	self assertValidNumberOfFaces: aNumberOfFaces.
	^self new initializeWithFaces: aNumberOfFaces
]

{ #category : #Accesing }
Dice >> faces [
	^ faces
]

{ #category : #Creations }
Dice >> initializeWithFaces: aNumberOfFaces [
	faces:= aNumberOfFaces
]

{ #category : #Accesing }
Dice >> roll [ 
	^ self subclassResponsibility. 
]
