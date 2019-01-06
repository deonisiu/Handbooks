# Справочник по настройке и использованию консоли
Я использую консоль ConEmu - https://conemu.github.io/ или http://cmder.net  
Статья по настройке терминала в Windows - https://isqua.ru/blog/2016/11/05/nastroika-tierminala-cmder-v-windows/

## Список файлов
* [Vim.sh](Vim.sh) - Справочник по редактору Vim
* [Bash.sh](Bash.sh) - Справочник про оболочку Bash
* [.bashrc](.bashrc) - Глобальные Bash настройки в Windows/users/user

# Bash

Bash - это интерпретатор командного языка, выполняющий команды поступающие со стандартного устройства ввода (клавиатуры).

В данной статье будут рассмотрены пользовательские и немного системных настроек, цель которых будет облегчить использование bash.

### Полезные ссылки

* Настройки Bash - http://sozdstel.blogspot.ru/2011/01/bash.html
* Оболочка Bash — шпаргалка для начинающих - https://tproger.ru/translations/bash-cheatsheet/
* Обустраиваем консоль - http://www.xakep.ru/55981/
* Цветное приглашение bash - http://www.unixcomp.net/content/35-cvetnoe-priglashenie-bash
* Git советы - http://idoka.ru/git-tips-and-tricks/
* Bash customization(углубленная) - https://wiki.archlinux.org/index.php/Bash/Prompt_customization_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
* Bash Reference Manual - https://www.gnu.org/software/bash/manual/bash.html#Command-Line-Editing

### Настройки

Настройки bash хранятся в файле .bashrc в домашней директории пользователей (~).
В нем можно поменять приглашение, обработку директорий с командами, задать алиасы, загружать цветовые схемы и др. 

Файл .bashrc будет рассмотрен позже.
Так же есть файлы:

~/.bash_profile - Этот файл обрабатывается при каждом входе в систему (пользователя).  
~/.bash_logout - Прочитывается когда происходит выход из системы.  
~/.bash_history - Хранит список используемых команд.

Помимо этих файлов есть системные настройки (опции bash). Их можно посмотреть командой set -o
Будет выведен список опций. Эти опции можно изменить с помощью той же команды set.

```
set [–abBCefhHkmnpPtuvx] [-o option] [argument …]
```

Для активации одной из опций наберите:
set -o option_name - для активации опции  
set +o option_name для деактивации опции.  
Список опций может меняться от версии bash.  
Команда set без параметров выведет все переменные окружения.

### Переменные

#### Список стандартных переменных:

* $BASH - В переменной BASH содержится полный путь до исполняемого файла командной оболочки Bash
* $BASH_VERSION -	В переменную BASH_VERSION записывается версия Bash
* $CLASSPATH - содержит список каталогов для поиска файлов классов Java и архивов Java
* $HOME -	Домашний каталог текущего пользователя
* $HOSTNAME -	В переменной HOSTNAME хранится имя компьютера
* $LANG	- это текущая установка локали, которая позволяет настроить командную оболочку для использования в различных странах и на различных языках
* $OSTYPE -	В переменной OSTYPE содержится описание операционной системы
* $PATH - это список каталогов для поиска команд и приложений, когда полный путь к файлу не задан
* $PSn	- (где n - число от 1 до 4) переменная хранит параметры приглашения (см. ниже)
* $PROMPT_COMMAND -	Эта команда должна быть выполнена до отображения строки приглашения Bash
* $PWD - это полный путь к текущему рабочему каталогу
* $SHELL - это полный путь к текущей командной оболочке
* $USER -	В переменной USER содержится имя текущего пользователя

### HotKey в Bash

Приводятся горячие клавиши:

#### Ctrl-команды
* Ctrl + a - переход к началу строки
* Ctrl + b - аналог стрелки влево
* Ctrl + c - отменить редактирование команды или прекратить работу
* Ctrl + d - аналог Delete. Если строка пустая - выход из shell
* Ctrl + e - переход к концу строки
* Ctrl + f - аналог стрелки вправо
* Ctrl + g - выход из режима дополнения
* Ctrl + h - аналог BackSpace
* Ctrl + i - аналог Tab
* Ctrl + k - удалить всё до конца строки
* Ctrl + l - очистить экран (набранная строка и даже позиция курсора остаётся)
* Ctrl + r - поиск по истории набранных команд
* Ctrl + t - поменять местами текущий символ с предыдущим
* Ctrl + u - удалить всё до начала строки
* Ctrl + v - преобразует следующую клавишу в её символьное отображение (Enter в ^M, Esc в ^[)
* Ctrl + w - удалить от курсора до начала слова
* Ctrl + x дважды - скачок между началом строки и текущей позицией курсора
* Ctrl + x @ - Показывает возможные варианты дополнения доменного имени
* Ctrl + y - вставить из буфера (все удаляемое по горячим клавишам удаляется не просто так, а в буфер)
* Ctrl + z - притормозить/остановить выполнение команды в фон
* Ctrl + _ - отмена последнего изменения

#### ALT-команды
* Alt + < - к первой команде в истории (вообще к самой первой в .bash_history) Alt + > - к последней команде в истории
* Alt + ? - показать весь список вариантов дополнения (аналог 2Т - см. ниже)
* Alt + * - вставить все возможные варианты дополнения
* Alt + / - попытатся дополнить имя файла (из имеющихся в текущем каталоге)
* Alt + . - вставить последний аргумент из предыдущей команды
* Alt + b - влево на слово Alt + c - сделать первую букву слова заглавной (и перейти к следующему слову)
* Alt + d - удалить от текущей позиции до конца слова
* Alt + f - вправо на слово
* Alt + l - сделать первую букву слова строчной (и перейти к следующему слову)
* Alt + n - искать по истории (но не сразу, а после полного ввода и нажатия Enter)
* Alt + p - искать по истории назад
* Alt + r - очистить всю строку
* Alt + t - поменять слова местами
* Alt + u - сделать все буквы заглавными от текущей позиции до конца слова
* Alt + BackSpace - Удалить от текущей позиции до начала слова

#### Иные:
* !! - выполнить последнюю команду в истории
* !abc - выполнить последнюю команду в истории, начинающуюся на abc
* !a:p - напечатать последнюю команду в истории, начинающуюся на a
* !n - выполнить n-ную команду в истории
* !$ - посдедний аргумент последней команды
* !^ - первый аргумент последней команды
* ^abc^xyz - замена abc на xyz в последней команде и выполнить результат
* Tab - выведет названия команд на начало введенных символов или заполнит до конца имя файла.

### .bashrc

Приведем на пояснениях и примерах содержимое файла для лучшего изучения.  
В файлах знак - # используется для обозначения комментария. Или закрытия строки и игнорируется интерпретатором.

#### alias

Этот пункт позволяет создавать ссылки для команд.  
Например у обычного пользователя часто имеются такие строки (у root часто нет таких строк в .bashrc):

```
alias ll='ls -l'
```

С данной строкой у пользователя появится команда ll, которая будет выводить файлы в один столбец с дополнительной информацией о файлах (владелец, дата).
Смена приглашения и специальные последовательности кодов
Пока показывается как сменить строку приглашения читатель узнает о переменной PS1 и ряд специальных управляющих последовательностей из ASCII.
Специальные символы задаются между \[ и \]. Существует множество переменных и команд которые могут пригодиться в bash. Строка приглашения задается в переменной PS1, а синтаксис строки специальными символами. Это дает возможность не только менять текст, но его цвет, вставлять дату и др.

#### Специальные символы:

* \A время - часы и минуты
* \d дата в формате "День_недели, Месяц, Число"
* \D{format} дата в формате format : {%d.%m.%y}, {%y-%m-%d}
* \e (управляющий символ в коде ASCII) передает окну терминала более сложные опции
* \h заменяется на имя компьютера (вплоть до первой точки в DNS-имени)
* \H имя хоста
* \j количество задач, работающих в шелле в настоящее время
* \l название терминала
* \n переход на новую строку
* \r возврат каретки на начало строки
* \s название шелла (будет выведено, например, «bash»
* \t время в 24-часовом формате (ЧЧ: MM: СС)
* \T время в 12-часовом формате (ЧЧ: ММ: СС)
* \@ время в 12-часовом формате (AM/PM)
* \u заменяется на имя текущего пользователя
* \v номер версии bash
* \V номер версии bash, номер релиза, номер патча
* \w путь к домашнему каталогу (~)
* \W имя текущей директории
* \! номер команды в истории
* \# системный номер команды
* \$ означает знак $ для обычного пользователя, и # для root
* \\ обратный слэш
* \[ начало последовательности непечатаемых символов ASCII
* \] конец последовательности непечатаемых символов ASCII
* $ ( ) внешняя команда
* \# текущий номер команды
* \nnn непечатаемый символ, у которого имеется восьмиричный код
* \! номер команды в истории команд

#### Переменные приглашения:

* PS1 - Основная строка приглашения.
* PS2 - Вторичная строка приглашения.
* PS3 - Приглашение при выборе в операторе select.
* PS4 - Приглашение используемое в скриптах, при выводе. Например при выводе echo. 

#### Иные:

PROMPT_COMMAND - В этой переменной задаются команды, которые будут выполняться перед первичном приглашении (PS1).  
Так же не запрещены скрипты и внешние команды.  
Пример первичного приглашения 1:  
```
PS1='\h:\w\$' 
```
Покажет имя компьютера (в сети, или проще говоря имя хоста), имя каталога и знак доллара для обычного пользователя, и # для root пользователя.  
Приемр 2:  
```
PS1='[u][\A']\$ 
```
Покажет имя пользователя и время (часы и минуты) и знак доллара для обычного пользователя, и # для root пользователя.

### Цвета и стили

Цвета текста и фона приглашения задаются специальными символами которые были рассмотрены выше, которые задаются в специальной последовательности.  
[свойство_фона;цвет_фона;свойство_текста;цвет_текста] 

#### Цвета:

Цвет - Текст - Фон  
* Черный - 30 - 40
* Красный - 31 - 41
* Зеленый - 32 - 42
* Желтый - 33 - 43
* Синий - 34 - 44
* Маджента - 35 - 45
* Циановый - 36 - 46
* Белый - 37 - 47

#### Свойства текста:

Название стиля - Код  
* Сбросить все свойства - 0
* Повышенная яркость - 1
* Пониженная яркость - 2
* Подчеркнутый - 4
* Нормальная яркость - 5
* Инвертированный - 7
* Скрытый - 8

Пример 1: Если добавить следующую строчку к переменной PS1 (начало будет иное у вас) или заменить полностью на: 
```
PS1='\[\033[0;40;4;37m\]qwesdfrty\[\033[0m\]'
```
То приглашение будет содержать - qwerty белого цвета и линию подчёркивания.
Пример 2:
```
PS1='\[\033[0;41;0;32m\]qwerty\[\033[0m\]'
```
То приглашение будет содержать - qwerty зелёного цвета и без подчёркивания.

### Полезные настройки

В файле etc/inputrc - настраивается ввод. Это файл для всех пользователей.  Для отдельного пользователя он находиться в домашней директории (~).

#### Настройка истории команд

Если нужно прокручивать историю команд (клавишами PageUP, PageDown) на определённое слово. Например введение cd позволит получать из истории только введенные команды начинающиеся на cd.

В файле /etc/inputrc добавить или раскомментировать:
```
# alternate mappings for "page up" and "page down" to search the history
"\e[5~": history-search-backward
"\e[6~": history-search-forward
```
Не забывайте так же про горячею комбинацию ctrl + r 

#### Настройка Tab

Если нужно что бы нажимать Tab нужно было один раз, то в etc/inputrc. 
```
set show-all-if-ambiguous On
```

#### Исправление регистра в аргументах функций

Например замену Books на books.  
В ~./bashrc: 
```
shopt -s nocaseglob
```