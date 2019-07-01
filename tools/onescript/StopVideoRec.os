﻿
Функция ВСпискеПроцессовЕсть(СтрПоиска)
	ЛогФайл = ПолучитьИмяВременногоФайла("txt");
	Команда = "tasklist > " + ЛогФайл;
	
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла("cmd");
	ЗТ = Новый ЗаписьТекста(ИмяВременногоФайла,"UTF-8",,Истина); 
	ЗТ.ЗаписатьСтроку(""+ Команда); 
	ЗТ.Закрыть();
	
	retCode = -1;
	ЗапуститьПриложение(ИмяВременногоФайла,,Истина,retCode);
	Если retCode <> 0 Тогда
		ВызватьИсключение("Не получилось получить список процессов!");
	КонецЕсли;	 
	
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ЛогФайл,"UTF-8");
	
	Нашел = Ложь;
	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;	 
		
		Если Найти(Нрег(Стр),НРег(СтрПоиска)) > 0 Тогда
			Нашел = Истина;
			Прервать;
		КонецЕсли;	 
		
	КонецЦикла;	
	
	Текст.Закрыть();
	
	Возврат Нашел;
КонецФункции	

Процедура ОстановитьЗаписьВидео(СтрокаАдреса)
	
	host = СтрокаАдреса;
	Поз  = Найти(host,":");
	Порт = Число(Сред(host,Поз+1));
	
	Сообщить("Порт="+Порт);
	
	TCPСоединение = Новый TCPСоединение("localhost",Порт);
	Если TCPСоединение.Активно Тогда
		TCPСоединение.ОтправитьСтроку("quit");
		TCPСоединение.Закрыть();
		Сообщить("" + ТекущаяДата() + " Отправлена команда quit.");
		//Пока Истина Цикл
		//	sleep(2000);
		//	Если Не ВСпискеПроцессовЕсть("vlc.exe") Тогда
		//		Прервать;
		//	КонецЕсли;	 
		//КонецЦикла;
		sleep(500);
		Сообщить("" + ТекущаяДата() + " Окончание скрипта.");
	Иначе	
		TCPСоединение.Закрыть();
	КонецЕсли;	 
	
	
КонецПроцедуры


Если АргументыКоманднойСтроки.Количество() = 0 Тогда
	Сообщить("Не передан адрес хоста!");
	//Возврат;
ИначеЕсли АргументыКоманднойСтроки.Количество() > 1 Тогда
	Сообщить("Скрипт принимает только один параметр!");
	//Возврат;
Иначе	
	ОстановитьЗаписьВидео(АргументыКоманднойСтроки[0]);
КонецЕсли;

