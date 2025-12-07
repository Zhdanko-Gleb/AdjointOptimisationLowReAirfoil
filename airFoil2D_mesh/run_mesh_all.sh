#!/bin/bash

rm *.obj > /dev/null 2>&1
foamCleanTutorials

#surfaceFeatures -noFunctionObjects

blockMesh

snappyHexMesh -dict system/snappyHexMeshDict_block -overwrite | tee log.shm1 


#In 2D we must use extrudeMesh in the base mesh to avoid the pyramids
#It also reduces the cell count for the next stage in snappy
extrudeMesh -noFunctionObjects


#This shifting gives problems in SHM only if the locainto in mesh point is inside of a non hexa element
#You have to be careful to put the point in a region with hexes
#I do this shifting to have the doamin in -0.5:0.5 personal choice not needed
transformPoints 'translate=(0 0 -1.5)'



#If you do not erase these files it will give you this error
#--> FOAM FATAL ERROR: 
#Number of cells in mesh:3888 does not equal size of cellLevel:7328
#This might be because of a restart with inconsistent cellLevel.
#
rm constant/polyMesh/cellLevel
rm constant/polyMesh/pointLevel

#Erase to avoid the creation of any aditional refinment aorund the airfoil
rm constant/polyMesh/level0Edge

#Additionally you can also erase this file
#Helper class which maintains intersections of (changing) mesh with (static) surfaces.
#Maintains per face any intersections of the cc-cc segment with any of the surfaces
rm constant/polyMesh/surfaceIndex

#snappyHexMesh -dict system/snappyHexMeshDict_bodyFitted -overwrite | tee log.shm2
snappyHexMesh -dict system/snappyHexMeshDict_bodyFitted | tee log.shm2

#extrudeMesh -noFunctionObjects
#transformPoints 'translate=(0 0 -1)'
checkMesh -latestTime | tee log.checkmesh2d



#rm constant/polyMesh/cellLevel
#rm constant/polyMesh/pointLevel
#rm constant/polyMesh/level0Edge



