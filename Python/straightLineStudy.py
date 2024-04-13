import matplotlib.pyplot as plt
import numpy as np

print ("Write the coordinates of the FRIST point: first X [ENTER] Y [ENTER]")
p1cx = int(input())
p1cy = int(input())
print ("Write the coordinates of the SECOND point: first X [ENTER] Y [ENTER]")
p2cx = int(input())
p2cy = int(input())
print("The first point is (", p1cx, ",",p1cy,")"
      ,"The scond point is (",p2cx,",",p2cy,")")

xpoints = np.array([p1cx,p2cx])
ypoints = np.array([p1cy,p2cy])

m =(p2cy - p1cy)/(p2cx - p1cx)
y = str(m) +"x + "+str((p1cy+(m*-p1cx)))
print("y=",y)
plt.plot(xpoints,ypoints,scalex=20,scaley=20)
plt.show()