# language: ru
# encoding: utf-8
#parent ua:
@UA30_Прочие_макеты
#parent uf:
@UF9_Вспомогательные_фичи

@IgnoreOnCIMainBuild
@critical

Функциональность: ФичаДляПроверкиПеременныеВТаблицах
 


Сценарий: ДляПроверкиПеременныеВТаблицах
	И я запоминаю строку 'Сообщить("Hellow world.")' в переменную "Переменная"
	И я выполняю код встроенного языка
		|'$Переменная$'|