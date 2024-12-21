Welcome to the ABD Iowa data model!

### Goal of project
This project is built to showcase the tooling and logic behind modeling multi-source data through dbt.

### Source of the data

The beverage data has been provided by the Alcoholic Beverage Department for the State of Iowa. 
This dataset has be published monthly since 2012: https://data.iowa.gov/Sales-Distribution/Iowa-Liquor-Sales/m3tr-qhgy/about_data

### Structure of the model

The data transformations are structured with the following layers:
- Staging (stg)
- Marts (dim & fct)
- External (ext)

Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/overview)
- Explore the [frameworks](https://www.maxqanalytics.io/frameworks) that have been applied for the modeling.
- Multiple downstream [data applications](https://lookerstudio.google.com/u/0/reporting/86bd9839-3788-4b62-a1d9-4ce312bbff3e/page/p_j2oz71jsnd) are linked to this model.
- This dbt project is maintained by [MAXQ Analytics](https://www.maxqanalytics.io/)

Contact:
- When you want to talk to us, you can reach us at: hello@maxqanalytics.io
