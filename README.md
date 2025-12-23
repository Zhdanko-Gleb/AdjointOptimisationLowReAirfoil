## Setup

All simulations require OpenFOAM v2506.

## Main Optimization Cases

**Location:** `maincases/`

Each subfolder contains a complete optimization setup.

**To run:**
```bash
cd maincases/<case_name>
./Allrun  # Uses 12 cores (pre-parallelized)
```

## Solver Validation

**Location:** `cylinder_cases/`

Test cases for `adjointOptimisationFoam` solver.

**Mesh studies:** Multiple meshes in `constant/` for convergence analysis.

**Reynolds number:** Modify `constant/transportProperties`:
```
nu = 1/Re;
```

**To run:**
```bash
./Allrun           # Serial
./Allrun-parallel  # Parallel
```

---
*Note: This README is under development and will be expanded.*
