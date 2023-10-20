import csv
data = []
t0 = 0.0
T = 0.05
with open("data_steph_fixed2.csv", "r") as f:
    reader = csv.reader(f, delimiter=",")
    for i, line in enumerate(reader):
        if i != 0:
            if float(line[0]) - float(data[-1][0]) > 0.06:
                print(line[0])
            if line[0] != data[-1][0]:
                data.append(line)
        else:
            data.append(line)
            t0 = (float)((line[0]))
print(t0)

with open("data_prbs.csv", mode="w", newline="") as csv_file:
    writer = csv.writer(csv_file)
    #writer.writerow(["Time", "y", "u"])  # Write the header
    for i in range(len(data)):
        # # Write the data row to the CSV file
        t = float('%.2f'%(T*i))
        y = float(data[i][1])
        u = float(data[i][2])
        writer.writerow([t,y,u])

        # # Flush the file buffer to ensure continuous writing
        csv_file.flush()