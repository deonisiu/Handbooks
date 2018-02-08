Bash - усовершенствованная и модернизированная вариация командной оболочки Bourne shell. 
Bash - это командный процессор, работающий, как правило, в интерактивном режиме в текстовом окне. Bash также может читать команды из файла, который называется скриптом (или сценарием). 
Он поддерживает автодополнение имён файлов и директорий, подстановку вывода результата команд, переменные, контроль за порядком выполнения, операторы ветвления и цикла. Ключевые слова, синтаксис и другие основные особенности языка были заимствованы из sh.

//? PATH
PATH — это системная переменная, содержащая список (через точку с запятой) директорий, в которых ОС будет искать исполняемый файл при вызове команды из консоли. Чтобы вывести список пишем 'echo $PATH'. Чтобы добавить директорию в список PATH в файле '.bashrc' добавляем строку:
PATH=$PATH:'/c/Program Files/Sublime Text 3' $* где $* имя файла который надо запустить. В результате можем выполнить команду 'subl somefile.js' для запуска файла из любой директории.

//? Встроенные переменные:

$BASH -	путь к исполняемому файлу bash
$BASH_VERSION - версия Bash, установленного в системе
$BASH_VERSINFO[n] -	массив, состоящий из 6 элементов, содержащий информацию о версии bash
$EDITOR - заданный по умолчанию редактор
$HOME - домашний каталог пользователя
$HOSTNAME - сетевое имя хоста
$HOSTTYPE - тип машины (идентифицирует аппаратную архитектуру)
$MACHTYPE - аппаратная архитектура
$OSTYPE - тип операционной системы
$PATH - путь поиска (включает в себя каталоги /usr/bin/, /usr/X11R6/bin/, /usr/local/bin)
$PWD - рабочий (текущий) каталог
$REPLY - переменная по умолчанию, куда записывается ввод пользователя, выполненный с помощью команды read
$SECONDS - время работы сценария (в секундах)

//? Файловая система
Пользователь всегда находится в какой-то папке. К примеру, Вы видите в консоли: nikname@computer /c/cmder — значит сейчас Вы в папке C:/cmder . Чтобы перейти в другую папку, наберите команду cd и укажите ей абсолютный или относительный путь — куда переходить. К примеру:
cd projects — переход в папку projects, которая есть текущей папке
cd /d/projects — переход в папку projects, расположенную по адресу D:/projects 
(где бы не находился пользователь)
cd /c/Program\ Files — переход в C/:Program Files 
(пробел в имени папки экранирован)
cd .. — переход к к родительской папке 
(вверх на 1 уровень)
cd - — переход к последней рабочей папке 
(что-то вроде команды «назад»)
Чтобы не набирать имя папки целиком, наберите первые пару символов и нажмите Tab — произойдет автодополнение (если нет двух папок, начинающихся с введенных символов, иначе будут показаны сами эти папки).

//? Посмотреть содержимое папки позволяет команда ls:
ls — показать содержимое папки 
(сортировка по имени, папки и файлы вперемешку, несколько столбцов)
ls -a — то же, но показывать и скрытые файлы и папки
ls -a -1 — то же, но в один столбец
ls -hF -1 --sort=extension — показать содержимое папки «красиво, в один столбец»
ls build/css — показать содержимое папки ТЕКУЩАЯ_ПАПКА/build/css

//? Создание папок и файлов — команды mkdir и touch.
mkdir project — создать папку с именем «project»
mkdir project project/css project/js — создать несколько папок
mkdir -p project/{css,js} — то же, что выше
touch index.html — создать файл
touch index.html css/style.css js/script.js — создать файлы 
(папки css/ и js/ должны уже существовать)

//? Копирование файлов — команда cp
cp index.html catalog.html — копирование файла index.html в тот же каталог с переименованием в catalog.html
cp index.html old/ — копирование файла index.html в папку old/ 
(все произойдет в текущей папке)
cp temp/ temp2/ -r — копирование каталога

//? Переименование или перемещение файлов — команда mv
mv index.html old — перемещение файла в папку
mv index.html old/new_name.txt — перемещение файла в папку с переименованием файла
mv order.txt orderNew.txt — переименовать файл

//? Удаление папок и файлов — команда rm
rm ghost.png — удалить файл
rm -rf old — удалить папку и все из нее

//? Разные мелочи (как вдохновение для последующего изучения консольных команд):
df -h — показать статистику использования пространства на дисках
grep -i -n --color 'carousel' index.html css/style.css — найти слово carousel в двух указанных файлах (с игнором регистра), вывести строки с этим словом и номера строк (искомое слово подсветить)
find . -iname '*ind*' — найти в текущей папке (и подпапках) все файлы, имена которых содержат ind и показать списком
ls -a | tee file.txt — записать в file.txt результат вывода команды ls -a


//? Ввод-вывод
echo - выводит выражение или содержимое переменной (stdout), но имеет ограничения в использовании
printf - команда форматированного вывода, расширенный вариант команды echo
read - «читает» значение переменной со стандартного ввода (stdin), в интерактивном режиме это клавиатура

//? Файловая система
cd - изменяет текущий каталог
pwd - выводит название текущего рабочего каталога (от англ. print working directory)
pushd - изменяет текущий каталог с возможностью возврата в обратном порядке
popd - возвращает текущий каталог после pushd
dirs - вывести или очистить содержимое стека каталогов, сохранённых через pushd

//? Действия над переменными
let - производит арифметические операции над переменными
eval - транслирует список аргументов из списка в команды
set - изменяет значения внутренних переменных скрипта
unset - удаляет переменную
export - экспортирует переменную, делая её доступной дочерним процессам
declare, typeset - задают и/или накладывают ограничения на переменные
getopts - используется для разбора аргументов, передаваемых скрипту из командной строки

//? Управление сценарием
source, . (точка) - запуск указанного сценария
exit - безусловное завершение работы сценария
exec - заменяет текущий процесс новым, запускаемым командой exec
shopt - позволяет изменять ключи (опции) оболочки на лету

//? Команды
true - возвращает код завершения ноль (успешное завершение)
false - возвращает код завершения, который свидетельствует о неудаче
type prog - выводит полный путь к prog
hash prog - запоминает путь к prog
help COMMAND - выводит краткую справку по использованию внутренней команды COMMAND

//? Управление запущенными в командной оболочке задачами
jobs - показывает список запущенных в командной оболочке задач, либо информацию о конкретной задаче по её номеру
fg - переключает поток ввода на текущую задачу (или на определённую задачу, если указан её номер) и продолжает её исполнение
bg - продолжает исполнение текущей приостановленной задачи (или определённых задач, если указаны их номера) в фоновом режиме
wait - ожидает завершения указанных задач