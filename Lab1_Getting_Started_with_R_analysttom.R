# ============================================================================
# Lab 1: Getting Started with R
# ============================================================================

# Student name:
# Date:

# PURPOSE --------------------------------------------------------------------

# Practice fundamental R skills:
# - Creating variables
# - Performing arithmetic
# - Using built-in functions
# - Working with vectors
# - Reading CSV files
# - Creating data-frame columns
# - Calculating summary statistics


# PART 1: RSTUDIO INTERFACE --------------------------------------------------

# Answer in comments:
# 1. Which RStudio pane is used to write and save an R script?
# Answer: Source Editor
#
# 2. Which pane shows commands and results as code runs?
# Answer: Console
#
# 3. Which pane displays objects currently stored in memory?
# Answer:Environment/History
#
# 4. Where can you view plots and help documentation?
# Answer: Plots Files/Packages /Help/Viewer/Presentation


# PART 2: VARIABLES AND DATA TYPES ------------------------------------------

# Create the following variables:
# a = 11 as an integer
# b = 5 as an integer
# c = 20.0 as a double
# msg = "Hello World"
# is_night = TRUE
# TYPE YOUR CODE BELOW
a <- 11L
b <- 5L
c <- 20.0
message <- "Hello world"
is_night = TRUE
# Display all five variables.
# TYPE YOUR CODE BELOW
a
b
c
message
is_night

# Use class() to display the data type of each variable.
# TYPE YOUR CODE BELOW
class(a)
class(b)
class(c)
class(message)
class(is_night)


# Answer in comments:
# 1. What is the class of a?
# Answer: Integer
#
# 2. What is the class of c?
# Answer: numeric
#
# 3. What is the class of msg?
# Answer: character
#
# 4. What is the class of is_night?
# Answer: Logical


# PART 3: BASIC ARITHMETIC ---------------------------------------------------

# Divide a by b and store the result in z.
# TYPE YOUR CODE BELOW
z <- a / b

# Perform integer division of a by b and store the result in y.
# Hint: use %/%
# TYPE YOUR CODE BELOW
y <- a %/% b

# Square c and store the result in c_squared.
# TYPE YOUR CODE BELOW
c_squared <- c ^ 2
  
# Calculate the remainder when a is divided by b.
# Store the result in x.
# Hint: use %%
# TYPE YOUR CODE BELOW
x <- a %% b

# Display z, y, c_squared, and x.
# TYPE YOUR CODE BELOW
z
y
c_squared
x


# Answer in comments:
# What is the difference between regular division and integer division?
# Answer:Regular division will give the exact number for example 2.2 
#where as integer division gives only the whole number part of the equation. 


# PART 4: BUILT-IN FUNCTIONS -------------------------------------------------

# Find the square root of 25 and store it in square_root.
# TYPE YOUR CODE BELOW
square_root <- sqrt(25)

# Calculate 2 raised to the power of 3 and store it in power_result.
# TYPE YOUR CODE BELOW
power_result <- 2 ^ 3

# Round 7.3457 to two decimal places and store it in rounded_result.
# TYPE YOUR CODE BELOW
rounded_result <- round(7.3457, 2)

# Set radius equal to 4. Calculate the area of a circle with pi * radius^2.
# Store the result in circle_area.
# TYPE YOUR CODE BELOW
radius <- 4
circle_area <- pi * radius ^ 2

# Display all four results.
# TYPE YOUR CODE BELOW
square_root
power_result
rounded_result
circle_area



# PART 5: VECTORS ------------------------------------------------------------

# Create a vector named study_hours containing five daily study-hour values.
# You may use the example values 5, 6, 4, 7, and 8 or your own values.

# TYPE YOUR CODE BELOW
study_hours <- c(3,5,7,8,2)

# Display study_hours.
# TYPE YOUR CODE BELOW
study_hours

# Calculate and display:
# - Total study hours, stored in total_hours
# - Average study hours, stored in avg_hours
# - Maximum study hours, stored in max_hours
# - Minimum study hours, stored in min_hours

# TYPE YOUR CODE BELOW
total_hours <- sum(study_hours)
total_hours
avg_hours <- mean(study_hours)
avg_hours
max_hours <- max(study_hours)
max_hours
min_hours <- min(study_hours)
min_hours
# Answer in comments:
# 1. How many values are in study_hours?
# Answer: 5
#
# 2. Which function returns the number of values in a vector?
# Answer: length
length(study_hours)


# PART 6: SALES DATA ---------------------------------------------------------

# Place sales_data.csv in the same folder as this R script.
# Do not use a personal setwd() path in the submitted script.

# Read sales_data.csv and store it in sales_data.
# TYPE YOUR CODE BELOW
sales_data <- read.csv("sales_data.csv")

# Display the first rows and structure of sales_data.
# TYPE YOUR CODE BELOW
head(sales_data)

# Create a column named Total_Sales by multiplying Units_Sold by
# Price_per_Unit for every product.
# TYPE YOUR CODE BELOW
sales_data$Total_Sales <- sales_data$Units_Sold * sales_data$Price_per_Unit

# Display the updated sales_data object.
# TYPE YOUR CODE BELOW
sales_data

# Calculate and display:
# - Total revenue, stored in total_revenue
# - Average units sold, stored in avg_units_sold

# TYPE YOUR CODE BELOW
total_revenue <- sum(sales_data$Total_Sales)
total_revenue
avg_units_sold <- mean(sales_data$Units_Sold)
avg_units_sold

# Identify the product with the largest Total_Sales value.
# Store the complete row in top_product.
# TYPE YOUR CODE BELOW
top_product <- sales_data[which.max(sales_data$Total_Sales), ]
top_product

# Answer in comments:
# 1. Which product produced the most revenue?
# Answer: Both Apples and Pears produced the same amount in revenue, 150.
#
# 2. What does each value in Total_Sales represent?
# Answer: Each unit in Total_Sales represents the total revenue produced 
# by each product


# PART 7: STUDENT GRADES -----------------------------------------------------

# Place student_grades.csv in the same folder as this R script.

# Read student_grades.csv and store it in grades.
# TYPE YOUR CODE BELOW
grades <- read.csv("student_grades.csv")
# Display the data and its structure.
# TYPE YOUR CODE BELOW
grades

# Create Average_Grade by calculating each student's row-wise average across
# Math, Science, and English.

# TYPE YOUR CODE BELOW
grades$Average_Grade <- rowMeans(grades[,c("Math", "Science", "English")])

# Display the updated grades object.
# TYPE YOUR CODE BELOW
grades

# Calculate and display:
# - Mean Math grade, stored in mean_math
# - Standard deviation of Science grades, stored in sd_science
# - Maximum English grade, stored in max_english
# - Minimum student average, stored in min_avg_grade

# TYPE YOUR CODE BELOW
mean_math <-mean(grades$Math)
mean_math
sd_science <- sd(grades$Science)
sd_science
max_english <- max(grades$English)
max_english
min_avg_grade <- min(grades$Average_Grade)
min_avg_grade
# Identify the student with the highest Average_Grade.
# Store the complete row in top_student.

# TYPE YOUR CODE BELOW
top_student <- grades[which.max(grades$Average_Grade), ]
top_student
# Answer in comments:
# 1. Which student has the highest average grade?
# Answer: Emma
#
# 2. What does the Science standard deviation describe?
# Answer: The Science Standard deviation shows how spread the student' 
# science grades are from the mean.


# PART 8: CONCLUSION ---------------------------------------------------------

# Write one short paragraph in comments explaining:
# - One new R operation you learned
# - How vectors differ from data frames
# - How R can calculate a new column for every row
# - One way summary statistics help describe a dataset
# 
# Conclusion:
# I learned a fair few R operations during this lesson, for instance, when you 
# use [which] you can pull based on a given scenario such as their max grade.
# Data frames are essentially tables of data that you can either pull from or 
# create, where as vectors are row (r) or columns (c) with a given number
# of variables. R can calculate a new column for every row by calculating a
# given operation, such as average (rowMeans) and creating a new column with
# the $ sign ($Average_Grade) attahced to the dataset you are pulling from.
# Statistics help describe a dataset by showing its main statistical data; 
# average, minimum, maximum, or spread in the data sheet. 

# END OF LAB -----------------------------------------------------------------
