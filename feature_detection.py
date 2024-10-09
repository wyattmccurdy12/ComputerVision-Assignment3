'''
Assignment 3: Feature Matching
Wyatt McCurdy

COS 470/570: Image Processing and Computer Vision
Dr. Zhang Xin

Task 1: Feature Detection and Matching (70 points). 
Use any keypoint detection algorithms (SIFT, ORB) to detect and match keypoints between several pairs of images. 
You are provided with initial images (see “pairs.zip”) where you will apply these algorithms. 

1. Keypoint Detection: Select any keypoint detection algorithm (SIFT, ORB) to detect keypoints in each image from 
the provided “pairs.zip”. 
Fine-tune your algorithm's parameters to enhance the accuracy of the matches. 
For example, if you use SIFT as the feature detector, then you should be able to tune the parameters including nfeatures, 
nOctaveLayers, contrastThreshold, edgeThreshold and sigma. 
'''

pairs_path = "pairs"

import cv2 as cv
import os
import numpy as np
from matplotlib import pyplot as plt

def load_images_from_folder(folder):
    images = []
    for filename in os.listdir(folder):
        img = cv.imread(os.path.join(folder, filename))
        if img is not None:
            images.append(img)
    return images

def detect_keypoints_and_descriptors(image, nfeatures=500, nOctaveLayers=3, contrastThreshold=0.04, edgeThreshold=10, sigma=1.6):
    sift = cv.SIFT_create(nfeatures=nfeatures, nOctaveLayers=nOctaveLayers, contrastThreshold=contrastThreshold, edgeThreshold=edgeThreshold, sigma=sigma)
    keypoints, descriptors = sift.detectAndCompute(image, None)
    return keypoints, descriptors

def match_keypoints(descriptors1, descriptors2):
    index_params = dict(algorithm=1, trees=5)
    search_params = dict(checks=50)
    flann = cv.FlannBasedMatcher(index_params, search_params)
    matches = flann.knnMatch(descriptors1, descriptors2, k=2)
    good_matches = []
    for m, n in matches:
        if m.distance < 0.8 * n.distance:
            good_matches.append(m)
    return good_matches

def draw_matches(img1, kp1, img2, kp2, matches):
    result = cv.drawMatches(img1, kp1, img2, kp2, matches, None, flags=cv.DrawMatchesFlags_NOT_DRAW_SINGLE_POINTS)
    plt.imshow(result)
    plt.show()

def main():

    # Load images to use for the remainder of the program
    images = load_images_from_folder(pairs_path)
    
    ## TASK 1: Feature Detection and Matching
    if len(images) % 2 != 0:
        print("Number of images should be even.")
        return
    
    for i in range(0, len(images), 2):
        img1 = images[i]
        img2 = images[i+1]
        
        kp1, des1 = detect_keypoints_and_descriptors(img1)
        kp2, des2 = detect_keypoints_and_descriptors(img2)
        
        good_matches = match_keypoints(des1, des2)
        
        draw_matches(img1, kp1, img2, kp2, good_matches)

    ## 

if __name__ == "__main__":
    main()