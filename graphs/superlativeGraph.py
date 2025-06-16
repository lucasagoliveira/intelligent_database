import matplotlib.pyplot as plt

# DO NOT CHANGE THESE VALUES
sql_times = [686.70, 241.48, 224.68, 252.63, 222.43, 221.90, 0.97, 0.39]

prolog_times = [1452.51, 148.50, 153.45, 154.24, 153.08, 156.61, 150.02, 148.92]
# Create X axis (1 to n)
x = list(range(1, len(sql_times) + 1))

# Plot
plt.figure(figsize=(12, 6))
plt.plot(x, sql_times, label="SQL Query Time", marker='o', color='blue')
plt.plot(x, prolog_times, label="Prolog Query Time", marker='x', color='green')

# Labels and legend
plt.title("Query Execution Time Comparison: SQL vs Prolog")
plt.xlabel("Query Index")
plt.ylabel("Time (ms)")
plt.legend()
plt.grid(True)
plt.tight_layout()

# Show plot
plt.show()
