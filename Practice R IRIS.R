#Load the packages
library(tidyverse)
library(datasets)

#Load the built-in iris and ChickWeight data sets
data("iris", package = "datasets")
data("ChickWeight", package = "datasets")

#Preview the first rows of each data set
print(head(iris))
print(head(ChickWeight))

#View the structure of each data set
str(iris)
str(ChickWeight)

#Convert the data frames to tibbles and print them
irises <- as_tibble(iris)
chicks <- as_tibble(ChickWeight)
print(irises)
print(chicks)

#Check the factor levels and whether Chick is an ordered factor
print(levels(irises$Species))
print(levels(chicks$Diet))
print(is.ordered(chicks$Chick))

#Filter the chicks on Diet 2 and the irises with a sepal length over 5
diet2 <- dplyr::filter(chicks, Diet == "2")
long_sepals <- dplyr::filter(irises, Sepal.Length > 5)
print(head(diet2))
print(head(long_sepals))

#Filter the chicks on Diet 2 after day 10
late_diet2 <- dplyr::filter(chicks, Diet == "2", Time > 10)
print(head(late_diet2))

#Create the base chick plot with Time on x, weight on y, colored and grouped by Chick
base_chicks <- ggplot(
  data = chicks,
  mapping = aes(x = Time, y = weight, color = Chick, group = Chick)
)
print(base_chicks)

#View the ChickWeight Table
View(ChickWeight)

#Plot the line for Chick growth over time in days and weight in grams then print it. Use a line width of 0.6.
line_plot <- base_chicks +
  geom_line(linewidth = 0.6) +
  labs(title = "Chick growth over time", x = "Time (days)", y = "Weight (g)")

print(line_plot)

#Create a scatter plot of sepal width vs sepal length colored by species
scatter_plot <- ggplot(
  data = irises,
  mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species)
) +
  geom_point(size = 3) +
  labs(title = "Sepal width vs length", x = "Sepal Length (cm)", y = "Sepal Width (cm)")

print(scatter_plot)

#Create a scatter plot where point size is sepal length x sepal width
size_plot <- ggplot(
  data = irises,
  mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species,
                size = Sepal.Length * Sepal.Width)
) +
  geom_point(alpha = 0.7) +
  labs(size = "Length X Width")

print(size_plot)

#Create a bar plot
bar_plot <- ggplot(data = irises, mapping = aes(x = Species, fill = Species)) +
  geom_bar() +
  labs(title = "Number of flowers by species", y = "Flower Count")

print(bar_plot)

#Create a bar plot of only the flowers with a sepal length over 5.5 cm
filtered_bar <- ggplot(
  data = dplyr::filter(irises, Sepal.Length > 5.5),
  mapping = aes(x = Species, fill = Species)
) +
  geom_bar() +
  labs(title = "Flowers with sepal length > 5.5 cm", y = "Count")

print(filtered_bar)

#Create a Box Plot with the irises data where you are using the Species and Sepal Width and color is species.
box_plot <- ggplot(
  data = irises,
  mapping = aes(x = Species, y = Sepal.Width, color = Species, fill = Species)
) +
  geom_boxplot(alpha = 0.25) +
  labs(y = "Sepal width (cm)")

print(box_plot)

#Create a Histogram Plot with the irises data where you are using the Species and Sepal Length and fill is species.
histogram_plot <- ggplot(
  data = irises, mapping = aes(x = Sepal.Length, fill = Species)
) +
  geom_histogram(bins = 20) +
  labs(x = "Sepal length (cm)", y = "Count")

print(histogram_plot)

#Create a KDE plot
kde_plot <- ggplot(
  data = irises, mapping = aes(x = Sepal.Length, color = Species)
) +
  geom_density(linewidth = 1) +
  labs(x = "Sepal length (cm)", y = "Density")

print(kde_plot)

#Create a Stacked KDE plot
stacked_kde <- ggplot(
  data = irises,
  mapping = aes(x = Sepal.Length, color = Species, fill = Species)
) +
  geom_density(position = "stack", alpha = 0.6) +
  labs(title = "Stacked density estimates", y = "Stacked Density")

print(stacked_kde)

#Create a ECDF
ecdf_species <- ggplot(
  data = irises, mapping = aes(x = Sepal.Length, color = Species)
) +
  stat_ecdf(linewidth = 1) +
  labs(x = "Sepal Length (cm)", y = "Proportion at or below x")

print(ecdf_species)

#Create a ECDF of all 150 flowers combined
ecdf_all <- ggplot(
  data = irises, mapping = aes(x = Sepal.Length)
) +
  stat_ecdf(linewidth = 1, color = "steelblue") +
  labs(title = "ECDF of all 150 Flowers", y = "Proportion at or below x")

print(ecdf_all)

#Create a 2D KDE contour plot of sepal length and sepal width
kde2d_plot <- ggplot(
  data = irises,
  mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species)
) +
  geom_density_2d(linewidth = 0.7, bins = 15) +
  labs(title = "Sepal Measurements: density contours")

print(kde2d_plot)

#Create a combined plot of the 2D KDE contours and the individual points
combined_kde <- ggplot(
  data = irises,
  mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species)
) +
  geom_density_2d(linewidth = 0.7, bins = 15) +
  geom_point(size = 2, alpha = 0.65) +
  labs(title = "Individual flowers and estimated concentrations")

print(combined_kde)

#Create a combined chick growth plot with lines and points
combined_growth <- base_chicks +
  geom_line(linewidth = 0.5) +
  geom_point(size = 1.2) +
  labs(title = "Chick growth: measurements and connecting lines",
       x = "Time (days)", y = "Weight (g)")

print(combined_growth)

#Create a faceted line plot of chick growth by diet in a 2 x 2 grid
faceted_growth <- base_chicks +
  geom_line(linewidth = 0.6) +
  facet_wrap(facets = vars(Diet), nrow = 2, ncol = 2, scales = "fixed") +
  labs(title = "Chick growth by diet", x = "Time (days)", y = "Weight (g)")

print(faceted_growth)

#Create a faceted histogram
faceted_histogram <- ggplot(data = irises, mapping = aes(x = Sepal.Length)) +
  geom_histogram(bins = 15, fill = "steelblue", color = "white") +
  facet_wrap(facets = vars(Species), ncol = 3) +
  labs(title = "Sepal length distributions by species", y = "Count")

print(faceted_histogram)

#Load the packages for the 3D plot
library(plotly)
library(MASS)

# Create X and Y Grid
x_grid <- seq(
  min(irises$Sepal.Length),
  max(irises$Sepal.Length),
  length.out = 50
)

y_grid <- seq(
  min(irises$Sepal.Width),
  max(irises$Sepal.Width),
  length.out = 50
)

#Bandwidth controls how smooth the density surface is
hx <- 0.25
hy <- 0.20

# Create empty matrix for density values
z <- matrix(
  0,
  nrow = length(y_grid),
  ncol = length(x_grid)
)

# Create density at each X/Y location
for (i in seq_along(x_grid)) {
  for (j in seq_along(y_grid)) {
    
    z[j, i] <- mean(
      dnorm(
        (x_grid[i] - irises$Sepal.Length) / hx
      ) *
        dnorm(
          (y_grid[j] - irises$Sepal.Width) / hy
        )
    ) / (hx * hy)
    
  }
}

# Create interactive 3D surface
combined_kde_3d <- plot_ly(
  x = x_grid,
  y = y_grid,
  z = z,
  type = "surface"
) %>%
  layout(
    title = "3D Density of Iris Sepal Measurements",
    scene = list(
      xaxis = list(title = "Sepal Length (cm)"),
      yaxis = list(title = "Sepal Width (cm)"),
      zaxis = list(title = "Density")
    )
  )

print(combined_kde_3d)
