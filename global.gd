extends Node

signal updateWeights
signal updateMoney
signal updateTimerSpawnOrdersWaitTime
signal updateCanceledOrders
signal updateCompletedOrders
signal updateReputation
signal updateReviews
signal updatePoliceCount

var money: int = 0
var timerSpawnOrdersWaitTimeMod: float = 1.0
var canceledOrders: int = 0
var completedOrders: int = 0
var reviews: Array = []
var reputation: float = 5.0
var unlockedElement1: bool = false
var unlockedElement2: bool = false
var policeCount: int = 0

var faction_weights = [5, 5, 5]
var faction_counts = [0, 0, 0]

const MAX_CANCELED_ORDERS: int = 2
const MAX_POLICE_COUNT: int = 5
const MIN_REPUTATION: float = 3.0
const MAX_MONEY_COUNT: int = 999999999999   # 999.999.999.999

const MIN_WEIGHT = 2.0
const MAX_WEIGHT = 12.0
const INCREMENT = 0.5          # насколько увеличиваем вес при успехе
const DECREMENT = 0.1          # насколько уменьшаем остальные при успехе
const PENALTY = 0.5            # насколько уменьшаем вес при провале

# Выбор тега с вероятностью, пропорциональной весам + случайный бонус
func get_weighted_tag() -> int:
	# Добавляем случайный бонус (0..2) к каждому весу, чтобы даже слабые теги иногда выпадали
	var modified = [
		faction_weights[0] + randf() * 1.5,
		faction_weights[1] + randf() * 1.5,
		faction_weights[2] + randf() * 1.5
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

func _change_money_count(count: int):
	Global.money += count
	print("Сейчас на балансе: " + str(money) + "$")
	
	emit_signal("updateMoney")

func _change_canceled_orders_count(count: int):
	canceledOrders = clamp(canceledOrders + count, 0, MAX_CANCELED_ORDERS)
	print("Отменено заказов: " + str(canceledOrders))
	
	emit_signal("updateCanceledOrders")

func _change_completed_orders_count(count: int):
	completedOrders += count
	print("Выполнено заказов: " + str(completedOrders))
	
	emit_signal("updateCompletedOrders")

func _add_review(num: float):
	print("Добавлено " + str(num) + " звёзд")
	reviews.append(num)
	_get_review_average()

func _get_review_average():
	if reviews.empty(): return
	var sum: float = 0.0
	for i in reviews:
		sum += i
	
	reputation = sum / reviews.size()
	print("Текущая репутация: " + str(reputation))
	
	emit_signal("updateReviews")
	emit_signal("updateReputation")

func _change_police_count(count: int):
	policeCount += count
	print("Текущий уровень полиции: " + str(policeCount))
	
	emit_signal("updatePoliceCount")
