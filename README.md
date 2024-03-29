# Air Quality Index Analysis

This repository contains a dataset and an SQL script for the analysis of air quality data obtained from Kaggle. The dataset includes information about air quality indexes at 11 PM on December 26, 2023, for various stations in a India.

## Dataset Information

- **Source:** [Kaggle - Latest Air Quality Index Analysis](https://www.kaggle.com/datasets/brpuneet898/latest-air-quality-index-analysis)


### Data Columns

1. `id`: Unique identifier for each record.
2. `country`: Country of the air quality observation.
3. `state`: State within the country.
4. `city`: City where the observation took place.
5. `station`: Air quality monitoring station.
6. `station_code`: Code for the monitoring station.
7. `last_update`: Timestamp of the observation (11 PM on December 26, 2023).
8. `latitude`: Latitude of the monitoring station.
9. `longitude`: Longitude of the monitoring station.
10. `pollutant_id`: Identifier for the type of pollutant.
11. `pollutant_min`: Minimum level of the pollutant.
12. `pollutant_max`: Maximum level of the pollutant.
13. `pollutant_avg`: Average level of the pollutant.

## SQL Script

The repository includes an SQL script [Air_Quality_dataset_insights.sql](https://github.com/PRADIP057/Air-Quality-Data-SQL/blob/main/Air_Quality_dataset_insights.sql) designed to perform insightful analysis on the provided air quality dataset. The script covers a range of complex questions and aims to extract valuable information from the data.

## Usage

1. Download the [air_quality_data.csv](https://www.kaggle.com/datasets/brpuneet898/latest-air-quality-index-analysis/download?datasetVersionNumber=1) file from Kaggle and place it in the root directory of this repository.
2. Import the SQL script [Air_Quality_dataset_insights.sql](https://github.com/PRADIP057/Air-Quality-Data-SQL/blob/main/Air_Quality_dataset_insights.sql)  your preferred SQL database management system.
3. Run the script to perform the analysis on the provided air quality dataset.

Feel free to modify and adapt the SQL script based on your specific requirements and database setup.

## License

The dataset and SQL script are provided under the terms specified by Kaggle. Refer to the [Kaggle dataset license](https://www.kaggle.com/terms) for more details.

## Acknowledgements

- Dataset Source: Kaggle

If you find this repository helpful or use the provided dataset or SQL script in your work, consider giving credit to Kaggle and the dataset contributors.

