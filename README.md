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

### 2. `airfoil2D_test/`
Flow solver.

**To use the generated mesh:**
```bash
cp -r airFoil2D_mesh/constant/polyMesh airfoil2D_test/constant/
```

Then run the desired solver in `airfoil2D_test/`.

## Workflow
```
airFoil2D_mesh → Generate mesh → Modify boundary file → Copy polyMesh → airfoil2D_test → Run solver
```
