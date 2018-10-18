Class {
	#name : #EffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
EffectTest >> testApplyAtomicBombToAGamePiece [
	| effect1 effect2 gamepiece1 gamepiece2 gamepiece3 pieces |
	effect1 := SpeedUp withAPowerValue: 4.
	gamepiece1 := GamePiece withColor: 'pink'.
	effect1 applyEffectTo: gamepiece1 ofGamePieceCollection: #().
	self assert: gamepiece1 position equals: 4.
	gamepiece2 := GamePiece withColor: 'blue'.
	effect1 applyEffectTo: gamepiece2 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece2 ofGamePieceCollection: #().
	gamepiece3 := GamePiece withColor: 'deep-purple'.
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	self assert: gamepiece3 position equals: 12.
	effect2 := AtomicBomb withAPowerValue: 0.
	pieces := OrderedCollection new.
	pieces
		add: gamepiece1;
		add: gamepiece2;
		add: gamepiece3.
	effect2 applyEffectTo: gamepiece1 ofGamePieceCollection: pieces.
	self assert: gamepiece1 position equals: 0.
	self assert: gamepiece2 position equals: 0.
	self assert: gamepiece3 position equals: 0
]

{ #category : #tests }
EffectTest >> testApplyMoonWalkToAGamePiece [
	| effect1 effect2 gamepiece1 gamepiece2 gamepiece3 pieces |
	effect1 := SpeedUp withAPowerValue: 4.
	gamepiece1 := GamePiece withColor: 'pink'.
	effect1 applyEffectTo: gamepiece1 ofGamePieceCollection: #().
	self assert: gamepiece1 position equals: 4.
	gamepiece2 := GamePiece withColor: 'blue'.
	effect1 applyEffectTo: gamepiece2 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece2 ofGamePieceCollection: #().
	gamepiece3 := GamePiece withColor: 'deep-purple'.
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	effect1 applyEffectTo: gamepiece3 ofGamePieceCollection: #().
	self assert: gamepiece3 position equals: 12.
	effect2 := MoonWalk withAPowerValue: 3.
	pieces:= OrderedCollection new. 
	pieces add: gamepiece1;
	add:gamepiece2;
	add:gamepiece3. 
	effect2 applyEffectTo: gamepiece1 ofGamePieceCollection: pieces.   
	self
		assert: gamepiece1 position
		equals: 4.
	self assert: gamepiece2 position equals: 5.
	self assert: gamepiece3 position equals: 9
]

{ #category : #tests }
EffectTest >> testApplyNonEffectToGamePiece [
	| effect1 gamepiece effect2 |
	effect1 := SpeedUp withAPowerValue: 4.
	gamepiece := GamePiece withColor: 'pink'.
	effect1 applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 4.
	effect2 := NonEffect new.
	effect2 applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 4.
]

{ #category : #tests }
EffectTest >> testApplySpeedUpToAGamePiece [
	| effect gamepiece |
	effect := SpeedUp withAPowerValue: 4.
	gamepiece := GamePiece withColor: 'pink'.
	effect applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 4
]

{ #category : #tests }
EffectTest >> testApplyWormHoleToAGamePiece [
	| effect1 effect2 gamepiece |
	effect1 := SpeedUp withAPowerValue: 4.
	gamepiece := GamePiece withColor: 'pink'.
	effect1 applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 4.
	effect2 := WormHole withAPowerValue: 4.
	effect2 applyEffectTo: gamepiece ofGamePieceCollection: #().
	self assert: gamepiece position equals: 0
]
