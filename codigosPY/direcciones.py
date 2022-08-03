#Insertar 500 direcciones, asignando del lote inicial a empleados, clientes o sucursal de forma aleatoria
import json as js
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
    f=open('JSON\data-direcciones.json', encoding="utf8")
    data=js.load(f)
    f.close()
    for i in range(500):
        corr=int(random.choice("123"))
        print(i+1)
        if(i+1 < int(total_sucursales()) and corr == 3):
            insertdireccion(corr,int(id_sucursales()[i]),data[i]['direccion'],data[i]['numero'],data[i]['ciudad'],str(data[i]['provincia']),data[i]['pais'])
        elif(corr==2):
            insertdireccion(corr,int(id_empleados()[i]),data[i]['direccion'],data[i]['numero'],data[i]['ciudad'],str(data[i]['provincia']),data[i]['pais'])
        elif(corr==1):
            insertdireccion(corr,int(id_clientes()[i]),data[i]['direccion'],data[i]['numero'],data[i]['ciudad'],str(data[i]['provincia']),data[i]['pais'])

cargarDirecciones()#el posta