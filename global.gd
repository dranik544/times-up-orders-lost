# Global.gd
extends Node

signal updateWeights

var faction_weights = [5, 5, 5]   # стартовые веса (чтобы сразу была вариативность)
var faction_counts = [0, 0, 0]    # сколько раз выполнен каждый тег

const MIN_WEIGHT = 2.0
const MAX_WEIGHT = 12.0
const INCREMENT = 0.5          # насколько увеличиваем вес при успехе
const DECREMENT = 0.1          # насколько уменьшаем остальные при успехе
const PENALTY = 0.5            # насколько уменьшаем вес при провале

# Выбор тега с вероятностью, пропорциональной весам + случайный бонус
func get_weighted_tag() -> int:
	# Добавляем случайный бонус (0..2) к каждому весу, чтобы даже слабые теги иногда выпадали
	var modified = [
		faction_weights[0] + randf() * 2.0,
		faction_weights[1] + randf() * 2.0,
		faction_weights[2] + randf() * 2.0
	]
	var total = modified[0] + modified[1] + modified[2]
	var r = randf() * total
	if r < modified[0]:
		return 1
	elif r < modified[0] + modified[1]:
		return 2
	else:
		return 3

# Вызывается при успешном выполнении заказа
func update_weights(tag: int):
	var idx = tag - 1
	# Увеличиваем выбранный тег
	faction_weights[idx] = min(faction_weights[idx] + INCREMENT, MAX_WEIGHT)
	# Немного уменьшаем остальные (но не ниже MIN_WEIGHT)
	for i in range(3):
		if i != idx:
			faction_weights[i] = max(faction_weights[i] - DECREMENT, MIN_WEIGHT)
	faction_counts[idx] += 1
	emit_signal("updateWeights")

# Вызывается при провале заказа (таймаут или неправильное выполнение)
func decrease_weight(tag: int):
	var idx = tag - 1
	faction_weights[idx] = max(faction_weights[idx] - PENALTY, MIN_WEIGHT)
	# Можно также слегка увеличить остальные (опционально)
	for i in range(3):
		if i != idx:
			faction_weights[i] = min(faction_weights[i] + 0.1, MAX_WEIGHT)
	# Не увеличиваем счётчик выполненных, но сигнал можно послать для обновления UI
	emit_signal("updateWeights")
