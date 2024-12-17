# Project Gladiator - Retail Data Engineering Pipeline
## Introduction
![Alt text](Line.png)
The E-commerce industry generates massive volumes of data daily. This project focuses on building a scalable and efficient data engineering pipeline to process, analyze, and transform heterogeneous customer order data into actionable insights. We combined on-premises tools and cloud services to deliver an end-to-end solution.

## Business Problem

The e-commerce industry produces vast volumes of heterogeneous data, which can become overwhelming without a structured framework for analysis. Processing this data efficiently is critical for extracting actionable insights to optimize customer retention, reduce processing inefficiencies, and improve overall business performance.

Unstructured order data, when left unanalyzed, leads to challenges such as:
- High processing time for data analysis.
- Inability to identify trends impacting customer churn and revenue growth.
- Operational inefficiencies resulting from incomplete or redundant processes.

## Analytics Approach

The project adopts a structured, data-driven approach to address challenges related to customer order data analysis. The workflow begins with data ingestion, where historical data is sourced from CSV files and loaded into MySQL, followed by integration with HDFS using Sqoop for efficient storage. Next, exploratory data analysis (EDA) is conducted to uncover trends, patterns, and anomalies within the data, providing a foundation for further analysis. The data is then transformed using PySpark, which includes cleaning, feature engineering, partitioning, and compression to optimize performance. For real-time insights, Apache Kafka is integrated with Spark Structured Streaming, enabling live data processing and analysis. Finally, insights are visualized using interactive Tableau dashboards, providing stakeholders with actionable business metrics and trends. By combining batch processing, real-time streaming, and visualization, this approach ensures a scalable and efficient pipeline for data analysis and decision-making.

## Scope

The scope of the project focuses on developing an end-to-end data engineering pipeline to streamline customer order data analysis. It includes data ingestion from multiple sources, transformation using PySpark for cleaning and optimization, and real-time processing with Kafka and Spark Streaming. The project also integrates with AWS services like S3 for scalable storage and Redshift for querying, ensuring a hybrid on-premises and cloud-based architecture. Insights are delivered to business users through Tableau dashboards, offering a clear view of customer trends and operational efficiency. However, the project excludes advanced functionalities like predictive modeling, customer segmentation, and fraud detection, keeping the focus on delivering actionable insights through streamlined data pipelines and real-time analytics.

## Tech Stack
#### On-Premises Components
- MySQL: Relational data storage
- Apache Hive: Data transformation
- Apache Spark: Distributed data processing
- Apache Kafka: Real-time streaming

#### Cloud Services (AWS)

- Amazon S3: Storage
- AWS Lambda: Event-driven data processing
- Amazon Redshift & DynamoDB: Data querying and analytics


## Project Structure

### The project comprises the following tasks:

- Data Ingestion: Using Sqoop for MySQL-to-Hive integration
- Schema Design: Relational tables for regions, customers, orders, and suppliers
- Data Processing: PySpark transformations for reading, writing, and cleaning data
- Optimization: Partitioning, bucketing, and compression strategies (Parquet & GZIP)
- Real-Time Streaming: Kafka + Spark Structured Streaming for live data pipelines
- Delta Lake: ACID-compliant operations for large datasets
- Cloud Integration: Connecting Hive and Spark with AWS S3 and Redshift
- Visualizations: Tableau dashboards for business queries and actionable insights



## Business Value

The model's ability to predict default rates enables Home Credit to proactively identify customers at risk of defaulting on their loans. Through the utilization of Explainable AI (XAI), the model elucidates which predictors exert the most influence on the likelihood of default, providing valuable insights for risk management strategies.

Modeling plays a pivotal role in mitigating the risk of non-performing assets, consequently bolstering the company's bottom line by minimizing losses attributed to defaults. Moreover, extending loans to underserved customers lacking credit history expands Home Credit's customer base and revenue streams, fostering inclusive growth and financial empowerment.

Embracing technology and machine learning in the financial sector not only drives business growth but also streamlines operations, enhancing efficiency and customer service. Through the optimized loan portfolio facilitated by the solution, Home Credit strategically allocates resources to applications with the highest expected returns relative to their associated risks, thereby maximizing profitability while maintaining a prudent risk profile.

Furthermore, enhanced profitability is achieved through improved risk assessment and portfolio optimization, enabling Home Credit to approve loans with favorable Risk-Adjusted Return on Capital (RAROC) values. This results in increased revenue generation while mitigating the adverse effects of defaults.



**[EDA Notebook](https://github.com/gnair60/Home-Credit-Capstone/blob/main/EDA.ipynb)**

**[Modeling Notebook](https://github.com/gnair60/Home-Credit-Capstone/blob/main/Modelling.ipynb)**

**[Presentation](https://github.com/gnair60/Home-Credit-Capstone/blob/main/Capstone_Presentation.pdf)**
