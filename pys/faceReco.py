import flask
import cv2
import numpy as np
import sqlite3
from collections import Counter
from time import sleep
import requests
import json



faceDetect=cv2.CascadeClassifier('haarcascade_frontalface_default.xml');
cam=cv2.VideoCapture(0);
rec = cv2.face.LBPHFaceRecognizer_create()
rec.read("recognizer/trainningData.yml")
recogonized_faces= []

def getProfile(id):
    conn=sqlite3.connect("FaceBase.db")
    cmd="SELECT * FROM People WHERE ID="+str(id)
    cursor=conn.execute(cmd)
    profile=None
    for row in cursor:
        profile=row
    conn.close()
    return profile
face_count=0
ct=0
while(ct<100):
    ct+=1
    ret,img=cam.read();
    gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    faces=faceDetect.detectMultiScale(gray,1.3,5);
    face_count = len(faces)
#    print(len(faces))
    for(x,y,w,h) in faces:
        # cv2.rectangle(img,(x,y),(x+w,y+h),(0,255,0),2)
        id,conf=rec.predict(gray[y:y+h,x:x+w])
        profile=getProfile(id)
        print(profile)
        font = cv2.FONT_HERSHEY_SIMPLEX
        recogonized_faces.append(profile)

    if(cv2.waitKey(1)==ord('q')):
        break;

    # sleep(0.1)

recogonized_faces= [item for item in Counter(recogonized_faces).most_common(2)]
print(recogonized_faces)
# for f in recogonized_faces:
#     if f[1]<20:
#         recogonized_faces.remove(f)


print(len(recogonized_faces))
print(recogonized_faces)
present = []
for rf in recogonized_faces:
    present.append(rf[0][0])
json_string = json.dumps(present)
print(json_string)

requests.put('https://sidhy-33818.firebaseio.com/.json', json_string)

def updateDataBase():
    conn=sqlite3.connect("FaceBase.db")
    conn.execute("UPDATE StudentAttendence SET Total = Total + 1")
    for r in recogonized_faces:
        print(r[0][0])
        conn.execute("UPDATE StudentAttendence SET Present = Present + 1 where ID = ?",(r[0][0],))


    conn.commit()
    conn.close()


updateDataBase()
cam.release()
cv2.destroyAllWindows()
