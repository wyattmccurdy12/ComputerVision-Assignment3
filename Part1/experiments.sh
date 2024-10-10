# Run experiments for keypoint matching

# Boston

# Try adjusting the number of octaves 
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 3 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 5 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 6 --contthresh 0.04 --edgethresh 10 --sigma 1.9

# From the above experiment, we have found the best octaves is 4. We will assume this is true for the rest of the experiment

# Try adjusting the number of features
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 150 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 200 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9

# From the above experiment, we've found that 100 features is a good starting point

# Try adjusting the contrast threshold
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.08 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.10 --edgethresh 10 --sigma 1.9

# From the above experiment, we find that contrast threshold really doesn't matter much - we'll just use 0.06

# Try adjusting the edge threshold
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 5 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 15 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 20 --sigma 1.9

# The highest edge threshold seems to be the best, so we'll use 20

# Try adjusting the sigma
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 20 --sigma 1.7
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 20 --sigma 1.9
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 20 --sigma 2.1
# python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 20 --sigma 2.3

# From the above experiment, we find that sigma = 1.9 is the best

# Now we will use the best parameters to run the matching algorithm
python feature_detection.py --image1 pairs/Boston.jpeg --image2 pairs/Boston1.jpeg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 20 --sigma 1.9 --save True


# Castle

# Try adjusting the number of octaves 
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 100 --noctave 3 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 100 --noctave 4 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 100 --noctave 5 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 100 --noctave 6 --contthresh 0.04 --edgethresh 10 --sigma 1.9

# From the above experiment, we have found the best octaves is 3. We will assume this is true for the rest of the experiment

# Try adjusting the number of features
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 80 --noctave 3 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 100 --noctave 3 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 150 --noctave 3 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 10 --sigma 1.9

# From the above experiment, we've found that 200 features is a good starting point

# Try adjusting the contrast threshold
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.08 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.10 --edgethresh 10 --sigma 1.9

# From the above experiment, we find that contrast threshold really doesn't matter much - we'll just use 0.06

# Try adjusting the edge threshold
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 5 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 15 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 20 --sigma 1.9

# The 15 edge threshold seems to be the best

# # Try adjusting the sigma
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 15 --sigma 1.7
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 15 --sigma 1.9
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 15 --sigma 2.1
# python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 15 --sigma 2.3

# From the above experiment, we find that sigma = 1.9 is the best

# Now we will use the best parameters to run the matching algorithm
python feature_detection.py --image1 pairs/Castle.jpg --image2 pairs/Castle1.jpg --nfeatures 200 --noctave 3 --contthresh 0.06 --edgethresh 15 --sigma 1.9 --save True

# MountRushmore

# Try adjusting the number of octaves
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 100 --noctave 3 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 100 --noctave 4 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 100 --noctave 5 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 100 --noctave 6 --contthresh 0.04 --edgethresh 10 --sigma 1.9

# 4 Octvaves seems to be the best

# Try adjusting the number of features
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 100 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 150 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 200 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9

# 80 features appears to be best

# Try adjusting the contrast threshold
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.08 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.10 --edgethresh 10 --sigma 1.9

# # 0.06 contrast threshold appears to be best

# # Try adjusting the edge threshold
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 5 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 15 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 20 --sigma 1.9

# 5 edge threshold appears to be best

# Try adjusting the sigma
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 5 --sigma 1.7
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 5 --sigma 1.9
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 5 --sigma 2.1
# python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 5 --sigma 2.3

# Let's go with 1.9

# Now we will use the best parameters to run the matching algorithm
python feature_detection.py --image1 pairs/MountRushmore.jpg --image2 pairs/MountRushmore1.jpg --nfeatures 80 --noctave 4 --contthresh 0.06 --edgethresh 5 --sigma 1.9 --save True

# NotreDame

# Try adjusting the number of octaves
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 3 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 4 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 5 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.04 --edgethresh 10 --sigma 1.9

# 6 Octaves

# Try adjusting the number of features
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 80 --noctave 6 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 150 --noctave 6 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 200 --noctave 6 --contthresh 0.06 --edgethresh 10 --sigma 1.9

# 100 Features

# Try adjusting the contrast threshold
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.04 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.08 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.10 --edgethresh 10 --sigma 1.9

# 0.06 contrast threshold

# Try adjusting the edge threshold
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 5 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 10 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 15 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 20 --sigma 1.9

# 5 Edge thresh

# Try adjusting the sigma
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 5 --sigma 1.7
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 5 --sigma 1.9
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 5 --sigma 2.1
# python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 5 --sigma 2.3

# 1.9 sigma

# Now we will use the best parameters to run the matching algorithm
python feature_detection.py --image1 pairs/NotreDame.jpg --image2 pairs/NotreDame1.jpg --nfeatures 100 --noctave 6 --contthresh 0.06 --edgethresh 5 --sigma 1.9 --save True