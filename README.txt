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