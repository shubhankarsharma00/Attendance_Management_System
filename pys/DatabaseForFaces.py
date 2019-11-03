import cv2
import numpy as np
import sqlite3

faceDetect=cv2.CascadeClassifier('haarcascade_frontalface_default.xml');
cam=cv2.VideoCapture(0);

def insertOrUpdate(Id,Name,Age,Gen):
    conn=sqlite3.connect("FaceBase.db")
    try:
        cmd = "CREATE TABLE People(ID int,Name varchar(255),Age int,Gender varchar(255))"
        conn.execute(cmd)
    except:
        pass
    cmd="SELECT * FROM People WHERE ID="+str(Id)
    cursor=conn.execute(cmd)
    isRecordExist=0
    for row in cursor:
        isRecordExist=1
    if(isRecordExist==1):
        conn.execute("UPDATE People SET Name=?, Age=?, Gender=? WHERE ID = ?;" ,(Name, Age , Gen , Id))
    else:
        conn.execute("INSERT INTO People(ID,Name,Age,Gender) Values(?,?,?,?)", (Id,Name,Age,Gen))
    conn.commit()
    conn.close()

Id=input('Enter User Id')
name=input('Enter User Name')
age=input('Enter User Age')
gen=input('Enter User Gender')

insertOrUpdate(Id,name,age,gen)

sampleNum=0
while(True):
    ret,img=cam.read();
    gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    faces=faceDetect.detectMultiScale(gray,1.3,5);
    for(x,y,w,h) in faces:
        sampleNum=sampleNum+1;
        cv2.imwrite("dataSet/User."+str(Id)+"."+str(sampleNum)+".jpg",gray[y:y+h,x:x+w])
        cv2.rectangle(img,(x,y),(x+w,y+h),(0,255,0),2)
        cv2.waitKey(100);
    cv2.imshow("Face",img);
    cv2.waitKey(1);
    if(sampleNum>20):
        break;
cam.release()
cv2.destroyAllWindows()