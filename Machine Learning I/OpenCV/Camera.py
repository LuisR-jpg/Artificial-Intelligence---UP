import cv2
import matplotlib.pyplot as plt
import numpy as np


def funcion(img):
  gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
  gray = cv2.GaussianBlur(gray, (5, 5), 0)

  ret, imgt = cv2.threshold(gray, 127, 255, cv2.THRESH_BINARY_INV) #Turns video to black and white

  cv2.imshow("Image threshold", imgt)
  countours, hierarchy = cv2.findContours(imgt.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
  rectangles = [cv2.boundingRect(countour) for countour in countours]
  c = 0
  sizeofImage = (500, 300)
  for rect in rectangles:
    if rect[2] > 50 and rect[3] > 50: #Takes only bigger objects
      imgn = img[rect[1]:rect[1] + rect[3], rect[0]:rect[0] + rect[2]]
      imgn = cv2.resize(imgn, (sizeofImage[0], sizeofImage[1]))
      c += 1
      cv2.imshow("Image rect", imgn)

      # Clasificar la imagen imgn
      # Escribir el resultado

      cv2.rectangle(img, (rect[0], rect[1]), (rect[0] + rect[2], rect[1] + rect[3]), (255, 0, 0), 2)
      cv2.putText(img, str('Guapo'), (rect[0], rect[1]), cv2.FONT_HERSHEY_SIMPLEX, 1, (200, 0, 0), 3, cv2.LINE_AA)
  return img

cam = cv2.VideoCapture(0)
while True:
    val, img = cam.read()
    img = funcion(img)
    cv2.imshow("Image funcion",img)
    img = cv2.cvtColor(img, code = cv2.COLOR_BGR2RGB)
    plt.figure(figsize = (15, 5))
    plt.subplot(1, 3, 1)
    plt.title("Original")
    plt.imshow(img)
    plt.show()
    print(np.unique(cv2.cvtColor(img, code = cv2.COLOR_RGB2HSV)[0]))
    print(img.shape)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
cam.release()
cv2.destroyAllWindows()