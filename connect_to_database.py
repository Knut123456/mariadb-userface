
def connect_to_database_def(host, user, password, port):
    from pathlib import Path
    import sys
    parent_div = Path(__file__).parent
    sys.path.append(str(parent_div))
    import mysql.connector
    from mysql.connector import Error
    import os

    try:
        conn = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            port=port 
        )
        if conn.is_connected():
           #print(f"Connected to database ,{database}")
            return conn
            
    except Error as e:
        print(f"Error while connecting to MariaDB: {e}")

    return None 

