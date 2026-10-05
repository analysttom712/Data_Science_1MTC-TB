# Data Science Labs

Lab work and projects from my Data Science course.

This repository holds my labs and final project for an applied data science course taught in R. Over the semester the work moves from R basics and the tidyverse through data cleaning, visualization, and regression, and ends with classification, clustering, and neural networks.

## Course Labs

| Lab | Modules Covered | Key Skills | Folder |
|-----|-----------------|------------|--------|
| **Lab 1** | R Basics, Data Import & Tidyverse · Exploratory Data Analysis & Visualization · Data Cleaning | Importing data with `readr`, wrangling with `dplyr`, plotting with `ggplot2`, handling missing and unusual values | [lab01](lab01/) |
| **Lab 2** | Data Preparation & Advanced Visualization · Applied Data Science Workflow · Simple Linear Regression | Reshaping with `tidyr`, multi-layer and faceted plots, the question → data → model → communicate workflow, fitting and interpreting `lm()` | [lab02](lab02/) |
| **Lab 3** | Multiple Linear Regression | Models with several predictors (including categorical), train/test splits, RMSE/MAE, residual diagnostics | [lab03](lab03/) |
| **Lab 4** | Classification & Machine Learning · Clustering & Introduction to Neural Networks | Classification models, confusion matrices and accuracy, k-means clustering, scaling, small neural networks with `nnet` | [lab04](lab04/) |
| **Lab 5** | Final Applied Data Science Project | End-to-end analysis in R Markdown (see below) | [final-project](final-project/) |

## Final Project: Predicting Diamond Prices

**Question:** How well can diamond price be predicted from its characteristics?

Using a 3,000-row random sample of the `diamonds` dataset from `ggplot2`, the project works through a full analysis in R Markdown:

1. **Define & inspect:** state the question, choose predictors, and check for missing or unusual values
2. **Explore:** visualize the price distribution, carat vs. price, and price across cut, color, or clarity
3. **Multiple linear regression:** train/test split, coefficient interpretation, test-set RMSE/MAE, and an actual-vs-predicted or residual plot
4. **Extend:** either k-means clustering of diamond characteristics or an artificial neural network (`nnet` + `NeuralNetTools`) classifying above- vs. below-median price
5. **Conclude:** model performance on unseen data, limitations, and ethical considerations for real pricing decisions

The project files are the `.Rmd` source and its rendered HTML/PDF report.

## Tools & Technologies

- R
- RStudio and R Markdown
- tidyverse (`readr`, `dplyr`, `tidyr`, `ggplot2`, `stringr`, `forcats`, `lubridate`)
- `nnet` and `NeuralNetTools` for neural networks
- Base R `lm()` and `kmeans()` for modeling

## Repository Structure

```
.
├── lab01/
├── lab02/
├── lab03/
├── lab04/
├── final-project/
│   ├── final_project.Rmd
│   └── final_project.html
├── data/                  # course datasets (not committed, see "Data" below)
├── data-science-labs.Rproj
├── .gitignore
└── README.md
```

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/analysttom712/<repo-name>.git
   ```

2. **Open the project in RStudio**
   Double-click the `.Rproj` file so file paths work relative to the project folder.

3. **Install the required packages** (one-time)
   ```r
   install.packages(c("tidyverse", "rmarkdown", "nnet", "NeuralNetTools"))
   ```

4. **Run a lab**
   Open a lab folder and run its script, or knit its R Markdown file.

## Data

The datasets for Labs 1–4 were provided through the course and **are not included in this repository**. To run those labs, put the matching data file in a `data/` folder at the project root:

```r
library(tidyverse)
df <- read_csv("data/dataset_name.csv")
```

The final project uses the `diamonds` dataset that comes with `ggplot2`, so it runs with no downloads.

## Author

**Tom**
GitHub: [@analysttom712](https://github.com/analysttom712)

---

*This repo is coursework for a Data Science class. If you're a current student in this course, please follow your class's academic integrity policy.*
