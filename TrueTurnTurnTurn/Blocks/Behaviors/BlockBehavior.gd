extends Node

var active = true setget setActive, isActive
var block setget setBlock

func collideWithPlayer(collider, collision):
	pass


func setActive(isActive):
	active = isActive
func isActive():
	return active
	
func setBlock(newBlock):
	block = newBlock
	return self
	
func init(iblock, iactive):
	block = iblock
	active = iactive