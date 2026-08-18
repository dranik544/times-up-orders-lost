extends Node
# Global.gd (AutoLoad)

signal updateWeights
signal updateMoney
signal updateTimerSpawnOrdersWaitTime
signal updateCanceledOrders
signal updateCompletedOrders
signal updateReputation
signal updateReviews
signal updatePoliceCount
signal updateFailedOrders

var system: int = 0   # 0 - ПК, 1 - ТЕЛЕФОН

var money: int = 0
var canceledOrders: int = 0
var completedOrders: int = 0
var reviews: Array = []
var reputation: float = 5.0
var unlockedElement1: bool = false
var unlockedElement2: bool = false
var policeCount: int = 0
var minTimerSpawnOrdersWaitTime: float = 40.0
var maxTimerSpawnOrdersWaitTime: float = 60.0
var timerSpawnOrdersWaitTimeMod: float = 1.0
var maxCountOrdersOnScreen: int = 1
var maxCountOrdersOnScreenMod: float = 1.0
var timeToCompleteOrderMod: float = 1.0
var minCountGroupsInOrder: int = 1
var maxCountGroupsInOrder: int = 4
var countGroupsInOrderMod: float = 1.0

var faction_weights = [5.0, 5.0, 5.0]
var faction_counts = [0, 0, 0]

enum difficulty {ULTRAEASY, EASY, NORMAL, HARD, ULTRAHARD}
var currentDifficulty = difficulty.NORMAL
var upOrderIfLineEditFocusEntered: bool = false
var events: Dictionary = {
	"ad": false,
	"without mistakes": false,
	"rain": false,
}
var soundsVolume: float = 1.0
var allContentAtStart: bool = false

enum typeOrder {DEFAULT, START, RARE, MESSAGE, EMERGENCY, BEGIN, DARKNET, CUSTOM}

const MAX_CANCELED_ORDERS: int = 3
const MAX_POLICE_COUNT: int = 5
const MIN_REPUTATION: float = 3.0
const MAX_MONEY_COUNT: int = 999999999999999999   # 999.999.999.999.999.999
const DEFAULT_MIN_TIMER_SPAWN_ORDERS_WAIT_TIME: float = 40.0
const DEFAULT_MAX_TIMER_SPAWN_ORDERS_WAIT_TIME: float = 60.0
const DEFAULT_MAX_COUNT_ORDERS_ON_SCREEN: int = 1
const DEFAULT_MIN_COUNT_GROUPS_IN_ORDER: int = 1
const DEFAULT_MAX_COUNT_GROUPS_IN_ORDER: int = 4

const MIN_WEIGHT = 2.0
const MAX_WEIGHT = 12.0
const INCREMENT = 0.5          # насколько увеличиваем вес при успехе
const DECREMENT = 0.1          # насколько уменьшаем остальные при успехе
const PENALTY = 0.5            # насколько уменьшаем вес при провале


func _ready():
	if OS.has_feature("pc"): system = 0
	elif OS.has_feature("mobile"): system = 1

func _reset():
	money = 0
	canceledOrders = 0
	completedOrders = 0
	reviews.clear()
	reputation = 5.0
	unlockedElement1 = false
	unlockedElement2 = false
	policeCount = 0
	minTimerSpawnOrdersWaitTime = 40.0
	maxTimerSpawnOrdersWaitTime = 60.0
	timerSpawnOrdersWaitTimeMod = 1.0
	maxCountOrdersOnScreen = 1
	maxCountOrdersOnScreenMod = 1.0
	timeToCompleteOrderMod = 1.0
	minCountGroupsInOrder = 1
	maxCountGroupsInOrder = 4
	countGroupsInOrderMod = 1.0
	faction_counts = [0, 0, 0]
	faction_weights = [5.0, 5.0, 5.0]

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
	
	print("Состояние весов: " + str(faction_weights))
	
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
	
	print("Состояние весов: " + str(faction_weights))
	
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

func _auto_balance(positive: bool):
	match currentDifficulty:
		difficulty.ULTRAEASY:
			Global._change_timer_spawn_order_wait_time(0.98 if positive else 1.35)   # -0.02; +0.35
			Global._change_max_count_orders_on_screen( 1.00 if positive else 1.00)   # +0.02; -0.25
			Global._change_completed_orders_count(     0.98 if positive else 1.25)   # -0.02; +0.25
			Global._change_time_to_complete_order(     0.98 if positive else 1.35)   # -0.02; +0.35
			Global._change_count_groups_in_order(      1.00 if positive else 1.00)   # +0.00; -0.00
		difficulty.EASY:
			Global._change_timer_spawn_order_wait_time(0.97 if positive else 1.15)   # -0.03; +0.15
			Global._change_max_count_orders_on_screen( 1.03 if positive else 0.85)   # +0.03; -0.15
			Global._change_completed_orders_count(     0.97 if positive else 1.15)   # -0.03; +0.15
			Global._change_time_to_complete_order(     0.96 if positive else 1.20)   # -0.04; +0.20
			Global._change_count_groups_in_order(      1.02 if positive else 0.90)   # +0.02; -0.05
		difficulty.NORMAL:
			Global._change_timer_spawn_order_wait_time(0.96 if positive else 1.05)   # -0.04; +0.05
			Global._change_max_count_orders_on_screen( 1.05 if positive else 0.95)   # +0.05; -0.05
			Global._change_completed_orders_count(     0.97 if positive else 1.05)   # -0.03; +0.05
			Global._change_time_to_complete_order(     0.95 if positive else 1.20)   # -0.05; +0.20
			Global._change_count_groups_in_order(      1.03 if positive else 0.95)   # +0.02; -0.05
		difficulty.HARD:
			Global._change_timer_spawn_order_wait_time(0.94 if positive else 1.02)   # -0.06; +0.02
			Global._change_max_count_orders_on_screen( 1.10 if positive else 0.95)   # -0.06; +0.02
			Global._change_completed_orders_count(     0.95 if positive else 1.02)   # -0.05; +0.02
			Global._change_time_to_complete_order(     0.92 if positive else 1.05)   # -0.08; +0.05
			Global._change_count_groups_in_order(      1.05 if positive else 0.95)   # +0.02; -0.05
		difficulty.ULTRAHARD:
			Global._change_timer_spawn_order_wait_time(0.85 if positive else 1.05)   # -0.10; +0.00
			Global._change_max_count_orders_on_screen( 1.35 if positive else 0.98)   # -0.10; +0.00
			Global._change_completed_orders_count(     0.92 if positive else 0.98)   # -0.08; +0.00
			Global._change_time_to_complete_order(     0.85 if positive else 0.98)   # -0.15; +0.00
			Global._change_count_groups_in_order(      1.15 if positive else 0.98)   # +0.02; -0.05





func _change_police_count(count: int):
	policeCount += count
	print("Текущий уровень полиции: " + str(policeCount))
	
	emit_signal("updatePoliceCount")

func _change_timer_spawn_order_wait_time(count: float):
	timerSpawnOrdersWaitTimeMod *= count
	minTimerSpawnOrdersWaitTime = DEFAULT_MIN_TIMER_SPAWN_ORDERS_WAIT_TIME * timerSpawnOrdersWaitTimeMod
	maxTimerSpawnOrdersWaitTime = DEFAULT_MAX_TIMER_SPAWN_ORDERS_WAIT_TIME * timerSpawnOrdersWaitTimeMod
	
	print("Модификатор таймера создания заказов: " + str(timerSpawnOrdersWaitTimeMod))
	print("Мин. время создания заказов: " + str(minTimerSpawnOrdersWaitTime) + ";   " + "Макс. время создания заказов: " + str(maxTimerSpawnOrdersWaitTime))
	
	emit_signal("updateTimerSpawnOrdersWaitTime")

func _change_max_count_orders_on_screen(count: float):
	maxCountOrdersOnScreenMod *= count
	maxCountOrdersOnScreen = clamp(int(DEFAULT_MAX_COUNT_ORDERS_ON_SCREEN * maxCountOrdersOnScreenMod), 1, 999)
	
	print("Модификатор. кол-ва заказов на экране: " + str(maxCountOrdersOnScreenMod))
	print("Макс. кол-во заказов на экране: " + str(maxCountOrdersOnScreen))

func _change_time_to_complete_order(count: float):
	timeToCompleteOrderMod *= count
	
	print("Модификатор на время выполнения заказа: " + str(timeToCompleteOrderMod))

func _change_count_groups_in_order(count: float):
	countGroupsInOrderMod *= count
	maxCountGroupsInOrder = clamp(DEFAULT_MAX_COUNT_GROUPS_IN_ORDER * countGroupsInOrderMod, 1, 10)
	minCountGroupsInOrder = clamp(DEFAULT_MIN_COUNT_GROUPS_IN_ORDER * countGroupsInOrderMod, 1, 10)
	
	print("Модификатор кол-ва групп на заказ: " + str(countGroupsInOrderMod))
	print("Мин. кол-во групп на заказ: " + str(minCountGroupsInOrder) + "Макс. кол-во групп на заказ: " + str(maxCountGroupsInOrder))
