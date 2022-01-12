#language:ru
@test

Функционал:Создание тикета с высоким приоритетом. API тесты
  - Создание нового тикета POST запросом с телом из json файла, значения которого заполняем сгенерированным значениями

  Сценарий: Создание юзера


    # Создание юзера. Эти данные подставятся в тело запроса в шаблон тела файла createTicket.json
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
      | status          | 1                                                   |
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