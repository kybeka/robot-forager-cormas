Class {
	#name : 'MyRFCell',
	#superclass : 'CMSpatialEntityElement',
	#category : 'MyRobotForager-Model',
	#package : 'MyRobotForager-Model'
}

{ #category : 'testing' }
MyRFCell >> getMineral [

	self hasMineral ifFalse: [ self error: 'This cell has no minerals' ].
	^ (self occupantsOfClass: MyRFMineral) first
]

{ #category : 'testing' }
MyRFCell >> hasMineral [
    ^ self hasOccupantsOfClass: MyRFMineral
]
