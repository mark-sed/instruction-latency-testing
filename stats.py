from statistics import median, mode, mean

with open('.test100.txt') as f:
    all_lines = f.read()

vals = all_lines.split('\n')

tests = []
prev = 0
for i in range(100, len(vals), 100):
    tests.append(vals[prev:i])
    prev = i

for i in range(len(tests)):
    for a in range(len(tests[i])):
        tests[i][a] = tests[i][a].split(';')

avrgs = []
med = []
mod = []
for i in range(len(tests)):
    i_real = []
    i_user = []
    i_sys = []
    for a in range(len(tests[i])):
        i_real.append(float(tests[i][a][1].replace(',', '.')))
        i_user.append(float(tests[i][a][2].replace(',', '.')))
        i_sys.append(float(tests[i][a][3].replace(',', '.')))
    avrgs.append([tests[i][0][0], mean(i_real), mean(i_user), mean(i_sys)])
    med.append([tests[i][0][0], median(i_real), median(i_user), median(i_sys)])
    mod.append([tests[i][0][0], mode(i_real), mode(i_user), mode(i_sys)])


print("%AVERAGES:")
for i in avrgs:
    for a in i:
        print(str(a)+",", end="")
    print()

print("%MEDIANS:")
for i in med:
    for a in i:
        print(str(a)+',',end="")
    print()

print("%MODES:")
for i in mod:
    for a in i:
        print(str(a)+',',end="")
    print()


