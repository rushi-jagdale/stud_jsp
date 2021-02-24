import mysql.connector

conn = mysql.connector.connect(
         user='mis_user',
         password='india#123',
         host='127.0.0.1',
         database='myadmin')

cur = conn.cursor()

query = ("SELECT * FROM person")

cur.execute(query)

for (id, name, owner) in cur:
  print("{}, {}, {}".format(id, name,owner))

cur.close()
conn.close()
                                                                                                               
                                                                                                               
                                                                                                               
                                                                                                               
                                                                                                               
