extends Control

@onready var score = $Score
@onready var life_count = $LifeCount

func set_score_label(new_score):
	score.text = "SCORE : "+str(new_score)

func set_life(amount):
	life_count.text = str(amount)
