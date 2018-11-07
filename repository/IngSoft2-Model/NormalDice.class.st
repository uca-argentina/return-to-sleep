"
This is a Normal dice. Its method roll will throw a number between 1 and the number of faces.
"
Class {
	#name : #NormalDice,
	#superclass : #Dice,
	#category : #'IngSoft2-Model'
}

{ #category : #Accesing }
NormalDice >> roll [
	^ (1 to: faces) atRandom.
]
