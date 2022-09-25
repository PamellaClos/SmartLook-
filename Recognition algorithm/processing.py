import numpy as np
import cv2
from numpy.random import default_rng

from matplotlib import pyplot as plt

def showSingleImage(img, title, size, mincolor=0, maxcolor=255):
    fig, axis = plt.subplots(figsize = size)

    axis.imshow(img, cmap='gray', vmin=mincolor, vmax=maxcolor)
    axis.set_title(title, fontdict = {'fontsize': 22, 'fontweight': 'medium'})
    plt.show()
    
def showMultipleImages(imgsArray, titlesArray, size, x, y, mincolor=0, maxcolor=255):
    if(x < 1 or y < 1):
        print("ERRO: X e Y não podem ser zero ou abaixo de zero!")
        return
    elif(x == 1 and y == 1):
        showSingleImage(imgsArray, titlesArray)
    elif(x == 1):
        fig, axis = plt.subplots(y, figsize = size)
        yId = 0
        for img in imgsArray:
            axis[yId].imshow(img, cmap='gray', vmin=mincolor, vmax=maxcolor)
            axis[yId].set_anchor('NW')
            axis[yId].set_title(titlesArray[yId], fontdict = {'fontsize': 18, 'fontweight': 'medium'}, pad = 10)

            yId += 1
    elif(y == 1):
        fig, axis = plt.subplots(1, x, figsize = size)
        fig.suptitle(titlesArray)
        xId = 0
        for img in imgsArray:
            axis[xId].imshow(img, cmap='gray', vmin=mincolor, vmax=maxcolor)
            axis[xId].set_anchor('NW')
            axis[xId].set_title(titlesArray[xId], fontdict = {'fontsize': 18, 'fontweight': 'medium'}, pad = 10)

            xId += 1
    else:
        fig, axis = plt.subplots(y, x, figsize = size)
        xId, yId, titleId = 0, 0, 0
        for img in imgsArray:
            axis[yId, xId].set_title(titlesArray[titleId], fontdict = {'fontsize': 18, 'fontweight': 'medium'}, pad = 10)
            axis[yId, xId].set_anchor('NW')
            axis[yId, xId].imshow(img, cmap='gray', vmin=mincolor, vmax=maxcolor)
            if(len(titlesArray[titleId]) == 0):
                axis[yId, xId].axis('off')

            titleId += 1
            xId += 1
            if xId == x:
                xId = 0
                yId += 1
    plt.show()

img_iris = cv2.imread("/content/iris_images/0.jpg")
img_iris = cv2.cvtColor(img_iris, cv2.COLOR_BGR2RGB)
showSingleImage(img_iris, "Iris", (7, 7))

img_gray = cv2.cvtColor(img_iris, cv2.COLOR_RGB2GRAY)

img_scharrx = cv2.Scharr(src=img_gray, ddepth=cv2.CV_64F, dx=1, dy=0)
img_scharry = cv2.Scharr(src=img_gray, ddepth=cv2.CV_64F, dx=0, dy=1)
img_scharrxy = cv2.addWeighted(img_scharrx, 0.5, img_scharry, 0.5, 0) #melhor usar assim

imgsArray = [img_iris, img_scharrx, img_scharry, img_scharrxy]
titlesArray = ['Original', 'Filtro 1', 'Filtro 2', 'Filtro 3']
showMultipleImages(imgsArray, titlesArray, (12, 9), 2, 2)

print(img_scharrx)

img_sobelx = cv2.convertScaleAbs(img_scharrx)

print(img_sobelx)