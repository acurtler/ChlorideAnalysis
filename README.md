# Chloride Analysis of Twin Cities Metro Area Lakes

This project was completed as part of my Environmental Science capstone course. I worked with a partner to analyze data from the MSP Long-Term Ecological Research Project (LTER). We used R to explore temporal trends in chloride concentrations of 24 lakes in the Twin Cities Metro Area (TCMA). The 24 lakes were part of four major lake chains in the TCMA: Phalen chain, Minneapolis Parks & Recreation Board chain, Lino Lakes chain, and Riley Creek chain. We also used ArcGIS Pro to explore spatial trends in chloride concentration, including relationship between chloride concentrations and lake position in the watershed, and relationship between road density and chloride concentration. The R scripts that were used in our data analysis are included in this repository. 

## Project Structure
- Cl_all_lakes.csv: csv file that contains chloride concentration data for all lakes from the LTER

- LakeChains.csv: csv file that categorizes lakes by the lake chain they belong to and their order in the chain

- Precipitation data for the TCMA as collected by the MSP airport:
    -	Precip_1980_1990.csv
    -	Precip_1990_1999.csv
    -	Precip_2000_2009.csv
    -	Precip_2010_2019.csv
    -	Precip_2020_present.csv

- LTERscript.Rmd: R markdown file with R script for data cleaning to get only the lakes of interest in our project (Riley chain, Phalen chain, MPRB chain, Lino Lakes chain)

- LTER_Summarize_1.R: R script for calculating summary statistics

- LTER_Plots.R: R script for creating some data plots

- LTER Final Project Presentation.pdf: pdf file of the presentation of our findings


## How to Run This Project

To run this project, follow these steps:

1. **Download the Data**
   - Download the CSV files containing chloride concentration data to your computer.

2. **Download the R Scripts and R Markdown Files**
   - Download the R scripts (`.R` files) and R Markdown files (`.Rmd` files) to your computer.

3. **Set Up Your R Environment**
   - Ensure you have R and RStudio installed on your computer.
  
4. **Change the Working Directory**
   - Open the R scripts or Rmd files in RStudio.
   - Modify the working directory to point to the location where you have stored the project files. You can do this by setting the working directory at the beginning of your script:
     ```R
     setwd("path/to/your/project/directory")
     ```
     Replace `path/to/your/project/directory` with the actual path to your project directory.

5. **Modify the File Reading Methods**
   - Ensure that the file paths in your scripts correctly point to the location of your CSV files. Update the `read.csv` function calls as follows:
     ```R
     data <- read.csv("Data/your-data-file.csv")
     ```
     Replace `your-data-file.csv` with the actual file names you are using.

6. **Run the R Scripts**
   - Open the R scripts R Markdown files in RStudio.
   - Run the scripts to clean the data, focusing on the lakes of interest and exploring the data trends.


