'''
Assignment 3: Feature Matching
Wyatt McCurdy

COS 470/570: Image Processing and Computer Vision
Dr. Zhang Xin

Task 1: Feature Detection and Matching (70 points). 

Sample command to run the script:
python feature_detection.py --image1 pairs/1.jpg --image2 pairs/2.jpg --nfeatures 500 --noctave 3 --contthresh 0.04 --edgethresh 10 --sigma 1.6
'''

pairs_path = "pairs"

import cv2 as cv
import os
import numpy as np
from matplotlib import pyplot as plt
import argparse

def load_images_from_folder(folder):
    """
    Load images from a specified folder.

    Args:
        folder (str): Path to the folder containing images.

    Returns:
        list: List of loaded images.
    """
    images = []
    for filename in os.listdir(folder):
        img = cv.imread(os.path.join(folder, filename))
        if img is not None:
            images.append(img)
    return images

def detect_keypoints_and_descriptors(image, nfeatures=500, nOctaveLayers=3, contrastThreshold=0.04, edgeThreshold=10, sigma=1.6):
    """
    Detect keypoints and compute descriptors using SIFT.

    Args:
        image (numpy.ndarray): Input image.
        nfeatures (int): Number of best features to retain.
        nOctaveLayers (int): Number of layers in each octave.
        contrastThreshold (float): Contrast threshold.
        edgeThreshold (float): Edge threshold.
        sigma (float): Sigma of the Gaussian applied to the input image at the octave #0.

    Returns:
        tuple: Keypoints and descriptors.
    """
    sift = cv.SIFT_create(nfeatures=nfeatures, nOctaveLayers=nOctaveLayers, contrastThreshold=contrastThreshold, edgeThreshold=edgeThreshold, sigma=sigma)
    keypoints, descriptors = sift.detectAndCompute(image, None)
    return keypoints, descriptors

def match_keypoints(descriptors1, descriptors2):
    """
    Match keypoints using FLANN-based matcher.

    Args:
        descriptors1 (numpy.ndarray): Descriptors of the first image.
        descriptors2 (numpy.ndarray): Descriptors of the second image.

    Returns:
        tuple: List of good matches and list of bad matches.
    """
    index_params = dict(algorithm=1, trees=5)
    search_params = dict(checks=50)
    flann = cv.FlannBasedMatcher(index_params, search_params)
    matches = flann.knnMatch(descriptors1, descriptors2, k=2)
    good_matches = []
    bad_matches = []
    for m, n in matches:
        if m.distance < 0.8 * n.distance:
            good_matches.append(m)
        else: 
            bad_matches.append(m)
    return good_matches, bad_matches

def draw_matches(img1, kp1, img2, kp2, matches):
    """
    Draw matches between two images.

    Args:
        img1 (numpy.ndarray): First image.
        kp1 (list): Keypoints of the first image.
        img2 (numpy.ndarray): Second image.
        kp2 (list): Keypoints of the second image.
        matches (list): List of good matches.

    Returns:
        numpy.ndarray: Image with matches drawn.
    """
    result = cv.drawMatches(img1, kp1, img2, kp2, matches, None, flags=cv.DrawMatchesFlags_NOT_DRAW_SINGLE_POINTS)
    return result

def report_matches(good_matches, bad_matches):
    """
    Report the number of good and bad matches.

    Args:
        good_matches (list): List of good matches.
        bad_matches (list): List of bad matches.

    Returns:
        dict: Dictionary containing the match report.
    """
    report = {
        "good_matches": len(good_matches),
        "bad_matches": len(bad_matches),
        "proportion_good_matches": len(good_matches) / (len(good_matches) + len(bad_matches))
    }
    print(f"Good Matches: {report['good_matches']}")
    print(f"Bad Matches: {report['bad_matches']}")
    print(f"Proportion of Good Matches: {report['proportion_good_matches']}")
    return report

def save_image(image, img1_name, nfeatures, noctave, contthresh, edgethresh, sigma):
    """
    Save the image with matches drawn in a folder labeled with image name and parameters.

    Args:
        image (numpy.ndarray): Image with matches drawn.
        img1_name (str): Name of the first image.
        img2_name (str): Name of the second image.
        nfeatures (int): Number of best features to retain.
        noctave (int): Number of layers in each octave.
        contthresh (float): Contrast threshold.
        edgethresh (float): Edge threshold.
        sigma (float): Sigma of the Gaussian applied to the input image at the octave #0.

    Returns:
        None
    """
    output_dir = img1_name
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    img_name = img1_name.split(".")[0]
    
    output_filename = f"{img_name}_nfeatures{nfeatures}_noctave{noctave}_contthresh{contthresh}_edgethresh{edgethresh}_sigma{sigma}.jpg"
    output_path = os.path.join(output_dir, output_filename)
    cv.imwrite(output_path, image)
    print(f"Saved matched image to {output_path}")

def log_parameters(args, report):
    """
    Log the parameters used for feature detection and matching, along with the results.

    Args:
        args (argparse.Namespace): Command-line arguments.
        report (dict): Dictionary containing the match report.

    Returns:
        None
    """

    # Get the image name without the extension
    imgname = args.image1.split("/")[-1]
    imgname = imgname.split(".")[0]
    # print("imgname", imgname)

    log_filename = f"log_{imgname}.csv"
    log_path = "logs/" + log_filename
    # print("log_path", log_path)

    # Write the parameters and results in append mode to the log file csv
    with open(log_path, "a") as f:
        # f.write(f"Image,nfeatures,noctave,contthresh,edgethresh,sigma,good_matches,bad_matches,proportion_good_matches\n")
        f.write(f"\n{imgname},{args.nfeatures},{args.noctave},{args.contthresh},{args.edgethresh},{args.sigma},{report['good_matches']},{report['bad_matches']},{report['proportion_good_matches']}")
    
    print(f"Logged parameters and results to {log_path}")

def main():
    """
    Main function to execute feature detection and matching.

    Returns:
        None
    """
    parser = argparse.ArgumentParser(description='Feature Matching using SIFT')
    parser.add_argument('--image1', type=str, default='pairs/Boston.jpeg', help='Path to the first image')
    parser.add_argument('--image2', type=str, default='pairs/Boston1.jpeg', help='Path to the second image')
    parser.add_argument('--nfeatures', type=int, default=120, help='Number of best features to retain')
    parser.add_argument('--noctave', type=int, default=4, help='Number of layers in each octave')
    parser.add_argument('--contthresh', type=float, default=0.06, help='Contrast threshold')
    parser.add_argument('--edgethresh', type=float, default=15, help='Edge threshold')
    parser.add_argument('--sigma', type=float, default=1.6, help='Sigma of the Gaussian applied to the input image at the octave #0')
    parser.add_argument('--save', type=bool, default=False, help='Save the matched image')
    
    args = parser.parse_args()
    
    img1 = cv.imread(args.image1)
    img2 = cv.imread(args.image2)
    
    if img1 is None or img2 is None:
        print("Error loading images.")
        return

    kp1, des1 = detect_keypoints_and_descriptors(img1, nfeatures=args.nfeatures, nOctaveLayers=args.noctave, contrastThreshold=args.contthresh, edgeThreshold=args.edgethresh, sigma=args.sigma)
    kp2, des2 = detect_keypoints_and_descriptors(img2, nfeatures=args.nfeatures, nOctaveLayers=args.noctave, contrastThreshold=args.contthresh, edgeThreshold=args.edgethresh, sigma=args.sigma)
    
    good_matches, bad_matches = match_keypoints(des1, des2)
    
    matched_image = draw_matches(img1, kp1, img2, kp2, good_matches)
    
    report = report_matches(good_matches, bad_matches)
    
    img1_name = os.path.splitext(os.path.basename(args.image1))[0]
    
    if args.save:
        save_image(matched_image, img1_name, args.nfeatures, args.noctave, args.contthresh, args.edgethresh, args.sigma)
    
    log_parameters(args, report)

if __name__ == "__main__":
    main()