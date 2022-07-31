from faker import Faker
import sqlite3 as sql
import re


def datos():#probando la conexion
    conn = sql.connect('db/itbank.db')
    cursor = conn.cursor()
    instruccion=f"SELECT * FROM sucursal"
    cursor.execute(instruccion)
    datos= cursor.fetchall()
    # conn.commit()
    conn.close()
    # print(datos[88][2])
    
# datos()
fake = Faker()

d = fake.address()
p=fake.country()

# d=d.split('\n')
# print(d)
# d=re.sub("\,","",str(d)).split(' ').strip('\n')
# print(d[1])


# d[4]=d[4].strip('\n')
# # d=d[4].strip('\t')
# print(d[4],'asasasas')
# print(d,'-----------')



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
    datos= re.sub("\(|\)|\,|\[","",str(datos)).split(' ')
    conn.close
    return datos
print(id_sucursales()[0])
def id_empleados():
    conn = sql.connect('db/itbank.db')
    cursor = conn.cursor()
    instruccion=f"SELECT * FROM id_empleados"
    cursor.execute(instruccion)
    datos= cursor.fetchall()
    datos= re.sub("\(|\)|\,||\[","",str(datos)).split(' ')
    conn.close
    return datos

def id_clientes():
    conn = sql.connect('db/itbank.db')
    cursor = conn.cursor()
    instruccion=f"SELECT * FROM id_clientes"
    cursor.execute(instruccion)
    datos= cursor.fetchall()
    datos= re.sub("\(|\)|\,||\[","",str(datos)).split(' ')
    conn.close
    return datos









import random

def cargarDirecciones():
    for i in range(20):
        # fake = Faker()
        # d = fake.address()
        # p=fake.country()

        corr=int(random.choice("123"))
        print(i+1)
        if(i+1 < int(total_sucursales()) and corr == 3):
            id_s=int(id_sucursales()[i])
            insertdireccion(corr,int(id_sucursales()[i]),'fitzroy',123,'caba','bsas','arg')
        elif(corr==2):
            id_e=int(id_empleados()[i])
            insertdireccion(corr,int(id_empleados()[i]),'135 y 470',689,'lp','bsas','arg')
        elif(corr==1):
            id_c=int(id_clientes()[i])
            insertdireccion(corr,int(id_clientes()[i]),'lalal',98765,'HHH','la pampa','arg')


cargarDirecciones()




