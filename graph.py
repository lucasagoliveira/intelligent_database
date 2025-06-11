import matplotlib.pyplot as plt

# Example data
sql_times = [
    608, 207, 206, 203, 203, 200, 202, 207, 205, 210, 218, 219,
    208, 213, 216, 204, 214, 218, 211, 219, 217, 210, 212, 208,
    211, 210, 215, 216, 216, 215
]

prolog_times = [
    480.09, 779.85, 404.66, 268.44, 269.15, 954.49, 277.02, 418.62,
    273.08, 409.24, 406.55, 422.45, 271.64, 410.63, 271.02, 415.24,
    405.62, 406.27, 278.15, 279.74, 410.73, 400.49, 277.77, 417.97,
    267.30, 271.64, 277.85, 417.74, 404.51, 275.14
]
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
