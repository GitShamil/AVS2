# 1. соответствие переменных адресам стека
main.c

1) -52[pbp] = argc
2) -56[rbp] = argv[1]
3) -64[rbp] = argv[0]
4) -4[rbp] = i
5) -16[rbp] = input
6) -8[rbp] = length
7) -24[rbp] = begin
8) -32[rbp] = end
9) -40[rbp] = time_spent
10) -48[rbp] = output

makeString.c
1) -4[rbp] = j
2) -8[rbp] = h
3) -9[rbp] = read

# 2. Использование программы и общая информация
Программа состоит из 2-х единиц компиляции. 1-ая единица это main, вторая countArrayB. 
У программы есть 3 режима работы через консоль
1) ./answer.exe           (- это запуск без параметров argv[1] и тогда будет ввод и вывод в консоль
2) ./answer.exe 1         (- argv[1] = 1 тогда будут данные браться из файла input.txt и класться в output.txt
3) ./answer.exe 2         (- argv[1] = 2 рандомный ввод и вывод в консоль
в конце ввода строке нажмите enter + ctrl + d для ввода символа окончания потока
Компилировал в ассемблер с такими параметрами
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./code.c \
    -S -o ./code.s


# 3. рефакторниг
1) удалил бесполезную часть с конца файла
2) убрал бесполезную работу когда сначала кладут в rax потом в rsi из rax, я стал класть сразу в rax
3) во время больших циклов клал i,j,h в регистры вместо того чтобы каждый раз дергать из стека
так как длина нашего массива до 100 то при вводе и выводе я не клал i в регистр, потому что это бессмысленно, это сэкономит почти ничего. А в самой функции makeString я положил j,j в регистр а также в цикле вокруг функции я стал использовать регистры 
1. r12d = i.       (-4[rbp] in main)
2. r13d = j   (-4[rbp] in makeString)
3. r14d = h   (-8[rbp] in makeString)
4. r15d = read (-9[rbp] in makeString)  - это флаг того что нужно считывать или нет
5. rbx = A[j-1] and A[j]  я юзал сначала для A[j-1] потом для A[j]
это улучшило производительность в 2 раза примерно. То есть я использовал регистры вместо обращения к стеку как нужндо для 6 баллов.
4) убрал бесполезные строки когда в регистр записывается значение которое там уже было и не могло измениться
5) оптимизировал цикл вычисление массива B достаточн сильно. Вместо 11 раз когда мы берем A[j] или A[j-1] в условиях, я их клал в rbx и тем самым дергал стек 3 раза вместо 11, что уменьшило время.

# 4. результаты тестов.
![image](https://user-images.githubusercontent.com/113286731/201534430-b5fe28a9-3cdd-4ccc-ac15-b6c7c121f640.png)


оптимизационные функция для размера
gcc -masm=intel     -fno-asynchronous-unwind-tables     -fno-jump-tables     -fno-stack-protector     -fno-exceptions             -ffunction-sections -Wl,--gc-sections -Os -ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables  -ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables -Wl,--strip-all  ./name.c     -S -o ./name.s


отимизационные функции для скорости
gcc -masm=intel     -fno-asynchronous-unwind-tables     -fno-jump-tables     -fno-stack-protector     -fno-exceptions            -m64 -Ofast -flto -march=native -funroll-loops   ./makeString.c     -S -o ./makeString.s



