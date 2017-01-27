This process code automates bubble counting process for requirements such as quality
control on a soft-drink manufacturing production line.

The following assumptions were made to obtain better results:
1.)	Circles dimply visible and in out-of-focal plane were considered insignificant.
2.)	Overlapping circles were considered in calculations to better estimate the area
	given that not all circles could be detected.
	
The steps performed to achieve the desired results are such:
a.)	Determined an intensity that allows segmentation of as many closed circles as
	possible. This value was experimentally found to be 187.
b.)	Closed the segmented image using imclose with a disk structuring element of
	radius 7 pixels.
c.)	All holes within closed circles were filled with imfill.
d.)	imfindcircles was then used to find circles with the radius range [10 30]
	and [32 70].
e.)	Counted the number of circles detected and determined the total area covered
	by all these circles.
