import json
import psycopg2
from psycopg2 import OperationalError, Error
import os
import pickle
import pandas as pd

def load_config(json_file_path="config.json"):
    """Function to load json config file"""
    with open(json_file_path, 'r') as json_file:
        config = json.load(json_file)
    # replace API_KEY in API_URL with the actual key generated from ticketmaster website
    if "API" in config:
        config["API"]["API_URL"] = config["API"]["API_URL"].replace("{API_KEY}", config["API"]["API_KEY"])
    return config


def execute_sql_script(sql_script):
    """ Execute an SQL script in PostgreSQL database """
    conn = None
    db_config = load_config()["Database"]
    try:
        conn = psycopg2.connect(
            dbname=db_config["database"],
            user=db_config["user"],
            password=db_config["password"],
            host=db_config["host"],
            port=db_config["port"]        
            )
        cur = conn.cursor()     
        cur.execute(sql_script)
        conn.commit()
        print("SQL script executed successfully!")
        
    except (OperationalError, Error) as e:
        print(f"Error: {e}")
        if conn is not None:
            conn.rollback()  # Roll back any changes if an error occurred
    finally:
        # Close cursor and connection
        if cur is not None:
            cur.close()
        if conn is not None:
            conn.close()


def run_script_file(script_name):
    """Function finds the script in sql_scripts folder and executes it in PostgreSQL"""
    script_full_path = f"sql_scripts/{script_name}.sql"
    with open(script_full_path, "r") as file:
        script = file.read()  
    execute_sql_script(script)


def generate_insert_statements(dataframe, table_name):
    """ Generate INSERT statements for DataFrame records """
    insert_statements = []
    for _, row in dataframe.iterrows():
        # Construct INSERT statement for each row
        columns = ', '.join(row.index.tolist())
        # values = ', '.join([f"'{value}'" if isinstance(value, str) else str(value) for value in row.tolist()])
        values = ', '.join([f"'{value}'" if isinstance(value, str) else 'NULL' if pd.isnull(value) else str(value) for value in row.tolist()])
        insert_statement = f"INSERT INTO {table_name} ({columns}) VALUES ({values});"
        insert_statements.append(insert_statement)
    return insert_statements


def write_insert_statements_to_file(insert_statements, script_name):
    """ Write INSERT statements to a text file """
    file_path = f"sql_scripts/{script_name}.sql"
    try:
        # Open the file in write mode
        with open(file_path, 'w') as file:
            # Write each INSERT statement to the file
            for statement in insert_statements:
                file.write(statement + '\n')  # Write each statement followed by a newline character
        print(f"Insert statements written to '{file_path}' successfully!")
    except Exception as e:
        print(f"Error: {e}")


def save_data_file(data, file_name):
    """Save data file by the given name as a pickle file in data/ folder"""
    data_storage_path = os.path.join("data", f"{file_name}.p")
    with open(data_storage_path, "wb") as file:
        pickle.dump(data, file)


def load_data_file(file_name):
    """Load data file from data/ folder"""
    data_storage_path = os.path.join("data", f"{file_name}.p")
    with open(data_storage_path, "rb") as file:
        events = pickle.load(file)
    return events