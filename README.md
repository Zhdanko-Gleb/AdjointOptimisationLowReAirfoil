# OpenFOAM Airfoil Simulation

## Directory Structure

### 1. `airFoil2D_mesh/`
Mesh generation for NACA 0012 airfoil using `snappyHexMesh`.

**To generate mesh:**
```bash
cd airFoil2D_mesh
sh run_mesh_all.sh
```

This creates the mesh in `airFoil2D_mesh/constant/polyMesh/`.

**After mesh generation:** Modify `constant/polyMesh/boundary` file to set correct boundary types (patches for : minX,maxX,minY,maxY; empty for: minZ, maxZ).
Example can be found in 'liftoptimisation/constant/polyMesh/boundary'. 

### 2. `liftoptimisation/` or 'dragoptimisation/'
Flow solver.

**To use the generated mesh:**
```bash
cp -r airFoil2D_mesh/constant/polyMesh liftoptimisation/constant/
```

Then run 
```bash
./Allrun-parallel
```

## Workflow
```
airFoil2D_mesh → Generate mesh → Modify boundary file → Copy polyMesh → Run solver
```

Folders `liftoptimisation/` and 'dragoptimisation/' already contained solution, it is advisable to first run
```bash
./Allclean
```
in those folders, to delete calcluations and start your own. 

## Parameters to play with
1. endTime can be changed in 'controlDict' either to increase number of optimisation iterations or decrase (the current is set to 8).
2. Reynolds number. For that it is easier to change viscosity defined in the 'constant/transportProperties'.
3. Angle of attack. For that velocity in the folder '0' should be modified accordingly and direction of normal in the 'optimisationDict'. Current velocity is set to (10 0 0). 
