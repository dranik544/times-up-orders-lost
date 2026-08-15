extends Node
# OrderList.gd (AutoLoad)

var orders: Array = [
	{
		"name": "Тестовый заказ (все типы)",
		"desc": "[center][b]ТЕСТОВЫЙ ЗАКАЗ ДЛЯ ОТЛАДКИ[/b][/center]\nПроверяем все типы параметров.",
		"good review": "Отлично, всё работает!",
		"bad review": "Что-то пошло не так.",
		"time": 120,
		"money": 1000,
		"ready text": "ГОТОВО",
		"cancel text": "ОТМЕНА",
		"tags": 1,
		"type": 2,
		"groups": [
			{
				"desc": "Чекбокс: {check1}",
				"frmt": {"check1": {"type": "rand_bool"}},
				"blck": [
					{
						"type": "check",
						"text": "Поставьте галочку, если {check1}",
						"stat": "{check1}"
					}
				]
			},
			{
				"desc": "Слайдер: значение от {slider_min} до {slider_max}",
				"frmt": {
					"slider_min": {"type": "rand_int", "min": 1, "max": 3},
					"slider_max": {"type": "rand_int", "min": 7, "max": 9}
				},
				"blck": [
					{
						"type": "slider",
						"text": "Диапазон",
						"step": 1,
						"min value": 0,
						"max value": 10,
						"min d value": "{slider_min}",
						"max d value": "{slider_max}"
					}
				]
			},
			{
				"desc": "Option: выберите {option_text}",
				"frmt": {
					"option": {"type": "rand_option", "pool": ["яблоко", "банан", "апельсин"]}
				},
				"blck": [
					{
						"type": "option",
						"text": "Фрукт",
						"items": ["яблоко", "банан", "апельсин"],
						"indx": "{option_index}"
					}
				]
			},
			{
				"desc": "Текстовое поле: напишите '{line_text}'",
				"frmt": {"line_text": {"type": "rand_text", "pool": ["godot", "engine", "game"]}},
				"blck": [
					{
						"type": "line",
						"text": "Слово",
						"ph text": "введите слово",
						"correct": "{line_text}"
					}
				]
			}
		]
	}
]
