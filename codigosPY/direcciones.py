from faker import Faker
import sqlite3 as sql
import re
import random

def insertdireccion(correspondencia,titular_id,calle,numero,ciudad,provincia,pais):
    conn = sql.connect('db/itbank.db')
    cursor = conn.cursor()
    instruccion=f"INSERT INTO direcciones(correspondencia_id,titular_id,calle,numero,ciudad,provincia,pais) VALUES({correspondencia},{titular_id},'{calle}',{numero},'{ciudad}','{provincia}','{pais}')"
    cursor.execute(instruccion)
    conn.commit()
    conn.close()

def total_sucursales():
    conn = sql.connect('db/itbank.db')
    cursor = conn.cursor()
    instruccion=f"SELECT * FROM total_sucursales"
    cursor.execute(instruccion)
    datos= cursor.fetchall()
    datos= re.sub("\(|\)|\,","",str(datos[0]))
    conn.close()
    return datos
    
def id_sucursales():
    conn = sql.connect('db/itbank.db')
    cursor = conn.cursor()
    instruccion=f"SELECT * FROM id_sucursales"
    cursor.execute(instruccion)
    datos= cursor.fetchall()
    datos= re.sub("\(|\)|\,|\[|\]","",str(datos)).split(' ')
    conn.close
    return datos
print(id_sucursales()[0])
def id_empleados():
    conn = sql.connect('db/itbank.db')
    cursor = conn.cursor()
    instruccion=f"SELECT * FROM id_empleados"
    cursor.execute(instruccion)
    datos= cursor.fetchall()
    datos= re.sub("\(|\)|\,|\[|\]","",str(datos)).split(' ')
    conn.close
    return datos

def id_clientes():
    conn = sql.connect('db/itbank.db')
    cursor = conn.cursor()
    instruccion=f"SELECT * FROM id_clientes"
    cursor.execute(instruccion)
    datos= cursor.fetchall()
    datos= re.sub("\(|\)|\,||\[|\]","",str(datos)).split(' ')
    conn.close
    return datos

def cargarDirecciones():
    for i in range(20):
        # fake = Faker()
        # d = fake.address()
        # p=fake.country()

        corr=int(random.choice("123"))
        print(i+1)
        if(i+1 < int(total_sucursales()) and corr == 3):
            insertdireccion(corr,int(id_sucursales()[i]),'fitzroy',123,'caba','bsas','arg')
        elif(corr==2):
            insertdireccion(corr,int(id_empleados()[i]),'135 y 470',689,'lp','bsas','arg')
        elif(corr==1):
            insertdireccion(corr,int(id_clientes()[i]),'lalal',98765,'HHH','la pampa','arg')

cargarDirecciones()