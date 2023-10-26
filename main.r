# Load the tidyverse package
library(tidyverse)

# Read the csv file named dataset.csv
df <- read_csv("dataset.csv")

# Create a pie chart of the color column
pie_chart <- df %>%
  # Count the frequency of each color
  count(color) %>%
  # Calculate the percentage of each color
  mutate(percentage = n / sum(n) * 100) %>%
  # Plot the pie chart using ggplot2
  ggplot(aes(x = "", y = percentage, fill = color)) +
  # Use geom_col to create a bar chart
  geom_col(width = 1) +
  # Use coord_polar to transform the bar chart into a pie chart
  coord_polar(theta = "y") +
  # Add labels to show the percentage of each color
  geom_text(aes(label = paste0(round(percentage, 1), "%")), position = position_stack(vjust = 0.5)) +
  # Add a title to the pie chart
  ggtitle("Pie Chart of Color")

# Create a graph of the stop, start, and go columns
graph <- df %>%
  # Gather the stop, start, and go columns into one column named variable and another column named value
  gather(variable, value, -color) %>%
  # Plot the graph using ggplot2
  ggplot(aes(x = variable, y = value, fill = color)) +
  # Use geom_boxplot to create a boxplot for each variable and color combination
  geom_boxplot() +
  # Add a title to the graph
  ggtitle("Graph of Stop, Start, and Go")

# Save the pie chart and the graph as png files named pie_chart.png and graph.png
ggsave("pie_chart.png", pie_chart)
ggsave("graph.png", graph)
