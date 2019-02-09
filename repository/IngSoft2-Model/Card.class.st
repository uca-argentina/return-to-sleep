"
This is a Card of the Game. It can be Permanent or Instant. 
"
Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #Creating }
Card class >> withValue [ 
	^ self subclassResponsibility.
]
