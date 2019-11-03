import os
import cv2
import numpy as np
from PIL import Image
import sqlite3

recognizer=cv2.face.LBPHFaceRecognizer_create();
path='dataSet'

def getImagesWithID(path):
    imagepaths=[os.path.join(path,f) for f in os.listdir(path)]
    faces=[]
    IDs=[]
    for imagepath in imagepaths:
        faceImg=Image.open(imagepath).convert('L');
        faceNp=np.array(faceImg,'uint8')
        ID=int(os.path.split(imagepath)[-1].split('.')[1])
        faces.append(faceNp)
        IDs.append(ID)
        cv2.imshow("training",faceNp)
        cv2.waitKey(10)
    return np.array(IDs),faces

def addDataBase():
    conn = sqlite3.connect("FaceBase.db")
    try:
        cmd = "CREATE TABLE StudentAttendence(ID int,Name varchar(255),Age int,Gender varchar(255)," \
              "Present int,Total int)"
        conn.execute(cmd)
    except:
        pass
    cmd = "SELECT * FROM People"
    cursor = conn.execute(cmd)
    data= []
    for row in cursor:
        data.append(row)
    cmd = "DELETE from StudentAttendence"
    conn.execute(cmd)
    for d in data:
        conn.execute("INSERT INTO StudentAttendence(ID,Name,Age,Gender,Present,total) Values(?,?,?,?,?,?)", (d[0], d[1], d[2], d[3],0,0))

    conn.commit()
    conn.close()

IDs,faces=getImagesWithID(path)
recognizer.train(faces,IDs)
recognizer.save('recognizer/trainningData.yml')
cv2.destroyAllWindows()
addDataBase()