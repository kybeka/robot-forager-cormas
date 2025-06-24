Class {
	#name : 'MyRFMineral',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#category : 'MyRobotForager-Model',
	#package : 'MyRobotForager-Model'
}

{ #category : 'accessing' }
MyRFMineral >> pov [
    <pov>
    ^ CMPointOfView
        color: CMColor gold
        shape: #diamond
]
