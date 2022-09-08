# robomonster
usetech sample project

Задание:

Реализовать приложение iOS на Swift (UIKit) , которое будет обращаться к API из списка
https://github.com/public-apis/public-apis
Приложение должно состоять из нескольких экранов: 
1. Экран списка элементов с простой разметкой.
2. Экран единичного объекта.
3. Экран поиска по объектам
Плюсом будет реализация поиска как с помощью API, так и с локально.
*4. Избранные объекты.
Реализовать добавление/удаление в локальное избранное.
Выбор библиотек и архитектурных решений нужно будет обосновать. * необязательная часть

Комментарий:

Для проекта был выбран тестовый сервис RoboHash по генерации аватарок. https://robohash.org
Он предельно прост, и позволяет отправить get запрос и получить изображение в требуемом формате

Приложение содержит два экрана:
Первый содержит список элементов, второй раскрывается и показывает детали элемента
Дополнительно можно добавить элемент в список элементов, набрав любой текст в экране UIAlertController

Приложение использует MVP архетектуру как более оптимальную для этого случая, 
Communication выделен в отдельный класс, чтобы не перегружать ViewController, 
а также иметь возможность получить данные из любого класса. При отсутствии аватары, она запрашивается на сервере с использованием await/async. Изображение сохраняется в локальной переменной.

Поиск реализован на экране списка и позволяет искать монстров по имени, используя searchBar. 

Удаление реализовано стандартным свайпом.





