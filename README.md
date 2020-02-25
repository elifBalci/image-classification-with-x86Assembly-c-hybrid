# image-classification-with-x86Assembly-c-hybrid

This code uses images in bmp format. Algorithm first find the offset value(in which byte will the pixels start) of bmp file which is the 10th byte.Then starting from that byte, it process pixels. This can be observed in following photograph.
![bmp_hexa](https://user-images.githubusercontent.com/33840767/57132924-cdbb1000-6da9-11e9-8bea-c9268608ee08.png)

Then the code prepares the histogram of green. Since steak, salam and currant can be recognized based on histogram of green component. And from histogram, the mode value will be calculeted which can be observed in following graph.
![mode](https://user-images.githubusercontent.com/33840767/57132880-a6644300-6da9-11e9-9129-57c6e9d46b90.png)

In following chart you can see that how different are the mode values. Figure1 : currant and figure2: steak
![curvsste](https://user-images.githubusercontent.com/33840767/57133619-0d82f700-6dac-11e9-9872-f6a22f03cc0e.png)

And in the end this program can classify images of currant, steal and salam based on their mode values of histograms.
