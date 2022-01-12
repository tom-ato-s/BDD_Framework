#language:ru
@test

Функционал:Создание тикета с высоким приоритетом. API тесты. Изменение статута тикета.
  - Создание нового тикета POST запросом с телом из json файла, значения которого заполняем сгенерированным значениями.
    Из полученного тикета читаем статус тикета и проверяем, что он "Закрыт" из тела ответа по jsonpath
  - После создания нового тикета, PUT запросом пробуем менять статус тикета их "Закрыт в Открыт".
    Должны получить негативную проверку. Тикет не должен поменяться.
  Сценарий: Создание юзера


    # Первая часть теста Создание юзера. Эти данные подставятся в тело запроса в шаблон тела файла createTicket.json
    # Генериnся рандомная строка по маске
        # E - Английская буква,
        # R - русская буква,
        # D - цифра. Остальные символы игнорятся
        # Условна дана строка TEST_EEE_DDD_RRR - снегерится примерно такая - TEST_QRG_904_ЙЦУ
    * сгенерировать переменные
      | id              | 0                                                   |
      | username        | EEEEEEEE                                            |
      | title           | EEEEEEEE                                            |
      | submitter_email | EEEEEEE@EEDD.EEE                                    |
      | status          | 4                                                   |
      | description     | EEEEEEEE                                            |
      | resolution      | 0                                                   |
      | priority        | 1                                                   |
      | last_escalation | 0                                                   |
      | secret_key      | 0                                                   |
      | queue           | 1                                                   |
      | kbitem          | 1                                                   |
      | merged_to       | 1                                                   |
    # Создаем тикет
    * создать запрос
      | method | url                                               | body              |
      | POST   | https://at-sandbox.workbench.lanit.ru/api/tickets/| createTicket.json |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 201
    * извлечь данные
      | status_          | $.status                   |
      | id_              | $.id                       |
      | priority_        | $.priority                 |
      | title_           | $.title                    |
      | submitter_email_ | $.submitter_email          |
      | description_     | $.description              |
    * сравнить значения
      | ${status_} | == | 4 |
    * подождать 10 сек
    # Вторая часть теста - запрос тикета и попытка изменить статус тикета из "Закрыт" на "Открыт"
    # Создаем новое значение статуса для замены на сайте
    * сгенерировать переменные
      | status          | 1                                                  |
      * создать запрос
      | method | url                                                      |body               |
      | PUT    |  https://at-sandbox.workbench.lanit.ru/api/tickets/${id_}| createTicket.json |
    * добавить header
      | Content-Type | application/json |
    # Отправляем запрос для замены статуса
    * отправить запрос
    * статус код 200
