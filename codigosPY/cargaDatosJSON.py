#  Insertar 5 nuevos clientes en la base de datos
import json as js
import sqlite3 as sql
from datetime import datetime

def insertJSON():
    f=open('JSON\clientes_nuevos.json')
    data=js.load(f)
    f.close
    for i in range(len(data)):
        conn = sql.connect('db/itbank.db')
        cursor = conn.cursor()
        instruccion=f"INSERT INTO cliente(customer_name,customer_surname,customer_DNI,dob,branch_id) VALUES('{data[i]['customer_name']}','{data[i]['customer_surname']}',{int(data[i]['customer_DNI'])},'{data[i]['customer_dob']}',{int(data[i]['branch_id'])})"
        cursor.execute(instruccion)
        conn.commit()
        conn.close()


insertJSON()



