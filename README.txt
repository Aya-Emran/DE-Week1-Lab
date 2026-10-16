# Week 1 Data Engineering Lab

## Scenario
A small online shop sends daily order data as a CSV file. A manager wants a reliable summary of valid orders by city.

## Pipeline plan
- Source: `orders.csv` (daily batch file)
- Raw destination: BigQuery table `de_intro.raw_orders`
- Curated output: query results after checking and filtering the data
- User of the output: shop manager

## Local data check
Before reporting, record at least two issues you found in the CSV and what you recommend doing with each.

1. Issue and recommendation:
Missing customer city: Fill in the missing city if possible; otherwise, exclude the record from city-based reports.
2. Issue and recommendation:
Duplicate order ID and zero quantity: Remove duplicate orders and exclude orders with quantity <= 0 from valid order reports.

## What the pipeline does
Complete after the lab: In one sentence, describe how the data moves from the source to a useful output.
The pipeline loads order data from a CSV file into BigQuery, checks data quality, filters invalid records and duplicates, and produces a reliable output for the shop manager.

## BigQuery Results

- Project: `project-b9192cc5-51a5-410f-b2c`
- Dataset: `DE_Intro`
- Raw table: `DE_Intro.raw_orders`
- Rows loaded: 8
- Rows with a missing customer city: 1
- Rows with non-positive quantity: 1
- Rows returned by the filtered query: 5

## Data Quality Findings

1. **Missing customer city:** Exclude records with missing or blank cities from city-based reports.
2. **Duplicate order ID:** Keep one record per order ID.
3. **Non-positive quantity:** Exclude records with quantity less than or equal to zero.

## Pipeline Summary

The pipeline loads order data from a CSV file into BigQuery, checks data quality, filters invalid records and duplicate orders, and produces a reliable summary of valid orders by city for the shop manager.