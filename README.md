# Introduction 
The aim of this activity is to analyse and model data coming from Netflix and Disney Plus Platforms.

# Installation instructions
### Clone the project repository
    https://github.com/kvc55/Data_Analysis_Platforms

### Create a virtualenv
    python -m venv path\to\myenv

### Install the requirements
    pip install -r requirements.txt

### Create and configure the connection to s3 bucket
1. Create s3 bucket and upload the files that are in downloads folder, then delete the files from the folder.

2. Create a .ini or .env file configuring the connection to the bucket: 

       BUCKET_REGION = selected_region
       KEY_ID = my_bucket_key_id
       ACCESS_KEY = my_bucket_access_key
       bucket_name = my_bucket_name

### You can execute the project by running
    python main.py


### Create a database 
The .sql files to create the tables to model the data and to populate them and also the queries done are in the "sql" folder.