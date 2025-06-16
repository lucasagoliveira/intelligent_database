import matplotlib.pyplot as plt

# DO NOT CHANGE THESE VALUES
sql_times = [78.83, 77.10, 71.59, 71.72]

prolog_times = [118.53, 135.25, 133.21, 118.44]
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
