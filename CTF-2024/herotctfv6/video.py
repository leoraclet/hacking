import cv2
import time
import numpy as np

cap = cv2.VideoCapture("subliminal_hide.mp4")
ret, frame = cap.read()

image_finale = np.zeros(frame.shape, dtype=np.uint8)
# 1280 = 20 * 64
# 720 = 20 * 36
i = 0
j = 0
frames = 1

while 1:
    image_finale[i * 20 : i * 20 + 19, j * 20 : j * 20 + 19, :] = 255 - frame[
        i * 20:i * 20 + 19, j * 20 : j * 20 + 19, :
    ]
    cv2.imshow("image_finale", image_finale)
    cv2.waitKey(1)
    i += 1
    if i == 36:
        i = 0
        j += 1
    ret, frame = cap.read()
    # cv2.imshow("frame", frame)
    # print("Frame: ", frame, frame.shape)

    frames += 1

    if frames == 2300:
        break

    # cv2.imshow("frame", frame)

cv2.imwrite("output_image.png", image_finale)
cap.release()
