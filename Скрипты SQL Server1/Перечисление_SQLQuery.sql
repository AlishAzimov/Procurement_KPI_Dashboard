--Перечисление.EG_Склад_ВидыОперацийПриходныйОрдер
--create view pbi.vw_Перечисление_EG_Склад_ВидыОперацийПриходныйОрдер as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'От поставщика'
        WHEN 1 THEN 'От подотчетника'
        WHEN 2 THEN 'Перемещение'
        WHEN 3 THEN 'Излишки по инвентаризации'
        WHEN 4 THEN 'Перемещение вне ордерной системы'
        WHEN 5 THEN 'Прием на ответственное хранение'
        WHEN 6 THEN 'От поставщика в порт'
        WHEN 7 THEN 'От поставщика по гарантии'
        WHEN 8 THEN 'Выпуск продукции'
        WHEN 9 THEN 'Прием на таможню'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1545
--

--Перечисление.EG_БТ_Incoterms
--create view pbi.vw_Перечисление_EG_БТ_Incoterms as
-- drop view pbi.vw_Перечисление_EG_БТ_Incoterms
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'EXW'
        WHEN 1 THEN 'FCA'
        WHEN 2 THEN 'FAS'
        WHEN 3 THEN 'FOB'
        WHEN 4 THEN 'CFR'
        WHEN 5 THEN 'CIF'
        WHEN 6 THEN 'CPT'
        WHEN 7 THEN 'CIP'
        WHEN 8 THEN 'DAT'
        WHEN 9 THEN 'DAP (DAF, DES, DDU)'
        WHEN 10 THEN 'DDP'
        WHEN 11 THEN 'Перемещения внутри страны'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1421
---

--Перечисление.EG_СостояниеЗаказа
--create view pbi.vw_Перечисление_EG_СостояниеЗаказа as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Рассмотрение'
        WHEN 1 THEN 'Ожидание оплаты'
        WHEN 2 THEN 'Отклонено'
        WHEN 3 THEN 'Частично оплачено'
        WHEN 4 THEN 'Факторинг'
        WHEN 5 THEN 'Полностью оплачено'
        WHEN 6 THEN 'Кредиторская задолженность'
        WHEN 7 THEN 'Постоянные врамках проекта'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1552
--
--Перечисление.EG_ВидДвиженияБюджета
--create view pbi.vw_Перечисление_EG_ВидДвиженияБюджета as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Приход'
        WHEN 1 THEN 'Расход'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1472

--Перечисление.EG_ТипыЗатрат
--create view pbi.vw_Перечисление_EG_ТипыЗатрат as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Переменные затраты'
        WHEN 1 THEN 'Постоянные затраты'
        WHEN 2 THEN 'Разовые затраты'
        WHEN 3 THEN 'Условно постоянные затраты'
        WHEN 4 THEN 'Ликвидация аварий (бурение)'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1561


--Перечисление.EG_МТО_СтатусыДокументовДМТО
--create view pbi.vw_Перечисление_EG_МТО_СтатусыДокументовДМТО as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'На расценке'
        WHEN 1 THEN 'В работе'
        WHEN 2 THEN 'На согласовании'
        WHEN 3 THEN 'Согласован'
        WHEN 4 THEN 'Подтвержден'
        WHEN 5 THEN 'К поступлению'
        WHEN 6 THEN 'Закрыт'
        WHEN 7 THEN 'Отменён'
        WHEN 8 THEN 'Аннулирован'
        WHEN 9 THEN 'На корректировке'
        WHEN 10 THEN 'На согласовании План закупа'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1522
---

--Перечисление.EG_МТО_ВидыЗакупа
--create view pbi.vw_Перечисление_EG_МТО_ВидыЗакупа as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Малостоимостной закуп'
        WHEN 1 THEN 'Тендер'
        WHEN 2 THEN 'Срочный закуп'
        WHEN 3 THEN 'БАК Безальтернативный контрагент'
        WHEN 4 THEN 'Услуги'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum76995
---

--Перечисление.EG_МТО_ВидыОбъектовЗакупки
--create view pbi.vw_Перечисление_EG_МТО_ВидыОбъектовЗакупки as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Материально-технические ресурсы'
        WHEN 1 THEN 'Транспортные услуги'
        WHEN 2 THEN 'Работы и услуги по основным сервисам'
        WHEN 3 THEN 'Работы и услуги по вспомогательным сервисам'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum76994
---

--Перечисление.EG_МТО_ХозяйственныеОперацииМТО
--create view pbi.vw_Перечисление_EG_МТО_ХозяйственныеОперацииМТО as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Потребность'
        WHEN 1 THEN 'На проработке'
        WHEN 2 THEN 'Заказ'
        WHEN 3 THEN 'Отмена заказа'
        WHEN 4 THEN 'Отгрузка по заказу'
        WHEN 5 THEN 'Планирование по заказу поставщику'
        WHEN 6 THEN 'Закупка у поставщика'
        WHEN 7 THEN 'Оплата поставщику'
        WHEN 8 THEN 'Выполнена'
        WHEN 9 THEN 'Выполнена частично'
        WHEN 10 THEN 'Корректировка заявки'
        WHEN 11 THEN 'Корректировка потребности'
        WHEN 12 THEN 'Корректировка проработки'
        WHEN 13 THEN 'Корректировка спецификации'
        WHEN 14 THEN 'Корректировка заказа'
        WHEN 15 THEN 'Корректировка поставки'
        WHEN 16 THEN 'Корректировка отгрузки'
        WHEN 17 THEN 'Корректировка закупа'
        WHEN 18 THEN 'Закрытие заявки'
        WHEN 19 THEN 'Корректировка тендера'
        WHEN 20 THEN 'Заявка на согласовании'
        WHEN 21 THEN 'Заявка отменена'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1527
---

--Перечисление.EG_МТО_ВидыПотребности
--create view pbi.vw_Перечисление_EG_МТО_ВидыПотребности as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Плановая'
        WHEN 1 THEN 'Аварийная - срочная'
        WHEN 2 THEN 'Аварийная'
        WHEN 3 THEN 'Внеплановая'
        WHEN 4 THEN 'Плановая в бюджете'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1513
---

--Перечисление.Периодичность
--create view pbi.vw_Перечисление_Периодичность as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'День'
        WHEN 1 THEN 'Неделя'
        WHEN 2 THEN 'Декада'
        WHEN 3 THEN 'Месяц'
        WHEN 4 THEN 'Квартал'
        WHEN 5 THEN 'Полугодие'
        WHEN 6 THEN 'Год'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1953
---


--Перечисление_EG_МТО_ТипыПотребности
--create view pbi.vw_Перечисление_EG_МТО_ТипыПотребности as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'На cкважину'
        WHEN 1 THEN 'На объект строительства (обустройство)'
        WHEN 2 THEN 'На буровое оборудование'
        WHEN 3 THEN 'На транспорт и спецтехнику'
        WHEN 4 THEN 'На персонал'
        WHEN 5 THEN 'База, офис'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum73573
---

--Перечисление.EG_МТО_ВидыПотребностиГодовойЗаявки
--create view pbi.vw_Перечисление_EG_МТО_ВидыПотребностиГодовойЗаявки as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Плановая'
        WHEN 1 THEN 'Новый проект'
        WHEN 2 THEN 'Корректировка'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1514
---


--РегистрСведений.EG_КурсыВалют
--create alter view pbi.vw_РегистрСведений_EG_КурсыВалют as
select  
DATEADD(YEAR, -2000, _InfoRg35458._Period) AS ДатаКурса,
CAST(_InfoRg35458._Fld35459RRef AS uniqueidentifier) as СтранаID, --Справочник.СтраныМира
_Reference702._Fld63445 as ВалютаПерехода,
CAST(_InfoRg35458._Fld35460RRef AS uniqueidentifier) as ВалютаID, --Справочник.Валюты
_Reference288._Description as ВалютаОсновная,
_InfoRg35458._Fld35461 as Курс,
_InfoRg35458._Fld35462 as Кратность
FROM _InfoRg35458 
join _Reference288 on _Reference288._idrref = _InfoRg35458._Fld35460rref
join _Reference702 on _Reference702._idrref = _InfoRg35458._Fld35459RRef
where _InfoRg35458._period > DATEADD(YEAR, +2000, '2021-12-31') 
and (_Reference702._Fld63445 = 'UZ' or _Reference702._Fld63445 = 'US' ) --Конвертация в USD и UZS

---


-- РегистрСведений.EG_МТО_ПроцентыПроработкиЗВП
--create view pbi.РегистрСведений_EG_МТО_ПроцентыПроработкиЗВП as
select 
CAST(_Fld80142RRef AS uniqueidentifier) as ЗВП_ID,
_Fld80272 as ПроцентОтменаЗакупа,
_Fld77001 as ПроцентТендер,
_Fld80143 as ПроцентСпецификация,
_Fld80144 as ПроцентПоступило
from _InfoRg77000
join _Document897 on _Fld80142RRef = _Document897._IDRRef
where _Document897._Date_Time > DATEADD(YEAR, +2000, '2021-12-31') and _Document897._Posted=0x01 and _Document897._Fld7092 =0x00 --с 2022 года and Проведен = true and ЭкспрессЗаявка = False 
																									and _Document897._Fld7061rref not in (0xA97E001E5848397D11DFAEC74909F087) --Без ЭНГС
---



--Перечисление.EG_МТО_ВидыОплатПоДоговору
--create view pbi.vw_Перечисление_EG_МТО_ВидыОплатПоДоговору as
SELECT
    CAST(_IDRRef AS uniqueidentifier) as IDRRef,
    _EnumOrder,
    CASE _EnumOrder
        WHEN 0 THEN 'Аванс количество дней с даты заключения договора'
        WHEN 1 THEN 'Аванс фиксированная дата'
        WHEN 2 THEN 'Расчет количество дней с даты поставки'
        WHEN 3 THEN 'Расчет фиксированная дата'
        ELSE 'Неизвестно'
    END AS Наименование
FROM _Enum1512
---