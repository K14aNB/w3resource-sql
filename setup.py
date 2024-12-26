from time import sleep
from dotenv import load_dotenv # type: ignore
from pyodbc import connect, OperationalError
from os import environ
from shutil import copy2
from pathlib import Path
from subprocess import run, CalledProcessError

def connect_db() -> None:
    """
    Function to establish connection with MS SQL Server database.

    A.env file should be created containing the following variables:
    'DRIVER', 'HOST', 'DATABASE', 'USER', 'PASSWORD'

    Returns
    -------
        None
    """
    if load_dotenv():
        server = environ.get("SERVER")
        username = environ.get("USERNAME")
        password = environ.get("DB_PASSWORD")
        connection_string = f'DRIVER={{ODBC Driver 18 for SQL Server}};SERVER={server};UID={username};PWD={password};Encrypt=no'

        # Copy data files to local directory
        src_dir_path = Path("./data/")
        Path("~/w3resource_sql/data").expanduser().mkdir(mode=0o777, parents=True, exist_ok=True)
        dest_path_dir = Path("~/w3resource_sql/data").expanduser()
        for file in src_dir_path.iterdir():
            copy2(src=file, dst=dest_path_dir)
        for file in dest_path_dir.iterdir():
            file.chmod(mode=0o644)

        try:
            initial_container_status = run(["docker", "ps"], check=True, capture_output=True).stdout.decode("utf-8").replace("\n", "")
            if not initial_container_status.endswith("w3resource_sql"):
                run(["docker", "compose", "-f", "./compose.yaml", "up", "-d"], check=True)
            container_status = run(["docker", "ps"], check=True, capture_output=True).stdout.decode("utf-8").replace("\n", "")
        except CalledProcessError as ce:
            print(f"{ce.cmd} failed")
        else:
            if container_status.endswith("w3resource_sql"):
                try:
                    if not initial_container_status.endswith("w3resource_sql"):
                        print("Waiting for database connection")
                        sleep(10)
                    db_connection = connect(connection_string)
                    cursor = db_connection.cursor()
                    print("Database connected successfully")
                except OperationalError as oe:
                    print(f"{oe}")
                else:
                    ddl_scripts_path = Path("./Scripts/ddl")
                    sp_scripts_path = Path("./Scripts/stored_procedures")
                    constraints_scripts_path = Path("./Scripts/constraints")

                    # Create w3resource_sql database
                    with open(ddl_scripts_path / "create_database.sql", "r") as db:
                        create_db_script = db.read()
                        db_connection.autocommit = True
                        cursor.execute(create_db_script)
                        db_connection.autocommit = False
                    
                    # Create tables
                    for ddl_file in ddl_scripts_path.iterdir():
                        with open(ddl_file, "r") as ddl:
                            ddl_script = ddl.read()
                            cursor.execute(ddl_script)
                            cursor.commit()
                    
                    # Add Foreign Key Constraints
                    for constraints_file in constraints_scripts_path.iterdir():
                        with open(constraints_file, "r") as constraints:
                            constraints_script = constraints.read()
                            cursor.execute(constraints_script)
                            cursor.commit()
                    
                    # Create Stored Procedures for inserting data into tables
                    cursor.execute("USE w3resource_sql")
                    for sp_file in sp_scripts_path.iterdir():
                        with open(sp_file, "r") as sp:
                            sp_script = sp.read()
                            cursor.execute(sp_script)
                            cursor.commit()

                    cursor.close()
                    db_connection.close()

if __name__ == "__main__":
    connect_db()














