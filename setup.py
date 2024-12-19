from time import sleep

from dotenv import load_dotenv
from pyodbc import connect, OperationalError
from os import environ, chmod
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
            chmod(path=file, mode=0o644)

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
                    sleep(5)
                    db_connection = connect(connection_string)
                    cursor = db_connection.cursor()
                    print("Database connected successfully")
                except OperationalError as oe:
                    print(f"{oe}")
                else:
                    # Create w3resource_sql database
                    with open("Scripts/ddl/create_database.sql", "r") as db:
                        create_db_script = db.read()
                        db_connection.autocommit = True
                        cursor.execute(create_db_script)
                        db_connection.autocommit = False

                    # Create salesman table
                    with open("Scripts/ddl/create_salesman_table.sql", "r") as salesman:
                        salesman_table_script = salesman.read()
                        cursor.execute(salesman_table_script)
                        cursor.commit()

                    # Create Stored Procedure to insert salesman data
                    with open("Scripts/stored_procedures/USP_insert_salesman_data.sql", "r") as salesman_sp:
                        salesman_sp_script = salesman_sp.read()
                        cursor.execute("USE w3resource_sql")
                        cursor.execute(salesman_sp_script)
                        cursor.commit()

                    # Create customer table
                    with open("Scripts/ddl/create_customer_table.sql", "r") as customer:
                        customer_table_script = customer.read()
                        cursor.execute(customer_table_script)
                        cursor.commit()

                    # Create Stored Procedure to insert customer data
                    with open("Scripts/stored_procedures/USP_insert_customer_data.sql", "r") as customer_sp:
                        customer_sp_script = customer_sp.read()
                        cursor.execute("USE w3resource_sql")
                        cursor.execute(customer_sp_script)
                        cursor.commit()

                    # Create nobel_win table
                    with open("Scripts/ddl/create_nobel_win_table.sql", "r") as nobel_win:
                        nobel_win_script = nobel_win.read()
                        cursor.execute(nobel_win_script)
                        cursor.commit()

                    # Create Stored Procedure to insert nobel_win data
                    with open("Scripts/stored_procedures/USP_insert_nobel_win_data.sql", "r") as nobel_win_sp:
                        nobel_win_sp_script = nobel_win_sp.read()
                        cursor.execute("USE w3resource_sql")
                        cursor.execute(nobel_win_sp_script)
                        cursor.commit()

                    # Create orders table
                    with open("Scripts/ddl/create_orders_table.sql", "r") as orders:
                        orders_script = orders.read()
                        cursor.execute(orders_script)
                        cursor.commit()

                    # Create Stored Procedure to insert orders data
                    with open("Scripts/stored_procedures/USP_insert_orders_data.sql", "r") as orders_sp:
                        orders_sp_script = orders_sp.read()
                        cursor.execute("USE w3resource_sql")
                        cursor.execute(orders_sp_script)
                        cursor.commit()

                    # Create item_mast table
                    with open("Scripts/ddl/create_item_mast_table.sql", "r") as item_mast:
                        item_mast_script = item_mast.read()
                        cursor.execute(item_mast_script)
                        cursor.commit()

                    # Create Stored Procedure to insert item_mast data
                    with open("Scripts/stored_procedures/USP_insert_item_mast_data.sql", "r") as item_mast_sp:
                        item_mast_sp_script = item_mast_sp.read()
                        cursor.execute("USE w3resource_sql")
                        cursor.execute(item_mast_sp_script)
                        cursor.commit()

                    # Create emp_details table
                    with open("Scripts/ddl/create_emp_details_table.sql", "r") as emp_details:
                        emp_details_script = emp_details.read()
                        cursor.execute(emp_details_script)
                        cursor.commit()

                    # Create Stored Procedure to insert emp_details data
                    with open("Scripts/stored_procedures/USP_insert_emp_details_data.sql", "r") as emp_details_sp:
                        emp_details_sp_script = emp_details_sp.read()
                        cursor.execute("USE w3resource_sql")
                        cursor.execute(emp_details_sp_script)
                        cursor.commit()

                    cursor.close()
                    db_connection.close()

if __name__ == "__main__":
    connect_db()














